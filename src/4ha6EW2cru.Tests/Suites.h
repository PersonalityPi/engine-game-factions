/**/
#pragma once
#ifndef SUITES_H
#define SUITES_H

#include <string>

class Suites
{

public:

	static std::string EventsSuite( ) { return "Events"; };
	static std::string GraphicsSuite( ) { return "Graphics"; };
	static std::string InputSuite( ) { return "Input"; };
	static std::string IOSuite( ) { return "IO"; };
	static std::string LoggingSuite( ) { return "Logging"; };
	static std::string StateSuite( ) { return "State"; };
	static std::string ScriptingSuite( ) { return "Scripting"; };
	static std::string SystemSuite( ) { return "System"; };
	static std::string ViewSuite( ) { return "View"; };
	static std::string TypesSuite( ) { return "Types"; };
	static std::string UtilitySuite( ) { return "Utility"; };
	static std::string GeometrySuite( ) { return "Geometry"; };
	static std::string PhysicsSuite( ) { return "physics"; };
	static std::string AISuite( ) { return "animation"; };
	static std::string SoundSuite( ) { return "sound"; };
	
};

#endif
