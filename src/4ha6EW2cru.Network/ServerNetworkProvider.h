/*!
*  @company Black Art Studios
*  @author Nicholas Kostelnik
*  @file   ServerNetworkProvider.h
*  @date   2009/07/15
*/
#pragma once
#ifndef SERVERNETWORKPROVIDER_H
#define SERVERNETWORKPROVIDER_H

#include "INetworkProvider.hpp"
#include "INetworkSystem.hpp"

#include <RakPeerInterface.h>

#include <deque>

namespace Network
{
	/*! 
	 *  A Network Provider that servers to clients
	 */
	class ServerNetworkProvider : public INetworkProvider
	{

		typedef std::deque< SystemAddress > SystemAddressList;

	public:

		/*! Default Destructor
		 *
		 *  @return ()
		 */
		~ServerNetworkProvider( );


		/*! Default Constructor
		*
		* @return (  )
		*/
		ServerNetworkProvider( INetworkSystem* networkSystem )
			: m_configuration( 0 )
			, m_networkSystem( networkSystem )
		{

		}

		void Initialize( Configuration::IConfiguration* configuration );

		void Update( const float& deltaMilliseconds );

		inline AnyType::AnyTypeMap Message( const System::Message& message, AnyType::AnyTypeMap parameters ) { return AnyType::AnyTypeMap( ); };

		void Release( );

		void PushMessage( const System::Message& message, AnyType::AnyTypeMap parameters );

	private:

		ServerNetworkProvider( const ServerNetworkProvider & copy ) { };
		ServerNetworkProvider & operator = ( const ServerNetworkProvider & copy ) { return *this; };

		void OnPacketReceived( Packet* packet );
		void OnPing( Packet* packet );
		void OnClientAdvertise( Packet* packet );
		void OnClientConnected( Packet* packet );
		void OnClientDisconnected( Packet* packet );

		Configuration::IConfiguration* m_configuration;

		INetworkSystem* m_networkSystem;
		RakPeerInterface* m_networkInterface;
		SystemAddressList m_clients;
		
	};
};

#endif
