/*!
*  @company Black Art Studios
*  @author Nicholas Kostelnik
*  @file   EventManager.h
*  @date   2008/10/25
*/
#pragma once
#ifndef EVENTMANAGER_H
#define EVENTMANAGER_H
#pragma warning( disable : 4251 )

#include <queue>
#include <map>

#include "IEvent.hpp"
#include "IEventListener.hpp"
#include "IEventManager.hpp"

namespace Events
{
	/*! 
	 *  Manages all Events distributed throughout the Game
	 */
	class GAMEAPI EventManager : public IEventManager
	{

	public:

		/*! Default Destructor
		 *
		 *  @return ()
		 */
		~EventManager( );


		/*! Default Constructor
		 *
		 *  @return ()
		 */
		EventManager( ) { };

		
		/*! Queues an Event for processing on the next call to Update
		 *
		 *  @param[in] const IEvent * event
		 *  @return (void)
		 */
		void QueueEvent( const Events::IEvent* event );


		/*! Processes an Event immediately
		 *
		 *  @param[in] const IEvent * event
		 *  @return (void)
		 */
		void TriggerEvent( const Events::IEvent* event );

		
		/*! Dispatched all events in the Event Queue to their Listening Event Handlers
		 *
		 *  @param[in] float deltaMilliseconds
		 *  @return (void)
		 */
		void Update( float deltaMilliseconds );


		/*! Adds an EventListener for Event processing
		 *
		 * @param[in] IEventListener * eventListener
		 * @return ( void )
		 */
		void AddEventListener( IEventListener* eventListener );


		/*! Marks an Event Listener for removal on the next call to Update
		 *
		 * @param[in] IEventListener * eventListener
		 * @return ( void )
		 */
		void RemoveEventListener( IEventListener* eventListener );
		

	private:

		EventManager( const EventManager & copy ) { };
		EventManager & operator = ( const EventManager & copy ) { return *this; };

		IEvent::EventQueue m_eventQueue;
		IEventListener::EventListenerList m_eventListeners;

	};
};

#endif

