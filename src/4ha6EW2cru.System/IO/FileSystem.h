/*!
*  @company Black Art Studios
*  @author Nicholas Kostelnik
*  @file   FileSystem.h
*  @date   2009/04/26
*/
#pragma once
#ifndef FILESYSTEM_H
#define FILESYSTEM_H

#include "IFileSystem.hpp"

#include "FileBuffer.hpp"
#include "FileSearchResult.hpp"

namespace IO
	{
	/*! 
	*  An Abstract representation of the Game File System
	*/
	class FileSystem : public IFileSystem
	{

	public:

		/*! Default Destructor
		*
		*  @return ()
		*/
		~FileSystem( );


		/*! Default Constructor
		 *
		 *  @return ()
		 */
		FileSystem( );


		/*! Initializes the File System and any built in Mount Points
		*
		*  @return (void)
		*/
		void Initialize( );


		/*! Mounts the given path into the file system
		*
		*  @param[in] const std::string path - can be a ZIP, BAD, PAK Archive or a Local Folder
		*  @param[in] const std::string mountPoint - the internal path the above will be mounted at
		*  @return (bool)
		*/
		bool Mount( const std::string& filePath, const std::string& mountPoint );


		/*! Returns the file data at the given path
		*
		*  @param[in] const std::string filePath
		*  @param[in] bool binary
		*  @return (FileBuffer*)
		*/
		FileBuffer* GetFile( const std::string& filePath, bool binary = true ) const;


		/*! Saves the given file data to the path specified in the FileBuffer
		*
		*  @param[in] const FileBuffer & fileBuffer
		*  @return (void)
		*/
		void SaveFile( const FileBuffer& fileBuffer ) const;


		/*! Checks to see if a file exists at the given path
		*
		*  @param[in] const std::string filePath
		*  @param[in] bool throwOnFail
		*  @return (bool)
		*/
		bool FileExists( const std::string& filePath, bool throwOnFail = false ) const;


		/*! Performs a file search
		*
		*  @param[in] const std::string path
		*  @param[in] const std::string searchPattern - wild card operator is *, so '/*.gif', '*.*', and '*' are all valid
		*  @param[in] const bool recursive
		*  @return (FileSearchResultList*)
		*/
		FileSearchResult::FileSearchResultList* FileSearch( const std::string& path, const std::string& searchPattern, bool recursive ) const;

	private:

		FileSearchResult::FileSearchResultList*_FileSearch( const std::string& path, const std::string& pattern, bool recursive, FileSearchResult::FileSearchResultList* results ) const;

		FileSystem( const FileSystem & copy ) { };
		FileSystem & operator = ( const FileSystem & copy ) { return *this; };

	};
};

#endif


