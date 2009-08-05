#include "UXSystemComponent.h"

using namespace luabind;
using namespace MyGUI;

#include "Events/ScriptEvent.hpp"
using namespace Events;

#include "Service/IService.hpp"
using namespace Services;

#include "Management/Management.h"

#include "Logging/Logger.h"
using namespace Logging;

namespace UX
{
	void UXSystemComponent::ChangeResolution( int width, int height, bool isFullScreen )
	{
		IService* renderService = Management::Get( )->GetServiceManager( )->FindService( System::Types::RENDER );

		AnyType::AnyTypeMap parameters;
		parameters[ System::Parameters::Graphics::Width ] = width;
		parameters[ System::Parameters::Graphics::Height ] = height;
		parameters[ System::Parameters::Graphics::FullScreen ] = isFullScreen;

		renderService->Message( "changeResolution", parameters );

		Management::Get( )->GetEventManager( )->QueueEvent( new ScriptEvent( "GRAPHICS_SETTINGS_CHANGED", width, height ) );

		m_scene->GetGui( )->windowResized( m_scene->GetGui( )->getRenderWindow( ) );
	}

	void UXSystemComponent::SetInputAllowed( bool inputAllowed )
	{
		IService* inputService = Management::Get( )->GetServiceManager( )->FindService( System::Types::INPUT );
		
		AnyType::AnyTypeMap parameters;
		parameters[ "inputAllowed" ] = inputAllowed;
		
		inputService->Message( "setInputAllowed", parameters );
	}

	void UXSystemComponent::UnScriptWidget( MyGUI::Widget* widget, const std::string& eventName, luabind::object function )
	{
		void* userData = widget->getUserData( );
		UXSystemComponent::WidgetUserData* widgetUserData = static_cast< UXSystemComponent::WidgetUserData* >( userData );

		if ( 0 != widgetUserData )
		{
			for ( UXSystemComponent::WidgetUserData::iterator i = widgetUserData->begin( ); i != widgetUserData->end( ); ++i )
			{
				if ( ( *i ).first == eventName )
				{
					if ( eventName == "onRelease" )
					{
						widget->eventMouseButtonReleased = 0;
					}

					if ( eventName == "onClick" )
					{
						widget->eventMouseButtonPressed = 0;
					}

					if ( eventName == "onKeyUp" )
					{
						widget->eventKeyButtonReleased = 0;
					}

					if ( eventName == "onListSelectAccept" )
					{
						static_cast< MultiList* >( widget )->eventListSelectAccept = 0;
					}

					if( eventName == "onScrollChangePosition" )
					{
						static_cast< VScroll* >( widget )->eventScrollChangePosition = 0;
					}

					if ( eventName == "onWindowButtonPressed" )
					{
						static_cast< Window* >( widget )->eventWindowButtonPressed = 0;
					}

					if ( eventName == "onWindowChangeCoord" )
					{
						static_cast< Window* >( widget )->eventWindowChangeCoord = 0;
					}

					widgetUserData->erase( i );

					return;
				}
			}
		}
	}

	void UXSystemComponent::ScriptWidget( MyGUI::Widget* widget, const std::string eventName, luabind::object function )
	{
		void* userData = widget->getUserData( );

		WidgetUserData* widgetUserData = static_cast< WidgetUserData* >( userData );

		if ( widgetUserData == 0 )
		{
			widgetUserData = new WidgetUserData( );
		}

		object* handlerFunctionPtr = new object( function );
		widgetUserData->insert( std::make_pair( eventName, handlerFunctionPtr ) );

		widget->setUserData( static_cast< void* >( widgetUserData ) );

		if ( eventName == "onRelease" )
		{
			widget->eventMouseButtonReleased = newDelegate( &UXSystemComponent::OnMouseReleased );
		}

		if ( eventName == "onClick" )
		{
			widget->eventMouseButtonPressed = newDelegate( &UXSystemComponent::OnMousePressed );
		}

		if ( eventName == "onKeyUp" )
		{
			widget->eventKeyButtonReleased = newDelegate( &UXSystemComponent::OnKeyUp );
		}

		if ( eventName == "onListSelectAccept" )
		{
			static_cast< MultiList* >( widget )->eventListSelectAccept = newDelegate( &UXSystemComponent::OnListSelectAccept );
		}

		if( eventName == "onScrollChangePosition" )
		{
			static_cast< VScroll* >( widget )->eventScrollChangePosition = newDelegate( &UXSystemComponent::OnEventScrollChangePosition );
		}

		if ( eventName == "onWindowButtonPressed" )
		{
			static_cast< Window* >( widget )->eventWindowButtonPressed = newDelegate( &UXSystemComponent::OnWindowButtonPressed );
		}

		if ( eventName == "onWindowChangeCoord" )
		{
			static_cast< Window* >( widget )->eventWindowChangeCoord = newDelegate( &UXSystemComponent::OnWindowChangeCoord );
		}
	}

	void UXSystemComponent::LoadComponent( const std::string componentName )
	{
		m_scene->CreateComponent( componentName, "default" );
	}

	void UXSystemComponent::OnMouseReleased( MyGUI::WidgetPtr widget, int left, int top, MyGUI::MouseButton id )
	{
		void* userData = widget->getUserData( );
		WidgetUserData* widgetUserData = static_cast< WidgetUserData* >( userData );

		for ( WidgetUserData::iterator i = widgetUserData->begin( ); i != widgetUserData->end( ); ++i )
		{
			if ( ( *i ).first == "onRelease" )
			{
				object eventHandler = *( *i ).second;

				try
				{
					eventHandler( static_cast< int >( id.value ), left, top );
				}
				catch( error& e )
				{
					object error_msg( from_stack( e.state( ) , -1 ) );
					std::stringstream logMessage;
					logMessage << error_msg;
					Logger::Get( )->Warn( logMessage.str( ) );
				}
			}
		}
	}

	void UXSystemComponent::OnMousePressed( MyGUI::WidgetPtr widget, int left, int top, MyGUI::MouseButton id )
	{
		void* userData = widget->getUserData( );
		WidgetUserData* widgetUserData = static_cast< WidgetUserData* >( userData );

		for ( WidgetUserData::iterator i = widgetUserData->begin( ); i != widgetUserData->end( ); ++i )
		{
			if ( ( *i ).first == "onClick" )
			{
				object eventHandler = *( *i ).second;

				try
				{
					eventHandler( static_cast< int >( id.value ), left, top );
				}
				catch( error& e )
				{
					object error_msg( from_stack( e.state( ) , -1 ) );
					std::stringstream logMessage;
					logMessage << error_msg;
					Logger::Get( )->Warn( logMessage.str( ) );
				}
			}
		}
	}

	void UXSystemComponent::OnKeyUp( MyGUI::WidgetPtr widget, MyGUI::KeyCode key )
	{
		void* userData = widget->getUserData( );
		WidgetUserData* widgetUserData = static_cast< WidgetUserData* >( userData );

		for ( WidgetUserData::iterator i = widgetUserData->begin( ); i != widgetUserData->end( ); ++i )
		{
			if ( ( *i ).first == "onKeyUp" )
			{
				Char keyCode = InputManager::getInstancePtr( )->getKeyChar( key, 0 );
				char* keyText = ( char* ) &keyCode;

				object eventHandler = *( *i ).second;

				try
				{
					eventHandler( static_cast< int >( key.value ), std::string( keyText ) );
				}
				catch( error& e )
				{
					object error_msg( from_stack( e.state( ) , -1 ) );
					std::stringstream logMessage;
					logMessage << error_msg;
					Logger::Get( )->Warn( logMessage.str( ) );
				}
			}
		}
	}

	void UXSystemComponent::OnListSelectAccept( MultiListPtr widget, size_t index )
	{
		void* userData = widget->getUserData( );
		WidgetUserData* widgetUserData = static_cast< WidgetUserData* >( userData );

		for ( WidgetUserData::iterator i = widgetUserData->begin( ); i != widgetUserData->end( ); ++i )
		{
			if ( ( *i ).first == "onListSelectAccept" )
			{
				object eventHandler = *( *i ).second;

				try
				{
					eventHandler( index );
				}
				catch( error& e )
				{
					object error_msg( from_stack( e.state( ) , -1 ) );
					std::stringstream logMessage;
					logMessage << error_msg;
					Logger::Get( )->Warn( logMessage.str( ) );
				}
			}
		}
	}

	void UXSystemComponent::OnEventScrollChangePosition( MyGUI::VScrollPtr widget, size_t position )
	{
		void* userData = widget->getUserData( );
		WidgetUserData* widgetUserData = static_cast< WidgetUserData* >( userData );

		for ( WidgetUserData::iterator i = widgetUserData->begin( ); i != widgetUserData->end( ); ++i )
		{
			if ( ( *i ).first == "onScrollChangePosition" )
			{
				object eventHandler = *( *i ).second;

				try
				{
					eventHandler( static_cast< int >( position ) );
				}
				catch( error& e )
				{
					object error_msg( from_stack( e.state( ) , -1 ) );
					std::stringstream logMessage;
					logMessage << error_msg;
					Logger::Get( )->Warn( logMessage.str( ) );
				}
			}
		}
	}

	void UXSystemComponent::OnWindowButtonPressed( MyGUI::WindowPtr widget, const std::string& name )
	{
		void* userData = widget->getUserData( );
		WidgetUserData* widgetUserData = static_cast< WidgetUserData* >( userData );

		for ( WidgetUserData::iterator i = widgetUserData->begin( ); i != widgetUserData->end( ); ++i )
		{
			if ( ( *i ).first == "onWindowButtonPressed" )
			{
				object eventHandler = *( *i ).second;

				try
				{
					eventHandler( name );
				}
				catch( error& e )
				{
					object error_msg( from_stack( e.state( ) , -1 ) );
					std::stringstream logMessage;
					logMessage << error_msg;
					Logger::Get( )->Warn( logMessage.str( ) );
				}
			}
		}
	}

	void UXSystemComponent::OnWindowChangeCoord( MyGUI::WindowPtr widget )
	{
		void* userData = widget->getUserData( );
		WidgetUserData* widgetUserData = static_cast< WidgetUserData* >( userData );

		for ( WidgetUserData::iterator i = widgetUserData->begin( ); i != widgetUserData->end( ); ++i )
		{
			if ( ( *i ).first == "onWindowChangeCoord" )
			{
				object eventHandler = *( *i ).second;

				try
				{
					eventHandler( );
				}
				catch( error& e )
				{
					object error_msg( from_stack( e.state( ) , -1 ) );
					std::stringstream logMessage;
					logMessage << error_msg;
					Logger::Get( )->Warn( logMessage.str( ) );
				}
			}
		}
	}

	std::vector< std::string > UXSystemComponent::GetSupportedResolutions( )
	{
		typedef std::vector< std::string > StringVector;

		IService* renderService = Management::Get( )->GetServiceManager( )->FindService( System::Types::RENDER );
		StringVector resolutions = renderService->Message( "getAvailableVideoModes", AnyType::AnyTypeMap( ) )[ "availableVideoModes" ].As< StringVector >( );

		std::multimap< int, std::string > resolutionWidths;

		for( StringVector::iterator i = resolutions.begin( ); i != resolutions.end( ); ++i )
		{
			std::string resolution = ( *i );

			std::stringstream resolutionStream;
			resolutionStream << resolution.substr( 0, resolution.find( " x " ) );

			int resolutionWidth = 0;
			resolutionStream >> resolutionWidth;
			resolutionWidths.insert( std::make_pair( resolutionWidth, resolution ) );
		}

		resolutions.clear( );

		for( std::multimap< int, std::string >::iterator i = resolutionWidths.begin( ); i != resolutionWidths.end( ); ++i )
		{
			resolutions.push_back( ( *i ).second );
		}

		return resolutions;
	}
}