/*!
*  @company Black Art Studios
*  @author Nicholas Kostelnik
*  @file   InputSystemComponent.h
*  @date   2009/04/26
*/
#pragma once
#ifndef INPUTSYSTEMCOMPONENT_H
#define INPUTSYSTEMCOMPONENT_H

#include <string>
#include <OIS.h>

#include "IInputSystemComponent.hpp"
#include "InputMessageBinding.hpp"

#include "System/SystemType.hpp"

namespace Input
{
	/*! 
	 *  An Input System Scene Component
	 */
	class InputSystemComponent : public IInputSystemComponent
	{
		typedef std::deque< float > InputHistory;
	
	public:
	
		/*! Default Destructor
		*
		*  @return ()
		*/
		~InputSystemComponent( ) { };
	
	
		/*! Default Constructor
		*
		*  @return ()
		*/
		InputSystemComponent( )
			: m_historySize( 10 )
		{

		}
	
	
		/*! Initializes the Component
		*
		*  @param[in] AnyType::AnyValueMap properties
		*  @return (void)
		*/
		void Initialize( );
	
	
		/*! Steps the internal data of the Component
		*
		*  @param[in] float deltaMilliseconds
		*  @return (void)
		*/
		void Update( float deltaMilliseconds );
	
	
		/*! Destroys the Component
		*
		*  @return (void)
		*/
		void Destroy( ) { };


		/*! Gets the properties of the Component
		*
		*  @return (AnyTypeKeyMap)
		*/
		AnyType::AnyTypeMap GetAttributes( ) const { return m_attributes; };


		/*! Sets an Attribute on the Component *
		*
		*  @param[in] const unsigned int attributeId
		*  @param[in] const AnyType & value
		*/
		inline void SetAttribute( const System::Attribute& attributeId, const AnyType& value ) { m_attributes[ attributeId ] = value; };


		/*! Adds an Observer to the Component
		*
		*  @param[in] IObserver * observer
		*  @return (void)
		*/
		void AddObserver( IObserver* observer ) { m_observers.push_back( observer ); };


		/*! Gets the System::Types::Type of the Component
		*
		*  @return (System::Types::Type)
		*/
		inline System::Types::Type GetType( ) const { return System::Types::INPUT; };


		/*! Posts a message to observers
		*
		*  @param[in] const std::string & message
		*  @param[in] AnyType::AnyValueMap parameters
		*  @return (AnyType)
		*/
		AnyType PushMessage( const System::MessageType& message, AnyType::AnyTypeMap parameters );


		/*! Messages the Component to influence its internal state
		*
		*  @param[in] const std::string & message
		*  @return (AnyType)
		*/
		AnyType Observe( const ISubject* subject, const System::MessageType& message, AnyType::AnyTypeMap parameters );


		/*! Called by the Scene when the user presses a mouse button
		*
		* @param[in] const OIS::MouseEvent & arg
		* @param[in] OIS::MouseButtonID id
		* @return ( void )
		*/
		void MousePressed( const OIS::MouseEvent &arg, OIS::MouseButtonID id );


		/*! Called by the Scene when the user releases a mouse button
		*
		* @param[in] const OIS::MouseEvent & arg
		* @param[in] OIS::MouseButtonID id
		* @return ( void )
		*/
		void MouseReleased( const OIS::MouseEvent &arg, OIS::MouseButtonID id );


		/*! Called the the Scene when the user moves the mouse
		*
		* @param[in] const OIS::MouseEvent & arg
		* @return ( void )
		*/
		void MouseMoved( const OIS::MouseEvent &arg );


		/*! Called by the Scene when a key is pressed
		*
		* @param[in] const OIS::KeyEvent & arg
		* @return ( void )
		*/
		void KeyPressed( const OIS::KeyEvent &arg );


		/*! Called by the Scene when a key is released
		*
		* @param[in] const KeyEvent & arg
		* @return ( void )
		*/
		void KeyReleased( const OIS::KeyEvent &arg );


		/*! Writes the contents of the object to the given stream
		*
		* @param[in] IStream * stream
		* @return ( void )
		*/
		void Serialize( IO::IStream* stream ) { };


		/*! Reads the contents of the object from the stream
		*
		* @param[in] IStream * stream
		* @return ( void )
		*/
		void DeSerialize( IO::IStream* stream ) { };
	
	private:
	
		InputSystemComponent( const InputSystemComponent & copy ) { };
		InputSystemComponent & operator = ( const InputSystemComponent & copy ) { return *this; };

		float AverageInputHistory( const InputHistory& inputHistory );

		InputMessageBinding::InputMessageBindingList m_keyUpMessages;
		InputMessageBinding::InputMessageBindingList m_mouseUpMessages;

		ObserverList m_observers;
		AnyType::AnyTypeMap m_attributes;

		InputHistory m_xHistory;
		InputHistory m_yHistory;

		int m_historySize;
	
	};
};

#endif
