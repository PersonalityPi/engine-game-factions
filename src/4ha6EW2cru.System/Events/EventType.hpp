/*!
*  @company Black Art Studios
*  @author Nicholas Kostelnik
*  @file   EventType.hpp
*  @date   2009/04/25
*/
#pragma once
#ifndef EVENTTYPE_H
#define EVENTTYPE_H

namespace Events
{
	/*! 
	 *  All possible Events within the Game
	 */
	enum EventType
	{
		ALL_EVENTS,
		TEST_EVENT,
		GAME_INITIALIZED,
		GAME_LEVEL_CHANGED,
		GAME_QUIT,
		GAME_ENDED,
		INPUT_KEY_UP,
		INPUT_KEY_DOWN,
		INPUT_MOUSE_PRESSED,
		INPUT_MOUSE_RELEASED,
		INPUT_MOUSE_MOVED,
		GRAPHICS_SETTINGS_CHANGED,
		GRAPHICS_RAY_CAST,
		UI_TITLE_SCREEN,
		UI_MAIN_MENU,
		UI_PAUSE_MENU,
		UI_OPTIONS,
		UI_CLEAR,
		UI_CONSOLE,
		LOG_MESSAGE_APPENDED,
		SCRIPT_COMMAND_EXECUTED,
		EVENTTYPE_MAX
	};
};

#endif
