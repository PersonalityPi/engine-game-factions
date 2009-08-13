/*!
*  @company Black Art Studios
*  @author Nicholas Kostelnik
*  @file   ISystem.hpp
*  @date   2009/04/25
*/
#pragma once
#ifndef ISYSTEM_H
#define ISYSTEM_H

#include <string>
#include <deque>
#include <map>

#include "SystemType.hpp"
#include "AnyType.hpp"
#include "ISystemScene.hpp"

#include "../Configuration/IConfiguration.hpp"

/*! 
 *  A Game System
 */
class ISystem
{

public:

	typedef std::map< System::Types::Type, ISystem* > SystemTypeMap;
	typedef std::multimap< System::Queues::Queue, ISystem* > SystemQueueMap;

	/*! Default Destructor
	*
	*  @return ()
	*/
	virtual ~ISystem( ) { };


	/*! Initializes the System with the game configuration
	*
	* @param[in] Configuration::IConfiguration * configuration
	* @return ( void )
	*/
	virtual void Initialize( Configuration::IConfiguration* configuration ) = 0;


	/*! Steps the System's internal data
	*
	*  @param[in] float deltaMilliseconds
	*  @return (void)
	*/
	virtual void Update( float deltaMilliseconds ) = 0;


	/*! Releases the System
	*
	*  @return (void)
	*/
	virtual void Release( ) = 0;


	/*! Returns the type of the System
	*
	*  @return (System::Types::Type)
	*/
	virtual System::Types::Type GetType( ) const = 0;


	/*! Creates the System Scene
	*
	*  @return (ISystemScene*)
	*/
	virtual ISystemScene* CreateScene( ) = 0;


	/*! Gets the System's Properties
	*
	*  @return (AnyTypeMap)
	*/
	virtual AnyType::AnyTypeMap GetAttributes( ) const = 0;


	/*! Sets a System Property
	*
	*  @param[in] const std::string & name
	*  @param[in] AnyType value
	*  @return (void)
	*/
	virtual void SetAttribute( const std::string& name, AnyType value ) = 0;

};

#endif
