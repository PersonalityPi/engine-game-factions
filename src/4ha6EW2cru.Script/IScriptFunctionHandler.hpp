/*!
*  @company Black Art Studios
*  @author Nicholas Kostelnik
*  @file   IScriptFunctionHandler.hpp
*  @date   2009/04/28
*/
#pragma once
#ifndef ISCRIPTGENERICHANDLER_HPP
#define ISCRIPTGENERICHANDLER_HPP

#include <luabind/luabind.hpp>
#include <deque>

#include "Events/IEvent.hpp"
#include "System/SystemType.hpp"

namespace Script
{
	/*!
	 *  A Container for handling Updates or Events from the Game  
	 */
	class IScriptFunctionHandler
	{

	public:

		typedef std::deque< IScriptFunctionHandler* > FunctionList;
		typedef std::multimap< System::MessageType, IScriptFunctionHandler* > FunctionMap;

		/*! Default Destructor
		 *
		 *  @return ()
		 */
		virtual ~IScriptFunctionHandler( ) { };


		/*! Marks the Handler for deletion on the next UX Update or Event Tick
		*
		*  @return (void)
		*/
		virtual void MarkForDeletion( ) = 0;


		/*! Returns whether or not the handler is marked for deletion on the next UX Update or Event Tick
		*
		*  @return (bool)
		*/
		virtual bool IsMarkedForDeletion( ) const = 0;


		/*! Returns the LUA function
		*
		*  @return (luabind::object)
		*/
		virtual luabind::object GetFunction( ) const = 0;

	};
};

#endif
