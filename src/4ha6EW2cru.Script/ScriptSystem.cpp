#include "ScriptSystem.h"

using namespace Maths;

#include "ScriptSystemScene.h"
#include "ScriptComponent.h"

#include "Management/Management.h"

#include <luabind/luabind.hpp>
#include <luabind/table_policy.hpp>
#include <luabind/operator.hpp>
using namespace luabind;

extern "C"
{
	#include <lua.h>
}


namespace Script
{
	ScriptSystem::~ScriptSystem( )
	{
		if ( m_auxScene != 0 )
		{
			delete m_auxScene;
			m_auxScene = 0;
		}
	}

	void ScriptSystem::Release( )
	{
		if ( m_auxScene != 0 )
		{
			m_auxScene->Destroy( );
		}
	}

	ISystemScene* ScriptSystem::CreateScene( )
	{
		m_auxScene = new ScriptSystemScene( m_configuration );
		m_auxScene->Initialize( );

		m_scene = new ScriptSystemScene( m_configuration );
		m_scene->Initialize( );

		return m_scene;
	}

	void ScriptSystem::Initialize( Configuration::IConfiguration* configuration )
	{
		Management::Get( )->GetServiceManager( )->RegisterService( this );

		m_configuration = configuration;
	}

	void ScriptSystem::Update( float deltaMilliseconds )
	{
		m_auxScene->Update( deltaMilliseconds );
		m_scene->Update( deltaMilliseconds );
	}

	AnyType::AnyTypeMap ScriptSystem::Message( const System::Message& message, AnyType::AnyTypeMap parameters )
	{
		AnyType::AnyTypeMap results;

		if( message == "loadScript" )
		{
			ISystemComponent* component = m_auxScene->CreateComponent( parameters[ System::Attributes::Name ].As< std::string >( ), "default" );
			component->SetAttribute( System::Parameters::ScriptPath, parameters[ System::Parameters::ScriptPath ].As< std::string >( ) );
			component->Initialize( );
			results[ "component" ] = component;
		}

		if ( message == "unloadComponent" )
		{
			ISystemComponent* component = m_auxScene->FindComponent( parameters[ "name" ].As< std::string >( ) );
			m_auxScene->DestroyComponent( component );
		}

		if ( message == "getMasterState" )
		{
			results[ "masterState" ] = m_auxScene->GetState( );
		}

		if ( message == System::Messages::RegisterScriptFunctions )
		{
			scope luaScope = 
				(
				def( "print", &ScriptSystemScene::Print ),
				def( "quit", &ScriptSystemScene::Quit ),
				def( "loadLevel", &ScriptSystemScene::LoadLevel ),
				def( "endGame", &ScriptSystemScene::EndGame ),

				class_< ScriptConfiguration >( "Config" )
				.def( constructor< Configuration::IConfiguration* >( ) )
				.property( "isFullScreen", &ScriptConfiguration::IsFullScreen, &ScriptConfiguration::SetFullScreen )
				.property( "displayWidth", &ScriptConfiguration::GetDisplayWidth, &ScriptConfiguration::SetDisplayWidth )
				.property( "displayHeight", &ScriptConfiguration::GetDisplayHeight, &ScriptConfiguration::SetDisplayHeight )
				.property( "isConsole", &ScriptConfiguration::IsConsole, &ScriptConfiguration::SetConsole )
				.property( "isInvertY", &ScriptConfiguration::IsInvertY, &ScriptConfiguration::SetInvertY )
				.property( "isSmoothMouse", &ScriptConfiguration::IsSmoothMouse, &ScriptConfiguration::SetSmoothMouse )
				.property( "mouseSmoothAmount", &ScriptConfiguration::GetMouseSmoothAmount, &ScriptConfiguration::SetMouseSmoothAmount )
				.property( "sfxVolume", &ScriptConfiguration::GetSFXVolume, &ScriptConfiguration::SetSFXVolume )
				.property( "musicVolume", &ScriptConfiguration::GetMusicVolume, &ScriptConfiguration::SetMusicVolume ),

				class_< ScriptComponent >( "ScriptComponent" )
				.def( constructor< >( ) )
				.def( "include", &ScriptComponent::IncludeScript )
				.def( "registerEventHandler", &ScriptComponent::RegisterEvent )
				.def( "registerUpdateHandler", &ScriptComponent::RegisterUpdate )
				.def( "unregisterEventHandler", &ScriptComponent::UnRegisterEvent )
				.def( "unregisterUpdateHandler", &ScriptComponent::UnRegisterUpdate )
				.def( "getName", &ScriptComponent::GetName )
				.def( "getLookAt", &ScriptComponent::GetLookAt )
				.def( "getPosition", &ScriptComponent::GetPosition )
				.def( "getTime", &ScriptComponent::GetTime )
				.def( "executeString", &ScriptComponent::ExecuteString )
				.def( "rayQuery", &ScriptComponent::RayQuery, copy_table( result ) )
				.def( "broadcastEvent", ( void ( ScriptComponent::* ) ( const std::string& ) ) &ScriptComponent::BroadcastEvent )
				.def( "broadcastEvent", ( void ( ScriptComponent::* ) ( const std::string&, const std::string& ) ) &ScriptComponent::BroadcastEvent )
				.def( "broadcastEvent", ( void ( ScriptComponent::* ) ( const std::string&, int ) ) &ScriptComponent::BroadcastEvent )
				.def( "broadcastEvent", ( void ( ScriptComponent::* ) ( const std::string&, const std::string&, const std::string& ) ) &ScriptComponent::BroadcastEvent )
				.def( "broadcastEvent", ( void ( ScriptComponent::* ) ( const std::string&, const std::string&, int ) ) &ScriptComponent::BroadcastEvent )
				.def( "broadcastEvent", ( void ( ScriptComponent::* ) ( const std::string&, int, int ) ) &ScriptComponent::BroadcastEvent )
				.def( "broadcastEvent", ( void ( ScriptComponent::* ) ( const std::string&, int, const std::string& ) ) &ScriptComponent::BroadcastEvent ),

				class_< MathVector3 >( "Vector" )
				.def( constructor< float, float, float >( ) )
				.def( self + MathVector3( ) ),

				class_< MathQuaternion >( "Quaternion" )
				.def( constructor< float, float, float, float >( ) )
				);

			results[ System::TypeStrings::SCRIPT ] = luaScope;
		}

		return results;
	}
}