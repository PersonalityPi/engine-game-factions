/*!
*  @company Black Art Studios
*  @author Nicholas Kostelnik
*  @file   InputSystem.h
*  @date   2009/04/26
*/
#pragma once
#ifndef INPUTMANAGER_H
#define INPUTMANAGER_H

#include <deque>

#include "InputSystemScene.h"
#include "IInputSystem.hpp"

#include "Service/IService.hpp"
#include "Configuration/IConfiguration.hpp"
#include "Events/IEventManager.hpp"
#include "Platform/IPlatformManager.h"
#include "Service/IServiceManager.h"

namespace Input
{
  /*! 
   *  Receives all Input from the User(s) and translates it into Game Events
   */
  class InputSystem : public IInputSystem, public Services::IService, public OIS::KeyListener, public OIS::MouseListener
  {
  
    typedef std::deque< InputSystemScene* > InputSystemSceneList;
  
  public:
  
    /*! Default Destructor
     *
     *  @return ()
     */
    ~InputSystem( );
  
  
    /*! Default Constructor
     *
     *  @param[in] Configuration::IConfiguration * configuration
     *  @return ()
     */
    InputSystem( Events::IEventManager* eventManager, Platform::IPlatformManager* platformManager, Services::IServiceManager* serviceManager )
      : _inputAllowed( true )
      , m_eventManager( eventManager )
      , m_configuration( 0 )
      , m_inputManager( 0 )
      , m_keyboard( 0 )
      , m_mouse( 0 )
      , m_platformManager( platformManager )
      , m_serviceManager( serviceManager )
    {
  
    }
  
  
    /*! Initializes the System
    *
    *  @return (void)
    */
    void Initialize( Configuration::IConfiguration* configuration );
  
  
    /*! Performs an Input capture and steps internal data
    *
    *  @param[in] float deltaMilliseconds
    *  @return (void)
    */
    inline void Update( float deltaMilliseconds );

  
    /*! Releases internal data of the System
    *
    *  @return (System::Types::Type)
    */
    void Release( ) { };
  

    /*! Messages the system with a command
    *
    * @param[in] const std::string & message
    * @param[in] AnyType::AnyTypeMap parameters
    * @return ( void )
    */
    AnyType::AnyTypeMap ProcessMessage( const System::MessageType& message, AnyType::AnyTypeMap parameters );

  
    /*! Returns the type of the System
    *
    *  @return (System::Types::Type)
    */
    System::Types::Type GetType( ) const { return System::Types::INPUT; };
  
  
    /*! Creates a System Scene
    *
    *  @return (ISystemScene*)
    */
    ISystemScene* CreateScene( );
  
  
    /*! Gets the System's Properties
    *
    *  @return (AnyTypeMap)
    */
    inline AnyType::AnyTypeMap GetAttributes( ) const { return m_attributes; };
  
  
    /*! Sets a System Property
    *
    *  @param[in] const std::string & name
    *  @param[in] AnyType value
    *  @return (void)
    */
    void SetAttribute( const std::string& name, AnyType value );
  

    /*! Creates a SystemComponent specific to the SystemScene
    *
    *  @param[in] const std::string & name
    *  @param[in] const std::string & type
    *  @return (ISystemComponent*)
    */
    ISystemComponent* CreateComponent( const std::string& name, System::Types::Type systemType ) { return 0; };
  
    
    /*! Callback fired when the user presses a button on the keyboard
     *
     *  @param[in] const OIS::KeyEvent & arg
     *  @return (bool)
     */
    bool keyPressed( const OIS::KeyEvent &arg );
  
    
    /*! Callback fired when the user releases a button on the keyboard
     *
     *  @param[in] const OIS::KeyEvent & arg
     *  @return (bool)
     */
    bool keyReleased( const OIS::KeyEvent &arg );
  
    
    /*! Callback fired when the user moves the mouse
     *
     *  @param[in] const OIS::MouseEvent & arg
     *  @return (bool)
     */
    bool mouseMoved( const OIS::MouseEvent &arg );
  
  
    /*! Callback fired when the user presses a button on the mouse
     *
     *  @param[in] const OIS::MouseEvent & arg
     *  @param[in] OIS::MouseButtonID id
     *  @return (bool)
     */
    bool mousePressed( const OIS::MouseEvent &arg, OIS::MouseButtonID id );
  
    
    /*! Callback fired when the user releases a button on the mouse 
     *
     *  @param[in] const OIS::MouseEvent & arg
     *  @param[in] OIS::MouseButtonID id
     *  @return (bool)
     */
    bool mouseReleased( const OIS::MouseEvent &arg, OIS::MouseButtonID id );


    /*! Returns the Bindings setup in the config file
    *
    * @return ( AnyType::AnyTypeMap )
    */
    inline InputMessageBinding::InputMessageBindingList GetBindings( ) { return m_messageBindings; };


    /*! Returns the Keyboard controller
    *
    * @return ( OIS::Keyboard* )
    */
    inline OIS::Keyboard* GetKeyboard( ) { return m_keyboard; };


    /*! Returns the Mouse controller
    *
    * @return ( OIS::Mouse* )
    */
    inline OIS::Mouse* GetMouse( ) { return m_mouse; };
  
  
  private:

    InputSystem( const InputSystem & copy ) { };
    InputSystem & operator = ( const InputSystem & copy ) { return *this; };

    void LoadMessageBindings( );
  
    bool _inputAllowed;
  
    AnyType::AnyTypeMap m_attributes;
    InputMessageBinding::InputMessageBindingList m_messageBindings;

    Configuration::IConfiguration* m_configuration;
    InputSystemSceneList m_inputScenes;

    Events::IEventManager* m_eventManager;
    Platform::IPlatformManager* m_platformManager;
    Services::IServiceManager* m_serviceManager;
  
    OIS::InputManager* m_inputManager;
    OIS::Mouse* m_mouse;
    OIS::Keyboard* m_keyboard;
  
  };
};

#endif

