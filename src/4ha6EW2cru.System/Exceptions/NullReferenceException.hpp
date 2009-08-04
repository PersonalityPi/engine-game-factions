/*!
*  @company Black Art Studios
*  @author Nicholas Kostelnik
*  @file   NullReferenceException.hpp
*  @date   2009/04/25
*/
#pragma once
#ifndef NULLREFERENCEEXCEPTION_H
#define NULLREFERENCEEXCEPTION_H

#include <exception>
#include <string>

/*! 
*  An Exception for when the system encounters a Null Reference
*/
class NullReferenceException : public std::exception
{

public:

	/*! Default Destructor
	*
	*  @return ()
	*/
	~NullReferenceException( ) { };


	/*! Constructor with default error message
	*
	*  @return ()
	*/
	NullReferenceException( )
		: std::exception( "The referenced object is NULL" )
	{

	}


	/*! Constructor with custom error message
	*
	*  @param[in] const std::string message
	*  @return ()
	*/
	NullReferenceException( const std::string message )
		: std::exception( message.c_str( ) )
	{

	}

private:

	NullReferenceException( const NullReferenceException & copy ) { };
	NullReferenceException & operator = ( const NullReferenceException & copy ) { return *this; };

};

#endif

