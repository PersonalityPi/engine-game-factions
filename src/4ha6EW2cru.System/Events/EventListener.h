/*!
*  @company Black Art Studios
*  @author Nicholas Kostelnik
*  @file   EventListener.h
*  @date   2009/04/25
*/
#pragma once
#ifndef EVENTLISTENER_H
#define EVENTLISTENER_H

#include "../Logging/Logger.h"
#include "../Exceptions/NullReferenceException.hpp"

#include "IEvent.hpp"
#include "IEventListener.hpp"
#include "EventType.hpp"

namespace Events
{
	/*! 
	 *  Listener for Events and handles the appropriate action
	 */
	template< class T >
	class EventListener : public IEventListener
	{

		typedef void ( T::*HandlerFunctor ) ( const IEvent* event );

	public:

		/*! Default Constructor
		 *
		 *  @param[in] const EventType eventType
		 *  @param[in] T * const handlerTarget
		 *  @param[in] HandlerFunctor handlerFunctor
		 *  @return ()
		 */
		EventListener( T* const handlerTarget, HandlerFunctor handlerFunctor )
			: m_handlerFunctor( handlerFunctor )
			, m_handlerTarget( handlerTarget )
			, m_markedForDeletion( false )
		{

		}

		
		/*! Calls the subscribed function for the Event
		 *
		 *  @param[in] const IEvent * event
		 *  @return (void)
		 */
		void HandleEvent( const IEvent* event ) const
		{
			if ( m_handlerTarget == 0 )
			{
				NullReferenceException nullTarget( "EventListener::HandleEvent - HandlerTarget is NULL" );
				Fatal( nullTarget.what( ) );
				throw nullTarget;
			}

			if ( m_handlerFunctor == 0 )
			{
				NullReferenceException nullHandler( "EventListener::HandleEvent - HandlerFunctor is NULL" );
				Fatal( nullHandler.what( ) );
				throw nullHandler;
			}

			if ( 0 == event )
			{
				NullReferenceException nullEvent( "EventListener::HandleEvent - Event is NULL" );
				Fatal( nullEvent.what( ) );
				throw nullEvent;
			}

			if ( !m_markedForDeletion )
			{
				( m_handlerTarget->*m_handlerFunctor )( event );
			}
		}

		
		/*! Returns a pointer to the method assigned to handle the Event
		 *
		 *  @return (const HandlerFunctor)
		 */
		inline const HandlerFunctor GetHandlerFunctor( ) const { return m_handlerFunctor; };

		
		/*! Retrieves the object instance for which the EventListener is Listening
		 *
		 *  @return (const T*)
		 */
		inline const T* GetHandlerTarget( ) const { return m_handlerTarget; };

		
		/*! Marks the EventHandler for Deletion on the Next Update
		 *
		 *  @return (void)
		 */
		inline void MarkForDeletion( ) { m_markedForDeletion = true; };

		
		/*! Gets whether the EventHandler is marked for deletion
		 *
		 *  @return (bool)
		 */
		inline bool IsMarkedForDeletion( ) const { return m_markedForDeletion; };


		/*! Returns the Address of the Class performing the Task
		*
		* @return ( unsigned int )
		*/
		unsigned int GetHandlerAddress( ) const { return ( unsigned int ) m_handlerTarget; };


		/*! Returns the name to the Function performing the Task
		*
		* @return ( std::string )
		*/
		std::string GetHandlerFunctionName( ) const { return typeid( m_handlerFunctor ).name( ); };

		inline bool operator == ( EventListener* input ) const
		{
			return (
				this->GetHandlerAddress( ) == input->GetHandlerAddress( ) &&
				this->GetHandlerFunctionName( ) == input->GetHandlerFunctionName( )
				);

		}

	private:

		HandlerFunctor m_handlerFunctor;
		T* m_handlerTarget;
		bool m_markedForDeletion;

		~EventListener( ) { };
		EventListener( ) { };
		EventListener( const EventListener & copy ) { };
		EventListener & operator = ( const EventListener & copy ) { return *this; };

	};

	template< class T >
	IEventListener* MakeEventListener( T* handlerTarget, void ( T::*handlerFunctor ) ( const IEvent* event ) )
	{
		if ( 0 == handlerTarget )
		{
			NullReferenceException nullTarget( "EventManager::RemoveEventListener - Event Target is NULL" );
			Fatal( nullTarget.what( ) );
			throw nullTarget;
		}

		if ( 0 == handlerFunctor )
		{
			NullReferenceException nullFunctor( "EventManager::RemoveEventListener - Handler Functor is NULL" );
			Fatal( nullFunctor.what( ) );
			throw nullFunctor;
		}

		return new EventListener< T >( handlerTarget, handlerFunctor );
	}
};

#endif

