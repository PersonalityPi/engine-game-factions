/*!
*  @company Black Art Studios
*  @author Nicholas Kostelnik
*  @file   ISystemScene.hpp
*  @date   2009/04/25
*/
#pragma once
#ifndef ISYSTEMWORLD_H
#define ISYSTEMWORLD_H

#include <string>
#include <map>
#include <vector>

#include "ISystemComponent.hpp"

#include "../Export.hpp"

/*! 
 *  A System Specific Scene
 */
class GAMEAPI ISystemScene
{

public:

  typedef std::vector<ISystemScene*> SystemSceneList;
  typedef std::map<int, ISystemScene*> SystemSceneMap;

  /*! Default Destructor
   *
   *  @return ()
   */
  virtual ~ISystemScene() { };


  /*! Initializes the System Scene
   *
   *  @return (void)
   */
  virtual void Initialize() = 0;


  /*! Steps internal data of the SystemScene
   *
   *  @param[in] float deltaMilliseconds
   *  @return (void)
   */
  virtual void Update(float deltaMilliseconds) = 0;


  /*! Destroys the System Scene
   *
   *  @return (void)
   */
  virtual void Destroy() = 0;


  /*! Gets the System::Types::Type of the SystemScene
   *
   *  @return (System::Types::Type)
   */
  virtual System::Types::Type GetType() const = 0;


  /*! Creates a SystemComponent specific to the SystemScene
   *
   *  @param[in] const std::string & name
   *  @param[in] const std::string & type
   *  @return (ISystemComponent*)
   */
  virtual ISystemComponent* CreateComponent(const std::string& name, const std::string& type) = 0;


  /*! Destroys a SystemComponent created by the SystemScene
   *
   *  @param[in] ISystemComponent * component
   *  @return (void)
   */
  virtual void DestroyComponent(ISystemComponent* component) = 0;
};

#endif
