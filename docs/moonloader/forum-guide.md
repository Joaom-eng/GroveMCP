# MoonLoader Development Guide — cópia do primeiro post

Fonte: https://gtaforums.com/topic/890990-moonloader-%E2%80%94-development/

Importado do HTML salvo pelo usuário; scripts e anúncios não são executados nem incluídos.

Disclaimer: The text may contain mistakes because English is not my native language, and I'd be very grateful if someone sent me a PM to help me correct some of these mistakes.

Development Guide

I highly recommend reading [this](https://gtaforums.com/topic/890990-moonloader-%E2%80%94-development/) topic before, if you don't familiar with MoonLoader yet.

Note: All links to the official MoonLoader wiki pages are translated via Google Translate.

THE BASICS

First of all, you need to have basic programming skills and some Lua language knowledge. If you are already familiar with programming, but don't know Lua, you can start from ["Learn Lua in 15 Minutes"](https://learnxinyminutes.com/docs/lua/) and [official documentation](https://www.lua.org/manual/5.1/manual.html).

In the case if you have no experience in programming at all, you may want to start with any book or online course of your choice, I personally can't recommend anything in this case, but any material recommended by the Lua community should be good enough.

This article is better for understanding if you already know Lua, but anyway it won't hurt even if you don't.

THE STANDARDS

Before we start talking directly about scripting, first we need to talk about standards. MoonLoader like any other good framework has its own standards that makes development more specific and efficient. So the standard is one of the things that you would like to know about development for MoonLoader.

Global Symbols

[Global variables](http://blast.hk/wiki/moonloader:globals#googtrans(en))

[All functions including opcodes](http://blast.hk/wiki/moonloader:functions#googtrans(en))

[All events](http://blast.hk/wiki/moonloader:events#googtrans(en))

If you are already familiar with SCM (CLEO), these lists can also be useful:

[Functions based on opcodes that have difference from original opcodes](http://blast.hk/wiki/moonloader:changed_opcodes#googtrans(en))

[Removed opcodes that have alternatives](http://blast.hk/wiki/moonloader:removed_opcodes#googtrans(en))

[Missing opcodes that have no purpose in Lua](http://blast.hk/wiki/moonloader:missing_opcodes#googtrans(en))

Directory Hierarchy

These directories are located in the game's root directory.

- 'moonloader' - The main directory. It contains .lua and .luac scripts, the log file 'moonloader.log' and other subdirectories related to Lua scripts
 
- 'moonloader\lib' - for libraries and modules
 
- 'moonloader\config' - for configs of any kind, including configs in the form of Lua scripts
 
- 'moonloader\resource' - for all the resources used by scripts (textures, models, etc)
 
- 'moonloader\resource\txd' - .txd files loads from this directory using 'loadTextureDictionary' script function

Libraries

MoonLoader distro includes several lua libraries to help making some common tasks easier and standardized.

- 'moonloader' - things related to MoonLoader
 
- 'vkeys' - virtual keyboard key identifiers with helpful functions
 
- 'bitex' - the standard module 'bit' extension
 
- 'vector3d' - 3D vector class
 
- 'matrix3x3' - 3D rotation matrix class
 
- 'sampfuncs' - SAMPFUNCS plugin constants
 
- 'game.models' - common game model identifiers (weapons, vehicles, skins, etc)
 
- 'game.globals' - global SCM variables list
 
- 'game.keys' - game control key identifiers
 
- 'game.weapons' - weapon names and identifiers

Script Directives

Directives are functions that specifies various script properties. Every directive value of any script can be obtained via [LuaScript](http://blast.hk/wiki/lua:luascript#googtrans(en)) object.

Directives must be set once in the global script scope, usually at the very beginning of the script. Though, using them is not necessary, but desirable.

- [script_name](http://blast.hk/wiki/lua:script_name#googtrans(en))(string name) - specifies script name
 
- [script_author](http://blast.hk/wiki/lua:script_author#googtrans(en))(string author) - specifies script author
 
- [script_authors](http://blast.hk/wiki/lua:script_authors#googtrans(en))(string author, …) - specifies multiple script authors
 
- [script_description](http://blast.hk/wiki/lua:script_description#googtrans(en))(string description) - specifies description
 
- [script_version](http://blast.hk/wiki/lua:script_version#googtrans(en))(string version) - specifies script version string
 
- [script_version_number](http://blast.hk/wiki/lua:script_version_number#googtrans(en))(int version) - specifies script version number (eg, release number)
 
- [script_url](http://blast.hk/wiki/lua:script_url#googtrans(en))(string url) - specifies script URL (can be not only a direct download link)
 
- [script_dependencies](http://blast.hk/wiki/lua:script_dependencies#googtrans(en))(string name, …) - specifies script external dependencies (eg, 'SA:MP', 'CLEO')
 
- [script_moonloader](http://blast.hk/wiki/lua:script_moonloader#googtrans(en))(int version) - specifies minimum required version of MoonLoader. Doesn't cause the script to terminate if the version doesn't match, but prints an error into the log
 
- [script_properties](http://blast.hk/wiki/lua:script_properties#googtrans(en))(string property, …) - specifies script properties that affect its execution

Code Style

All MoonLoader's global variables and constants are named in the UPPERCASE, all built-in functions and events are named in the [lowerCamelCase](https://en.wikipedia.org/wiki/Camel_case), every event name starts with prefix 'on', types (classes) named in CamelCase, and built-in modules in lowercase (lua_thread is an exception). So, if you don't know what naming style you wish to use, the [snake_case](https://en.wikipedia.org/wiki/Snake_case) style might be your choice.

HELLO, WORLD!

```lua
print("Hello, World!")
```

That's how the "Hello world" would look like in regular Lua.

In MoonLoader global script area is not intended for main script code. Instead, all main code must be inside the 'main' function.

So "Hello world" should look like this:

```lua
-- will print out string "Hello, World!" and script will be terminated
function main()  
  print("Hello, World!")
end
```

But... Why?

Global script area is intended for defining script information, loading libraries and configs. All code within the global area executes right after script loads, but the 'main' function calls when the game gets loaded.

Function 'main' can be suspended for certain time interval using function 'wait' with value in milliseconds. Delay in script won't pause the whole game, only the delayed script thread will be paused.

And you can use infinite loops inside 'main' to implement actively-working script, here is an example:

```lua
-- specify script information
script_name("Restore health")
script_author("noname_noob")
-- load virtual key list
local vk = require "vkeys"

function main()  
  while true do -- infinite loop    
    wait(0) -- delay is necessary in infinite loop, even zero    
    if wasKeyPressed(vk.VK_1) and isPlayerPlaying(PLAYER_HANDLE) then -- if key '1' was pressed and player is available      
      setCharHealth(PLAYER_PED, 100) -- set 100 health points to the player's character    
    end  
  end
end
```

The 'wait' delay may be used only inside the 'main' function (of course in nested calls too) and [scripting threads](http://blast.hk/wiki/lua:luathread#googtrans(en)). Delays can be used in any way, not only inside loops.

Script stops execution and completely unloads when exiting the 'main' function.

Next example shows how you can use sequence of delays and then stop script:

```lua
local vk = require "lib.vkeys"

function main()  
  while true do    
    wait(0)    
    if wasKeyPressed(vk.VK_1) and isPlayerPlaying(PLAYER_HANDLE) then      
      print('Restoring health... Please, wait.')      
      wait(500)      
      setCharHealth(PLAYER_PED, 100)      
      print('Restore health: done.')      
      print('Restoring armor...')      
      wait(500)      
      setCharHealth(PLAYER_PED, 100)      
      print('Restore armor: done.')      
      print('Terminating...')      
      return -- exit from 'main'. Script will be stopped and unloaded    
    end  
  end
end
```

Events

Broadly speaking, events are functions that performed by themselves when some action happens. For example, when user starts a new game or new script gets loaded.

This example uses event 'onScriptMessage' to intercept 'print' messages from all scripts:

```lua
-- calls when any script prints out message with function 'print'
function onScriptMessage(msg, script)  
  -- it is advisable to check that game is loaded  
  if isPlayerPlaying(PLAYER_HANDLE) then    
    printStringNow(script.name .. ": " .. msg, 2000) -- display message  
  end
end
```

Script won't stop automatically if it has some events and doesn't have the 'main' function. But if you have both in your script and your function 'main' doesn't have infinite loop, you can use 'wait(-1)' to prevent script from automatical termination.

Also, delays cannot be used inside events, but you can use scripting threads to get over it.

In this way you can use delays inside events and prevent script termination using 'wait(-1)':

```lua
function onScriptMessage(msg, script)  
  -- run a new scripting thread, passing message and script name  
  lua_thread.create(process_script_message, msg, script.name) -- function 'process_script_message' will be called instantly in this line  
  -- and will run until delay, then execution will be passed back to the event  
  -- but the thread will continue to get processed and will continue exististence until it is exited
end

function process_script_message(msg, name)  
  printStringNow(name, 1000)  
  wait(1000)  
  printStringNow(msg, 'Message:~n~' .. msg)  
  -- function exits out = the thread is destroyed
end
```

You can learn more about scripting threads on [wiki](http://blast.hk/wiki/lua:luathread#googtrans(en)).

Theoretically, this information is enough to start developing Lua-scripts for MoonLoader. Things described here is just a basic guide to get started, MoonLoader has a lot more concepts which you have to learn yourself.

I highly recommend installing scripts "ML AutoReload" and "ML ReloadAll", they are really helpful in development, you might also want to install "SF Integration" and "ScriptManager" if you have SAMPFUNCS installed, they are very useful too.

SCRIPT COMPILATION

Lua scripts don't require compilation and it is better to keep scripts open source, but if you need, you can compile them using LuaJIT interpreter.

Download [this archive](http://blast.hk/moonloader/files/misc/luajit-compiler.zip) and extract it anywhere, then just drag and drop your .lua script file onto compile.bat, the compiled script with extension .luac will appear next to original file. MoonLoader loads the .luac files in the same way as normal .lua.

IDE

Atom was selected as an official IDE for MoonLoader, Notepad++ is also supported officially, but has less functionality. The best option is to choose one of these source code editors for effective development, but you can use any text editor that you like.

[Atom](https://atom.io/):

Extension for Atom includes Lua syntax highlighting, smart autocompletion, real-time error checking. There is also fuzzy search for functions and opcodes - activated with hotkey Ctrl+Alt+A, to find function by opcode add prefix '@' before search query.

Installation:

Note: if you already have package 'language-lua' or 'linter-lua' installed in your Atom, disable or remove it to avoid conflicts.

1. Install and run [Atom](https://atom.io/)

2. Go to the settings window (menu File -> Settings or hotkey Ctr + ,)

3. Go to the "Install" tab

4. Enter "moonloader" in the search box and install first module from the results list

Note: if an error occurred during autoinstallation of "autocomplete-lua" just install it yourself by the same method.

[Notepad++](https://notepad-plus-plus.org/):

Extension for Notepad++ has less functionality - it's includes basic autocompletion suggestions, additional keywords highlighting and tooltips for functions.

1. Install [Notepad++](https://notepad-plus-plus.org/download/) and run it at least once

2. Download the [MoonLoader installer](http://blast.hk/moonloader/download.php), run and install it with selected "Notepad++ extension" checkbox

3. Open Notepad++ and select the Lua language (menu Language -> L -> Lua)

LINKS

[Main Topic](https://gtaforums.com/topic/890990-moonloader-%E2%80%94-development/)

[MoonLoader Wiki Pages](http://blast.hk/wiki/start?idx=moonloader#googtrans(en))

[Download Script Examples](http://blast.hk/moonloader/files/misc/moonloader-examples.zip)
