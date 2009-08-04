/*!
*  @company Black Art Studios
*  @author Nicholas Kostelnik
*  @file   IWorld.hpp
*  @date   2009/04/27
*/
#pragma once
#ifndef IWORLD_HPP
#define IWORLD_HPP

#include <string>

#include "../System/ISystemScene.hpp"

#include "IWorldEntity.hpp"

namespace State
{
	/*!
	 *  A container for all entities 
	 */
	class IWorld
	{

	public:

		/*! Default Destructor
		 *
		 *  @return ()
		 */
		virtual ~IWorld( ) { };


		/*! Creates a World Entity Container
		 *
		 *  @param[in] const std::string & name
		 *  @return (IWorldEntity*)
		 */
		virtual IWorldEntity* CreateEntity( const std::string& name ) = 0;


		/*! Creates a World Entity Container
		*
		*  @param[in] const std::string & name
		*  @return (IWorldEntity*)
		*/
		virtual void DestroyEntity( const std::string& name ) = 0;


		/*! Adds a System Scene to the internal scene list
		 *
		 *  @param[in] ISystemScene * systemScene
		 *  @return (void)
		 */
		virtual void AddSystemScene( ISystemScene* systemScene ) = 0;


		/*! Gets a list of internal system scenes
		 *
		 *  @return (const SystemSceneMap&)
		 */
		virtual const ISystemScene::SystemSceneMap& GetSystemScenes( ) const = 0;


		/*! Destroys all entities within the world
		 *
		 *  @return (void)
		 */
		virtual void Clear( ) = 0;

		
		/*! Destroys the World and All Registered Scenes
		*
		* @return ( void )
		*/
		virtual void Destroy( ) = 0;

	};
};

#endif
