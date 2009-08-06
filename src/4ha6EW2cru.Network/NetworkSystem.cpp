#include "NetworkSystem.h"

#include "NetworkSystemScene.h"

#include <RakNetworkFactory.h>
#include <RakSleep.h>
#include <BitStream.h>
#include <MessageIdentifiers.h>

using namespace RakNet;

#include "Logging/Logger.h"
using namespace Logging;

#include "Events/Event.h"
#include "Events/EventData.hpp"
using namespace Events;

#include "System/SystemType.hpp"
using namespace Configuration;

#include "Management/Management.h"

#include "NetworkUtils.h"

#include "Configuration/ConfigurationTypes.hpp"

#include "ServerNetworkProvider.h"
#include "ClientNetworkProvider.h"

#include "ServerAdvertisement.hpp"

#include <luabind/luabind.hpp>
using namespace luabind;

namespace Network
{
	NetworkSystem::~NetworkSystem( )
	{
		delete m_networkProvider;
		m_networkProvider = 0;
	}

	void NetworkSystem::Release( )
	{
		m_networkProvider->Release( );
	}

	ISystemScene* NetworkSystem::CreateScene()
	{
		m_scene = new NetworkSystemScene( this );
		return m_scene;
	}

	void NetworkSystem::Initialize( Configuration::IConfiguration* configuration )
	{
		m_configuration = configuration;

		if ( m_attributes[ System::Attributes::Network::IsServer ].As< bool >( ) )
		{
			m_networkProvider = new ServerNetworkProvider( this );
		}
		else
		{
			m_networkProvider = new ClientNetworkProvider( this );
		}

		m_networkProvider->Initialize( configuration );

		Management::Get( )->GetServiceManager( )->RegisterService( this ); 
	}

	void NetworkSystem::PushMessage( const System::Message& message, AnyType::AnyTypeMap parameters )
	{
		m_networkProvider->PushMessage( message, parameters );
	}

	void NetworkSystem::Update( const float& deltaMilliseconds )
	{
		m_networkProvider->Update( deltaMilliseconds );
	}

	AnyType::AnyTypeMap NetworkSystem::Message( const System::Message& message, AnyType::AnyTypeMap parameters )
	{
		AnyType::AnyTypeMap results;

		if ( message == System::Messages::RegisterScriptFunctions )
		{
			scope luaScope = 
				(
				class_< ServerAdvertisement >( "ServerAdvertisement" )
					.def( constructor< const std::string&, const std::string&, const int&, const int&, const int& >( ) )
					.def( "getServerName", &ServerAdvertisement::GetServerName )
					.def( "getMaxPlayers", &ServerAdvertisement::GetMaxPlayers )
					.def( "getPlayerCount", &ServerAdvertisement::GetPlayerCount )
					.def( "getLevelName", &ServerAdvertisement::GetLevelName )
					.def( "getPing", &ServerAdvertisement::GetPing )
				);

			results[ System::TypeStrings::NETWORK ] = luaScope;
		} 
		else if ( m_networkProvider )
		{
			return m_networkProvider->Message( message, parameters );
		}

		return results;
	}

	void NetworkSystem::MessageComponent( const std::string& componentName, const std::string& message, AnyType::AnyTypeMap parameters )
	{
		m_scene->MessageComponent( componentName, message, parameters );
	}
}