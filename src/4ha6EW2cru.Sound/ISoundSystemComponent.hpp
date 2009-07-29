/*!
*  @company Black Art Studios
*  @author Nicholas Kostelnik
*  @file   ISoundSystemComponent.hpp
*  @date   2009/04/27
*/
#pragma once
#ifndef ISOUNDSYSTEMCOMPONENT_HPP
#define ISOUNDSYSTEMCOMPONENT_HPP

#include "System/ISystemComponent.hpp"

namespace Sound
{
	/*!
	 *  A Sound System Component 
	 */
	class ISoundSystemComponent : public ISystemComponent
	{

	public:

		/*! Default Destructor
		 *
		 *  @return ()
		 */
		virtual ~ISoundSystemComponent( ) { };

	};
};

#endif