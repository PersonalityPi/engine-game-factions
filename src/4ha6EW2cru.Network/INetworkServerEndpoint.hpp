/*!
*  @company Black Art Studios
*  @author Nicholas Kostelnik
*  @file   INetworkServerEndpoint.hpp
*  @date   2009/08/17
*/
#pragma once
#ifndef INETWORKSERVERENDPOINT_HPP
#define INETWORKSERVERENDPOINT_HPP

#include "INetworkEndpoint.hpp"

#include <RPC3.h>

namespace Network
{
	/*! 
	 *  An endpoint that receives client information
	 */
	class GAMEAPI INetworkServerEndpoint : public INetworkEndpoint
	{

	public:

		/*! Default Destructor
		 *
		 *  @return ()
		 */
		virtual ~INetworkServerEndpoint( ) { };


		/*! Called when a client has finished loading a level
		 *
		 * @param[in] RakNet::RPC3 * rpcFromNetwork
		 * @return ( void )
		 */
		virtual void LevelLoaded( RakNet::RPC3* rpcFromNetwork ) = 0;
		
	};
};

#endif