/*!
*  @company Black Art Studios
*  @author Nicholas Kostelnik
*  @file  AlreadyInitializedException.hpp
*  @date   2009/04/25
*/
#pragma once
#ifndef ALREADYINITIALIZEDEXCEPTION_H
#define ALREADYINITIALIZEDEXCEPTION_H

/*! 
 *  An Exception to note an Already Initialized Component
 */
class AlreadyInitializedException : public std::exception
{

public:

	/*! Default Destructor
	 *
	 *  @return ()
	 */
	~AlreadyInitializedException( ) { };


	/*! Constructor with default error message
	 *
	 *  @return ()
	 */
	AlreadyInitializedException( )
		: std::exception( "Object has already been Initialized" )
	{

	}


	/*! Constructor with custom error message
	 *
	 *  @param[in] const std::string message
	 *  @return ()
	 */
	AlreadyInitializedException( const std::string message )
		: std::exception( message.c_str( ) )
	{

	}

private:

	AlreadyInitializedException( const AlreadyInitializedException & copy ) { };
	AlreadyInitializedException & operator = ( const AlreadyInitializedException & copy ) { return *this; };

};


#endif

