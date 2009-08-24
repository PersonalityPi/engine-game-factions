#include "UXSystemScene.h"

using namespace Ogre;
using namespace MyGUI;

#include "Service/IService.hpp"
using namespace Services;

#include "Management/Management.h"

using namespace luabind;

#include "Events/EventType.hpp"
#include "Events/EventData.hpp"
#include "Events/InputEventData.hpp"
using namespace Events;

#include "UXSystemComponent.h"

namespace UX
{
	UXSystemScene::~UXSystemScene()
	{
		delete m_gui;
		m_gui = 0;
	}

	void UXSystemScene::Initialize( )
	{
		IService* renderService = Management::Get( )->GetServiceManager( )->FindService( System::Types::RENDER );
		Root* root = renderService->ProcessMessage( System::Messages::Graphics::GetRootSingleton, AnyType::AnyTypeMap( ) )[ "result" ].As< Ogre::Root* >( );
		Root::initFromPtr( root ); 
		
		Ogre::RenderWindow* renderWindow = renderService->ProcessMessage( System::Messages::Graphics::GetRenderWindow, AnyType::AnyTypeMap( ) )[ "renderWindow" ].As< Ogre::RenderWindow* >( );
		m_gui->initialise( renderWindow, "/data/interface/core/core.xml", ResourceGroupManager::DEFAULT_RESOURCE_GROUP_NAME, "" );
		m_gui->hidePointer( );

		WidgetManager::getInstancePtr( )->registerUnlinker( this );

		Management::Get( )->GetEventManager( )->AddEventListener( INPUT_MOUSE_PRESSED, this, &UXSystemScene::OnMousePressed );
		Management::Get( )->GetEventManager( )->AddEventListener( INPUT_MOUSE_MOVED, this, &UXSystemScene::OnMouseMoved );
		Management::Get( )->GetEventManager( )->AddEventListener( INPUT_MOUSE_RELEASED, this, &UXSystemScene::OnMouseReleased );
		Management::Get( )->GetEventManager( )->AddEventListener( INPUT_KEY_DOWN, this, &UXSystemScene::OnKeyDown );
		Management::Get( )->GetEventManager( )->AddEventListener( INPUT_KEY_UP, this, &UXSystemScene::OnKeyUp );

		this->InitializeComponent( "interface-root", "/data/interface/interface.lua" );
	}

	void UXSystemScene::Destroy()
	{
		IService* scriptService = Management::Get( )->GetServiceManager( )->FindService( System::Types::SCRIPT );

		for ( IUXSystemComponent::UXSystemComponentList::iterator i = m_components.begin( ); i != m_components.end( ); ++i )
		{
			AnyType::AnyTypeMap parameters;
			parameters[ "name" ] = ( *i )->GetAttributes( )[ System::Attributes::Name ].As< std::string >( );
			scriptService->ProcessMessage( "unloadComponent", parameters );
			delete ( *i );
		}

		Management::Get( )->GetEventManager( )->RemoveEventListener( INPUT_MOUSE_PRESSED, this, &UXSystemScene::OnMousePressed );
		Management::Get( )->GetEventManager( )->RemoveEventListener( INPUT_MOUSE_MOVED, this, &UXSystemScene::OnMouseMoved );
		Management::Get( )->GetEventManager( )->RemoveEventListener( INPUT_MOUSE_RELEASED, this, &UXSystemScene::OnMouseReleased );
		Management::Get( )->GetEventManager( )->RemoveEventListener( INPUT_KEY_DOWN, this, &UXSystemScene::OnKeyDown );
		Management::Get( )->GetEventManager( )->RemoveEventListener( INPUT_KEY_UP, this, &UXSystemScene::OnKeyUp );

		m_gui->shutdown( );
	}

	IUXSystemComponent* UXSystemScene::InitializeComponent( const std::string& name, const std::string& scriptPath )
	{
		UXSystemComponent* component = new UXSystemComponent( name, this );
		component->SetAttribute( System::Attributes::Name, name );
		component->SetAttribute( System::Attributes::SystemType, System::Types::UX );
		component->SetAttribute( System::Attributes::Parent, this );

		AnyType::AnyTypeMap scriptParameters;
		scriptParameters[ System::Parameters::ScriptPath ] = scriptPath;
		scriptParameters[ System::Attributes::Name ] = name;

		IService* scriptService = Management::Get( )->GetServiceManager( )->FindService( System::Types::SCRIPT );
		ISystemComponent* scriptComponent = scriptService->ProcessMessage( System::Messages::LoadScript, scriptParameters )[ "component" ].As< ISystemComponent* >( );

		//TODO: This implementation needs to be looked at, possibly using a different interface to the script system instead of the traditional scene access route
		lua_State* scriptState = scriptComponent->Observe( 0, System::Messages::GetState, AnyType::AnyTypeMap( ) ).As< lua_State* >( );
		globals( scriptState )[ System::TypeStrings::UX ] = component;

		scriptComponent->Observe( 0, System::Messages::RunScript, AnyType::AnyTypeMap( ) );

		m_components.push_back( component );

		return component;
	}

	ISystemComponent* UXSystemScene::CreateComponent( const std::string& name, const std::string& type )
	{
		std::stringstream layoutPath;
		layoutPath << "/data/interface/components/" << name << ".layout";
		m_gui->load( layoutPath.str( ) );

		std::stringstream scriptPath;
		scriptPath << "/data/interface/components/" << name << ".lua";

		IUXSystemComponent* component = this->InitializeComponent( name, scriptPath.str( ) );

		m_gui->windowResized( m_gui->getRenderWindow( ) );

		return component;
	}

	void UXSystemScene::OnMouseMoved( const IEvent* event )
	{
		MouseEventData* eventData = static_cast< MouseEventData* >( event->GetEventData( ) );
		m_gui->injectMouseMove( eventData->GetMouseState( ).X.abs, eventData->GetMouseState( ).Y.abs, eventData->GetMouseState( ).Z.abs );
	}

	void UXSystemScene::OnMousePressed( const IEvent* event )
	{
		MouseEventData* eventData = static_cast< MouseEventData* >( event->GetEventData( ) );
		m_gui->injectMousePress( eventData->GetMouseState( ).X.abs, eventData->GetMouseState( ).Y.abs, MouseButton::Enum( eventData->GetMouseButtonId( ) ) );
	}

	void UXSystemScene::OnMouseReleased( const IEvent* event )
	{
		MouseEventData* eventData = static_cast< MouseEventData* >( event->GetEventData( ) );
		m_gui->injectMouseRelease( eventData->GetMouseState( ).X.abs, eventData->GetMouseState( ).Y.abs, MouseButton::Enum( eventData->GetMouseButtonId( ) ) );
	}

	void UXSystemScene::OnKeyUp( const IEvent* event )
	{
		KeyEventData* eventData = static_cast< KeyEventData* >( event->GetEventData( ) );
		m_gui->injectKeyRelease( KeyCode::Enum( eventData->GetKeyCode( ) ) );
	}

	void UXSystemScene::OnKeyDown( const IEvent* event )
	{
		KeyEventData* eventData = static_cast< KeyEventData* >( event->GetEventData( ) );
		m_gui->injectKeyPress( KeyCode::Enum( eventData->GetKeyCode( ) ) );
	}

	void UXSystemScene::_unlinkWidget( WidgetPtr widget )
	{
		void* userData = widget->getUserData( );
		UXSystemComponent::WidgetUserData* widgetUserData = static_cast< UXSystemComponent::WidgetUserData* >( userData );

		if ( 0 != widgetUserData )
		{
			for ( UXSystemComponent::WidgetUserData::iterator i = widgetUserData->begin( ); i != widgetUserData->end( ); ++i )
			{
				delete ( *i ).second;
			}

			delete widgetUserData;
		}
	}

	void UXSystemScene::Update( float deltaMilliseconds )
	{
		m_gui->injectFrameEntered( deltaMilliseconds );
	}
}