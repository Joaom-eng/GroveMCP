# Скриптовый API | Modding Wiki

Fonte: https://wiki.blast.hk/moonloader/scripting-api

Здесь перечислены все глобальные функции, события, переменные и константы, которые добавляет MoonLoader для Lua скриптов. Список включает и те, для которых ещё не написаны статьи.
 Для получения статей из определенных категорий можно воспользоваться фильтром по тегам: [функции](https://wiki.blast.hk/t/moonloader/lua/function), [события](https://wiki.blast.hk/t/moonloader/lua/event), [переменные](https://wiki.blast.hk/t/moonloader/lua/variable), [константы](https://wiki.blast.hk/t/moonloader/lua/constant), [классы](https://wiki.blast.hk/t/moonloader/lua/class).
 Информация о типах параметров располагается на странице [Типы данных MoonLoader](https://wiki.blast.hk/moonloader/types).

Если функция помечена красным цветом, то страница с описанием отсутствует, его следует искать на сайте [Sanny Builder](https://library.sannybuilder.com/#/sa/find).

Lua |

bool result = [isCursorActive](https://wiki.blast.hk/moonloader/lua/isCursorActive)() |

table pickups = [getAllPickups](https://wiki.blast.hk/moonloader/lua/getAllPickups)() |

int handle = [getPickupPointerHandle](https://wiki.blast.hk/moonloader/lua/getPickupPointerHandle)(Pickup pickup) |

int pointer = [getPickupPointer](https://wiki.blast.hk/moonloader/lua/getPickupPointer)(Pickup pickup) |

int type = [getPickupType](https://wiki.blast.hk/moonloader/lua/getPickupType)(Pickup pickup) |

int model = [getPickupModel](https://wiki.blast.hk/moonloader/lua/getPickupModel)(Pickup pickup) |

float x, float y, float z, float w = [getObjectQuaternion](https://wiki.blast.hk/moonloader/lua/getObjectQuaternion)(Object object) |

[setObjectQuaternion](https://wiki.blast.hk/moonloader/lua/setObjectQuaternion)(Object object, float x, float y, float z, float w) |

float x, float y, float z, float w = [getVehicleQuaternion](https://wiki.blast.hk/moonloader/lua/getVehicleQuaternion)(Vehicle car) |

[setVehicleQuaternion](https://wiki.blast.hk/moonloader/lua/setVehicleQuaternion)(Vehicle car, float x, float y, float z, float w) |

float x, float y, float z, float w = [getCharQuaternion](https://wiki.blast.hk/moonloader/lua/getCharQuaternion)(Ped ped) |

[setCharQuaternion](https://wiki.blast.hk/moonloader/lua/setCharQuaternion)(Ped ped, float x, float y, float z, float w) |

AudioStream handle = [loadAudioStream](https://wiki.blast.hk/moonloader/lua/loadAudioStream)(zstring audio) |

[setAudioStreamState](https://wiki.blast.hk/moonloader/lua/setAudioStreamState)(AudioStream handle, int state) |

[releaseAudioStream](https://wiki.blast.hk/moonloader/lua/releaseAudioStream)(AudioStream handle) |

double length = [getAudioStreamLength](https://wiki.blast.hk/moonloader/lua/getAudioStreamLength)(AudioStream handle) |

int state = [getAudioStreamState](https://wiki.blast.hk/moonloader/lua/getAudioStreamState)(AudioStream handle) |

float volume = [getAudioStreamVolume](https://wiki.blast.hk/moonloader/lua/getAudioStreamVolume)(AudioStream audio) |

[setAudioStreamVolume](https://wiki.blast.hk/moonloader/lua/setAudioStreamVolume)(AudioStream audio, float volume) |

[setAudioStreamLooped](https://wiki.blast.hk/moonloader/lua/setAudioStreamLooped)(AudioStream audio, bool loop) |

AudioStream handle = [load3dAudioStream](https://wiki.blast.hk/moonloader/lua/load3dAudioStream)(zstring audio) |

[setPlay3dAudioStreamAtCoordinates](https://wiki.blast.hk/moonloader/lua/setPlay3dAudioStreamAtCoordinates)(AudioStream handle, float posX, float posY, float posZ) |

[setPlay3dAudioStreamAtObject](https://wiki.blast.hk/moonloader/lua/setPlay3dAudioStreamAtObject)(AudioStream audio, Object object) |

[setPlay3dAudioStreamAtChar](https://wiki.blast.hk/moonloader/lua/setPlay3dAudioStreamAtChar)(AudioStream audio, Ped ped) |

[setPlay3dAudioStreamAtCar](https://wiki.blast.hk/moonloader/lua/setPlay3dAudioStreamAtCar)(AudioStream audio, Vehicle car) |

AudioStream handle = [loadAudioStreamFromMemory](https://wiki.blast.hk/moonloader/lua/loadAudioStreamFromMemory)(uint address, uint size) |

AudioStream handle = [load3dAudioStreamFromMemory](https://wiki.blast.hk/moonloader/lua/load3dAudioStreamFromMemory)(uint address, uint size) |

[renderDrawLine](https://wiki.blast.hk/moonloader/lua/renderDrawLine)(float pos1X, float pos1Y, float pos2X, float pos2Y, float width, uint color) |

[renderDrawBox](https://wiki.blast.hk/moonloader/lua/renderDrawBox)(float posX, float posY, float sizeX, float sizeY, uint color) |

[renderDrawBoxWithBorder](https://wiki.blast.hk/moonloader/lua/renderDrawBoxWithBorder)(float posX, float posY, float sizeX, float sizeY, uint color, float bsize, uint bcolor) |

float length = [renderGetFontDrawTextLength](https://wiki.blast.hk/moonloader/lua/renderGetFontDrawTextLength)(DxFont font, zstring text, [bool ignoreColorTags=false]) |

float height = [renderGetFontDrawHeight](https://wiki.blast.hk/moonloader/lua/renderGetFontDrawHeight)(DxFont font) |

uint index = [renderGetFontCharIndexAt](https://wiki.blast.hk/moonloader/lua/renderGetFontCharIndexAt)(DxFont font, string text, float x, [bool ignoreColorTags=false]) |

float width = [renderGetFontCharWidth](https://wiki.blast.hk/moonloader/lua/renderGetFontCharWidth)(DxFont font, string/uint char) |

DxFont font = [renderCreateFont](https://wiki.blast.hk/moonloader/lua/renderCreateFont)(zstring font, int height, uint flags, [uint charset]) |

[renderReleaseFont](https://wiki.blast.hk/moonloader/lua/renderReleaseFont)(DxFont font) |

[renderFontDrawText](https://wiki.blast.hk/moonloader/lua/renderFontDrawText)(DxFont font, zstring text, float posX, float posY, uint color, [bool ignoreColorTags=false]) |

[renderDrawPolygon](https://wiki.blast.hk/moonloader/lua/renderDrawPolygon)(float posX, float posY, float sizeX, float sizeY, int corners, float rotation, uint color) |

DxTexture texture = [renderLoadTextureFromFile](https://wiki.blast.hk/moonloader/lua/renderLoadTextureFromFile)(zstring file) |

[renderReleaseTexture](https://wiki.blast.hk/moonloader/lua/renderReleaseTexture)(DxTexture texture) |

[renderDrawTexture](https://wiki.blast.hk/moonloader/lua/renderDrawTexture)(DxTexture texture, float posX, float posY, float sizeX, float sizeY, float rotation, uint color) |

[renderBegin](https://wiki.blast.hk/moonloader/lua/renderBegin)(int type) |

[renderEnd](https://wiki.blast.hk/moonloader/lua/renderEnd)() |

[renderColor](https://wiki.blast.hk/moonloader/lua/renderColor)(uint color) |

[renderVertex](https://wiki.blast.hk/moonloader/lua/renderVertex)(float vX, float vY) |

[renderSetTexCoord](https://wiki.blast.hk/moonloader/lua/renderSetTexCoord)(float posX, float posY) |

[renderBindTexture](https://wiki.blast.hk/moonloader/lua/renderBindTexture)(DxTexture texture) |

uint struct = [renderGetTextureStruct](https://wiki.blast.hk/moonloader/lua/renderGetTextureStruct)(DxTexture texture) |

uint sprite = [renderGetTextureSprite](https://wiki.blast.hk/moonloader/lua/renderGetTextureSprite)(DxTexture texture) |

uint sizeX, uint sizeY = [renderGetTextureSize](https://wiki.blast.hk/moonloader/lua/renderGetTextureSize)(DxTexture texture) |

[renderSetRenderState](https://wiki.blast.hk/moonloader/lua/renderSetRenderState)(int state, uint value) |

DxTexture texture = [renderLoadTextureFromFileInMemory](https://wiki.blast.hk/moonloader/lua/renderLoadTextureFromFileInMemory)(uint pointer, uint size) |

[script_version_number](https://wiki.blast.hk/moonloader/lua/script_version_number)(int version) |

[script_version](https://wiki.blast.hk/moonloader/lua/script_version)(string version) |

[script_name](https://wiki.blast.hk/moonloader/lua/script_name)(string name) |

[script_description](https://wiki.blast.hk/moonloader/lua/script_description)(string description) |

[script_authors](https://wiki.blast.hk/moonloader/lua/script_authors)(string author, ...) |

[script_author](https://wiki.blast.hk/moonloader/lua/script_author)(string author) |

[script_dependencies](https://wiki.blast.hk/moonloader/lua/script_dependencies)(string name, ...) |

[script_moonloader](https://wiki.blast.hk/moonloader/lua/script_moonloader)(int version) |

LuaScript s = [thisScript](https://wiki.blast.hk/moonloader/lua/thisScript)() |

[wait](https://wiki.blast.hk/moonloader/lua/wait)(int time) |

[print](https://wiki.blast.hk/moonloader/lua/print)(any value, ...) |

int value = [getGameGlobal](https://wiki.blast.hk/moonloader/lua/getGameGlobal)(int index) |

[setGameGlobal](https://wiki.blast.hk/moonloader/lua/setGameGlobal)(int index, int value) |

uint ptr = [getGameGlobalPtr](https://wiki.blast.hk/moonloader/lua/getGameGlobalPtr)(int index) |

bool loaded = [isSampfuncsLoaded](https://wiki.blast.hk/moonloader/lua/isSampfuncsLoaded)() |

bool loaded = [isCleoLoaded](https://wiki.blast.hk/moonloader/lua/isCleoLoaded)() |

bool loaded = [isSampLoaded](https://wiki.blast.hk/moonloader/lua/isSampLoaded)() |

bool state = [isKeyDown](https://wiki.blast.hk/moonloader/lua/isKeyDown)(int keyId) |

[reloadScripts](https://wiki.blast.hk/moonloader/lua/reloadScripts)() |

bool status = [isOpcodesAvailable](https://wiki.blast.hk/moonloader/lua/isOpcodesAvailable)() |

int i = [representFloatAsInt](https://wiki.blast.hk/moonloader/lua/representFloatAsInt)(float f) |

float i = [representIntAsFloat](https://wiki.blast.hk/moonloader/lua/representIntAsFloat)(int i) |

[setGxtEntry](https://wiki.blast.hk/moonloader/lua/setGxtEntry)(string key, string text) |

string key = [setFreeGxtEntry](https://wiki.blast.hk/moonloader/lua/setFreeGxtEntry)(string text) |

string key = [getFreeGxtKey](https://wiki.blast.hk/moonloader/lua/getFreeGxtKey)() |

string text = [getGxtText](https://wiki.blast.hk/moonloader/lua/getGxtText)(string key) |

[clearGxtEntry](https://wiki.blast.hk/moonloader/lua/clearGxtEntry)(string key) |

bool active = [isPauseMenuActive](https://wiki.blast.hk/moonloader/lua/isPauseMenuActive)() |

bool foreground = [isGameWindowForeground](https://wiki.blast.hk/moonloader/lua/isGameWindowForeground)() |

int major, int minor, int majorRev, int minorRev, int game, int region, bool steam, bool cracked = [getGameVersion](https://wiki.blast.hk/moonloader/lua/getGameVersion)() |

int version = [getMoonloaderVersion](https://wiki.blast.hk/moonloader/lua/getMoonloaderVersion)() |

double time = [localClock](https://wiki.blast.hk/moonloader/lua/localClock)() |

[freeTextures](https://wiki.blast.hk/moonloader/lua/freeTextures)() |

string path = [getWorkingDirectory](https://wiki.blast.hk/moonloader/lua/getWorkingDirectory)() |

string path = [getGameDirectory](https://wiki.blast.hk/moonloader/lua/getGameDirectory)() |

[useRenderCommands](https://wiki.blast.hk/moonloader/lua/useRenderCommands)(bool enable) |

[writeMemory](https://wiki.blast.hk/moonloader/lua/writeMemory)(uint address, uint size, int value, bool virtualProtect) |

int value = [readMemory](https://wiki.blast.hk/moonloader/lua/readMemory)(uint address, uint size, bool virtualProtect) |

bool result, uint handle = [loadDynamicLibrary](https://wiki.blast.hk/moonloader/lua/loadDynamicLibrary)(string library) |

[freeDynamicLibrary](https://wiki.blast.hk/moonloader/lua/freeDynamicLibrary)(uint handle) |

bool result, uint proc = [getDynamicLibraryProcedure](https://wiki.blast.hk/moonloader/lua/getDynamicLibraryProcedure)(string proc, uint handle) |

bool result = [doesFileExist](https://wiki.blast.hk/moonloader/lua/doesFileExist)(string file) |

bool result = [doesDirectoryExist](https://wiki.blast.hk/moonloader/lua/doesDirectoryExist)(string directory) |

bool result = [createDirectory](https://wiki.blast.hk/moonloader/lua/createDirectory)(string directory) |

float val = [popFloat](https://wiki.blast.hk/moonloader/lua/popFloat)() |

bool result = [isGameVersionOriginal](https://wiki.blast.hk/moonloader/lua/isGameVersionOriginal)() |

uint memory = [allocateMemory](https://wiki.blast.hk/moonloader/lua/allocateMemory)(uint size) |

[freeMemory](https://wiki.blast.hk/moonloader/lua/freeMemory)(uint memory) |

Filesearch handle, string name = [findFirstFile](https://wiki.blast.hk/moonloader/lua/findFirstFile)(string mask) |

string file = [findNextFile](https://wiki.blast.hk/moonloader/lua/findNextFile)(Filesearch handle) |

[findClose](https://wiki.blast.hk/moonloader/lua/findClose)(Filesearch handle) |

bool result, Ped ped = [findAllRandomCharsInSphere](https://wiki.blast.hk/moonloader/lua/findAllRandomCharsInSphere)(float posX, float posY, float posZ, float radius, bool findNext, bool skipDead) |

bool result, Vehicle car = [findAllRandomVehiclesInSphere](https://wiki.blast.hk/moonloader/lua/findAllRandomVehiclesInSphere)(float posX, float posY, float posZ, float radius, bool findNext, bool skipWrecked) |

bool result, Object object = [findAllRandomObjectsInSphere](https://wiki.blast.hk/moonloader/lua/findAllRandomObjectsInSphere)(float posX, float posY, float posZ, float radius, bool findNext) |

uint ptr = [getCharPointer](https://wiki.blast.hk/moonloader/lua/getCharPointer)(Ped ped) |

uint ptr = [getCarPointer](https://wiki.blast.hk/moonloader/lua/getCarPointer)(Vehicle car) |

uint struct = [getObjectPointer](https://wiki.blast.hk/moonloader/lua/getObjectPointer)(Object object) |

int returnValue = [callFunction](https://wiki.blast.hk/moonloader/lua/callFunction)(uint address, int params, int pop, ...) |

int returnValue = [callMethod](https://wiki.blast.hk/moonloader/lua/callMethod)(uint address, int struct, int params, int pop, ...) |

Vehicle car, Ped ped = [storeClosestEntities](https://wiki.blast.hk/moonloader/lua/storeClosestEntities)(Ped ped) |

[switchCarEngine](https://wiki.blast.hk/moonloader/lua/switchCarEngine)(Vehicle car, bool state) |

bool result, float posX, float posY, float posZ = [getTargetBlipCoordinates](https://wiki.blast.hk/moonloader/lua/getTargetBlipCoordinates)() |

int gears = [getCarNumberOfGears](https://wiki.blast.hk/moonloader/lua/getCarNumberOfGears)(Vehicle car) |

int gear = [getCarCurrentGear](https://wiki.blast.hk/moonloader/lua/getCarCurrentGear)(Vehicle car) |

bool state = [isCarSirenOn](https://wiki.blast.hk/moonloader/lua/isCarSirenOn)(Vehicle car) |

bool state = [isCarEngineOn](https://wiki.blast.hk/moonloader/lua/isCarEngineOn)(Vehicle car) |

[printHelpString](https://wiki.blast.hk/moonloader/lua/printHelpString)(string text) |

[printStyledString](https://wiki.blast.hk/moonloader/lua/printStyledString)(string text, int time, int style) |

[printString](https://wiki.blast.hk/moonloader/lua/printString)(string text, int time) |

[printStringNow](https://wiki.blast.hk/moonloader/lua/printStringNow)(string text, int time) |

bool result, Ped ped = [getCharPlayerIsTargeting](https://wiki.blast.hk/moonloader/lua/getCharPlayerIsTargeting)(Player player) |

GxtString name = [getNameOfVehicleModel](https://wiki.blast.hk/moonloader/lua/getNameOfVehicleModel)(Model modelId) |

bool result = [testCheat](https://wiki.blast.hk/moonloader/lua/testCheat)(string text) |

bool result = [spawnVehicleByCheating](https://wiki.blast.hk/moonloader/lua/spawnVehicleByCheating)(Model modelId) |

Ped handle = [getCharPointerHandle](https://wiki.blast.hk/moonloader/lua/getCharPointerHandle)(uint ptr) |

Vehicle handle = [getVehiclePointerHandle](https://wiki.blast.hk/moonloader/lua/getVehiclePointerHandle)(uint ptr) |

Object handle = [getObjectPointerHandle](https://wiki.blast.hk/moonloader/lua/getObjectPointerHandle)(uint ptr) |

bool result, table colPoint = [processLineOfSight](https://wiki.blast.hk/moonloader/lua/processLineOfSight)(float originX, float originY, float originZ, float targetX, float targetY, float targetZ, [bool checkSolid=true], [bool car=false], [bool ped=false], [bool object=false], [bool particle=false], [bool seeThrough=false], [bool ignoreSomeObjects=false], [bool shootThrough=false]) |

bool result = [setClipboardText](https://wiki.blast.hk/moonloader/lua/setClipboardText)(string text) |

string text = [getClipboardText](https://wiki.blast.hk/moonloader/lua/getClipboardText)() |

int value = [getStructElement](https://wiki.blast.hk/moonloader/lua/getStructElement)(uint struct, int offset, uint size, [bool unprotect=false]) |

[setStructElement](https://wiki.blast.hk/moonloader/lua/setStructElement)(uint struct, int offset, uint size, int value, [bool unprotect=false]) |

float w, float x, float y, float z = [convertMatrixToQuaternion](https://wiki.blast.hk/moonloader/lua/convertMatrixToQuaternion)(float rightX, float rightY, float rightZ, float frontX, float frontY, float frontZ, float upX, float upY, float upZ) |

float rightX, float rightY, float rightZ, float frontX, float frontY, float frontZ, float upX, float upY, float upZ = [convertQuaternionToMatrix](https://wiki.blast.hk/moonloader/lua/convertQuaternionToMatrix)(float w, float x, float y, float z) |

float wposX, float wposY = [convert3DCoordsToScreen](https://wiki.blast.hk/moonloader/lua/convert3DCoordsToScreen)(float posX, float posY, float posZ) |

[setGameKeyState](https://wiki.blast.hk/moonloader/lua/setGameKeyState)(int key, int state) |

int posX, int posY = [getCursorPos](https://wiki.blast.hk/moonloader/lua/getCursorPos)() |

float gposX, float gposY = [convertWindowScreenCoordsToGameScreenCoords](https://wiki.blast.hk/moonloader/lua/convertWindowScreenCoordsToGameScreenCoords)(float wposX, float wposY) |

float wposX, float wposY = [convertGameScreenCoordsToWindowScreenCoords](https://wiki.blast.hk/moonloader/lua/convertGameScreenCoordsToWindowScreenCoords)(float gposX, float gposY) |

float posX, float posY, float posZ = [convertScreenCoordsToWorld3D](https://wiki.blast.hk/moonloader/lua/convertScreenCoordsToWorld3D)(float posX, float posY, float depth) |

uint handle = [getModuleHandle](https://wiki.blast.hk/moonloader/lua/getModuleHandle)(string module) |

uint address = [getModuleProcAddress](https://wiki.blast.hk/moonloader/lua/getModuleProcAddress)(string module, string proc) |

[setVirtualKeyDown](https://wiki.blast.hk/moonloader/lua/setVirtualKeyDown)(int vkey, bool down) |

[setCharKeyDown](https://wiki.blast.hk/moonloader/lua/setCharKeyDown)(int ckey, bool down) |

int index = [downloadUrlToFile](https://wiki.blast.hk/moonloader/lua/downloadUrlToFile)(string url, string file, function statusCallback) |

bool state = [isKeyJustPressed](https://wiki.blast.hk/moonloader/lua/isKeyJustPressed)(int key) |

bool result, float x, float y, float z, float w, float h = [convert3DCoordsToScreenEx](https://wiki.blast.hk/moonloader/lua/convert3DCoordsToScreenEx)(float posX, float posY, float posZ, [bool checkMin=false], [bool checkMax=false]) |

float value = [getStructFloatElement](https://wiki.blast.hk/moonloader/lua/getStructFloatElement)(uint struct, int offset, [bool unprotect=false]) |

[setStructFloatElement](https://wiki.blast.hk/moonloader/lua/setStructFloatElement)(uint struct, int offset, float value, [bool unprotect=false]) |

bool state = [wasKeyPressed](https://wiki.blast.hk/moonloader/lua/wasKeyPressed)(int key) |

bool state = [wasKeyReleased](https://wiki.blast.hk/moonloader/lua/wasKeyReleased)(int key) |

int delta = [getMousewheelDelta](https://wiki.blast.hk/moonloader/lua/getMousewheelDelta)() |

[consumeWindowMessage](https://wiki.blast.hk/moonloader/lua/consumeWindowMessage)([bool game=true], [bool scripts=true]) |

[addEventHandler](https://wiki.blast.hk/moonloader/lua/addEventHandler)(string eventName, function callback) |

bool paused = [isGamePaused](https://wiki.blast.hk/moonloader/lua/isGamePaused)() |

double time = [gameClock](https://wiki.blast.hk/moonloader/lua/gameClock)() |

[script_properties](https://wiki.blast.hk/moonloader/lua/script_properties)(string property, ...) |

[script_url](https://wiki.blast.hk/moonloader/lua/script_url)(string url) |

any imports = [import](https://wiki.blast.hk/moonloader/lua/import)(string filename) |

string json = [encodeJson](https://wiki.blast.hk/moonloader/lua/encodeJson)(table data) |

table data = [decodeJson](https://wiki.blast.hk/moonloader/lua/decodeJson)(string json) |

[showCursor](https://wiki.blast.hk/moonloader/lua/showCursor)(bool show, [bool lockControls]) |

[lockPlayerControl](https://wiki.blast.hk/moonloader/lua/lockPlayerControl)(bool lock) |

bool locked = [isPlayerControlLocked](https://wiki.blast.hk/moonloader/lua/isPlayerControlLocked)() |

bool result = [setBlipCoordinates](https://wiki.blast.hk/moonloader/lua/setBlipCoordinates)(Marker blip, float x, float y, float z) |

bool result = [setTargetBlipCoordinates](https://wiki.blast.hk/moonloader/lua/setTargetBlipCoordinates)(float x, float y, float z) |

bool result = [placeWaypoint](https://wiki.blast.hk/moonloader/lua/placeWaypoint)(float x, float y, float z) |

bool result = [removeWaypoint](https://wiki.blast.hk/moonloader/lua/removeWaypoint)() |

string path = [getFolderPath](https://wiki.blast.hk/moonloader/lua/getFolderPath)(int csidl) |

float value = [getTimeStepValue](https://wiki.blast.hk/moonloader/lua/getTimeStepValue)() |

uint devicePtr = [getD3DDevicePtr](https://wiki.blast.hk/moonloader/lua/getD3DDevicePtr)() |

table objects = [getAllObjects](https://wiki.blast.hk/moonloader/lua/getAllObjects)() |

table peds = [getAllChars](https://wiki.blast.hk/moonloader/lua/getAllChars)() |

table vehicles = [getAllVehicles](https://wiki.blast.hk/moonloader/lua/getAllVehicles)() |

float value = [getGameGlobalFloat](https://wiki.blast.hk/moonloader/lua/getGameGlobalFloat)(int index) |

[setGameGlobalFloat](https://wiki.blast.hk/moonloader/lua/setGameGlobalFloat)(int index, float value) |

LuaScript s = [script.load](https://wiki.blast.hk/moonloader/lua/script/load)(string file) |

LuaScript s = [script.find](https://wiki.blast.hk/moonloader/lua/script/find)(string name) |

table list = [script.list](https://wiki.blast.hk/moonloader/lua/script/list)() |

LuaScript script = [script.get](https://wiki.blast.hk/moonloader/lua/script/get)(int scriptId) |

[script.this](https://wiki.blast.hk/moonloader/lua/script/this) |

table data = [inicfg.load](https://wiki.blast.hk/moonloader/lua/inicfg#inicfgload)([table default], [string file]) |

bool result = [inicfg.save](https://wiki.blast.hk/moonloader/lua/inicfg#inicfgsave)(table data, [string file]) |

int value = [memory.read](https://wiki.blast.hk/moonloader/lua/memory#memoryread)(uint address, uint size, [bool unprotect=false]) |

[memory.write](https://wiki.blast.hk/moonloader/lua/memory#memorywrite)(uint address, int value, uint size, [bool unprotect=false]) |

int value = [memory.getint8](https://wiki.blast.hk/moonloader/lua/memory#memorygetint8)(uint address, [bool unprotect=false]) |

bool result = [memory.setint8](https://wiki.blast.hk/moonloader/lua/memory#memorysetint8)(uint address, int byte, [bool unprotect=false]) |

int value = [memory.getint16](https://wiki.blast.hk/moonloader/lua/memory#memorygetint16)(uint address, [bool unprotect=false]) |

bool result = [memory.setint16](https://wiki.blast.hk/moonloader/lua/memory#memorysetint16)(uint address, int word, [bool unprotect=false]) |

int value = [memory.getint32](https://wiki.blast.hk/moonloader/lua/memory#memorygetint32)(uint address, [bool unprotect=false]) |

bool result = [memory.setint32](https://wiki.blast.hk/moonloader/lua/memory#memorysetint32)(uint address, int dword, [bool unprotect=false]) |

double value = [memory.getint64](https://wiki.blast.hk/moonloader/lua/memory#memorygetint64)(uint address, [bool unprotect=false]) |

bool result = [memory.setint64](https://wiki.blast.hk/moonloader/lua/memory#memorysetint64)(uint address, double qword, [bool unprotect=false]) |

int value = [memory.getuint8](https://wiki.blast.hk/moonloader/lua/memory#memorygetuint8)(uint address, [bool unprotect=false]) |

bool result = [memory.setuint8](https://wiki.blast.hk/moonloader/lua/memory#memorysetuint8)(uint address, int byte, [bool unprotect=false]) |

int value = [memory.getuint16](https://wiki.blast.hk/moonloader/lua/memory#memorygetuint16)(uint address, [bool unprotect=false]) |

bool result = [memory.setuint16](https://wiki.blast.hk/moonloader/lua/memory#memorysetuint16)(uint address, int word, [bool unprotect=false]) |

int value = [memory.getuint32](https://wiki.blast.hk/moonloader/lua/memory#memorygetuint32)(uint address, [bool unprotect=false]) |

bool result = [memory.setuint32](https://wiki.blast.hk/moonloader/lua/memory#memorysetuint32)(uint address, int dword, [bool unprotect=false]) |

double value = [memory.getuint64](https://wiki.blast.hk/moonloader/lua/memory#memorygetuint64)(uint address, [bool unprotect=false]) |

bool result = [memory.setuint64](https://wiki.blast.hk/moonloader/lua/memory#memorysetuint64)(uint address, double qword, [bool unprotect=false]) |

float value = [memory.getfloat](https://wiki.blast.hk/moonloader/lua/memory#memorygetfloat)(uint address, [bool unprotect=false]) |

bool result = [memory.setfloat](https://wiki.blast.hk/moonloader/lua/memory#memorysetfloat)(uint address, float value, [bool unprotect=false]) |

double value = [memory.getdouble](https://wiki.blast.hk/moonloader/lua/memory#memorygetdouble)(uint address, [bool unprotect=false]) |

bool result = [memory.setdouble](https://wiki.blast.hk/moonloader/lua/memory#memorysetdouble)(uint address, double value, [bool unprotect=false]) |

int oldProtection = [memory.unprotect](https://wiki.blast.hk/moonloader/lua/memory#memoryunprotect)(uint address, uint size) |

int oldProtection = [memory.protect](https://wiki.blast.hk/moonloader/lua/memory#memoryprotect)(uint address, uint size, int newProtection) |

[memory.copy](https://wiki.blast.hk/moonloader/lua/memory#memorycopy)(uint destAddress, uint srcAddress, uint size, [bool unprotect=false]) |

bool result = [memory.compare](https://wiki.blast.hk/moonloader/lua/memory#memorycompare)(uint address1, uint address2, uint size, [bool unprotect=false]) |

string str = [memory.tostring](https://wiki.blast.hk/moonloader/lua/memory#memorytostring)(uint address, [uint size], [bool unprotect=false]) |

string hexstr = [memory.tohex](https://wiki.blast.hk/moonloader/lua/memory#memorytohex)(uint address, uint size, [bool unprotect=false]) |

bool result = [memory.hex2bin](https://wiki.blast.hk/moonloader/lua/memory#memoryhex2bin)(string hex, uint dstAddress, uint size) |

string bin = [memory.hex2bin](https://wiki.blast.hk/moonloader/lua/memory#memoryhex2bin)(string hex) |

[memory.fill](https://wiki.blast.hk/moonloader/lua/memory#memoryfill)(uint address, int value, uint size, [bool unprotect=false]) |

uint address = [memory.strptr](https://wiki.blast.hk/moonloader/lua/memory#strptr)(string str) |

LuaThread thread = [lua_thread.create](https://wiki.blast.hk/moonloader/lua/lua_thread/create)(function func, ...) |

LuaThread thread = [lua_thread.create_suspended](https://wiki.blast.hk/moonloader/lua/lua_thread/create_suspended)(function func) |

[shakeCam](https://wiki.blast.hk/moonloader/lua/shakeCam)(int shake) |

Player player = [createPlayer](https://wiki.blast.hk/moonloader/lua/createPlayer)(Model modelId, float atX, float atY, float atZ) |

Ped ped = [createChar](https://wiki.blast.hk/moonloader/lua/createChar)(int pedtype, Model modelId, float atX, float atY, float atZ) |

[deleteChar](https://wiki.blast.hk/moonloader/lua/deleteChar)(Ped ped) |

float positionX, float positionY, float positionZ = [getCharCoordinates](https://wiki.blast.hk/moonloader/lua/getCharCoordinates)(Ped ped) |

[setCharCoordinates](https://wiki.blast.hk/moonloader/lua/setCharCoordinates)(Ped ped, float posX, float posY, float posZ) |

bool result = [isCharInArea2d](https://wiki.blast.hk/moonloader/lua/isCharInArea2d)(Ped ped, float cornerAX, float cornerAY, float cornerBX, float cornerBY, bool sphere) |

bool result = [isCharInArea3d](https://wiki.blast.hk/moonloader/lua/isCharInArea3d)(Ped ped, float cornerAX, float cornerAY, float cornerAZ, float cornerBX, float cornerBY, float cornerBZ, bool sphere) |

Vehicle car = [createCar](https://wiki.blast.hk/moonloader/lua/createCar)(Model modelId, float atX, float atY, float atZ) |

[deleteCar](https://wiki.blast.hk/moonloader/lua/deleteCar)(Vehicle car) |

[carGotoCoordinates](https://wiki.blast.hk/moonloader/lua/carGotoCoordinates)(Vehicle car, float driveToX, float driveToY, float driveToZ) |

[carWanderRandomly](https://wiki.blast.hk/moonloader/lua/carWanderRandomly)(Vehicle car) |

[carSetIdle](https://wiki.blast.hk/moonloader/lua/carSetIdle)(Vehicle car) |

float positionX, float positionY, float positionZ = [getCarCoordinates](https://wiki.blast.hk/moonloader/lua/getCarCoordinates)(Vehicle car) |

[setCarCoordinates](https://wiki.blast.hk/moonloader/lua/setCarCoordinates)(Vehicle car, float atX, float atY, float atZ) |

[setCarCruiseSpeed](https://wiki.blast.hk/moonloader/lua/setCarCruiseSpeed)(Vehicle car, float maxSpeed) |

[setCarDrivingStyle](https://wiki.blast.hk/moonloader/lua/setCarDrivingStyle)(Vehicle car, int behaviour) |

[setCarMission](https://wiki.blast.hk/moonloader/lua/setCarMission)(Vehicle car, int driverBehaviour) |

bool result = [isCarInArea2d](https://wiki.blast.hk/moonloader/lua/isCarInArea2d)(Vehicle car, float cornerAX, float cornerAY, float cornerBX, float cornerBY, bool sphere) |

bool result = [isCarInArea3d](https://wiki.blast.hk/moonloader/lua/isCarInArea3d)(Vehicle car, float cornerAX, float cornerAY, float cornerAZ, float cornerBX, float cornerBY, float cornerBZ, bool sphere) |

[printBig](https://wiki.blast.hk/moonloader/lua/printBig)(GxtString gxtString, int time, int style) |

[printText](https://wiki.blast.hk/moonloader/lua/printText)(GxtString gxtString, int time, int flag) |

[printTextNow](https://wiki.blast.hk/moonloader/lua/printTextNow)(GxtString gxtString, int time, int flag) |

[clearPrints](https://wiki.blast.hk/moonloader/lua/clearPrints)() |

int hours, int mins = [getTimeOfDay](https://wiki.blast.hk/moonloader/lua/getTimeOfDay)() |

[setTimeOfDay](https://wiki.blast.hk/moonloader/lua/setTimeOfDay)(int hours, int minutes) |

int minutes = [getMinutesToTimeOfDay](https://wiki.blast.hk/moonloader/lua/getMinutesToTimeOfDay)(int hours, int minutes) |

bool result = [isPointOnScreen](https://wiki.blast.hk/moonloader/lua/isPointOnScreen)(float sphereX, float sphereY, float sphereZ, float radius) |

Vehicle car = [storeCarCharIsIn](https://wiki.blast.hk/moonloader/lua/storeCarCharIsIn)(Ped ped) |

bool result = [isCharInCar](https://wiki.blast.hk/moonloader/lua/isCharInCar)(Ped ped, Vehicle car) |

bool result = [isCharInModel](https://wiki.blast.hk/moonloader/lua/isCharInModel)(Ped ped, Model carModel) |

bool result = [isCharInAnyCar](https://wiki.blast.hk/moonloader/lua/isCharInAnyCar)(Ped ped) |

bool result = [isButtonPressed](https://wiki.blast.hk/moonloader/lua/isButtonPressed)(Player player, int key) |

int state = [getPadState](https://wiki.blast.hk/moonloader/lua/getPadState)(Player player, int key) |

bool result = [locateCharAnyMeans2d](https://wiki.blast.hk/moonloader/lua/locateCharAnyMeans2d)(Ped ped, float pointX, float pointY, float radiusX, float radiusY, bool sphere) |

bool result = [locateCharOnFoot2d](https://wiki.blast.hk/moonloader/lua/locateCharOnFoot2d)(Ped ped, float pointX, float pointY, float radiusX, float radiusY, bool sphere) |

bool result = [locateCharInCar2d](https://wiki.blast.hk/moonloader/lua/locateCharInCar2d)(Ped ped, float pointX, float pointY, float radiusX, float radiusY, bool sphere) |

bool result = [locateStoppedCharAnyMeans2d](https://wiki.blast.hk/moonloader/lua/locateStoppedCharAnyMeans2d)(Ped ped, float pointX, float pointY, float radiusX, float radiusY, bool sphere) |

bool result = [locateStoppedCharOnFoot2d](https://wiki.blast.hk/moonloader/lua/locateStoppedCharOnFoot2d)(Ped ped, float pointX, float pointY, float radiusX, float radiusY, bool sphere) |

bool result = [locateStoppedCharInCar2d](https://wiki.blast.hk/moonloader/lua/locateStoppedCharInCar2d)(Ped ped, float pointX, float pointY, float radiusX, float radiusY, bool sphere) |

bool result = [locateCharAnyMeansChar2d](https://wiki.blast.hk/moonloader/lua/locateCharAnyMeansChar2d)(Ped ped, Ped nearPed, float radiusX, float radiusY, bool sphere) |

[locateCharOnFootChar2d](https://wiki.blast.hk/moonloader/lua/locateCharOnFootChar2d)(Ped ped, Ped nearPed, float radiusX, float radiusY, bool sphere) |

bool result = [locateCharInCarChar2d](https://wiki.blast.hk/moonloader/lua/locateCharInCarChar2d)(Ped ped, Ped nearPed, float radiusX, float radiusY, bool sphere) |

bool result = [locateCharAnyMeans3d](https://wiki.blast.hk/moonloader/lua/locateCharAnyMeans3d)(Ped ped, float sphereX, float sphereY, float sphereZ, float radiusX, float radiusY, float radiusZ, bool sphere) |

bool result = [locateCharOnFoot3d](https://wiki.blast.hk/moonloader/lua/locateCharOnFoot3d)(Ped ped, float sphereX, float sphereY, float sphereZ, float radiusX, float radiusY, float radiusZ, bool sphere) |

bool result = [locateCharInCar3d](https://wiki.blast.hk/moonloader/lua/locateCharInCar3d)(Ped ped, float sphereX, float sphereY, float sphereZ, float radiusX, float radiusY, float radiusZ, bool sphere) |

bool result = [locateStoppedCharAnyMeans3d](https://wiki.blast.hk/moonloader/lua/locateStoppedCharAnyMeans3d)(Ped ped, float sphereX, float sphereY, float sphereZ, float radiusX, float radiusY, float radiusZ, bool sphere) |

bool result = [locateStoppedCharOnFoot3d](https://wiki.blast.hk/moonloader/lua/locateStoppedCharOnFoot3d)(Ped ped, float sphereX, float sphereY, float sphereZ, float radiusX, float radiusY, float radiusZ, bool sphere) |

bool result = [locateStoppedCharInCar3d](https://wiki.blast.hk/moonloader/lua/locateStoppedCharInCar3d)(Ped ped, float sphereX, float sphereY, float sphereZ, float radiusX, float radiusY, float radiusZ, bool sphere) |

bool result = [locateCharAnyMeansChar3d](https://wiki.blast.hk/moonloader/lua/locateCharAnyMeansChar3d)(Ped ped, Ped nearPed, float radiusX, float radiusY, float radiusZ, bool sphere) |

bool result = [locateCharOnFootChar3d](https://wiki.blast.hk/moonloader/lua/locateCharOnFootChar3d)(Ped ped, Ped nearPed, float radiusX, float radiusY, float radiusZ, bool sphere) |

bool result = [locateCharInCarChar3d](https://wiki.blast.hk/moonloader/lua/locateCharInCarChar3d)(Ped ped, Ped nearPed, float radiusX, float radiusY, float radiusZ, bool sphere) |

Object object = [createObject](https://wiki.blast.hk/moonloader/lua/createObject)(Model modelId, float atX, float atY, float atZ) |

[deleteObject](https://wiki.blast.hk/moonloader/lua/deleteObject)(Object object) |

[givePlayerMoney](https://wiki.blast.hk/moonloader/lua/givePlayerMoney)(Player player, int money) |

int money = [getPlayerMoney](https://wiki.blast.hk/moonloader/lua/getPlayerMoney)(Player player) |

[giveRemoteControlledCarToPlayer](https://wiki.blast.hk/moonloader/lua/giveRemoteControlledCarToPlayer)(Player player, float float2, float float3, float float4) |

[alterWantedLevel](https://wiki.blast.hk/moonloader/lua/alterWantedLevel)(Player player, int wantedLevel) |

[alterWantedLevelNoDrop](https://wiki.blast.hk/moonloader/lua/alterWantedLevelNoDrop)(Player player, int minimumWantedLevel) |

bool result = [isWantedLevelGreater](https://wiki.blast.hk/moonloader/lua/isWantedLevelGreater)(Player player, int level) |

[clearWantedLevel](https://wiki.blast.hk/moonloader/lua/clearWantedLevel)(Player player) |

[setDeatharrestState](https://wiki.blast.hk/moonloader/lua/setDeatharrestState)(bool value) |

bool result = [hasDeatharrestBeenExecuted](https://wiki.blast.hk/moonloader/lua/hasDeatharrestBeenExecuted)() |

[addAmmoToChar](https://wiki.blast.hk/moonloader/lua/addAmmoToChar)(Ped ped, int weapon, int ammo) |

bool result = [isPlayerDead](https://wiki.blast.hk/moonloader/lua/isPlayerDead)(Player player) |

bool result = [isCharDead](https://wiki.blast.hk/moonloader/lua/isCharDead)(Ped ped) |

bool result = [isCarDead](https://wiki.blast.hk/moonloader/lua/isCarDead)(Vehicle car) |

bool result = [isPlayerPressingHorn](https://wiki.blast.hk/moonloader/lua/isPlayerPressingHorn)(Player player) |

Ped ped = [createCharInsideCar](https://wiki.blast.hk/moonloader/lua/createCharInsideCar)(Vehicle car, Model pedtype, int model) |

bool result = [isCarModel](https://wiki.blast.hk/moonloader/lua/isCarModel)(Vehicle car, Model modelId) |

int carGenerator = [createCarGenerator](https://wiki.blast.hk/moonloader/lua/createCarGenerator)(float atX, float atY, float atZ, float angle, Model modelId, int color1, int color2, bool forceSpawn, int alarm, int doorLock, int minDelay, int maxDelay) |

[switchCarGenerator](https://wiki.blast.hk/moonloader/lua/switchCarGenerator)(int carGenerator, int carsToGenerate) |

[displayOnscreenTimer](https://wiki.blast.hk/moonloader/lua/displayOnscreenTimer)(VarId var, bool countInDirection) |

[clearOnscreenTimer](https://wiki.blast.hk/moonloader/lua/clearOnscreenTimer)(VarId var) |

[clearOnscreenCounter](https://wiki.blast.hk/moonloader/lua/clearOnscreenCounter)(VarId var) |

bool result = [isCharInZone](https://wiki.blast.hk/moonloader/lua/isCharInZone)(Ped ped, GxtString zoneName) |

[pointCameraAtCar](https://wiki.blast.hk/moonloader/lua/pointCameraAtCar)(Vehicle car, int mode, int switchstyle) |

[pointCameraAtChar](https://wiki.blast.hk/moonloader/lua/pointCameraAtChar)(Ped ped, int mode, int switchstyle) |

[restoreCamera](https://wiki.blast.hk/moonloader/lua/restoreCamera)() |

[shakePad](https://wiki.blast.hk/moonloader/lua/shakePad)(Player player, int time, int intensity) |

[setTimeScale](https://wiki.blast.hk/moonloader/lua/setTimeScale)(float gamespeed) |

[setFixedCameraPosition](https://wiki.blast.hk/moonloader/lua/setFixedCameraPosition)(float positionX, float positionY, float positionZ, float rotationX, float rotationY, float rotationZ) |

[pointCameraAtPoint](https://wiki.blast.hk/moonloader/lua/pointCameraAtPoint)(float pointAtX, float pointAtY, float pointAtZ, int switchstyle) |

Marker marker = [addBlipForCarOld](https://wiki.blast.hk/moonloader/lua/addBlipForCarOld)(Vehicle car, int unused, bool visibility) |

Marker marker = [addBlipForCharOld](https://wiki.blast.hk/moonloader/lua/addBlipForCharOld)(Ped ped, int int2, int int3) |

[removeBlip](https://wiki.blast.hk/moonloader/lua/removeBlip)(Marker marker) |

[changeBlipColour](https://wiki.blast.hk/moonloader/lua/changeBlipColour)(Marker marker, int color) |

Marker marker = [addBlipForCoordOld](https://wiki.blast.hk/moonloader/lua/addBlipForCoordOld)(float atX, float atY, float atZ, int color, int flag) |

[changeBlipScale](https://wiki.blast.hk/moonloader/lua/changeBlipScale)(Marker marker, int size) |

[setFadingColour](https://wiki.blast.hk/moonloader/lua/setFadingColour)(int r, int g, int b) |

[doFade](https://wiki.blast.hk/moonloader/lua/doFade)(bool in, int time) |

bool result = [getFadingStatus](https://wiki.blast.hk/moonloader/lua/getFadingStatus)() |

[addHospitalRestart](https://wiki.blast.hk/moonloader/lua/addHospitalRestart)(float atX, float atY, float atZ, float angle, int townNumber) |

[addPoliceRestart](https://wiki.blast.hk/moonloader/lua/addPoliceRestart)(float atX, float atY, float atZ, float angle, int townNumber) |

[overrideNextRestart](https://wiki.blast.hk/moonloader/lua/overrideNextRestart)(float atX, float atY, float atZ, float angle) |

[drawShadow](https://wiki.blast.hk/moonloader/lua/drawShadow)(Particle particle, float atX, float atY, float atZ, float rotationFactor, float size, int intensity, int flags1, int flags2, int flags3) |

float angle = [getCharHeading](https://wiki.blast.hk/moonloader/lua/getCharHeading)(Ped ped) |

[setCharHeading](https://wiki.blast.hk/moonloader/lua/setCharHeading)(Ped ped, float angle) |

float angle = [getCarHeading](https://wiki.blast.hk/moonloader/lua/getCarHeading)(Vehicle car) |

[setCarHeading](https://wiki.blast.hk/moonloader/lua/setCarHeading)(Vehicle car, float angle) |

float angle = [getObjectHeading](https://wiki.blast.hk/moonloader/lua/getObjectHeading)(Object object) |

[setObjectHeading](https://wiki.blast.hk/moonloader/lua/setObjectHeading)(Object object, float angle) |

bool result = [isCharTouchingObject](https://wiki.blast.hk/moonloader/lua/isCharTouchingObject)(Ped ped, Object object) |

[setCharAmmo](https://wiki.blast.hk/moonloader/lua/setCharAmmo)(Ped ped, int weapon, int ammo) |

[declareMissionFlag](https://wiki.blast.hk/moonloader/lua/declareMissionFlag)(VarId flag) |

Marker marker = [addBlipForCar](https://wiki.blast.hk/moonloader/lua/addBlipForCar)(Vehicle car) |

Marker marker = [addBlipForChar](https://wiki.blast.hk/moonloader/lua/addBlipForChar)(Ped ped) |

Marker marker = [addBlipForObject](https://wiki.blast.hk/moonloader/lua/addBlipForObject)(Object object) |

Checkpoint checkpoint = [addBlipForCoord](https://wiki.blast.hk/moonloader/lua/addBlipForCoord)(float atX, float atY, float atZ) |

[changeBlipDisplay](https://wiki.blast.hk/moonloader/lua/changeBlipDisplay)(Marker marker, int mode) |

[addOneOffSound](https://wiki.blast.hk/moonloader/lua/addOneOffSound)(float atX, float atY, float atZ, int sound) |

int unk = [addContinuousSound](https://wiki.blast.hk/moonloader/lua/addContinuousSound)(float atX, float atY, float atZ, int sound) |

[removeSound](https://wiki.blast.hk/moonloader/lua/removeSound)(int sound) |

bool result = [isCarStuckOnRoof](https://wiki.blast.hk/moonloader/lua/isCarStuckOnRoof)(Vehicle car) |

[addUpsidedownCarCheck](https://wiki.blast.hk/moonloader/lua/addUpsidedownCarCheck)(Vehicle car) |

[removeUpsidedownCarCheck](https://wiki.blast.hk/moonloader/lua/removeUpsidedownCarCheck)(Vehicle car) |

bool result = [isCharInAreaOnFoot2d](https://wiki.blast.hk/moonloader/lua/isCharInAreaOnFoot2d)(Ped ped, float cornerAX, float cornerAY, float cornerBX, float cornerBY, bool sphere) |

bool result = [isCharInAreaInCar2d](https://wiki.blast.hk/moonloader/lua/isCharInAreaInCar2d)(Ped ped, float cornerAX, float cornerAY, float cornerBX, float cornerBY, bool sphere) |

bool result = [isCharStoppedInArea2d](https://wiki.blast.hk/moonloader/lua/isCharStoppedInArea2d)(Ped ped, float cornerAX, float cornerAY, float cornerBX, float cornerBY, bool sphere) |

bool result = [isCharStoppedInAreaOnFoot2d](https://wiki.blast.hk/moonloader/lua/isCharStoppedInAreaOnFoot2d)(Ped ped, float cornerAX, float cornerAY, float cornerBX, float cornerBY, bool sphere) |

bool result = [isCharStoppedInAreaInCar2d](https://wiki.blast.hk/moonloader/lua/isCharStoppedInAreaInCar2d)(Ped ped, float cornerAX, float cornerAY, float cornerBX, float cornerBY, bool sphere) |

bool result = [isCharInAreaOnFoot3d](https://wiki.blast.hk/moonloader/lua/isCharInAreaOnFoot3d)(Ped ped, float cornerAX, float cornerAY, float cornerAZ, float cornerBX, float cornerBY, float cornerBZ, bool sphere) |

bool result = [isCharInAreaInCar3d](https://wiki.blast.hk/moonloader/lua/isCharInAreaInCar3d)(Ped ped, float cornerAX, float cornerAY, float cornerAZ, float cornerBX, float cornerBY, float cornerBZ, bool sphere) |

bool result = [isCharStoppedInArea3d](https://wiki.blast.hk/moonloader/lua/isCharStoppedInArea3d)(Ped ped, float cornerAX, float cornerAY, float cornerAZ, float cornerBX, float cornerBY, float cornerBZ, bool sphere) |

bool result = [isCharStoppedInAreaOnFoot3d](https://wiki.blast.hk/moonloader/lua/isCharStoppedInAreaOnFoot3d)(Ped ped, float cornerAX, float cornerAY, float cornerAZ, float cornerBX, float cornerBY, float cornerBZ, bool sphere) |

bool result = [isCharStoppedInAreaInCar3d](https://wiki.blast.hk/moonloader/lua/isCharStoppedInAreaInCar3d)(Ped ped, float cornerAX, float cornerAY, float cornerAZ, float cornerBX, float cornerBY, float cornerBZ, bool sphere) |

bool result = [isCarStoppedInArea2d](https://wiki.blast.hk/moonloader/lua/isCarStoppedInArea2d)(Vehicle car, float cornerAX, float cornerAY, float cornerBX, float cornerBY, bool sphere) |

bool result = [isCarStoppedInArea3d](https://wiki.blast.hk/moonloader/lua/isCarStoppedInArea3d)(Vehicle car, float cornerAX, float cornerAY, float cornerAZ, float cornerBX, float cornerBY, float cornerBZ, bool sphere) |

bool result = [locateCar2d](https://wiki.blast.hk/moonloader/lua/locateCar2d)(Vehicle car, float pointX, float pointY, float radiusX, float radiusY, bool sphere) |

bool result = [locateStoppedCar2d](https://wiki.blast.hk/moonloader/lua/locateStoppedCar2d)(Vehicle car, float pointX, float pointY, float radiusX, float radiusY, bool sphere) |

bool result = [locateCar3d](https://wiki.blast.hk/moonloader/lua/locateCar3d)(Vehicle car, float sphereX, float sphereY, float sphereZ, float radiusX, float radiusY, float radiusZ, bool sphere) |

bool result = [locateStoppedCar3d](https://wiki.blast.hk/moonloader/lua/locateStoppedCar3d)(Vehicle car, float sphereX, float sphereY, float sphereZ, float radiusX, float radiusY, float radiusZ, bool sphere) |

[giveWeaponToChar](https://wiki.blast.hk/moonloader/lua/giveWeaponToChar)(Ped ped, int weapon, int ammo) |

bool result = [setPlayerControl](https://wiki.blast.hk/moonloader/lua/setPlayerControl)(Player player, bool canMove) |

bool result = [forceWeather](https://wiki.blast.hk/moonloader/lua/forceWeather)(int weather) |

bool result = [forceWeatherNow](https://wiki.blast.hk/moonloader/lua/forceWeatherNow)(int weather) |

[releaseWeather](https://wiki.blast.hk/moonloader/lua/releaseWeather)() |

[setCurrentCharWeapon](https://wiki.blast.hk/moonloader/lua/setCurrentCharWeapon)(Ped ped, int weapon) |

bool result, float positionX, float positionY, float positionZ = [getObjectCoordinates](https://wiki.blast.hk/moonloader/lua/getObjectCoordinates)(Object object) |

bool result = [setObjectCoordinates](https://wiki.blast.hk/moonloader/lua/setObjectCoordinates)(Object object, float atX, float atY, float atZ) |

int timeMs = [getGameTimer](https://wiki.blast.hk/moonloader/lua/getGameTimer)() |

bool result, int level = [storeWantedLevel](https://wiki.blast.hk/moonloader/lua/storeWantedLevel)(Player player) |

bool result = [isCarStopped](https://wiki.blast.hk/moonloader/lua/isCarStopped)(Vehicle car) |

[markCharAsNoLongerNeeded](https://wiki.blast.hk/moonloader/lua/markCharAsNoLongerNeeded)(Ped ped) |

[markCarAsNoLongerNeeded](https://wiki.blast.hk/moonloader/lua/markCarAsNoLongerNeeded)(Vehicle car) |

[markObjectAsNoLongerNeeded](https://wiki.blast.hk/moonloader/lua/markObjectAsNoLongerNeeded)(Object object) |

[dontRemoveChar](https://wiki.blast.hk/moonloader/lua/dontRemoveChar)(Ped ped) |

[dontRemoveObject](https://wiki.blast.hk/moonloader/lua/dontRemoveObject)(Object object) |

bool result, Ped ped = [createCharAsPassenger](https://wiki.blast.hk/moonloader/lua/createCharAsPassenger)(Vehicle car, Model pedtype, int model, int passengerSeat) |

bool result = [printWithNumberBig](https://wiki.blast.hk/moonloader/lua/printWithNumberBig)(GxtString gxtString, int number, int time, int style) |

bool result = [printWithNumber](https://wiki.blast.hk/moonloader/lua/printWithNumber)(GxtString gxtString, int number, int time, int flag) |

bool result = [printWithNumberNow](https://wiki.blast.hk/moonloader/lua/printWithNumberNow)(GxtString gxtString, int number, int time, int flag) |

bool result = [switchRoadsOn](https://wiki.blast.hk/moonloader/lua/switchRoadsOn)(float cornerAX, float cornerAY, float cornerAZ, float cornerBX, float cornerBY, float cornerBZ) |

[switchRoadsOff](https://wiki.blast.hk/moonloader/lua/switchRoadsOff)(float cornerAX, float cornerAY, float cornerAZ, float cornerBX, float cornerBY, float cornerBZ) |

bool result, int passengers = [getNumberOfPassengers](https://wiki.blast.hk/moonloader/lua/getNumberOfPassengers)(Vehicle car) |

int maxPassengers = [getMaximumNumberOfPassengers](https://wiki.blast.hk/moonloader/lua/getMaximumNumberOfPassengers)(Vehicle car) |

bool result = [setCarDensityMultiplier](https://wiki.blast.hk/moonloader/lua/setCarDensityMultiplier)(float multiplier) |

bool result = [setCarHeavy](https://wiki.blast.hk/moonloader/lua/setCarHeavy)(Vehicle car, bool heavy) |

[setMaxWantedLevel](https://wiki.blast.hk/moonloader/lua/setMaxWantedLevel)(int level) |

bool result = [isCarInAirProper](https://wiki.blast.hk/moonloader/lua/isCarInAirProper)(Vehicle car) |

bool result = [isCarUpsidedown](https://wiki.blast.hk/moonloader/lua/isCarUpsidedown)(Vehicle car) |

bool result, Ped ped = [getPlayerChar](https://wiki.blast.hk/moonloader/lua/getPlayerChar)(Player player) |

bool result = [cancelOverrideRestart](https://wiki.blast.hk/moonloader/lua/cancelOverrideRestart)() |

bool result = [setPoliceIgnorePlayer](https://wiki.blast.hk/moonloader/lua/setPoliceIgnorePlayer)(Player player, bool ignored) |

bool result = [startKillFrenzy](https://wiki.blast.hk/moonloader/lua/startKillFrenzy)(GxtString gxtString, int weapon, int timeLimit, int targets, Model targetModels1, Model targetModels2, Model targetModels3, Model targetModels4, bool completedText) |

bool result, int status = [readKillFrenzyStatus](https://wiki.blast.hk/moonloader/lua/readKillFrenzyStatus)() |

bool result = [locateCharAnyMeansCar2d](https://wiki.blast.hk/moonloader/lua/locateCharAnyMeansCar2d)(Ped ped, Vehicle car, float radiusX, float radiusY, bool sphere) |

bool result = [locateCharOnFootCar2d](https://wiki.blast.hk/moonloader/lua/locateCharOnFootCar2d)(Ped ped, Vehicle car, float radiusX, float radiusY, bool flag) |

bool result = [locateCharInCarCar2d](https://wiki.blast.hk/moonloader/lua/locateCharInCarCar2d)(Ped ped, Vehicle car, float radiusX, float radiusY, bool sphere) |

bool result = [locateCharAnyMeansCar3d](https://wiki.blast.hk/moonloader/lua/locateCharAnyMeansCar3d)(Ped ped, Vehicle car, float radiusX, float radiusY, float radiusZ, bool flag) |

bool result = [locateCharOnFootCar3d](https://wiki.blast.hk/moonloader/lua/locateCharOnFootCar3d)(Ped ped, Vehicle car, float radiusX, float radiusY, float radiusZ, bool flag) |

bool result = [locateCharInCarCar3d](https://wiki.blast.hk/moonloader/lua/locateCharInCarCar3d)(Ped ped, Vehicle car, float radiusX, float radiusY, float radiusZ, bool flag) |

[lockCarDoors](https://wiki.blast.hk/moonloader/lua/lockCarDoors)(Vehicle car, int status) |

bool result = [explodeCar](https://wiki.blast.hk/moonloader/lua/explodeCar)(Vehicle car) |

bool result = [addExplosion](https://wiki.blast.hk/moonloader/lua/addExplosion)(float atX, float atY, float atZ, int radius) |

bool result = [isCarUpright](https://wiki.blast.hk/moonloader/lua/isCarUpright)(Vehicle car) |

bool result, Pickup pickup = [createPickup](https://wiki.blast.hk/moonloader/lua/createPickup)(Model modelId, int type, float atX, float atY, float atZ) |

bool result = [hasPickupBeenCollected](https://wiki.blast.hk/moonloader/lua/hasPickupBeenCollected)(Pickup pickup) |

bool result = [removePickup](https://wiki.blast.hk/moonloader/lua/removePickup)(Pickup pickup) |

bool result = [setTaxiLights](https://wiki.blast.hk/moonloader/lua/setTaxiLights)(Vehicle taxi, bool light) |

bool result = [printBigQ](https://wiki.blast.hk/moonloader/lua/printBigQ)(GxtString gxtString, int time, int style) |

bool result = [setTargetCarForMissionGarage](https://wiki.blast.hk/moonloader/lua/setTargetCarForMissionGarage)(GxtString garage, Vehicle car) |

bool result = [applyBrakesToPlayersCar](https://wiki.blast.hk/moonloader/lua/applyBrakesToPlayersCar)(Player player, bool apply) |

[setCharHealth](https://wiki.blast.hk/moonloader/lua/setCharHealth)(Ped ped, int health) |

[setCarHealth](https://wiki.blast.hk/moonloader/lua/setCarHealth)(Vehicle car, int health) |

int health = [getCharHealth](https://wiki.blast.hk/moonloader/lua/getCharHealth)(Ped ped) |

int health = [getCarHealth](https://wiki.blast.hk/moonloader/lua/getCarHealth)(Vehicle car) |

bool result = [changeCarColour](https://wiki.blast.hk/moonloader/lua/changeCarColour)(Vehicle car, int primaryColor, int secondaryColor) |

[switchPedRoadsOn](https://wiki.blast.hk/moonloader/lua/switchPedRoadsOn)(float cornerAX, float cornerAY, float cornerAZ, float cornerBX, float cornerBY, float cornerBZ) |

[switchPedRoadsOff](https://wiki.blast.hk/moonloader/lua/switchPedRoadsOff)(float cornerAX, float cornerAY, float cornerAZ, float cornerBX, float cornerBY, float cornerBZ) |

[setGangWeapons](https://wiki.blast.hk/moonloader/lua/setGangWeapons)(int gang, int weapons1, int weapons2, int weapons3) |

bool result = [isCharTouchingObjectOnFoot](https://wiki.blast.hk/moonloader/lua/isCharTouchingObjectOnFoot)(Ped ped, Object object) |

[loadSpecialCharacter](https://wiki.blast.hk/moonloader/lua/loadSpecialCharacter)(GxtString gxtString, int id) |

bool result = [hasSpecialCharacterLoaded](https://wiki.blast.hk/moonloader/lua/hasSpecialCharacterLoaded)(int id) |

bool result = [isPlayerInRemoteMode](https://wiki.blast.hk/moonloader/lua/isPlayerInRemoteMode)(Player player) |

[setCutsceneOffset](https://wiki.blast.hk/moonloader/lua/setCutsceneOffset)(float posX, float posY, float posZ) |

[setAnimGroupForChar](https://wiki.blast.hk/moonloader/lua/setAnimGroupForChar)(Ped ped, string style) |

[requestModel](https://wiki.blast.hk/moonloader/lua/requestModel)(Model modelId) |

bool result = [hasModelLoaded](https://wiki.blast.hk/moonloader/lua/hasModelLoaded)(Model modelId) |

[markModelAsNoLongerNeeded](https://wiki.blast.hk/moonloader/lua/markModelAsNoLongerNeeded)(Model modelId) |

[drawCorona](https://wiki.blast.hk/moonloader/lua/drawCorona)(float atX, float atY, float atZ, float radius, int type, bool lensflares, int r, int g, int b) |

[storeClock](https://wiki.blast.hk/moonloader/lua/storeClock)() |

[restoreClock](https://wiki.blast.hk/moonloader/lua/restoreClock)() |

bool result = [isPlayerPlaying](https://wiki.blast.hk/moonloader/lua/isPlayerPlaying)(Player player) |

int mode = [getControllerMode](https://wiki.blast.hk/moonloader/lua/getControllerMode)() |

[setCanResprayCar](https://wiki.blast.hk/moonloader/lua/setCanResprayCar)(Vehicle car, bool sprayable) |

[unloadSpecialCharacter](https://wiki.blast.hk/moonloader/lua/unloadSpecialCharacter)(int id) |

[resetNumOfModelsKilledByPlayer](https://wiki.blast.hk/moonloader/lua/resetNumOfModelsKilledByPlayer)(Player player) |

int quantity = [getNumOfModelsKilledByPlayer](https://wiki.blast.hk/moonloader/lua/getNumOfModelsKilledByPlayer)(Player player, Model modelId) |

[activateGarage](https://wiki.blast.hk/moonloader/lua/activateGarage)(GxtString garage) |

Object object = [createObjectNoOffset](https://wiki.blast.hk/moonloader/lua/createObjectNoOffset)(Model modelId, float atX, float atY, float atZ) |

bool result = [isCharStopped](https://wiki.blast.hk/moonloader/lua/isCharStopped)(Ped ped) |

[switchWidescreen](https://wiki.blast.hk/moonloader/lua/switchWidescreen)(bool enable) |

Marker marker = [addSpriteBlipForContactPoint](https://wiki.blast.hk/moonloader/lua/addSpriteBlipForContactPoint)(float atX, float atY, float atZ, int icon) |

Marker marker = [addSpriteBlipForCoord](https://wiki.blast.hk/moonloader/lua/addSpriteBlipForCoord)(float atX, float atY, float atZ, int type) |

[setCharOnlyDamagedByPlayer](https://wiki.blast.hk/moonloader/lua/setCharOnlyDamagedByPlayer)(Ped ped, bool enabled) |

[setCarOnlyDamagedByPlayer](https://wiki.blast.hk/moonloader/lua/setCarOnlyDamagedByPlayer)(Vehicle car, bool enabled) |

[setCharProofs](https://wiki.blast.hk/moonloader/lua/setCharProofs)(Ped ped, bool BP, bool FP, bool EP, bool CP, bool MP) |

[setCarProofs](https://wiki.blast.hk/moonloader/lua/setCarProofs)(Vehicle car, bool BP, bool FP, bool EP, bool CP, bool MP) |

[deactivateGarage](https://wiki.blast.hk/moonloader/lua/deactivateGarage)(GxtString garage) |

bool result = [isCarInWater](https://wiki.blast.hk/moonloader/lua/isCarInWater)(Vehicle car) |

float nodeX, float nodeY, float nodeZ = [getClosestCharNode](https://wiki.blast.hk/moonloader/lua/getClosestCharNode)(float closestToX, float closestToY, float closestToZ) |

float nodeX, float nodeY, float nodeZ = [getClosestCarNode](https://wiki.blast.hk/moonloader/lua/getClosestCarNode)(float closestToX, float closestToY, float closestToZ) |

[carGotoCoordinatesAccurate](https://wiki.blast.hk/moonloader/lua/carGotoCoordinatesAccurate)(Vehicle car, float toX, float toY, float toZ) |

bool result = [isCarOnScreen](https://wiki.blast.hk/moonloader/lua/isCarOnScreen)(Vehicle car) |

bool result = [isCharOnScreen](https://wiki.blast.hk/moonloader/lua/isCharOnScreen)(Ped ped) |

bool result = [isObjectOnScreen](https://wiki.blast.hk/moonloader/lua/isObjectOnScreen)(Object object) |

float z = [getGroundZFor3dCoord](https://wiki.blast.hk/moonloader/lua/getGroundZFor3dCoord)(float atX, float atY, float atZ) |

int fire = [startScriptFire](https://wiki.blast.hk/moonloader/lua/startScriptFire)(float atX, float atY, float atZ, int propagation, int size) |

bool result = [isScriptFireExtinguished](https://wiki.blast.hk/moonloader/lua/isScriptFireExtinguished)(int fire) |

[removeScriptFire](https://wiki.blast.hk/moonloader/lua/removeScriptFire)(int fire) |

[boatGotoCoords](https://wiki.blast.hk/moonloader/lua/boatGotoCoords)(Vehicle boat, float toX, float toY, float toZ) |

[boatStop](https://wiki.blast.hk/moonloader/lua/boatStop)(Vehicle car) |

bool result = [isCharShootingInArea](https://wiki.blast.hk/moonloader/lua/isCharShootingInArea)(Ped ped, float cornerAX, float cornerAY, float cornerBX, float cornerBY, int weapon) |

bool result = [isCurrentCharWeapon](https://wiki.blast.hk/moonloader/lua/isCurrentCharWeapon)(Ped ped, int weapon) |

[setBoatCruiseSpeed](https://wiki.blast.hk/moonloader/lua/setBoatCruiseSpeed)(Vehicle boat, float speed) |

Ped ped = [getRandomCharInZone](https://wiki.blast.hk/moonloader/lua/getRandomCharInZone)(GxtString zone, bool pedtype, bool gang, bool criminal_prostitute) |

bool result = [isCharShooting](https://wiki.blast.hk/moonloader/lua/isCharShooting)(Ped ped) |

Pickup pickup = [createMoneyPickup](https://wiki.blast.hk/moonloader/lua/createMoneyPickup)(float atX, float atY, float atZ, int cash, bool permanenceFlag) |

[setCharAccuracy](https://wiki.blast.hk/moonloader/lua/setCharAccuracy)(Ped ped, int accuracy) |

float speed = [getCarSpeed](https://wiki.blast.hk/moonloader/lua/getCarSpeed)(Vehicle car) |

[loadCutscene](https://wiki.blast.hk/moonloader/lua/loadCutscene)(GxtString cutscene) |

Object object = [createCutsceneObject](https://wiki.blast.hk/moonloader/lua/createCutsceneObject)(Model modelId) |

[setCutsceneAnim](https://wiki.blast.hk/moonloader/lua/setCutsceneAnim)(int cutscene, GxtString anim) |

[startCutscene](https://wiki.blast.hk/moonloader/lua/startCutscene)() |

int time = [getCutsceneTime](https://wiki.blast.hk/moonloader/lua/getCutsceneTime)() |

bool result = [hasCutsceneFinished](https://wiki.blast.hk/moonloader/lua/hasCutsceneFinished)() |

[clearCutscene](https://wiki.blast.hk/moonloader/lua/clearCutscene)() |

[restoreCameraJumpcut](https://wiki.blast.hk/moonloader/lua/restoreCameraJumpcut)() |

[setCollectable1Total](https://wiki.blast.hk/moonloader/lua/setCollectable1Total)(int total) |

bool result = [isProjectileInArea](https://wiki.blast.hk/moonloader/lua/isProjectileInArea)(float cornerAX, float cornerAY, float cornerAZ, float cornerBX, float cornerBY, float cornerBZ) |

bool result = [isCharModel](https://wiki.blast.hk/moonloader/lua/isCharModel)(Ped ped, Model modelId) |

[loadSpecialModel](https://wiki.blast.hk/moonloader/lua/loadSpecialModel)(Model modelId, GxtString gxtString) |

float forwardX = [getCarForwardX](https://wiki.blast.hk/moonloader/lua/getCarForwardX)(Vehicle car) |

float forwardY = [getCarForwardY](https://wiki.blast.hk/moonloader/lua/getCarForwardY)(Vehicle car) |

[changeGarageType](https://wiki.blast.hk/moonloader/lua/changeGarageType)(GxtString garage, int type) |

[printWith2NumbersNow](https://wiki.blast.hk/moonloader/lua/printWith2NumbersNow)(GxtString gxtString, int numbers1, int numbers2, int time, int flag) |

[printWith3Numbers](https://wiki.blast.hk/moonloader/lua/printWith3Numbers)(GxtString gxtString, int numbers1, int numbers2, int numbers3, int time, int flag) |

[printWith4Numbers](https://wiki.blast.hk/moonloader/lua/printWith4Numbers)(GxtString gxtString, int numbers1, int numbers2, int numbers3, int numbers4, int time, int flag) |

[printWith4NumbersNow](https://wiki.blast.hk/moonloader/lua/printWith4NumbersNow)(GxtString gxtString, int numbers1, int numbers2, int numbers3, int numbers4, int time, int flag) |

[printWith6Numbers](https://wiki.blast.hk/moonloader/lua/printWith6Numbers)(GxtString gxtString, int numbers1, int numbers2, int numbers3, int numbers4, int numbers5, int numbers6, int time, int flag) |

[playerMadeProgress](https://wiki.blast.hk/moonloader/lua/playerMadeProgress)(int progress) |

[setProgressTotal](https://wiki.blast.hk/moonloader/lua/setProgressTotal)(int maxProgress) |

[registerMissionGiven](https://wiki.blast.hk/moonloader/lua/registerMissionGiven)() |

[registerMissionPassed](https://wiki.blast.hk/moonloader/lua/registerMissionPassed)(GxtString mission) |

[removeAllScriptFires](https://wiki.blast.hk/moonloader/lua/removeAllScriptFires)() |

bool result = [hasCharBeenDamagedByWeapon](https://wiki.blast.hk/moonloader/lua/hasCharBeenDamagedByWeapon)(Ped ped, int weapon) |

bool result = [hasCarBeenDamagedByWeapon](https://wiki.blast.hk/moonloader/lua/hasCarBeenDamagedByWeapon)(Vehicle car, int weapon) |

[explodeCharHead](https://wiki.blast.hk/moonloader/lua/explodeCharHead)(Ped ped) |

[anchorBoat](https://wiki.blast.hk/moonloader/lua/anchorBoat)(Vehicle boat, bool anchor) |

int fire = [startCarFire](https://wiki.blast.hk/moonloader/lua/startCarFire)(Vehicle car) |

int fire = [startCharFire](https://wiki.blast.hk/moonloader/lua/startCharFire)(Ped ped) |

Vehicle car = [getRandomCarOfTypeInArea](https://wiki.blast.hk/moonloader/lua/getRandomCarOfTypeInArea)(float cornerAX, float cornerAY, float cornerBX, float cornerBY, Model modelId) |

bool result = [hasResprayHappened](https://wiki.blast.hk/moonloader/lua/hasResprayHappened)(Vehicle car) |

[setCameraZoom](https://wiki.blast.hk/moonloader/lua/setCameraZoom)(int mode) |

Pickup pickup = [createPickupWithAmmo](https://wiki.blast.hk/moonloader/lua/createPickupWithAmmo)(Model modelId, int type, int ammo, float atX, float atY, float atZ) |

[setCarRamCar](https://wiki.blast.hk/moonloader/lua/setCarRamCar)(Vehicle car, Vehicle car) |

[setPlayerNeverGetsTired](https://wiki.blast.hk/moonloader/lua/setPlayerNeverGetsTired)(Player player, bool infiniteRun) |

[setPlayerFastReload](https://wiki.blast.hk/moonloader/lua/setPlayerFastReload)(Player player, bool fastReload) |

[setCharBleeding](https://wiki.blast.hk/moonloader/lua/setCharBleeding)(Ped ped, bool bleeding) |

[setFreeResprays](https://wiki.blast.hk/moonloader/lua/setFreeResprays)(bool enable) |

[setCharVisible](https://wiki.blast.hk/moonloader/lua/setCharVisible)(Ped ped, bool visible) |

[setCarVisible](https://wiki.blast.hk/moonloader/lua/setCarVisible)(Vehicle car, bool visible) |

bool result = [isAreaOccupied](https://wiki.blast.hk/moonloader/lua/isAreaOccupied)(float cornerAX, float cornerAY, float cornerAZ, float cornerBX, float cornerBY, float cornerBZ, bool solid, bool car, bool actor, bool object, bool particle) |

[displayText](https://wiki.blast.hk/moonloader/lua/displayText)(float posX, float posY, GxtString gxtString) |

[setTextScale](https://wiki.blast.hk/moonloader/lua/setTextScale)(float sizeX, float sizeY) |

[setTextColour](https://wiki.blast.hk/moonloader/lua/setTextColour)(int r, int g, int b, int a) |

[setTextJustify](https://wiki.blast.hk/moonloader/lua/setTextJustify)(bool alignJustify) |

[setTextCentre](https://wiki.blast.hk/moonloader/lua/setTextCentre)(bool centered) |

[setTextWrapx](https://wiki.blast.hk/moonloader/lua/setTextWrapx)(float linewidth) |

[setTextCentreSize](https://wiki.blast.hk/moonloader/lua/setTextCentreSize)(float linewidth) |

[setTextBackground](https://wiki.blast.hk/moonloader/lua/setTextBackground)(bool background) |

[setTextProportional](https://wiki.blast.hk/moonloader/lua/setTextProportional)(bool proportional) |

[setTextFont](https://wiki.blast.hk/moonloader/lua/setTextFont)(int font) |

bool result = [rotateObject](https://wiki.blast.hk/moonloader/lua/rotateObject)(Object object, float fromAngle, float toAngle, bool flag) |

bool result = [slideObject](https://wiki.blast.hk/moonloader/lua/slideObject)(Object object, float toX, float toY, float toZ, float speedX, float speedY, float speedZ, bool collisionCheck) |

[removeCharElegantly](https://wiki.blast.hk/moonloader/lua/removeCharElegantly)(Ped ped) |

[setCharStayInSamePlace](https://wiki.blast.hk/moonloader/lua/setCharStayInSamePlace)(Ped ped, bool enabled) |

bool result = [isExplosionInArea](https://wiki.blast.hk/moonloader/lua/isExplosionInArea)(int explosionType, float cornerAX, float cornerAY, float cornerAZ, float cornerBX, float cornerBY, float cornerBZ) |

[placeObjectRelativeToCar](https://wiki.blast.hk/moonloader/lua/placeObjectRelativeToCar)(Object object, Vehicle car, float offsetX, float offsetY, float offsetZ) |

[makeObjectTargettable](https://wiki.blast.hk/moonloader/lua/makeObjectTargettable)(Object object, bool targetable) |

[addArmourToChar](https://wiki.blast.hk/moonloader/lua/addArmourToChar)(Ped ped, int points) |

[openGarage](https://wiki.blast.hk/moonloader/lua/openGarage)(GxtString garage) |

[closeGarage](https://wiki.blast.hk/moonloader/lua/closeGarage)(GxtString garage) |

[warpCharFromCarToCoord](https://wiki.blast.hk/moonloader/lua/warpCharFromCarToCoord)(Ped ped, float placeAtX, float placeAtY, float placeAtZ) |

[setVisibilityOfClosestObjectOfType](https://wiki.blast.hk/moonloader/lua/setVisibilityOfClosestObjectOfType)(float atX, float atY, float atZ, float radius, Model modelId, bool visibility) |

bool result = [hasCharSpottedChar](https://wiki.blast.hk/moonloader/lua/hasCharSpottedChar)(Ped ped, Ped ped) |

bool result = [hasObjectBeenDamaged](https://wiki.blast.hk/moonloader/lua/hasObjectBeenDamaged)(Object object) |

[warpCharIntoCar](https://wiki.blast.hk/moonloader/lua/warpCharIntoCar)(Ped ped, Vehicle car) |

[printWith2NumbersBig](https://wiki.blast.hk/moonloader/lua/printWith2NumbersBig)(GxtString gxtString, int numbers1, int numbers2, int time, int style) |

[setCameraBehindPlayer](https://wiki.blast.hk/moonloader/lua/setCameraBehindPlayer)() |

Ped ped = [createRandomChar](https://wiki.blast.hk/moonloader/lua/createRandomChar)(float atX, float atY, float atZ) |

bool result = [isSniperBulletInArea](https://wiki.blast.hk/moonloader/lua/isSniperBulletInArea)(float float1, float float2, float float3, float float4, float float5, float float6) |

[setObjectVelocity](https://wiki.blast.hk/moonloader/lua/setObjectVelocity)(Object object, float velocityInDirectionX, float velocityInDirectionY, float velocityInDirectionZ) |

[setObjectCollision](https://wiki.blast.hk/moonloader/lua/setObjectCollision)(Object object, bool collision) |

[printStringInStringNow](https://wiki.blast.hk/moonloader/lua/printStringInStringNow)(GxtString gxtString, GxtString string, int time1, int time2) |

bool result = [isPointObscuredByAMissionEntity](https://wiki.blast.hk/moonloader/lua/isPointObscuredByAMissionEntity)(float cornerAX, float cornerAY, float cornerAZ, float cornerBX, float cornerBY, float cornerBZ) |

[loadAllModelsNow](https://wiki.blast.hk/moonloader/lua/loadAllModelsNow)() |

[addToObjectVelocity](https://wiki.blast.hk/moonloader/lua/addToObjectVelocity)(Object object, float velocityX, float velocityY, float velocityZ) |

[drawSprite](https://wiki.blast.hk/moonloader/lua/drawSprite)(int texture, float positionX, float positionY, float width, float height, int r, int g, int b, int a) |

[drawRect](https://wiki.blast.hk/moonloader/lua/drawRect)(float positionX, float positionY, float width, float height, int r, int g, int b, int a) |

int id = [loadSprite](https://wiki.blast.hk/moonloader/lua/loadSprite)(string name) |

bool result = [loadTextureDictionary](https://wiki.blast.hk/moonloader/lua/loadTextureDictionary)(zstring txd) |

[removeTextureDictionary](https://wiki.blast.hk/moonloader/lua/removeTextureDictionary)() |

[setObjectDynamic](https://wiki.blast.hk/moonloader/lua/setObjectDynamic)(Object object, bool moveable) |

[setCharAnimSpeed](https://wiki.blast.hk/moonloader/lua/setCharAnimSpeed)(Ped ped, string animation, float speed) |

[playMissionPassedTune](https://wiki.blast.hk/moonloader/lua/playMissionPassedTune)(int music) |

[clearArea](https://wiki.blast.hk/moonloader/lua/clearArea)(float atX, float atY, float atZ, float radius, bool area) |

[freezeOnscreenTimer](https://wiki.blast.hk/moonloader/lua/freezeOnscreenTimer)(bool timer) |

[switchCarSiren](https://wiki.blast.hk/moonloader/lua/switchCarSiren)(Vehicle car, bool siren) |

[setCarWatertight](https://wiki.blast.hk/moonloader/lua/setCarWatertight)(Vehicle car, bool watertight) |

[setCharCantBeDraggedOut](https://wiki.blast.hk/moonloader/lua/setCharCantBeDraggedOut)(Ped ped, bool locked) |

[turnCarToFaceCoord](https://wiki.blast.hk/moonloader/lua/turnCarToFaceCoord)(Vehicle car, float coordX, float coordY) |

[drawSphere](https://wiki.blast.hk/moonloader/lua/drawSphere)(float atX, float atY, float atZ, float radius) |

[setCarStatus](https://wiki.blast.hk/moonloader/lua/setCarStatus)(Vehicle car, int action) |

bool result = [isCharMale](https://wiki.blast.hk/moonloader/lua/isCharMale)(Ped ped) |

[policeRadioMessage](https://wiki.blast.hk/moonloader/lua/policeRadioMessage)(float float1, float float2, float float3) |

[setCarStrong](https://wiki.blast.hk/moonloader/lua/setCarStrong)(Vehicle car, bool strong) |

[switchRubbish](https://wiki.blast.hk/moonloader/lua/switchRubbish)(bool int1) |

[switchStreaming](https://wiki.blast.hk/moonloader/lua/switchStreaming)(bool streaming) |

bool result = [isGarageOpen](https://wiki.blast.hk/moonloader/lua/isGarageOpen)(GxtString garage) |

bool result = [isGarageClosed](https://wiki.blast.hk/moonloader/lua/isGarageClosed)(GxtString garage) |

[swapNearestBuildingModel](https://wiki.blast.hk/moonloader/lua/swapNearestBuildingModel)(float atX, float atY, float atZ, float radius, Model from, Model to) |

[switchWorldProcessing](https://wiki.blast.hk/moonloader/lua/switchWorldProcessing)(bool cutsceneOnly) |

[clearAreaOfCars](https://wiki.blast.hk/moonloader/lua/clearAreaOfCars)(float cornerAX, float cornerAY, float cornerAZ, float cornerBX, float cornerBY, float cornerBZ) |

int sphere = [addSphere](https://wiki.blast.hk/moonloader/lua/addSphere)(float atX, float atY, float atZ, float radius) |

[removeSphere](https://wiki.blast.hk/moonloader/lua/removeSphere)(int sphere) |

[setEveryoneIgnorePlayer](https://wiki.blast.hk/moonloader/lua/setEveryoneIgnorePlayer)(Player player, bool ignored) |

Vehicle car = [storeCarCharIsInNoSave](https://wiki.blast.hk/moonloader/lua/storeCarCharIsInNoSave)(Ped ped) |

[displayOnscreenTimerWithString](https://wiki.blast.hk/moonloader/lua/displayOnscreenTimerWithString)(VarId timer, int type, GxtString gxtString) |

[displayOnscreenCounterWithString](https://wiki.blast.hk/moonloader/lua/displayOnscreenCounterWithString)(VarId var, bool type, GxtString gxtString) |

[createRandomCarForCarPark](https://wiki.blast.hk/moonloader/lua/createRandomCarForCarPark)(float coordsX, float coordsY, float coordsZ, float zAngle) |

[setWantedMultiplier](https://wiki.blast.hk/moonloader/lua/setWantedMultiplier)(float sensitivity) |

[setCameraInFrontOfPlayer](https://wiki.blast.hk/moonloader/lua/setCameraInFrontOfPlayer)() |

bool result = [isCarVisiblyDamaged](https://wiki.blast.hk/moonloader/lua/isCarVisiblyDamaged)(Vehicle car) |

bool result = [doesObjectExist](https://wiki.blast.hk/moonloader/lua/doesObjectExist)(Object object) |

[loadScene](https://wiki.blast.hk/moonloader/lua/loadScene)(float atX, float atY, float atZ) |

[addStuckCarCheck](https://wiki.blast.hk/moonloader/lua/addStuckCarCheck)(Vehicle car, float stuckCheckDistance, int time) |

[removeStuckCarCheck](https://wiki.blast.hk/moonloader/lua/removeStuckCarCheck)(Vehicle car) |

bool result = [isCarStuck](https://wiki.blast.hk/moonloader/lua/isCarStuck)(Vehicle car) |

[loadMissionAudio](https://wiki.blast.hk/moonloader/lua/loadMissionAudio)(int asId, int name) |

bool result = [hasMissionAudioLoaded](https://wiki.blast.hk/moonloader/lua/hasMissionAudioLoaded)(int id) |

[playMissionAudio](https://wiki.blast.hk/moonloader/lua/playMissionAudio)(int id) |

bool result = [hasMissionAudioFinished](https://wiki.blast.hk/moonloader/lua/hasMissionAudioFinished)(int id) |

float nodeX, float nodeY, float nodeZ, float angle = [getClosestCarNodeWithHeading](https://wiki.blast.hk/moonloader/lua/getClosestCarNodeWithHeading)(float X, float Y, float Z) |

bool result = [hasImportGarageSlotBeenFilled](https://wiki.blast.hk/moonloader/lua/hasImportGarageSlotBeenFilled)(int int1, int int2) |

[clearThisPrint](https://wiki.blast.hk/moonloader/lua/clearThisPrint)(GxtString text) |

[clearThisBigPrint](https://wiki.blast.hk/moonloader/lua/clearThisBigPrint)(GxtString text) |

[setMissionAudioPosition](https://wiki.blast.hk/moonloader/lua/setMissionAudioPosition)(int id, float locationX, float locationY, float locationZ) |

[activateSaveMenu](https://wiki.blast.hk/moonloader/lua/activateSaveMenu)() |

bool result = [hasSaveGameFinished](https://wiki.blast.hk/moonloader/lua/hasSaveGameFinished)() |

[noSpecialCameraForThisGarage](https://wiki.blast.hk/moonloader/lua/noSpecialCameraForThisGarage)(int int1) |

Marker marker = [addBlipForPickup](https://wiki.blast.hk/moonloader/lua/addBlipForPickup)(Pickup pickup) |

[setPedDensityMultiplier](https://wiki.blast.hk/moonloader/lua/setPedDensityMultiplier)(float multiplier) |

[setTextDrawBeforeFade](https://wiki.blast.hk/moonloader/lua/setTextDrawBeforeFade)(bool int1) |

int collected = [getCollectable1sCollected](https://wiki.blast.hk/moonloader/lua/getCollectable1sCollected)() |

[setSpritesDrawBeforeFade](https://wiki.blast.hk/moonloader/lua/setSpritesDrawBeforeFade)(bool antialiased) |

[setTextRightJustify](https://wiki.blast.hk/moonloader/lua/setTextRightJustify)(bool alignRight) |

[printHelp](https://wiki.blast.hk/moonloader/lua/printHelp)(GxtString gxtString) |

[clearHelp](https://wiki.blast.hk/moonloader/lua/clearHelp)() |

[flashHudObject](https://wiki.blast.hk/moonloader/lua/flashHudObject)(int hudComponent) |

[setGenerateCarsAroundCamera](https://wiki.blast.hk/moonloader/lua/setGenerateCarsAroundCamera)(bool int1) |

[clearSmallPrints](https://wiki.blast.hk/moonloader/lua/clearSmallPrints)() |

[setUpsidedownCarNotDamaged](https://wiki.blast.hk/moonloader/lua/setUpsidedownCarNotDamaged)(Vehicle car, bool disableFlippedExplosion) |

bool result = [isPlayerControllable](https://wiki.blast.hk/moonloader/lua/isPlayerControllable)(Player player) |

[makePlayerSafe](https://wiki.blast.hk/moonloader/lua/makePlayerSafe)(Player player) |

int primaryColor, int secondaryColor = [getCarColours](https://wiki.blast.hk/moonloader/lua/getCarColours)(Vehicle car) |

[setAllCarsCanBeDamaged](https://wiki.blast.hk/moonloader/lua/setAllCarsCanBeDamaged)(bool enable) |

[setCarCanBeDamaged](https://wiki.blast.hk/moonloader/lua/setCarCanBeDamaged)(Vehicle car, bool enable) |

[setDrunkInputDelay](https://wiki.blast.hk/moonloader/lua/setDrunkInputDelay)(Player player, int handlingResponsiveness) |

[setCharMoney](https://wiki.blast.hk/moonloader/lua/setCharMoney)(Ped ped, int money) |

float X, float Y, float Z = [getOffsetFromObjectInWorldCoords](https://wiki.blast.hk/moonloader/lua/getOffsetFromObjectInWorldCoords)(Object object, float offsetX, float offsetY, float offsetZ) |

float X, float Y, float Z = [getOffsetFromCarInWorldCoords](https://wiki.blast.hk/moonloader/lua/getOffsetFromCarInWorldCoords)(Vehicle car, float offsetX, float offsetY, float offsetZ) |

[clearMissionAudio](https://wiki.blast.hk/moonloader/lua/clearMissionAudio)(int id) |

[setFreeHealthCare](https://wiki.blast.hk/moonloader/lua/setFreeHealthCare)(Player player, bool free) |

[loadAndLaunchMissionInternal](https://wiki.blast.hk/moonloader/lua/loadAndLaunchMissionInternal)(int mission) |

[setObjectDrawLast](https://wiki.blast.hk/moonloader/lua/setObjectDrawLast)(Object object, bool drawLast) |

int ammo = [getAmmoInCharWeapon](https://wiki.blast.hk/moonloader/lua/getAmmoInCharWeapon)(Ped ped, int int) |

[setNearClip](https://wiki.blast.hk/moonloader/lua/setNearClip)(float clip) |

[setRadioChannel](https://wiki.blast.hk/moonloader/lua/setRadioChannel)(int radioStation) |

[setCarTraction](https://wiki.blast.hk/moonloader/lua/setCarTraction)(Vehicle car, float traction) |

bool result = [areMeasurementsInMetres](https://wiki.blast.hk/moonloader/lua/areMeasurementsInMetres)() |

float feet = [convertMetresToFeet](https://wiki.blast.hk/moonloader/lua/convertMetresToFeet)(float meters) |

[setCarAvoidLevelTransitions](https://wiki.blast.hk/moonloader/lua/setCarAvoidLevelTransitions)(Vehicle car, bool avoidLevelTransitions) |

[clearAreaOfChars](https://wiki.blast.hk/moonloader/lua/clearAreaOfChars)(float cornerAX, float cornerAY, float cornerAZ, float cornerBX, float cornerBY, float cornerBZ) |

[setTotalNumberOfMissions](https://wiki.blast.hk/moonloader/lua/setTotalNumberOfMissions)(int totalMissions) |

int imperial = [convertMetresToFeetInt](https://wiki.blast.hk/moonloader/lua/convertMetresToFeetInt)(int metric) |

[registerFastestTime](https://wiki.blast.hk/moonloader/lua/registerFastestTime)(int stat, int to) |

[registerHighestScore](https://wiki.blast.hk/moonloader/lua/registerHighestScore)(int int1, int int2) |

[warpCharIntoCarAsPassenger](https://wiki.blast.hk/moonloader/lua/warpCharIntoCarAsPassenger)(Ped ped, Vehicle car, int passengerSeat) |

bool result = [isCarPassengerSeatFree](https://wiki.blast.hk/moonloader/lua/isCarPassengerSeatFree)(Vehicle car, int seat) |

Ped ped = [getCharInCarPassengerSeat](https://wiki.blast.hk/moonloader/lua/getCharInCarPassengerSeat)(Vehicle car, int seat) |

[setCharIsChrisCriminal](https://wiki.blast.hk/moonloader/lua/setCharIsChrisCriminal)(Ped ped, bool flag) |

[startCredits](https://wiki.blast.hk/moonloader/lua/startCredits)() |

[stopCredits](https://wiki.blast.hk/moonloader/lua/stopCredits)() |

bool result = [areCreditsFinished](https://wiki.blast.hk/moonloader/lua/areCreditsFinished)() |

[setMusicDoesFade](https://wiki.blast.hk/moonloader/lua/setMusicDoesFade)(bool enable) |

Model modelId = [getCarModel](https://wiki.blast.hk/moonloader/lua/getCarModel)(Vehicle veh) |

bool result = [areAnyCarCheatsActivated](https://wiki.blast.hk/moonloader/lua/areAnyCarCheatsActivated)() |

[setCharSuffersCriticalHits](https://wiki.blast.hk/moonloader/lua/setCharSuffersCriticalHits)(Ped ped, bool enable) |

bool result = [isCharSittingInCar](https://wiki.blast.hk/moonloader/lua/isCharSittingInCar)(Ped ped, Vehicle car) |

bool result = [isCharSittingInAnyCar](https://wiki.blast.hk/moonloader/lua/isCharSittingInAnyCar)(Ped ped) |

bool result = [isCharOnFoot](https://wiki.blast.hk/moonloader/lua/isCharOnFoot)(Ped ped) |

[loadSplashScreen](https://wiki.blast.hk/moonloader/lua/loadSplashScreen)(GxtString gxtString) |

[setJamesCarOnPathToPlayer](https://wiki.blast.hk/moonloader/lua/setJamesCarOnPathToPlayer)(int int1) |

[setObjectRotation](https://wiki.blast.hk/moonloader/lua/setObjectRotation)(Object object, float rotationX, float rotationY, float rotationZ) |

float X, float Y, float Z = [getDebugCameraCoordinates](https://wiki.blast.hk/moonloader/lua/getDebugCameraCoordinates)() |

bool result = [isPlayerTargettingChar](https://wiki.blast.hk/moonloader/lua/isPlayerTargettingChar)(Player player, Ped ped) |

bool result = [isPlayerTargettingObject](https://wiki.blast.hk/moonloader/lua/isPlayerTargettingObject)(Player player, Object object) |

[displayTextWithNumber](https://wiki.blast.hk/moonloader/lua/displayTextWithNumber)(float x, float y, GxtString gxtString, int number) |

[displayTextWith2Numbers](https://wiki.blast.hk/moonloader/lua/displayTextWith2Numbers)(float x, float y, GxtString gxtString, int numbersX, int numbersY) |

[failCurrentMission](https://wiki.blast.hk/moonloader/lua/failCurrentMission)() |

[setInterpolationParameters](https://wiki.blast.hk/moonloader/lua/setInterpolationParameters)(float delay, int time) |

float X, float Y, float Z = [getDebugCameraPointAt](https://wiki.blast.hk/moonloader/lua/getDebugCameraPointAt)() |

[attachCharToCar](https://wiki.blast.hk/moonloader/lua/attachCharToCar)(Ped ped, Vehicle car, float offsetX, float offsetY, float offsetZ, int position, float shootingAngleLimit, int weapon) |

[detachCharFromCar](https://wiki.blast.hk/moonloader/lua/detachCharFromCar)(Ped ped) |

[setCarStayInFastLane](https://wiki.blast.hk/moonloader/lua/setCarStayInFastLane)(Vehicle car, bool flag) |

[clearCharLastWeaponDamage](https://wiki.blast.hk/moonloader/lua/clearCharLastWeaponDamage)(Ped ped) |

[clearCarLastWeaponDamage](https://wiki.blast.hk/moonloader/lua/clearCarLastWeaponDamage)(Vehicle car) |

int int10 = [getRandomCopInArea](https://wiki.blast.hk/moonloader/lua/getRandomCopInArea)(float float1, float float2, float float3, float float4, bool int5, bool int6, bool int7, bool int8, bool int9) |

Ped ped = [getDriverOfCar](https://wiki.blast.hk/moonloader/lua/getDriverOfCar)(Vehicle car) |

int followers = [getNumberOfFollowers](https://wiki.blast.hk/moonloader/lua/getNumberOfFollowers)(Ped ped) |

[giveRemoteControlledModelToPlayer](https://wiki.blast.hk/moonloader/lua/giveRemoteControlledModelToPlayer)(Player player, float atX, float atY, float atZ, float angle, Model RCModel) |

int weapon = [getCurrentCharWeapon](https://wiki.blast.hk/moonloader/lua/getCurrentCharWeapon)(Ped ped) |

bool result = [locateCharAnyMeansObject2d](https://wiki.blast.hk/moonloader/lua/locateCharAnyMeansObject2d)(Ped ped, Object object, float radiusX, float radiusY, bool sphere) |

bool result = [locateCharOnFootObject2d](https://wiki.blast.hk/moonloader/lua/locateCharOnFootObject2d)(Ped ped, Object object, float radiusX, float radiusY, bool sphere) |

bool result = [locateCharInCarObject2d](https://wiki.blast.hk/moonloader/lua/locateCharInCarObject2d)(Ped ped, Object object, float radiusX, float radiusY, bool sphere) |

bool result = [locateCharAnyMeansObject3d](https://wiki.blast.hk/moonloader/lua/locateCharAnyMeansObject3d)(Ped ped, Object object, float radiusX, float radiusY, float radiusZ, bool sphere) |

bool result = [locateCharOnFootObject3d](https://wiki.blast.hk/moonloader/lua/locateCharOnFootObject3d)(Ped ped, Object object, float radiusX, float radiusY, float radiusZ, bool sphere) |

bool result = [locateCharInCarObject3d](https://wiki.blast.hk/moonloader/lua/locateCharInCarObject3d)(Ped ped, Object object, float radiusX, float radiusY, float radiusZ, bool sphere) |

[setCarTempAction](https://wiki.blast.hk/moonloader/lua/setCarTempAction)(Vehicle car, int action, int time) |

bool result = [isCharOnAnyBike](https://wiki.blast.hk/moonloader/lua/isCharOnAnyBike)(Ped ped) |

bool result = [canCharSeeDeadChar](https://wiki.blast.hk/moonloader/lua/canCharSeeDeadChar)(Ped ped, int pedtype) |

[setEnterCarRangeMultiplier](https://wiki.blast.hk/moonloader/lua/setEnterCarRangeMultiplier)(float float1) |

Vehicle car = [getRemoteControlledCar](https://wiki.blast.hk/moonloader/lua/getRemoteControlledCar)(Player player) |

bool result = [isPcVersion](https://wiki.blast.hk/moonloader/lua/isPcVersion)() |

bool result = [isModelAvailable](https://wiki.blast.hk/moonloader/lua/isModelAvailable)(Model modelId) |

[shutCharUp](https://wiki.blast.hk/moonloader/lua/shutCharUp)(Ped ped, bool muted) |

[setEnableRcDetonate](https://wiki.blast.hk/moonloader/lua/setEnableRcDetonate)(bool detonation) |

[setCarRandomRouteSeed](https://wiki.blast.hk/moonloader/lua/setCarRandomRouteSeed)(Vehicle car, int routeSeed) |

bool result = [isAnyPickupAtCoords](https://wiki.blast.hk/moonloader/lua/isAnyPickupAtCoords)(float pickupX, float pickupY, float pickupZ) |

[removeAllCharWeapons](https://wiki.blast.hk/moonloader/lua/removeAllCharWeapons)(Ped ped) |

bool result = [hasCharGotWeapon](https://wiki.blast.hk/moonloader/lua/hasCharGotWeapon)(Ped ped, int weapon) |

[setTankDetonateCars](https://wiki.blast.hk/moonloader/lua/setTankDetonateCars)(int tank, bool detonate) |

int offset1, int offset2, int offset3, int offset4 = [getPositionOfAnalogueSticks](https://wiki.blast.hk/moonloader/lua/getPositionOfAnalogueSticks)(int joystick) |

bool result = [isCarOnFire](https://wiki.blast.hk/moonloader/lua/isCarOnFire)(Vehicle car) |

bool result = [isCarTireBurst](https://wiki.blast.hk/moonloader/lua/isCarTireBurst)(Vehicle car, int tire) |

[initialiseObjectPath](https://wiki.blast.hk/moonloader/lua/initialiseObjectPath)(int int1, float float2) |

[setObjectPathSpeed](https://wiki.blast.hk/moonloader/lua/setObjectPathSpeed)(int int1, int int2) |

[setObjectPathPosition](https://wiki.blast.hk/moonloader/lua/setObjectPathPosition)(int int1, float float2) |

[clearObjectPath](https://wiki.blast.hk/moonloader/lua/clearObjectPath)(int int1) |

[heliGotoCoords](https://wiki.blast.hk/moonloader/lua/heliGotoCoords)(Vehicle heli, float toX, float toY, float toZ, float altitudeMin, float altitudeMax) |

float coordsX, float coordsY, float coordsZ = [getDeadCharPickupCoords](https://wiki.blast.hk/moonloader/lua/getDeadCharPickupCoords)(Ped ped) |

Pickup pickup = [createProtectionPickup](https://wiki.blast.hk/moonloader/lua/createProtectionPickup)(float atX, float atY, float atZ, int int4, int int5) |

bool result = [isCharInAnyBoat](https://wiki.blast.hk/moonloader/lua/isCharInAnyBoat)(Ped ped) |

bool result = [isCharInAnyHeli](https://wiki.blast.hk/moonloader/lua/isCharInAnyHeli)(Ped ped) |

bool result = [isCharInAnyPlane](https://wiki.blast.hk/moonloader/lua/isCharInAnyPlane)(Ped ped) |

bool result = [isCharInWater](https://wiki.blast.hk/moonloader/lua/isCharInWater)(Ped ped) |

int weapon, int ammo, Model modelId = [getCharWeaponInSlot](https://wiki.blast.hk/moonloader/lua/getCharWeaponInSlot)(Ped ped, int slot) |

float float6, float float7, float float8, float float9, float float10, float float11, float float12 = [getClosestStraightRoad](https://wiki.blast.hk/moonloader/lua/getClosestStraightRoad)(float atX, float atY, float atZ, float height, float radius) |

[setCarForwardSpeed](https://wiki.blast.hk/moonloader/lua/setCarForwardSpeed)(Vehicle car, float speed) |

[setInteriorVisible](https://wiki.blast.hk/moonloader/lua/setInteriorVisible)(int interior) |

[markCarAsConvoyCar](https://wiki.blast.hk/moonloader/lua/markCarAsConvoyCar)(Vehicle car, bool convoy) |

[resetHavocCausedByPlayer](https://wiki.blast.hk/moonloader/lua/resetHavocCausedByPlayer)(int int1) |

int int2 = [getHavocCausedByPlayer](https://wiki.blast.hk/moonloader/lua/getHavocCausedByPlayer)(int int1) |

[createScriptRoadblock](https://wiki.blast.hk/moonloader/lua/createScriptRoadblock)(float cornerAX, float cornerAY, float cornerAZ, float cornerBX, float cornerBY, float cornerBZ, int type) |

[clearAllScriptRoadblocks](https://wiki.blast.hk/moonloader/lua/clearAllScriptRoadblocks)() |

float X, float Y, float Z = [getOffsetFromCharInWorldCoords](https://wiki.blast.hk/moonloader/lua/getOffsetFromCharInWorldCoords)(Ped ped, float offsetX, float offsetY, float offsetZ) |

bool result = [hasCharBeenPhotographed](https://wiki.blast.hk/moonloader/lua/hasCharBeenPhotographed)(Ped ped) |

[switchSecurityCamera](https://wiki.blast.hk/moonloader/lua/switchSecurityCamera)(bool int1) |

bool result = [isCharInFlyingVehicle](https://wiki.blast.hk/moonloader/lua/isCharInFlyingVehicle)(Ped ped) |

Marker marker = [addShortRangeSpriteBlipForCoord](https://wiki.blast.hk/moonloader/lua/addShortRangeSpriteBlipForCoord)(float atX, float atY, float atZ, int icon) |

[setHeliOrientation](https://wiki.blast.hk/moonloader/lua/setHeliOrientation)(Vehicle heli, float angle) |

[clearHeliOrientation](https://wiki.blast.hk/moonloader/lua/clearHeliOrientation)(Vehicle heli) |

[planeGotoCoords](https://wiki.blast.hk/moonloader/lua/planeGotoCoords)(int plane, float X, float Y, float Z, float z1, float z2) |

float X, float Y, float Z = [getNthClosestCarNode](https://wiki.blast.hk/moonloader/lua/getNthClosestCarNode)(float X, float Y, float Z, int type) |

[drawWeaponshopCorona](https://wiki.blast.hk/moonloader/lua/drawWeaponshopCorona)(float X, float Y, float Z, float radius, int type, int flare, int r, int g, int b) |

[setEnableRcDetonateOnContact](https://wiki.blast.hk/moonloader/lua/setEnableRcDetonateOnContact)(bool enable) |

[freezeCharPosition](https://wiki.blast.hk/moonloader/lua/freezeCharPosition)(Ped ped, bool locked) |

[setCharDrownsInWater](https://wiki.blast.hk/moonloader/lua/setCharDrownsInWater)(Ped ped, bool drowns) |

[setObjectRecordsCollisions](https://wiki.blast.hk/moonloader/lua/setObjectRecordsCollisions)(Object object, bool set) |

bool result = [hasObjectCollidedWithAnything](https://wiki.blast.hk/moonloader/lua/hasObjectCollidedWithAnything)(Object object) |

[removeRcBuggy](https://wiki.blast.hk/moonloader/lua/removeRcBuggy)() |

int armour = [getCharArmour](https://wiki.blast.hk/moonloader/lua/getCharArmour)(Ped ped) |

[setHeliStabiliser](https://wiki.blast.hk/moonloader/lua/setHeliStabiliser)(Vehicle heli, bool limiter) |

[setCarStraightLineDistance](https://wiki.blast.hk/moonloader/lua/setCarStraightLineDistance)(Vehicle car, int radius) |

[popCarBoot](https://wiki.blast.hk/moonloader/lua/popCarBoot)(Vehicle car) |

[shutPlayerUp](https://wiki.blast.hk/moonloader/lua/shutPlayerUp)(Player player, bool shut) |

[setPlayerMood](https://wiki.blast.hk/moonloader/lua/setPlayerMood)(Player player, int flag, int time) |

[requestCollision](https://wiki.blast.hk/moonloader/lua/requestCollision)(float X, float Y) |

bool result = [locateObject2d](https://wiki.blast.hk/moonloader/lua/locateObject2d)(Object object, float X, float Y, float radiusX, float radiusY, bool sphere) |

bool result = [locateObject3d](https://wiki.blast.hk/moonloader/lua/locateObject3d)(Object object, float X, float Y, float Z, float radiusX, float radiusY, float radiusZ, bool flag) |

bool result = [isObjectInWater](https://wiki.blast.hk/moonloader/lua/isObjectInWater)(Object object) |

bool result = [isObjectInArea2d](https://wiki.blast.hk/moonloader/lua/isObjectInArea2d)(Object object, float cornerAX, float cornerAY, float cornerBX, float cornerBY, bool sphere) |

bool result = [isObjectInArea3d](https://wiki.blast.hk/moonloader/lua/isObjectInArea3d)(Object object, float cornerAX, float cornerAY, float cornerAZ, float cornerBX, float cornerBY, float cornerBZ, bool flag) |

[taskToggleDuck](https://wiki.blast.hk/moonloader/lua/taskToggleDuck)(Ped ped, bool crouch) |

[requestAnimation](https://wiki.blast.hk/moonloader/lua/requestAnimation)(string animation) |

bool result = [hasAnimationLoaded](https://wiki.blast.hk/moonloader/lua/hasAnimationLoaded)(string animation) |

[removeAnimation](https://wiki.blast.hk/moonloader/lua/removeAnimation)(string animation) |

bool result = [isCharWaitingForWorldCollision](https://wiki.blast.hk/moonloader/lua/isCharWaitingForWorldCollision)(Ped ped) |

bool result = [isCarWaitingForWorldCollision](https://wiki.blast.hk/moonloader/lua/isCarWaitingForWorldCollision)(Vehicle car) |

[attachCharToObject](https://wiki.blast.hk/moonloader/lua/attachCharToObject)(Ped ped, Object object, float offsetX, float offsetY, float offsetZ, int orientation, float angle, int lockWeapon) |

[displayNthOnscreenCounterWithString](https://wiki.blast.hk/moonloader/lua/displayNthOnscreenCounterWithString)(VarId text, int type, int line, GxtString gxtString) |

[addSetPiece](https://wiki.blast.hk/moonloader/lua/addSetPiece)(int type, float rectX1, float rectY1, float rectX2, float rectY2, float spawnAX, float spawnAY, float headedTowards1X, float headedTowards1Y, float spawnBX, float spawnBY, float headedTowards2X, float headedTowards2Y) |

[setExtraColours](https://wiki.blast.hk/moonloader/lua/setExtraColours)(int color, bool fade) |

[clearExtraColours](https://wiki.blast.hk/moonloader/lua/clearExtraColours)(bool fade) |

int twowheelstime, float twowheelsdistance, int wheelietime, float wheelieDistance, int stoppieTime, float stoppieDistance = [getWheelieStats](https://wiki.blast.hk/moonloader/lua/getWheelieStats)(Player player) |

[burstCarTire](https://wiki.blast.hk/moonloader/lua/burstCarTire)(Vehicle car, int tire) |

bool result = [isPlayerWearing](https://wiki.blast.hk/moonloader/lua/isPlayerWearing)(Player player, string bodypart, int skin) |

[setPlayerCanDoDriveBy](https://wiki.blast.hk/moonloader/lua/setPlayerCanDoDriveBy)(Player player, bool mode) |

int handleAs = [createSwatRope](https://wiki.blast.hk/moonloader/lua/createSwatRope)(int pedtype, Model modelId, float X, float Y, float Z) |

[setCarModelComponents](https://wiki.blast.hk/moonloader/lua/setCarModelComponents)(Model car, int variation1, int variation2) |

[closeAllCarDoors](https://wiki.blast.hk/moonloader/lua/closeAllCarDoors)(Vehicle car) |

float distance = [getDistanceBetweenCoords2d](https://wiki.blast.hk/moonloader/lua/getDistanceBetweenCoords2d)(float x1, float y1, float x2, float y2) |

float distance = [getDistanceBetweenCoords3d](https://wiki.blast.hk/moonloader/lua/getDistanceBetweenCoords3d)(float x1, float y1, float z1, float x2, float y2, float z2) |

[sortOutObjectCollisionWithCar](https://wiki.blast.hk/moonloader/lua/sortOutObjectCollisionWithCar)(Object object, Vehicle car) |

int level = [getMaxWantedLevel](https://wiki.blast.hk/moonloader/lua/getMaxWantedLevel)() |

[printHelpForever](https://wiki.blast.hk/moonloader/lua/printHelpForever)(GxtString text) |

[printHelpForeverWithNumber](https://wiki.blast.hk/moonloader/lua/printHelpForeverWithNumber)(GxtString text, int number) |

Pickup pickup = [createLockedPropertyPickup](https://wiki.blast.hk/moonloader/lua/createLockedPropertyPickup)(float pX, float pY, float pZ, GxtString gxtString) |

Pickup pickup = [createForsalePropertyPickup](https://wiki.blast.hk/moonloader/lua/createForsalePropertyPickup)(float pX, float pY, float pZ, int price, GxtString gxtString) |

[freezeCarPosition](https://wiki.blast.hk/moonloader/lua/freezeCarPosition)(Vehicle car, bool locked) |

bool result = [hasCharBeenDamagedByChar](https://wiki.blast.hk/moonloader/lua/hasCharBeenDamagedByChar)(Ped ped, Ped byActor) |

bool result = [hasCharBeenDamagedByCar](https://wiki.blast.hk/moonloader/lua/hasCharBeenDamagedByCar)(Ped ped, Vehicle byCar) |

bool result = [hasCarBeenDamagedByChar](https://wiki.blast.hk/moonloader/lua/hasCarBeenDamagedByChar)(Vehicle car, Ped byActor) |

bool result = [hasCarBeenDamagedByCar](https://wiki.blast.hk/moonloader/lua/hasCarBeenDamagedByCar)(Vehicle car, Vehicle byCar) |

int radio = [getRadioChannel](https://wiki.blast.hk/moonloader/lua/getRadioChannel)() |

[setCharStayInCarWhenJacked](https://wiki.blast.hk/moonloader/lua/setCharStayInCarWhenJacked)(Ped ped, bool stay) |

[setPlayerDrunkenness](https://wiki.blast.hk/moonloader/lua/setPlayerDrunkenness)(Player player, int drunk) |

Vehicle car = [getRandomCarOfTypeInAreaNoSave](https://wiki.blast.hk/moonloader/lua/getRandomCarOfTypeInAreaNoSave)(float x1, float y1, float x2, float y2, Model modelId) |

[setCanBurstCarTires](https://wiki.blast.hk/moonloader/lua/setCanBurstCarTires)(Vehicle car, bool vulnerability) |

[fireHunterGun](https://wiki.blast.hk/moonloader/lua/fireHunterGun)(Vehicle car) |

bool result = [isCharTouchingVehicle](https://wiki.blast.hk/moonloader/lua/isCharTouchingVehicle)(Ped ped, Vehicle car) |

[setCharCanBeShotInVehicle](https://wiki.blast.hk/moonloader/lua/setCharCanBeShotInVehicle)(Ped ped, bool can) |

[loadMissionText](https://wiki.blast.hk/moonloader/lua/loadMissionText)(GxtString table) |

[clearCharLastDamageEntity](https://wiki.blast.hk/moonloader/lua/clearCharLastDamageEntity)(Ped ped) |

[clearCarLastDamageEntity](https://wiki.blast.hk/moonloader/lua/clearCarLastDamageEntity)(Vehicle car) |

[freezeObjectPosition](https://wiki.blast.hk/moonloader/lua/freezeObjectPosition)(Object object, bool freeze) |

[removeWeaponFromChar](https://wiki.blast.hk/moonloader/lua/removeWeaponFromChar)(Ped ped, int weapon) |

[makePlayerFireProof](https://wiki.blast.hk/moonloader/lua/makePlayerFireProof)(Player player, bool fireproof) |

[increasePlayerMaxHealth](https://wiki.blast.hk/moonloader/lua/increasePlayerMaxHealth)(Player player, int increase) |

[increasePlayerMaxArmour](https://wiki.blast.hk/moonloader/lua/increasePlayerMaxArmour)(Player player, int increase) |

Ped ped = [createRandomCharAsDriver](https://wiki.blast.hk/moonloader/lua/createRandomCharAsDriver)(Vehicle car) |

Ped ped = [createRandomCharAsPassenger](https://wiki.blast.hk/moonloader/lua/createRandomCharAsPassenger)(Vehicle car, int seat) |

[ensurePlayerHasDriveByWeapon](https://wiki.blast.hk/moonloader/lua/ensurePlayerHasDriveByWeapon)(Player player, int ammo) |

[makeHeliComeCrashingDown](https://wiki.blast.hk/moonloader/lua/makeHeliComeCrashingDown)(Vehicle heli) |

[addExplosionNoSound](https://wiki.blast.hk/moonloader/lua/addExplosionNoSound)(float pX, float pY, float pZ, int type) |

[linkObjectToInterior](https://wiki.blast.hk/moonloader/lua/linkObjectToInterior)(Object object, int interior) |

[setCharNeverTargetted](https://wiki.blast.hk/moonloader/lua/setCharNeverTargetted)(Ped ped, bool untargetable) |

bool result = [wasCutsceneSkipped](https://wiki.blast.hk/moonloader/lua/wasCutsceneSkipped)() |

bool result = [isCharInAnyPoliceVehicle](https://wiki.blast.hk/moonloader/lua/isCharInAnyPoliceVehicle)(Ped ped) |

bool result = [doesCharExist](https://wiki.blast.hk/moonloader/lua/doesCharExist)(Ped ped) |

bool result = [doesVehicleExist](https://wiki.blast.hk/moonloader/lua/doesVehicleExist)(Vehicle car) |

Marker blip = [addShortRangeSpriteBlipForContactPoint](https://wiki.blast.hk/moonloader/lua/addShortRangeSpriteBlipForContactPoint)(float pX, float pY, float pZ, int icon) |

[setAllTaxisHaveNitro](https://wiki.blast.hk/moonloader/lua/setAllTaxisHaveNitro)(bool toggle) |

[freezeCarPositionAndDontLoadCollision](https://wiki.blast.hk/moonloader/lua/freezeCarPositionAndDontLoadCollision)(Vehicle car, bool keep) |

[freezeCharPositionAndDontLoadCollision](https://wiki.blast.hk/moonloader/lua/freezeCharPositionAndDontLoadCollision)(Ped ped, bool keep) |

[setPlayerIsInStadium](https://wiki.blast.hk/moonloader/lua/setPlayerIsInStadium)(bool set) |

[displayRadar](https://wiki.blast.hk/moonloader/lua/displayRadar)(bool enable) |

[registerBestPosition](https://wiki.blast.hk/moonloader/lua/registerBestPosition)(int stat, float float) |

bool result = [isPlayerInInfoZone](https://wiki.blast.hk/moonloader/lua/isPlayerInInfoZone)(Player player, GxtString zone) |

[setLoadCollisionForCarFlag](https://wiki.blast.hk/moonloader/lua/setLoadCollisionForCarFlag)(Vehicle car, bool enable) |

[setLoadCollisionForCharFlag](https://wiki.blast.hk/moonloader/lua/setLoadCollisionForCharFlag)(Ped ped, bool enable) |

[addBigGunFlash](https://wiki.blast.hk/moonloader/lua/addBigGunFlash)(float fromX, float fromY, float fromZ, float toX, float toY, float toZ) |

float progress = [getProgressPercentage](https://wiki.blast.hk/moonloader/lua/getProgressPercentage)() |

[setVehicleToFadeIn](https://wiki.blast.hk/moonloader/lua/setVehicleToFadeIn)(Vehicle car, int flag) |

[registerOddjobMissionPassed](https://wiki.blast.hk/moonloader/lua/registerOddjobMissionPassed)() |

bool result = [isPlayerInShortcutTaxi](https://wiki.blast.hk/moonloader/lua/isPlayerInShortcutTaxi)(Player player) |

bool result = [isCharDucking](https://wiki.blast.hk/moonloader/lua/isCharDucking)(Ped ped) |

[setOnscreenCounterFlashWhenFirstDisplayed](https://wiki.blast.hk/moonloader/lua/setOnscreenCounterFlashWhenFirstDisplayed)(VarId text, bool flashing) |

[shuffleCardDecks](https://wiki.blast.hk/moonloader/lua/shuffleCardDecks)(bool shuffle) |

int card = [fetchNextCard](https://wiki.blast.hk/moonloader/lua/fetchNextCard)() |

float vecX, float vecY, float vecZ = [getObjectVelocity](https://wiki.blast.hk/moonloader/lua/getObjectVelocity)(Object object) |

bool result = [isDebugCameraOn](https://wiki.blast.hk/moonloader/lua/isDebugCameraOn)() |

[addToObjectRotationVelocity](https://wiki.blast.hk/moonloader/lua/addToObjectRotationVelocity)(Object object, float vecX, float vecY, float vecZ) |

[setObjectRotationVelocity](https://wiki.blast.hk/moonloader/lua/setObjectRotationVelocity)(Object object, float vecX, float vecY, float vecZ) |

bool result = [isObjectStatic](https://wiki.blast.hk/moonloader/lua/isObjectStatic)(Object object) |

float angle = [getAngleBetween2dVectors](https://wiki.blast.hk/moonloader/lua/getAngleBetween2dVectors)(float vecX, float vecY, float vecX, float vecY) |

bool result = [do2dRectanglesCollide](https://wiki.blast.hk/moonloader/lua/do2dRectanglesCollide)(float areaX, float areaY, float scaleX, float scaleY, float overlapareaX, float overlapareaY, float overlapscaleX, float overlapscaleY) |

float axisX, float axisY, float axisZ = [getObjectRotationVelocity](https://wiki.blast.hk/moonloader/lua/getObjectRotationVelocity)(Object object) |

[addVelocityRelativeToObjectVelocity](https://wiki.blast.hk/moonloader/lua/addVelocityRelativeToObjectVelocity)(Object object, float vecX, float vecY, float vecZ) |

float speed = [getObjectSpeed](https://wiki.blast.hk/moonloader/lua/getObjectSpeed)(Object object) |

bool result, float X, float Y = [get2dLinesIntersectPoint](https://wiki.blast.hk/moonloader/lua/get2dLinesIntersectPoint)(float l1x1, float l1y1, float l1x2, float l1y2, float l2x1, float l2y1, float l2x2, float l2y2) |

[taskPause](https://wiki.blast.hk/moonloader/lua/taskPause)(Ped ped, int timeMS) |

[taskStandStill](https://wiki.blast.hk/moonloader/lua/taskStandStill)(Ped ped, int timeMS) |

[taskFallAndGetUp](https://wiki.blast.hk/moonloader/lua/taskFallAndGetUp)(Ped ped, bool int2, int time) |

[taskJump](https://wiki.blast.hk/moonloader/lua/taskJump)(Ped ped, bool jump) |

[taskTired](https://wiki.blast.hk/moonloader/lua/taskTired)(Ped ped, int timeMS) |

[taskDie](https://wiki.blast.hk/moonloader/lua/taskDie)(Ped ped) |

[taskLookAtChar](https://wiki.blast.hk/moonloader/lua/taskLookAtChar)(Ped ped, int lookAt, int timeMS) |

[taskLookAtVehicle](https://wiki.blast.hk/moonloader/lua/taskLookAtVehicle)(Ped ped, int lookAt, int timeMS) |

[taskSay](https://wiki.blast.hk/moonloader/lua/taskSay)(Ped ped, int audio) |

[taskShakeFist](https://wiki.blast.hk/moonloader/lua/taskShakeFist)(Ped ped) |

[taskCower](https://wiki.blast.hk/moonloader/lua/taskCower)(Ped ped) |

[taskHandsUp](https://wiki.blast.hk/moonloader/lua/taskHandsUp)(Ped ped, int timeMS) |

[taskDuck](https://wiki.blast.hk/moonloader/lua/taskDuck)(Ped ped, int timeMS) |

[taskUseAtm](https://wiki.blast.hk/moonloader/lua/taskUseAtm)(Ped ped) |

[taskScratchHead](https://wiki.blast.hk/moonloader/lua/taskScratchHead)(Ped ped) |

[taskLookAbout](https://wiki.blast.hk/moonloader/lua/taskLookAbout)(Ped ped, int timeMS) |

[taskEnterCarAsPassenger](https://wiki.blast.hk/moonloader/lua/taskEnterCarAsPassenger)(Ped ped, Vehicle car, int time, int passengerSeat) |

[taskEnterCarAsDriver](https://wiki.blast.hk/moonloader/lua/taskEnterCarAsDriver)(Ped ped, Vehicle car, int timeMS) |

[taskLeaveCar](https://wiki.blast.hk/moonloader/lua/taskLeaveCar)(Ped ped, Vehicle car) |

[taskLeaveCarAndFlee](https://wiki.blast.hk/moonloader/lua/taskLeaveCarAndFlee)(Ped ped, Vehicle car, float X, float Y, float Z) |

[taskCarDriveToCoord](https://wiki.blast.hk/moonloader/lua/taskCarDriveToCoord)(Ped ped, Vehicle car, float toX, float toY, float toZ, float speed, int int7, int model, int int9) |

[taskCarDriveWander](https://wiki.blast.hk/moonloader/lua/taskCarDriveWander)(Ped ped, Vehicle hijackCar, float searchRadius, int trafficBehavior) |

[taskGoStraightToCoord](https://wiki.blast.hk/moonloader/lua/taskGoStraightToCoord)(Ped ped, float toX, float toY, float toZ, int mode, int time) |

[taskAchieveHeading](https://wiki.blast.hk/moonloader/lua/taskAchieveHeading)(Ped ped, float angle) |

[flushRoute](https://wiki.blast.hk/moonloader/lua/flushRoute)() |

[extendRoute](https://wiki.blast.hk/moonloader/lua/extendRoute)(float pointX, float pointY, float pointZ) |

[taskFollowPointRoute](https://wiki.blast.hk/moonloader/lua/taskFollowPointRoute)(Ped ped, int flags1, int flags2) |

[taskGotoChar](https://wiki.blast.hk/moonloader/lua/taskGotoChar)(Ped ped, Ped toActor, int timelimit, float stopWithinRadius) |

[taskFleePoint](https://wiki.blast.hk/moonloader/lua/taskFleePoint)(Ped ped, float fromX, float fromY, float fromZ, float awayRadius, int timelimit) |

[taskFleeChar](https://wiki.blast.hk/moonloader/lua/taskFleeChar)(Ped ped, Ped fromActor, float radius, int timelimit) |

[taskSmartFleePoint](https://wiki.blast.hk/moonloader/lua/taskSmartFleePoint)(Ped ped, float fromX, float fromY, float fromZ, float stopAtRadius, int timelimit) |

[taskSmartFleeChar](https://wiki.blast.hk/moonloader/lua/taskSmartFleeChar)(Ped ped, Ped fromActor, float originRadius, int timelimit) |

[taskWanderStandard](https://wiki.blast.hk/moonloader/lua/taskWanderStandard)(Ped ped) |

[taskKillCharOnFoot](https://wiki.blast.hk/moonloader/lua/taskKillCharOnFoot)(Ped ped, Ped killActor) |

[startPlaybackRecordedCar](https://wiki.blast.hk/moonloader/lua/startPlaybackRecordedCar)(Vehicle car, int path) |

[stopPlaybackRecordedCar](https://wiki.blast.hk/moonloader/lua/stopPlaybackRecordedCar)(Vehicle car) |

[pausePlaybackRecordedCar](https://wiki.blast.hk/moonloader/lua/pausePlaybackRecordedCar)(Vehicle car) |

[unpausePlaybackRecordedCar](https://wiki.blast.hk/moonloader/lua/unpausePlaybackRecordedCar)(Vehicle car) |

[setCarEscortCarLeft](https://wiki.blast.hk/moonloader/lua/setCarEscortCarLeft)(Vehicle car, Vehicle followCar) |

[setCarEscortCarRight](https://wiki.blast.hk/moonloader/lua/setCarEscortCarRight)(Vehicle car, Vehicle followCar) |

[setCarEscortCarRear](https://wiki.blast.hk/moonloader/lua/setCarEscortCarRear)(Vehicle car, Vehicle followCar) |

[setCarEscortCarFront](https://wiki.blast.hk/moonloader/lua/setCarEscortCarFront)(Vehicle car, Vehicle followCar) |

[taskFollowPathNodesToCoord](https://wiki.blast.hk/moonloader/lua/taskFollowPathNodesToCoord)(Ped ped, float pathX, float pathY, float pathZ, int mode, int time) |

bool result = [isCharInAngledArea2d](https://wiki.blast.hk/moonloader/lua/isCharInAngledArea2d)(Ped ped, float x1, float y1, float x2, float y2, float angle, bool sphere) |

bool result = [isCharInAngledAreaOnFoot2d](https://wiki.blast.hk/moonloader/lua/isCharInAngledAreaOnFoot2d)(Ped ped, float x1, float y1, float x2, float y2, float angle, bool sphere) |

bool result = [isCharInAngledAreaInCar2d](https://wiki.blast.hk/moonloader/lua/isCharInAngledAreaInCar2d)(Ped ped, float x1, float y1, float x2, float y2, float angle, bool sphere) |

bool result = [isCharStoppedInAngledArea2d](https://wiki.blast.hk/moonloader/lua/isCharStoppedInAngledArea2d)(Ped ped, float x1, float y1, float x2, float y2, float height, bool flag) |

bool result = [isCharStoppedInAngledAreaOnFoot2d](https://wiki.blast.hk/moonloader/lua/isCharStoppedInAngledAreaOnFoot2d)(Ped ped, float x1, float y1, float x2, float y2, float angle, bool sphere) |

bool result = [isCharStoppedInAngledAreaInCar2d](https://wiki.blast.hk/moonloader/lua/isCharStoppedInAngledAreaInCar2d)(Ped ped, float x1, float y1, float x2, float y2, float height, bool flag) |

bool result = [isCharInAngledArea3d](https://wiki.blast.hk/moonloader/lua/isCharInAngledArea3d)(Ped ped, float x1, float y1, float z1, float x2, float y2, float z2, float angle, bool sphere) |

bool result = [isCharInAngledAreaOnFoot3d](https://wiki.blast.hk/moonloader/lua/isCharInAngledAreaOnFoot3d)(Ped ped, float x1, float y1, float z1, float x2, float y2, float z2, float angle, bool sphere) |

bool result = [isCharInAngledAreaInCar3d](https://wiki.blast.hk/moonloader/lua/isCharInAngledAreaInCar3d)(Ped ped, float x1, float y1, float z1, float x2, float y2, float z2, float depth, bool flag) |

bool result = [isCharStoppedInAngledArea3d](https://wiki.blast.hk/moonloader/lua/isCharStoppedInAngledArea3d)(Ped ped, float x1, float y1, float z1, float x2, float y2, float z2, float depth, bool flag) |

bool result = [isCharStoppedInAngledAreaOnFoot3d](https://wiki.blast.hk/moonloader/lua/isCharStoppedInAngledAreaOnFoot3d)(Ped ped, float x1, float y1, float z1, float x2, float y2, float z2, float depth, bool flag) |

bool result = [isCharStoppedInAngledAreaInCar3d](https://wiki.blast.hk/moonloader/lua/isCharStoppedInAngledAreaInCar3d)(Ped ped, float x1, float y1, float z1, float x2, float y2, float z2, float depth, bool flag) |

bool result = [isCharInTaxi](https://wiki.blast.hk/moonloader/lua/isCharInTaxi)(Ped ped) |

[taskGoToCoordAnyMeans](https://wiki.blast.hk/moonloader/lua/taskGoToCoordAnyMeans)(Ped ped, float toX, float toY, float toZ, int mode, Vehicle useCar) |

float zAngle = [getHeadingFromVector2d](https://wiki.blast.hk/moonloader/lua/getHeadingFromVector2d)(float pX, float pY) |

[taskPlayAnim](https://wiki.blast.hk/moonloader/lua/taskPlayAnim)(Ped ped, string animation, string IFP, float framedelta, bool loop, bool lockX, bool lockY, bool lockF, int time) |

[loadPathNodesInArea](https://wiki.blast.hk/moonloader/lua/loadPathNodesInArea)(float x1, float y1, float x2, float y2) |

[releasePathNodes](https://wiki.blast.hk/moonloader/lua/releasePathNodes)() |

int maker = [loadCharDecisionMaker](https://wiki.blast.hk/moonloader/lua/loadCharDecisionMaker)(int type) |

[setCharDecisionMaker](https://wiki.blast.hk/moonloader/lua/setCharDecisionMaker)(Ped ped, int maker) |

[setTextDropshadow](https://wiki.blast.hk/moonloader/lua/setTextDropshadow)(int shadow, int r, int g, int b, int a) |

bool result = [isPlaybackGoingOnForCar](https://wiki.blast.hk/moonloader/lua/isPlaybackGoingOnForCar)(Vehicle car) |

[setSenseRange](https://wiki.blast.hk/moonloader/lua/setSenseRange)(Ped ped, float accuracy) |

bool result = [isCharPlayingAnim](https://wiki.blast.hk/moonloader/lua/isCharPlayingAnim)(Ped ped, string animation) |

[setCharAnimPlayingFlag](https://wiki.blast.hk/moonloader/lua/setCharAnimPlayingFlag)(Ped ped, string animation, bool flag) |

float time = [getCharAnimCurrentTime](https://wiki.blast.hk/moonloader/lua/getCharAnimCurrentTime)(Ped ped, string animation) |

[setCharAnimCurrentTime](https://wiki.blast.hk/moonloader/lua/setCharAnimCurrentTime)(Ped ped, string animation, float time) |

int task = [openSequenceTask](https://wiki.blast.hk/moonloader/lua/openSequenceTask)() |

[closeSequenceTask](https://wiki.blast.hk/moonloader/lua/closeSequenceTask)(int task) |

[performSequenceTask](https://wiki.blast.hk/moonloader/lua/performSequenceTask)(Ped ped, int task) |

[setCharCollision](https://wiki.blast.hk/moonloader/lua/setCharCollision)(Ped ped, bool enable) |

float totalTime = [getCharAnimTotalTime](https://wiki.blast.hk/moonloader/lua/getCharAnimTotalTime)(Ped ped, string animation) |

[clearSequenceTask](https://wiki.blast.hk/moonloader/lua/clearSequenceTask)(int task) |

int handle = [addAttractor](https://wiki.blast.hk/moonloader/lua/addAttractor)(float originX, float originY, float originZ, float zAngle, float unknownAngle, int taskSequence) |

[clearAttractor](https://wiki.blast.hk/moonloader/lua/clearAttractor)(int handle) |

Ped ped = [createCharAtAttractor](https://wiki.blast.hk/moonloader/lua/createCharAtAttractor)(int pedtype, Model modelId, int ASOrigin, int task) |

[taskLeaveCarImmediately](https://wiki.blast.hk/moonloader/lua/taskLeaveCarImmediately)(Ped ped, Vehicle car) |

[incrementIntStat](https://wiki.blast.hk/moonloader/lua/incrementIntStat)(int stat, int add) |

[incrementFloatStat](https://wiki.blast.hk/moonloader/lua/incrementFloatStat)(int stat, float add) |

[decrementIntStat](https://wiki.blast.hk/moonloader/lua/decrementIntStat)(int stat, int int) |

[decrementFloatStat](https://wiki.blast.hk/moonloader/lua/decrementFloatStat)(int stat, float float) |

[registerIntStat](https://wiki.blast.hk/moonloader/lua/registerIntStat)(int stat, int int) |

[registerFloatStat](https://wiki.blast.hk/moonloader/lua/registerFloatStat)(int stat, float value) |

[setIntStat](https://wiki.blast.hk/moonloader/lua/setIntStat)(int stat, int int) |

[setFloatStat](https://wiki.blast.hk/moonloader/lua/setFloatStat)(int stat, float float) |

int status = [getScriptTaskStatus](https://wiki.blast.hk/moonloader/lua/getScriptTaskStatus)(Ped ped, int task) |

int group = [createGroup](https://wiki.blast.hk/moonloader/lua/createGroup)(int type) |

[setGroupLeader](https://wiki.blast.hk/moonloader/lua/setGroupLeader)(int group, Ped ped) |

[setGroupMember](https://wiki.blast.hk/moonloader/lua/setGroupMember)(int group, Ped ped) |

[removeGroup](https://wiki.blast.hk/moonloader/lua/removeGroup)(int group) |

[taskLeaveAnyCar](https://wiki.blast.hk/moonloader/lua/taskLeaveAnyCar)(Ped ped) |

[taskKillCharOnFootWhileDucking](https://wiki.blast.hk/moonloader/lua/taskKillCharOnFootWhileDucking)(Ped ped, int weapon, int flags, int time, int chance) |

[taskAimGunAtChar](https://wiki.blast.hk/moonloader/lua/taskAimGunAtChar)(Ped ped, int aimAt, int timeMS) |

[taskGoToCoordWhileShooting](https://wiki.blast.hk/moonloader/lua/taskGoToCoordWhileShooting)(Ped ped, float toX, float toY, float toZ, int mode, float turnRadius, float stopRadius, int lookAtActor) |

[taskStayInSamePlace](https://wiki.blast.hk/moonloader/lua/taskStayInSamePlace)(Ped ped, bool stay) |

[taskTurnCharToFaceChar](https://wiki.blast.hk/moonloader/lua/taskTurnCharToFaceChar)(Ped ped, int rotateTo) |

bool result = [isCharAtScriptedAttractor](https://wiki.blast.hk/moonloader/lua/isCharAtScriptedAttractor)(Ped ped, int origin) |

[setSequenceToRepeat](https://wiki.blast.hk/moonloader/lua/setSequenceToRepeat)(int pack, bool loop) |

int progess = [getSequenceProgress](https://wiki.blast.hk/moonloader/lua/getSequenceProgress)(Ped ped) |

[clearLookAt](https://wiki.blast.hk/moonloader/lua/clearLookAt)(Ped ped) |

[setFollowNodeThresholdDistance](https://wiki.blast.hk/moonloader/lua/setFollowNodeThresholdDistance)(Ped ped, float dist) |

Particle particle = [createFxSystem](https://wiki.blast.hk/moonloader/lua/createFxSystem)(string particle, float pX, float pY, float pZ, int type) |

[playFxSystem](https://wiki.blast.hk/moonloader/lua/playFxSystem)(Particle particle) |

[stopFxSystem](https://wiki.blast.hk/moonloader/lua/stopFxSystem)(Particle particle) |

[playAndKillFxSystem](https://wiki.blast.hk/moonloader/lua/playAndKillFxSystem)(Particle particle) |

[killFxSystem](https://wiki.blast.hk/moonloader/lua/killFxSystem)(Particle particle) |

int stat = [getIntStat](https://wiki.blast.hk/moonloader/lua/getIntStat)(int stat) |

float stat = [getFloatStat](https://wiki.blast.hk/moonloader/lua/getFloatStat)(int stat) |

[setObjectRenderScorched](https://wiki.blast.hk/moonloader/lua/setObjectRenderScorched)(Object object, bool fireproof) |

[taskLookAtObject](https://wiki.blast.hk/moonloader/lua/taskLookAtObject)(Ped ped, int lookAt, int timeMS) |

float float = [limitAngle](https://wiki.blast.hk/moonloader/lua/limitAngle)(float angle) |

[openCarDoor](https://wiki.blast.hk/moonloader/lua/openCarDoor)(Vehicle car, int door) |

float X, float Y, float Z = [getPickupCoordinates](https://wiki.blast.hk/moonloader/lua/getPickupCoordinates)(Pickup pickup) |

[removeDecisionMaker](https://wiki.blast.hk/moonloader/lua/removeDecisionMaker)(int maker) |

Model modelId = [getCharModel](https://wiki.blast.hk/moonloader/lua/getCharModel)(Ped ped) |

[taskAimGunAtCoord](https://wiki.blast.hk/moonloader/lua/taskAimGunAtCoord)(Ped ped, float atX, float atY, float atZ, int timeMS) |

[taskShootAtCoord](https://wiki.blast.hk/moonloader/lua/taskShootAtCoord)(Ped ped, float atX, float atY, float atZ, int timeMS) |

Particle particle = [createFxSystemOnChar](https://wiki.blast.hk/moonloader/lua/createFxSystemOnChar)(string particle, Ped ped, float offsetX, float offsetY, float offsetZ, int type) |

Particle particle = [createFxSystemOnCharWithDirection](https://wiki.blast.hk/moonloader/lua/createFxSystemOnCharWithDirection)(string particle, Ped ped, float offsetX, float offsetY, float offsetZ, float rotationX, float rotationY, float rotationZ, int type) |

Particle particle = [createFxSystemOnCar](https://wiki.blast.hk/moonloader/lua/createFxSystemOnCar)(string particle, Vehicle car, float offsetX, float offsetY, float offsetZ, int type) |

Particle particle = [createFxSystemOnCarWithDirection](https://wiki.blast.hk/moonloader/lua/createFxSystemOnCarWithDirection)(string particle, Vehicle car, float offsetX, float offsetY, float offsetZ, float rotationX, float rotationY, float rotationZ, int type) |

Particle particle = [createFxSystemOnObject](https://wiki.blast.hk/moonloader/lua/createFxSystemOnObject)(string particle, Object object, float offsetX, float offsetY, float offsetZ, int type) |

Particle particle = [createFxSystemOnObjectWithDirection](https://wiki.blast.hk/moonloader/lua/createFxSystemOnObjectWithDirection)(string particle, Object object, float offsetX, float offsetY, float offsetZ, float rotationX, float rotationY, float rotationZ, int flag) |

[taskDestroyCar](https://wiki.blast.hk/moonloader/lua/taskDestroyCar)(Ped ped, Vehicle car) |

[taskDiveAndGetUp](https://wiki.blast.hk/moonloader/lua/taskDiveAndGetUp)(Ped ped, float toOffsetX, float toOffsetY, int time) |

[customPlateForNextCar](https://wiki.blast.hk/moonloader/lua/customPlateForNextCar)(Model modelId, string numberplate) |

[taskShuffleToNextCarSeat](https://wiki.blast.hk/moonloader/lua/taskShuffleToNextCarSeat)(Ped ped, Vehicle car) |

[taskChatWithChar](https://wiki.blast.hk/moonloader/lua/taskChatWithChar)(Ped ped, int withActor, bool flag, int unknownFlag) |

[attachCameraToVehicle](https://wiki.blast.hk/moonloader/lua/attachCameraToVehicle)(Vehicle car, float offsetX, float offsetY, float offsetZ, float rotationX, float rotationY, float rotationZ, float tilt, int switchstyle) |

[attachCameraToVehicleLookAtVehicle](https://wiki.blast.hk/moonloader/lua/attachCameraToVehicleLookAtVehicle)(Vehicle car, float offsetX, float offsetY, float offsetZ, int toCar, float tilt, int switchstyle) |

[attachCameraToVehicleLookAtChar](https://wiki.blast.hk/moonloader/lua/attachCameraToVehicleLookAtChar)(Vehicle car, float offsetX, float offsetY, float offsetZ, Ped ped, float tilt, int switchstyle) |

[attachCameraToChar](https://wiki.blast.hk/moonloader/lua/attachCameraToChar)(Ped ped, float offsetX, float offsetY, float offsetZ, float rotationX, float rotationY, float rotationZ, float tilt, int switchstyle) |

[attachCameraToCharLookAtChar](https://wiki.blast.hk/moonloader/lua/attachCameraToCharLookAtChar)(Ped ped, float offsetX, float offsetY, float offsetZ, int targetActor, float tilt, int switchstyle) |

[forceCarLights](https://wiki.blast.hk/moonloader/lua/forceCarLights)(Vehicle car, int lights) |

[addPedtypeAsAttractorUser](https://wiki.blast.hk/moonloader/lua/addPedtypeAsAttractorUser)(int ASOrigin, int pedtype) |

[attachObjectToCar](https://wiki.blast.hk/moonloader/lua/attachObjectToCar)(Object object, Vehicle car, float offsetX, float offsetY, float offsetZ, float rotationX, float rotationY, float rotationZ) |

[detachObject](https://wiki.blast.hk/moonloader/lua/detachObject)(Object object, float X, float Y, float Z, bool collisionDetection) |

[attachCarToCar](https://wiki.blast.hk/moonloader/lua/attachCarToCar)(Vehicle car, int toCar, float offsetX, float offsetY, float offsetZ, float rotationX, float rotationY, float rotationZ) |

[detachCar](https://wiki.blast.hk/moonloader/lua/detachCar)(Vehicle car, float X, float Y, float Z, bool collisionDetection) |

bool result = [isObjectAttached](https://wiki.blast.hk/moonloader/lua/isObjectAttached)(Object object) |

bool result = [isVehicleAttached](https://wiki.blast.hk/moonloader/lua/isVehicleAttached)(Vehicle car) |

[clearCharTasks](https://wiki.blast.hk/moonloader/lua/clearCharTasks)(Ped ped) |

[taskTogglePedThreatScanner](https://wiki.blast.hk/moonloader/lua/taskTogglePedThreatScanner)(Ped ped, bool unknownFlag1, bool unknownFlag2, bool unknownFlag3) |

[popCarDoor](https://wiki.blast.hk/moonloader/lua/popCarDoor)(Vehicle car, int door, bool visible) |

[fixCarDoor](https://wiki.blast.hk/moonloader/lua/fixCarDoor)(Vehicle car, int door) |

[taskEveryoneLeaveCar](https://wiki.blast.hk/moonloader/lua/taskEveryoneLeaveCar)(Vehicle car) |

bool result = [isPlayerTargettingAnything](https://wiki.blast.hk/moonloader/lua/isPlayerTargettingAnything)(Player player) |

float X, float Y, float Z = [getActiveCameraCoordinates](https://wiki.blast.hk/moonloader/lua/getActiveCameraCoordinates)() |

float X, float Y, float Z = [getActiveCameraPointAt](https://wiki.blast.hk/moonloader/lua/getActiveCameraPointAt)() |

[popCarPanel](https://wiki.blast.hk/moonloader/lua/popCarPanel)(Vehicle car, int component, bool effectFlag) |

[fixCarPanel](https://wiki.blast.hk/moonloader/lua/fixCarPanel)(Vehicle car, int componentB) |

[fixCarTire](https://wiki.blast.hk/moonloader/lua/fixCarTire)(Vehicle car, int tire) |

[attachObjectToObject](https://wiki.blast.hk/moonloader/lua/attachObjectToObject)(Object object, int toObject, float offsetX, float offsetY, float offsetZ, float rotationX, float rotationY, float rotationZ) |

[attachObjectToChar](https://wiki.blast.hk/moonloader/lua/attachObjectToChar)(Object object, Ped ped, float offsetX, float offsetY, float offsetZ, float rotationX, float rotationY, float rotationZ) |

float vecX, float vecY, float vecZ = [getCarSpeedVector](https://wiki.blast.hk/moonloader/lua/getCarSpeedVector)(Vehicle car) |

float mass = [getCarMass](https://wiki.blast.hk/moonloader/lua/getCarMass)(Vehicle car) |

[taskDiveFromAttachmentAndGetUp](https://wiki.blast.hk/moonloader/lua/taskDiveFromAttachmentAndGetUp)(Ped ped, int timeMS) |

[attachCharToBike](https://wiki.blast.hk/moonloader/lua/attachCharToBike)(Ped ped, Vehicle car, float offsetX, float offsetY, float offsetZ, int position, float shootingAngle1, float shootingAngle2, int weapon) |

[taskGotoCharOffset](https://wiki.blast.hk/moonloader/lua/taskGotoCharOffset)(Ped ped, int toActor, int timelimit, float approachDistance, float approachAngle) |

[taskLookAtCoord](https://wiki.blast.hk/moonloader/lua/taskLookAtCoord)(Ped ped, float toX, float toY, float toZ, int timeMS) |

[hideCharWeaponForScriptedCutscene](https://wiki.blast.hk/moonloader/lua/hideCharWeaponForScriptedCutscene)(Ped ped, bool hide) |

float speed = [getCharSpeed](https://wiki.blast.hk/moonloader/lua/getCharSpeed)(Ped ped) |

[setGroupDecisionMaker](https://wiki.blast.hk/moonloader/lua/setGroupDecisionMaker)(int group, int maker) |

int maker = [loadGroupDecisionMaker](https://wiki.blast.hk/moonloader/lua/loadGroupDecisionMaker)(int type) |

[disablePlayerSprint](https://wiki.blast.hk/moonloader/lua/disablePlayerSprint)(Player player, bool mode) |

[taskSitDown](https://wiki.blast.hk/moonloader/lua/taskSitDown)(Ped ped, int timeMS) |

Searchlight searchlight = [createSearchlight](https://wiki.blast.hk/moonloader/lua/createSearchlight)(float atX, float atY, float atZ, float targetX, float targetY, float targetZ, float radius1, float radius2) |

[deleteSearchlight](https://wiki.blast.hk/moonloader/lua/deleteSearchlight)(Searchlight searchlight) |

bool result = [doesSearchlightExist](https://wiki.blast.hk/moonloader/lua/doesSearchlightExist)(Searchlight searchlight) |

[moveSearchlightBetweenCoords](https://wiki.blast.hk/moonloader/lua/moveSearchlightBetweenCoords)(Searchlight searchlight, float fromX, float fromY, float fromZ, float toX, float toY, float toZ, float speed) |

[pointSearchlightAtCoord](https://wiki.blast.hk/moonloader/lua/pointSearchlightAtCoord)(Searchlight searchlight, float toX, float toY, float toZ, float speed) |

[pointSearchlightAtChar](https://wiki.blast.hk/moonloader/lua/pointSearchlightAtChar)(Searchlight searchlight, Ped ped, float speed) |

bool result = [isCharInSearchlight](https://wiki.blast.hk/moonloader/lua/isCharInSearchlight)(Searchlight searchlight, Ped ped) |

bool result = [hasCutsceneLoaded](https://wiki.blast.hk/moonloader/lua/hasCutsceneLoaded)() |

[taskTurnCharToFaceCoord](https://wiki.blast.hk/moonloader/lua/taskTurnCharToFaceCoord)(Ped ped, float atX, float atY, float atZ) |

[taskDrivePointRoute](https://wiki.blast.hk/moonloader/lua/taskDrivePointRoute)(Ped ped, Vehicle car, float speed) |

[fireSingleBullet](https://wiki.blast.hk/moonloader/lua/fireSingleBullet)(float fromX, float fromY, float fromZ, float targetX, float targetY, float targetZ, int energy) |

bool result = [isLineOfSightClear](https://wiki.blast.hk/moonloader/lua/isLineOfSightClear)(float fromX, float fromY, float fromZ, float toX, float toY, float toZ, bool checkBuildings, bool checkVehicles, bool checkActors, bool checkObjects, bool checkParticles) |

float roll = [getCarRoll](https://wiki.blast.hk/moonloader/lua/getCarRoll)(Vehicle car) |

[pointSearchlightAtVehicle](https://wiki.blast.hk/moonloader/lua/pointSearchlightAtVehicle)(Searchlight searchlight, Vehicle car, float speed) |

bool result = [isVehicleInSearchlight](https://wiki.blast.hk/moonloader/lua/isVehicleInSearchlight)(int int, Vehicle car) |

Searchlight searchlight = [createSearchlightOnVehicle](https://wiki.blast.hk/moonloader/lua/createSearchlightOnVehicle)(Vehicle car, float offsetX, float offsetY, float offsetZ, float targetX, float targetY, float targetZ, float radius, float radius) |

[taskGoToCoordWhileAiming](https://wiki.blast.hk/moonloader/lua/taskGoToCoordWhileAiming)(Ped ped, float toX, float toY, float toZ, int mode, float turnRadius, float stopRadius, Ped ped, float offsetX, float offsetY, float offsetZ) |

int num = [getNumberOfFiresInRange](https://wiki.blast.hk/moonloader/lua/getNumberOfFiresInRange)(float atX, float atY, float atZ, float radius) |

Marker marker = [addBlipForSearchlight](https://wiki.blast.hk/moonloader/lua/addBlipForSearchlight)(Searchlight searchlight) |

[skipToEndAndStopPlaybackRecordedCar](https://wiki.blast.hk/moonloader/lua/skipToEndAndStopPlaybackRecordedCar)(Vehicle car) |

[taskCarTempAction](https://wiki.blast.hk/moonloader/lua/taskCarTempAction)(Ped ped, Vehicle car, int performAction, int timelimit) |

[setLaRiots](https://wiki.blast.hk/moonloader/lua/setLaRiots)(bool enable) |

[removeCharFromGroup](https://wiki.blast.hk/moonloader/lua/removeCharFromGroup)(Ped ped) |

[attachSearchlightToSearchlightObject](https://wiki.blast.hk/moonloader/lua/attachSearchlightToSearchlightObject)(Searchlight searchlight, int tower, int housing, int bulb, float offsetX, float offsetY, float offsetZ) |

[switchEmergencyServices](https://wiki.blast.hk/moonloader/lua/switchEmergencyServices)(bool enable) |

Checkpoint checkpoint = [createCheckpoint](https://wiki.blast.hk/moonloader/lua/createCheckpoint)(int type, float atX, float atY, float atZ, float pointX, float pointY, float pointZ, float radius) |

[deleteCheckpoint](https://wiki.blast.hk/moonloader/lua/deleteCheckpoint)(Checkpoint checkpoint) |

[switchRandomTrains](https://wiki.blast.hk/moonloader/lua/switchRandomTrains)(bool enable) |

Vehicle train = [createMissionTrain](https://wiki.blast.hk/moonloader/lua/createMissionTrain)(int type, float atX, float atY, float atZ, bool direction) |

[deleteMissionTrains](https://wiki.blast.hk/moonloader/lua/deleteMissionTrains)() |

[markMissionTrainsAsNoLongerNeeded](https://wiki.blast.hk/moonloader/lua/markMissionTrainsAsNoLongerNeeded)() |

[deleteAllTrains](https://wiki.blast.hk/moonloader/lua/deleteAllTrains)() |

[setTrainSpeed](https://wiki.blast.hk/moonloader/lua/setTrainSpeed)(Vehicle train, float speed) |

[setTrainCruiseSpeed](https://wiki.blast.hk/moonloader/lua/setTrainCruiseSpeed)(Vehicle train, float speed) |

int caboose = [getTrainCaboose](https://wiki.blast.hk/moonloader/lua/getTrainCaboose)(Vehicle train) |

[deletePlayer](https://wiki.blast.hk/moonloader/lua/deletePlayer)(Player player) |

[setTwoPlayerCameraMode](https://wiki.blast.hk/moonloader/lua/setTwoPlayerCameraMode)(bool mode) |

[taskCarMission](https://wiki.blast.hk/moonloader/lua/taskCarMission)(Ped ped, Vehicle car, int targetCar, int order, float maxSpeed, int trafficFlag) |

[taskGoToObject](https://wiki.blast.hk/moonloader/lua/taskGoToObject)(Ped ped, int toObject, int timelimit, float stopWithinRadius) |

[taskWeaponRoll](https://wiki.blast.hk/moonloader/lua/taskWeaponRoll)(Ped ped, bool roll) |

[taskCharArrestChar](https://wiki.blast.hk/moonloader/lua/taskCharArrestChar)(Ped ped, int bustActor) |

Model itemID = [getAvailableVehicleMod](https://wiki.blast.hk/moonloader/lua/getAvailableVehicleMod)(Vehicle car, int poolIndex) |

int type = [getVehicleModType](https://wiki.blast.hk/moonloader/lua/getVehicleModType)(Model component) |

int componentId = [addVehicleMod](https://wiki.blast.hk/moonloader/lua/addVehicleMod)(Vehicle car, Model component) |

[removeVehicleMod](https://wiki.blast.hk/moonloader/lua/removeVehicleMod)(Vehicle car, int componentId) |

[requestVehicleMod](https://wiki.blast.hk/moonloader/lua/requestVehicleMod)(Model component) |

bool result = [hasVehicleModLoaded](https://wiki.blast.hk/moonloader/lua/hasVehicleModLoaded)(Model component) |

[markVehicleModAsNoLongerNeeded](https://wiki.blast.hk/moonloader/lua/markVehicleModAsNoLongerNeeded)(Model component) |

int num = [getNumAvailablePaintjobs](https://wiki.blast.hk/moonloader/lua/getNumAvailablePaintjobs)(Vehicle car) |

[giveVehiclePaintjob](https://wiki.blast.hk/moonloader/lua/giveVehiclePaintjob)(int set, int paintjob) |

bool result = [isGroupMember](https://wiki.blast.hk/moonloader/lua/isGroupMember)(Ped ped, int group) |

bool result = [isGroupLeader](https://wiki.blast.hk/moonloader/lua/isGroupLeader)(Ped ped, int group) |

[setGroupSeparationRange](https://wiki.blast.hk/moonloader/lua/setGroupSeparationRange)(int group, float range) |

[limitTwoPlayerDistance](https://wiki.blast.hk/moonloader/lua/limitTwoPlayerDistance)(float distance) |

[releaseTwoPlayerDistance](https://wiki.blast.hk/moonloader/lua/releaseTwoPlayerDistance)() |

[setPlayerPlayerTargetting](https://wiki.blast.hk/moonloader/lua/setPlayerPlayerTargetting)(bool can) |

float X, float Y, float Z = [getScriptFireCoords](https://wiki.blast.hk/moonloader/lua/getScriptFireCoords)(int fire) |

float X, float Y, float Z, float ZAngle = [getNthClosestCarNodeWithHeading](https://wiki.blast.hk/moonloader/lua/getNthClosestCarNodeWithHeading)(float forX, float forY, float forZ, int direction) |

[setPlayersCanBeInSeparateCars](https://wiki.blast.hk/moonloader/lua/setPlayersCanBeInSeparateCars)(bool allow) |

bool result = [doesCarHaveStuckCarCheck](https://wiki.blast.hk/moonloader/lua/doesCarHaveStuckCarCheck)(Vehicle car) |

[setPlaybackSpeed](https://wiki.blast.hk/moonloader/lua/setPlaybackSpeed)(Vehicle car, float speed) |

bool result = [areAnyCharsNearChar](https://wiki.blast.hk/moonloader/lua/areAnyCharsNearChar)(Ped ped, float range) |

[skipCutsceneEnd](https://wiki.blast.hk/moonloader/lua/skipCutsceneEnd)() |

int percentage = [getPercentageTaggedInArea](https://wiki.blast.hk/moonloader/lua/getPercentageTaggedInArea)(float x1, float y1, float x2, float y2) |

[setTagStatusInArea](https://wiki.blast.hk/moonloader/lua/setTagStatusInArea)(float x1, float y1, float x2, float y2, bool value) |

[carGotoCoordinatesRacing](https://wiki.blast.hk/moonloader/lua/carGotoCoordinatesRacing)(Vehicle car, float toX, float toY, float toZ) |

[startPlaybackRecordedCarUsingAi](https://wiki.blast.hk/moonloader/lua/startPlaybackRecordedCarUsingAi)(Vehicle car, int path) |

[skipInPlaybackRecordedCar](https://wiki.blast.hk/moonloader/lua/skipInPlaybackRecordedCar)(Vehicle car, float path) |

[clearCharDecisionMakerEventResponse](https://wiki.blast.hk/moonloader/lua/clearCharDecisionMakerEventResponse)(int maker, int event) |

[addCharDecisionMakerEventResponse](https://wiki.blast.hk/moonloader/lua/addCharDecisionMakerEventResponse)(int maker, int event, int taskID, float respect, float hate, float like, float dislike, bool inCar, bool onFoot) |

[taskPickUpObject](https://wiki.blast.hk/moonloader/lua/taskPickUpObject)(Ped ped, Object object, float offsetX, float offsetY, float offsetZ, int boneId1, int boneId2, string performAnimation, int IFPFile, int time) |

[dropObject](https://wiki.blast.hk/moonloader/lua/dropObject)(Ped ped, bool object) |

[explodeCarInCutscene](https://wiki.blast.hk/moonloader/lua/explodeCarInCutscene)(Vehicle car) |

[buildPlayerModel](https://wiki.blast.hk/moonloader/lua/buildPlayerModel)(Player player) |

[planeAttackPlayer](https://wiki.blast.hk/moonloader/lua/planeAttackPlayer)(int hydra, Vehicle car, float radius) |

[planeFlyInDirection](https://wiki.blast.hk/moonloader/lua/planeFlyInDirection)(int plane, float direction, float altitudemin, float altitudemax) |

[planeFollowEntity](https://wiki.blast.hk/moonloader/lua/planeFollowEntity)(int plane, Ped ped, Vehicle car, float radius) |

[taskDriveBy](https://wiki.blast.hk/moonloader/lua/taskDriveBy)(Ped ped, int drivebyActor, Vehicle car, float pX, float pY, float pZ, float radiusX, int radiusY, bool radiusZ, int firingRate) |

[setCarStayInSlowLane](https://wiki.blast.hk/moonloader/lua/setCarStayInSlowLane)(Vehicle car, bool stay) |

[takeRemoteControlOfCar](https://wiki.blast.hk/moonloader/lua/takeRemoteControlOfCar)(Player player, Vehicle car) |

bool result = [isClosestObjectOfTypeSmashedOrDamaged](https://wiki.blast.hk/moonloader/lua/isClosestObjectOfTypeSmashedOrDamaged)(Model object, float atX, float atY, float atZ, float radius, bool smashed, bool damaged) |

[startSettingUpConversation](https://wiki.blast.hk/moonloader/lua/startSettingUpConversation)(Ped ped) |

[finishSettingUpConversation](https://wiki.blast.hk/moonloader/lua/finishSettingUpConversation)() |

bool result = [isConversationAtNode](https://wiki.blast.hk/moonloader/lua/isConversationAtNode)(Ped ped, GxtString gxtString) |

int health = [getObjectHealth](https://wiki.blast.hk/moonloader/lua/getObjectHealth)(Object object) |

[setObjectHealth](https://wiki.blast.hk/moonloader/lua/setObjectHealth)(Object object, int health) |

[breakObject](https://wiki.blast.hk/moonloader/lua/breakObject)(Object object, int intensity) |

[heliAttackPlayer](https://wiki.blast.hk/moonloader/lua/heliAttackPlayer)(Vehicle heli, Player player, float radius) |

[heliFollowEntity](https://wiki.blast.hk/moonloader/lua/heliFollowEntity)(Vehicle heli, Ped ped, Vehicle car, float radius) |

[policeHeliChaseEntity](https://wiki.blast.hk/moonloader/lua/policeHeliChaseEntity)(Vehicle heli, Ped ped, Vehicle car, float radius) |

[taskUseMobilePhone](https://wiki.blast.hk/moonloader/lua/taskUseMobilePhone)(Ped ped, bool hold) |

[taskWarpCharIntoCarAsDriver](https://wiki.blast.hk/moonloader/lua/taskWarpCharIntoCarAsDriver)(Ped ped, Vehicle car) |

[taskWarpCharIntoCarAsPassenger](https://wiki.blast.hk/moonloader/lua/taskWarpCharIntoCarAsPassenger)(Ped ped, Vehicle car, int passengerseat) |

[switchCopsOnBikes](https://wiki.blast.hk/moonloader/lua/switchCopsOnBikes)(bool generate) |

bool result = [isFlameInAngledArea2d](https://wiki.blast.hk/moonloader/lua/isFlameInAngledArea2d)(float x1, float y1, float x2, float y2, float angle, bool sphere) |

bool result = [isFlameInAngledArea3d](https://wiki.blast.hk/moonloader/lua/isFlameInAngledArea3d)(float x1, float y1, float z1, float x2, float y2, float z2, float angle, bool sphere) |

[addStuckCarCheckWithWarp](https://wiki.blast.hk/moonloader/lua/addStuckCarCheckWithWarp)(Vehicle car, float checkDistance, int time, bool stuck, bool flipped, bool warp, int path) |

[damageCarPanel](https://wiki.blast.hk/moonloader/lua/damageCarPanel)(Vehicle car, int door) |

[setCarRoll](https://wiki.blast.hk/moonloader/lua/setCarRoll)(Vehicle car, float roll) |

bool result = [suppressCarModel](https://wiki.blast.hk/moonloader/lua/suppressCarModel)(Model modelId) |

[dontSuppressCarModel](https://wiki.blast.hk/moonloader/lua/dontSuppressCarModel)(Model modelId) |

[dontSuppressAnyCarModels](https://wiki.blast.hk/moonloader/lua/dontSuppressAnyCarModels)() |

bool result = [isPs2KeyboardKeyPressed](https://wiki.blast.hk/moonloader/lua/isPs2KeyboardKeyPressed)(int key) |

bool result = [isPs2KeyboardKeyJustPressed](https://wiki.blast.hk/moonloader/lua/isPs2KeyboardKeyJustPressed)(int key) |

bool result = [isCharHoldingObject](https://wiki.blast.hk/moonloader/lua/isCharHoldingObject)(Ped ped, int liftingObject) |

[setCarCanGoAgainstTraffic](https://wiki.blast.hk/moonloader/lua/setCarCanGoAgainstTraffic)(Vehicle car, bool can) |

[damageCarDoor](https://wiki.blast.hk/moonloader/lua/damageCarDoor)(Vehicle car, int door) |

Vehicle car = [getRandomCarInSphereNoSave](https://wiki.blast.hk/moonloader/lua/getRandomCarInSphereNoSave)(float X, float Y, float Z, float radius, int model) |

Ped ped = [getRandomCharInSphere](https://wiki.blast.hk/moonloader/lua/getRandomCharInSphere)(float X, float Y, float Z, float radius, bool pedtypeCivilian, bool gang, bool prostitute) |

bool result = [hasCharBeenArrested](https://wiki.blast.hk/moonloader/lua/hasCharBeenArrested)(Ped ped) |

[setPlaneThrottle](https://wiki.blast.hk/moonloader/lua/setPlaneThrottle)(int plane, float throttle) |

[heliLandAtCoords](https://wiki.blast.hk/moonloader/lua/heliLandAtCoords)(Vehicle heli, float X, float Y, float Z, float minaltitude, float maxaltitude) |

[planeStartsInAir](https://wiki.blast.hk/moonloader/lua/planeStartsInAir)(int hydra) |

[setRelationship](https://wiki.blast.hk/moonloader/lua/setRelationship)(int acquaintance, int pedtype, int toPedtype) |

[clearRelationship](https://wiki.blast.hk/moonloader/lua/clearRelationship)(int acquaintance, int pedtype, int toPedtype) |

[clearGroupDecisionMakerEventResponse](https://wiki.blast.hk/moonloader/lua/clearGroupDecisionMakerEventResponse)(int maker, int event) |

[addGroupDecisionMakerEventResponse](https://wiki.blast.hk/moonloader/lua/addGroupDecisionMakerEventResponse)(int maker, int event, int taskID, float respect, float hate, float like, float dislike, bool inCar, bool onFoot) |

[drawSpriteWithRotation](https://wiki.blast.hk/moonloader/lua/drawSpriteWithRotation)(int texture, float x, float y, float scaleX, float scaleY, float angle, int r, int g, int b, int a) |

[taskUseAttractor](https://wiki.blast.hk/moonloader/lua/taskUseAttractor)(Ped ped, int attractor) |

[taskShootAtChar](https://wiki.blast.hk/moonloader/lua/taskShootAtChar)(Ped ped, int atActor, int timelimit) |

[setInformRespectedFriends](https://wiki.blast.hk/moonloader/lua/setInformRespectedFriends)(int flags, float radius, int pedsToScan) |

bool result = [isCharRespondingToEvent](https://wiki.blast.hk/moonloader/lua/isCharRespondingToEvent)(Ped ped, int event) |

[setObjectVisible](https://wiki.blast.hk/moonloader/lua/setObjectVisible)(Object object, bool visibility) |

[taskFleeCharAnyMeans](https://wiki.blast.hk/moonloader/lua/taskFleeCharAnyMeans)(Ped ped, int fleeFrom, float runDistance, int time, bool changeCourse, int unkTime1, int unkTime2, float awayRadius) |

[flushPatrolRoute](https://wiki.blast.hk/moonloader/lua/flushPatrolRoute)() |

[extendPatrolRoute](https://wiki.blast.hk/moonloader/lua/extendPatrolRoute)(float X, float Y, float Z, string animation, string IFPFile) |

bool result = [playObjectAnim](https://wiki.blast.hk/moonloader/lua/playObjectAnim)(Object object, string animation, string IFPFile, float framedelta, bool lockF, bool loop) |

[setRadarZoom](https://wiki.blast.hk/moonloader/lua/setRadarZoom)(int zoom) |

bool result = [doesBlipExist](https://wiki.blast.hk/moonloader/lua/doesBlipExist)(Marker marker) |

[loadPrices](https://wiki.blast.hk/moonloader/lua/loadPrices)(GxtString shopping) |

[loadShop](https://wiki.blast.hk/moonloader/lua/loadShop)(GxtString shopping) |

int num = [getNumberOfItemsInShop](https://wiki.blast.hk/moonloader/lua/getNumberOfItemsInShop)() |

int item = [getItemInShop](https://wiki.blast.hk/moonloader/lua/getItemInShop)(int index) |

int price = [getPriceOfItem](https://wiki.blast.hk/moonloader/lua/getPriceOfItem)(int item) |

[taskDead](https://wiki.blast.hk/moonloader/lua/taskDead)(Ped ped) |

[setCarAsMissionCar](https://wiki.blast.hk/moonloader/lua/setCarAsMissionCar)(Vehicle car) |

[setZonePopulationType](https://wiki.blast.hk/moonloader/lua/setZonePopulationType)(GxtString zone, int popcycle) |

[setZoneDealerStrength](https://wiki.blast.hk/moonloader/lua/setZoneDealerStrength)(GxtString zone, int density) |

int strength = [getZoneDealerStrength](https://wiki.blast.hk/moonloader/lua/getZoneDealerStrength)(GxtString zone) |

[setZoneGangStrength](https://wiki.blast.hk/moonloader/lua/setZoneGangStrength)(GxtString zone, int gang, int density) |

int density = [getZoneGangStrength](https://wiki.blast.hk/moonloader/lua/getZoneGangStrength)(GxtString zone, int gang) |

bool result = [isMessageBeingDisplayed](https://wiki.blast.hk/moonloader/lua/isMessageBeingDisplayed)() |

[setCharIsTargetPriority](https://wiki.blast.hk/moonloader/lua/setCharIsTargetPriority)(Ped ped, bool targetPriority) |

[customPlateDesignForNextCar](https://wiki.blast.hk/moonloader/lua/customPlateDesignForNextCar)(Model modelNumplate, int townTexture) |

[taskGotoCar](https://wiki.blast.hk/moonloader/lua/taskGotoCar)(Ped ped, Vehicle car, int timeMS, float stopAtDistance) |

[requestIpl](https://wiki.blast.hk/moonloader/lua/requestIpl)(string group) |

[removeIpl](https://wiki.blast.hk/moonloader/lua/removeIpl)(string group) |

[removeIplDiscreetly](https://wiki.blast.hk/moonloader/lua/removeIplDiscreetly)(string group) |

[setCharRelationship](https://wiki.blast.hk/moonloader/lua/setCharRelationship)(Ped ped, int acquaintance, int pedtype) |

[clearCharRelationship](https://wiki.blast.hk/moonloader/lua/clearCharRelationship)(Ped ped, int acquaintance, int pedtype) |

[clearAllCharRelationships](https://wiki.blast.hk/moonloader/lua/clearAllCharRelationships)(Ped ped, int acquaintance) |

float pitch = [getCarPitch](https://wiki.blast.hk/moonloader/lua/getCarPitch)(Vehicle car) |

int interior = [getActiveInterior](https://wiki.blast.hk/moonloader/lua/getActiveInterior)() |

[heliKeepEntityInView](https://wiki.blast.hk/moonloader/lua/heliKeepEntityInView)(Vehicle heli, Ped ped, Vehicle car, float minaltitude, float maxaltitude) |

int model = [getWeapontypeModel](https://wiki.blast.hk/moonloader/lua/getWeapontypeModel)(int id) |

int slot = [getWeapontypeSlot](https://wiki.blast.hk/moonloader/lua/getWeapontypeSlot)(int id) |

int info = [getShoppingExtraInfo](https://wiki.blast.hk/moonloader/lua/getShoppingExtraInfo)(int item, int flag) |

[givePlayerClothes](https://wiki.blast.hk/moonloader/lua/givePlayerClothes)(Player player, int texture, int model, int bodypart) |

int num = [getNumberOfFiresInArea](https://wiki.blast.hk/moonloader/lua/getNumberOfFiresInArea)(float x1, float y1, float z1, float x2, float y2, float z2) |

[attachWinchToHeli](https://wiki.blast.hk/moonloader/lua/attachWinchToHeli)(Vehicle heli, bool magnet) |

[releaseEntityFromWinch](https://wiki.blast.hk/moonloader/lua/releaseEntityFromWinch)(Vehicle heli) |

int carriage = [getTrainCarriage](https://wiki.blast.hk/moonloader/lua/getTrainCarriage)(Vehicle train, int handle) |

Vehicle carHandle, Ped pedHandle, Object objectHandle = [grabEntityOnWinch](https://wiki.blast.hk/moonloader/lua/grabEntityOnWinch)(Vehicle heli) |

GxtString name = [getNameOfItem](https://wiki.blast.hk/moonloader/lua/getNameOfItem)(int item) |

[taskClimb](https://wiki.blast.hk/moonloader/lua/taskClimb)(Ped ped, bool climb) |

[buyItem](https://wiki.blast.hk/moonloader/lua/buyItem)(int item) |

[clearCharTasksImmediately](https://wiki.blast.hk/moonloader/lua/clearCharTasksImmediately)(Ped ped) |

[storeClothesState](https://wiki.blast.hk/moonloader/lua/storeClothesState)() |

[restoreClothesState](https://wiki.blast.hk/moonloader/lua/restoreClothesState)() |

float length = [getRopeHeightForObject](https://wiki.blast.hk/moonloader/lua/getRopeHeightForObject)(int magnet) |

[setRopeHeightForObject](https://wiki.blast.hk/moonloader/lua/setRopeHeightForObject)(int magnet, float length) |

Vehicle carHandle, Ped pedHandle, Object objectHandle = [grabEntityOnRopeForObject](https://wiki.blast.hk/moonloader/lua/grabEntityOnRopeForObject)(int magnet) |

[releaseEntityFromRopeForObject](https://wiki.blast.hk/moonloader/lua/releaseEntityFromRopeForObject)(int magnet) |

[playerEnteredDockCrane](https://wiki.blast.hk/moonloader/lua/playerEnteredDockCrane)() |

[playerEnteredBuildingsiteCrane](https://wiki.blast.hk/moonloader/lua/playerEnteredBuildingsiteCrane)() |

[playerLeftCrane](https://wiki.blast.hk/moonloader/lua/playerLeftCrane)() |

[performSequenceTaskFromProgress](https://wiki.blast.hk/moonloader/lua/performSequenceTaskFromProgress)(Ped ped, int sequence, int unkProgress1, int unkProgress2) |

[setNextDesiredMoveState](https://wiki.blast.hk/moonloader/lua/setNextDesiredMoveState)(int speed) |

[taskGotoCharAiming](https://wiki.blast.hk/moonloader/lua/taskGotoCharAiming)(Ped ped, int followActor, float minradius, float maxradius) |

int unkProgress1, int unkProgress2 = [getSequenceProgressRecursive](https://wiki.blast.hk/moonloader/lua/getSequenceProgressRecursive)(Ped ped) |

[taskKillCharOnFootTimed](https://wiki.blast.hk/moonloader/lua/taskKillCharOnFootTimed)(Ped ped, int attackActor, int time) |

float X, float Y, float Z = [getNearestTagPosition](https://wiki.blast.hk/moonloader/lua/getNearestTagPosition)(float X, float Y, float Z) |

[taskJetpack](https://wiki.blast.hk/moonloader/lua/taskJetpack)(Ped ped) |

[setArea51SamSite](https://wiki.blast.hk/moonloader/lua/setArea51SamSite)(bool enable) |

bool result, Searchlight searchlight = [isCharInAnySearchlight](https://wiki.blast.hk/moonloader/lua/isCharInAnySearchlight)(Ped ped) |

bool result = [isTrailerAttachedToCab](https://wiki.blast.hk/moonloader/lua/isTrailerAttachedToCab)(Vehicle trailer, Vehicle car) |

[detachTrailerFromCab](https://wiki.blast.hk/moonloader/lua/detachTrailerFromCab)(Vehicle trailer, Vehicle cab) |

int group = [getPlayerGroup](https://wiki.blast.hk/moonloader/lua/getPlayerGroup)(Player player) |

GxtString shop = [getLoadedShop](https://wiki.blast.hk/moonloader/lua/getLoadedShop)() |

int int2, int int3, int int4 = [getBeatProximity](https://wiki.blast.hk/moonloader/lua/getBeatProximity)(int track) |

[setGroupDefaultTaskAllocator](https://wiki.blast.hk/moonloader/lua/setGroupDefaultTaskAllocator)(int group, int command) |

[setPlayerGroupRecruitment](https://wiki.blast.hk/moonloader/lua/setPlayerGroupRecruitment)(Player player, bool enabled) |

[activateHeliSpeedCheat](https://wiki.blast.hk/moonloader/lua/activateHeliSpeedCheat)(Vehicle heli, int power) |

[taskSetCharDecisionMaker](https://wiki.blast.hk/moonloader/lua/taskSetCharDecisionMaker)(Ped ped, int maker) |

[deleteMissionTrain](https://wiki.blast.hk/moonloader/lua/deleteMissionTrain)(Vehicle train) |

[markMissionTrainAsNoLongerNeeded](https://wiki.blast.hk/moonloader/lua/markMissionTrainAsNoLongerNeeded)(Vehicle train) |

[setBlipAlwaysDisplayOnZoomedRadar](https://wiki.blast.hk/moonloader/lua/setBlipAlwaysDisplayOnZoomedRadar)(Marker marker, bool displayAlways) |

[requestCarRecording](https://wiki.blast.hk/moonloader/lua/requestCarRecording)(int path) |

bool result = [hasCarRecordingBeenLoaded](https://wiki.blast.hk/moonloader/lua/hasCarRecordingBeenLoaded)(int path) |

[setMissionTrainCoordinates](https://wiki.blast.hk/moonloader/lua/setMissionTrainCoordinates)(Vehicle train, float X, float Y, float Z) |

[taskComplexPickupObject](https://wiki.blast.hk/moonloader/lua/taskComplexPickupObject)(Ped ped, Object object) |

[listenToPlayerGroupCommands](https://wiki.blast.hk/moonloader/lua/listenToPlayerGroupCommands)(Ped ped, bool listen) |

[setPlayerEnterCarButton](https://wiki.blast.hk/moonloader/lua/setPlayerEnterCarButton)(Player player, bool can) |

[taskCharSlideToCoord](https://wiki.blast.hk/moonloader/lua/taskCharSlideToCoord)(Ped ped, float toX, float toY, float toZ, float angle, float withinRadius) |

int weekday = [getCurrentDayOfWeek](https://wiki.blast.hk/moonloader/lua/getCurrentDayOfWeek)() |

[registerScriptBrainForCodeUse](https://wiki.blast.hk/moonloader/lua/registerScriptBrainForCodeUse)(int id, GxtString gxtString) |

[applyForceToCar](https://wiki.blast.hk/moonloader/lua/applyForceToCar)(Vehicle car, float vecX, float vecY, float vecZ, float rotationX, float rotationY, float rotationZ) |

[addToCarRotationVelocity](https://wiki.blast.hk/moonloader/lua/addToCarRotationVelocity)(Vehicle car, float vecX, float vecY, float vecZ) |

[setCarRotationVelocity](https://wiki.blast.hk/moonloader/lua/setCarRotationVelocity)(Vehicle car, float vecX, float vecY, float vecZ) |

[setCharShootRate](https://wiki.blast.hk/moonloader/lua/setCharShootRate)(Ped ped, int rate) |

bool result = [isModelInCdimage](https://wiki.blast.hk/moonloader/lua/isModelInCdimage)(Model modelId) |

[removeOilPuddlesInArea](https://wiki.blast.hk/moonloader/lua/removeOilPuddlesInArea)(float x1, float y1, float x2, float y2) |

[setBlipAsFriendly](https://wiki.blast.hk/moonloader/lua/setBlipAsFriendly)(Marker marker, bool type) |

[taskSwimToCoord](https://wiki.blast.hk/moonloader/lua/taskSwimToCoord)(Ped ped, float toX, float toY, float toZ) |

float x1, float y1, float z1, float x2, float y2, float z2 = [getModelDimensions](https://wiki.blast.hk/moonloader/lua/getModelDimensions)(Model modelId) |

int maker = [copyCharDecisionMaker](https://wiki.blast.hk/moonloader/lua/copyCharDecisionMaker)(Ped ped) |

int maker = [copyGroupDecisionMaker](https://wiki.blast.hk/moonloader/lua/copyGroupDecisionMaker)(int group) |

[taskDrivePointRouteAdvanced](https://wiki.blast.hk/moonloader/lua/taskDrivePointRouteAdvanced)(Ped ped, Vehicle car, float speed, int flag1, int flag2, int flag3) |

bool result = [isRelationshipSet](https://wiki.blast.hk/moonloader/lua/isRelationshipSet)(int acquaintance, int ofActors, int toActors) |

[setCarAlwaysCreateSkids](https://wiki.blast.hk/moonloader/lua/setCarAlwaysCreateSkids)(Vehicle car, bool enable) |

int city = [getCityFromCoords](https://wiki.blast.hk/moonloader/lua/getCityFromCoords)(float X, float Y, float Z) |

bool result = [hasObjectOfTypeBeenSmashed](https://wiki.blast.hk/moonloader/lua/hasObjectOfTypeBeenSmashed)(float X, float Y, float Z, float radius, Model modelId) |

bool result = [isPlayerPerformingWheelie](https://wiki.blast.hk/moonloader/lua/isPlayerPerformingWheelie)(Player player) |

bool result = [isPlayerPerformingStoppie](https://wiki.blast.hk/moonloader/lua/isPlayerPerformingStoppie)(Player player) |

[setCheckpointCoords](https://wiki.blast.hk/moonloader/lua/setCheckpointCoords)(Checkpoint checkpoint, float X, float Y, float Z) |

[controlCarHydraulics](https://wiki.blast.hk/moonloader/lua/controlCarHydraulics)(Vehicle car, float f1, float f2, float f3, float f4) |

int numberOfLeaders, int numberOfMembers = [getGroupSize](https://wiki.blast.hk/moonloader/lua/getGroupSize)(int group) |

[setObjectCollisionDamageEffect](https://wiki.blast.hk/moonloader/lua/setObjectCollisionDamageEffect)(Object object, bool destructible) |

[setCarFollowCar](https://wiki.blast.hk/moonloader/lua/setCarFollowCar)(Vehicle car, int followCar, float radius) |

[playerEnteredQuarryCrane](https://wiki.blast.hk/moonloader/lua/playerEnteredQuarryCrane)() |

[playerEnteredLasVegasCrane](https://wiki.blast.hk/moonloader/lua/playerEnteredLasVegasCrane)() |

[switchEntryExit](https://wiki.blast.hk/moonloader/lua/switchEntryExit)(GxtString interior, bool access) |

[displayTextWithFloat](https://wiki.blast.hk/moonloader/lua/displayTextWithFloat)(float X, float Y, GxtString GXT, float value, int flag) |

bool result = [doesGroupExist](https://wiki.blast.hk/moonloader/lua/doesGroupExist)(int group) |

[giveMeleeAttackToChar](https://wiki.blast.hk/moonloader/lua/giveMeleeAttackToChar)(Ped ped, int fightingStyle, int moves) |

[setCarHydraulics](https://wiki.blast.hk/moonloader/lua/setCarHydraulics)(Vehicle car, bool hydraulics) |

bool result = [is2playerGameGoingOn](https://wiki.blast.hk/moonloader/lua/is2playerGameGoingOn)() |

float fov = [getCameraFov](https://wiki.blast.hk/moonloader/lua/getCameraFov)() |

bool result = [doesCarHaveHydraulics](https://wiki.blast.hk/moonloader/lua/doesCarHaveHydraulics)(Vehicle car) |

[taskCharSlideToCoordAndPlayAnim](https://wiki.blast.hk/moonloader/lua/taskCharSlideToCoordAndPlayAnim)(Ped ped, float toX, float toY, float toZ, float angle, float radius, string animation, int ifp1, float ifp2, bool LA, bool LX, bool LY, bool LF, int LT) |

int number = [getTotalNumberOfPedsKilledByPlayer](https://wiki.blast.hk/moonloader/lua/getTotalNumberOfPedsKilledByPlayer)(Player player) |

float X, float Y, float Z = [getLevelDesignCoordsForObject](https://wiki.blast.hk/moonloader/lua/getLevelDesignCoordsForObject)(Object object, int spoot) |

int event = [getCharHighestPriorityEvent](https://wiki.blast.hk/moonloader/lua/getCharHighestPriorityEvent)(Ped ped) |

float X, float Y, float Z = [getParkingNodeInArea](https://wiki.blast.hk/moonloader/lua/getParkingNodeInArea)(float x1, float y1, float z1, float x2, float y2, float z2) |

Vehicle car = [getCarCharIsUsing](https://wiki.blast.hk/moonloader/lua/getCarCharIsUsing)(Ped ped) |

[taskPlayAnimNonInterruptable](https://wiki.blast.hk/moonloader/lua/taskPlayAnimNonInterruptable)(Ped ped, string animation, string IFP, float framedelta, bool loopA, bool lockX, bool lockY, bool lockF, int time) |

[addStuntJump](https://wiki.blast.hk/moonloader/lua/addStuntJump)(float startX, float startY, float startZ, float radiusX, float radiusY, float radiusZ, float goalX, float goalY, float goalZ, float radius2X, float radius2Y, float radius2Z, float cameraX, float cameraY, float cameraZ, int reward) |

[setObjectCoordinatesAndVelocity](https://wiki.blast.hk/moonloader/lua/setObjectCoordinatesAndVelocity)(Object object, float X, float Y, float Z) |

[setCharKindaStayInSamePlace](https://wiki.blast.hk/moonloader/lua/setCharKindaStayInSamePlace)(Ped ped, bool stay) |

[taskFollowPatrolRoute](https://wiki.blast.hk/moonloader/lua/taskFollowPatrolRoute)(Ped ped, int walkMode, int routeMode) |

bool result = [isCharInAir](https://wiki.blast.hk/moonloader/lua/isCharInAir)(Ped ped) |

float height = [getCharHeightAboveGround](https://wiki.blast.hk/moonloader/lua/getCharHeightAboveGround)(Ped ped) |

[setCharWeaponSkill](https://wiki.blast.hk/moonloader/lua/setCharWeaponSkill)(Ped ped, int skill) |

[setTextEdge](https://wiki.blast.hk/moonloader/lua/setTextEdge)(int size, int r, int g, int b, int a) |

[setCarEngineBroken](https://wiki.blast.hk/moonloader/lua/setCarEngineBroken)(Vehicle car, bool broken) |

bool result = [isThisModelABoat](https://wiki.blast.hk/moonloader/lua/isThisModelABoat)(Model modelId) |

bool result = [isThisModelAPlane](https://wiki.blast.hk/moonloader/lua/isThisModelAPlane)(Model modelId) |

bool result = [isThisModelAHeli](https://wiki.blast.hk/moonloader/lua/isThisModelAHeli)(Model modelId) |

[setFirstPersonInCarCameraMode](https://wiki.blast.hk/moonloader/lua/setFirstPersonInCarCameraMode)(bool enable) |

[taskGreetPartner](https://wiki.blast.hk/moonloader/lua/taskGreetPartner)(Ped ped, Ped ped2, float unk1, int unk2) |

[setHeliBladesFullSpeed](https://wiki.blast.hk/moonloader/lua/setHeliBladesFullSpeed)(Vehicle heli) |

[displayHud](https://wiki.blast.hk/moonloader/lua/displayHud)(bool enable) |

[connectLods](https://wiki.blast.hk/moonloader/lua/connectLods)(Object object, int lod) |

[setMaxFireGenerations](https://wiki.blast.hk/moonloader/lua/setMaxFireGenerations)(int max) |

[taskDieNamedAnim](https://wiki.blast.hk/moonloader/lua/taskDieNamedAnim)(Ped ped, string animation, string ifp1, float ifp2, int time) |

[setPlayerDuckButton](https://wiki.blast.hk/moonloader/lua/setPlayerDuckButton)(Player player, bool able) |

[setPoolTableCoords](https://wiki.blast.hk/moonloader/lua/setPoolTableCoords)(float x1, float y1, float z1, float x2, float y2, float z2) |

bool result = [hasObjectBeenPhotographed](https://wiki.blast.hk/moonloader/lua/hasObjectBeenPhotographed)(Object object) |

[doCameraBump](https://wiki.blast.hk/moonloader/lua/doCameraBump)(float rotationZ, float rotationY) |

int day, int month = [getCurrentDate](https://wiki.blast.hk/moonloader/lua/getCurrentDate)() |

[setObjectAnimSpeed](https://wiki.blast.hk/moonloader/lua/setObjectAnimSpeed)(Object object, string animation, float speed) |

bool result = [isObjectPlayingAnim](https://wiki.blast.hk/moonloader/lua/isObjectPlayingAnim)(Object object, string anim) |

float progress = [getObjectAnimCurrentTime](https://wiki.blast.hk/moonloader/lua/getObjectAnimCurrentTime)(Object object, string animation) |

[setObjectAnimCurrentTime](https://wiki.blast.hk/moonloader/lua/setObjectAnimCurrentTime)(Object object, string animation, float progress) |

[setCharVelocity](https://wiki.blast.hk/moonloader/lua/setCharVelocity)(Ped ped, float vecX, float vecY, float vecZ) |

float vecX, float vecY, float vecZ = [getCharVelocity](https://wiki.blast.hk/moonloader/lua/getCharVelocity)(Ped ped) |

[setCharRotation](https://wiki.blast.hk/moonloader/lua/setCharRotation)(Ped ped, float vecX, float vecY, float vecZ) |

float value = [getCarUprightValue](https://wiki.blast.hk/moonloader/lua/getCarUprightValue)(Vehicle car) |

[setVehicleInterior](https://wiki.blast.hk/moonloader/lua/setVehicleInterior)(Vehicle car, int interior) |

[selectWeaponsForVehicle](https://wiki.blast.hk/moonloader/lua/selectWeaponsForVehicle)(Vehicle car, bool gun) |

int city = [getCityPlayerIsIn](https://wiki.blast.hk/moonloader/lua/getCityPlayerIsIn)(Player player) |

GxtString name = [getNameOfZone](https://wiki.blast.hk/moonloader/lua/getNameOfZone)(float X, float Y, float Z) |

[activateInteriorPeds](https://wiki.blast.hk/moonloader/lua/activateInteriorPeds)(bool activate) |

[setVehicleCanBeTargetted](https://wiki.blast.hk/moonloader/lua/setVehicleCanBeTargetted)(Vehicle car, bool unk) |

[taskFollowFootsteps](https://wiki.blast.hk/moonloader/lua/taskFollowFootsteps)(Ped ped, int followActor) |

[damageChar](https://wiki.blast.hk/moonloader/lua/damageChar)(Ped ped, int health, bool affectArmour) |

[setCarCanBeVisiblyDamaged](https://wiki.blast.hk/moonloader/lua/setCarCanBeVisiblyDamaged)(Vehicle car, bool can) |

[setHeliReachedTargetDistance](https://wiki.blast.hk/moonloader/lua/setHeliReachedTargetDistance)(Vehicle heli, int dist) |

float level = [getSoundLevelAtCoords](https://wiki.blast.hk/moonloader/lua/getSoundLevelAtCoords)(Ped ped, float X, float Y, float Z) |

[setCharAllowedToDuck](https://wiki.blast.hk/moonloader/lua/setCharAllowedToDuck)(Ped ped, bool enable) |

[setHeadingForAttachedPlayer](https://wiki.blast.hk/moonloader/lua/setHeadingForAttachedPlayer)(Player player, float toAngle, float rotationSpeed) |

[taskWalkAlongsideChar](https://wiki.blast.hk/moonloader/lua/taskWalkAlongsideChar)(Ped ped, int alongisdeActor) |

[createEmergencyServicesCar](https://wiki.blast.hk/moonloader/lua/createEmergencyServicesCar)(Model car, float X, float Y, float Z) |

[taskKindaStayInSamePlace](https://wiki.blast.hk/moonloader/lua/taskKindaStayInSamePlace)(Ped ped, bool stay) |

[startPlaybackRecordedCarLooped](https://wiki.blast.hk/moonloader/lua/startPlaybackRecordedCarLooped)(Vehicle car, int path) |

[setCharInterior](https://wiki.blast.hk/moonloader/lua/setCharInterior)(Ped ped, int interior) |

bool result = [isAttachedPlayerHeadingAchieved](https://wiki.blast.hk/moonloader/lua/isAttachedPlayerHeadingAchieved)(Player player) |

[enableEntryExitPlayerGroupWarping](https://wiki.blast.hk/moonloader/lua/enableEntryExitPlayerGroupWarping)(float X, float Y, float radius, bool access) |

Object object = [getClosestStealableObject](https://wiki.blast.hk/moonloader/lua/getClosestStealableObject)(float X, float Y, float Z, float radius) |

bool result = [isProceduralInteriorActive](https://wiki.blast.hk/moonloader/lua/isProceduralInteriorActive)(int interior) |

[removeCarRecording](https://wiki.blast.hk/moonloader/lua/removeCarRecording)(int path) |

[setZonePopulationRace](https://wiki.blast.hk/moonloader/lua/setZonePopulationRace)(GxtString zone, int popcycle) |

[setObjectOnlyDamagedByPlayer](https://wiki.blast.hk/moonloader/lua/setObjectOnlyDamagedByPlayer)(Object object, bool player) |

[createBirds](https://wiki.blast.hk/moonloader/lua/createBirds)(float x1, float y1, float z1, float x2, float y2, float z2, int flag1, int flag2) |

[setVehicleDirtLevel](https://wiki.blast.hk/moonloader/lua/setVehicleDirtLevel)(Vehicle car, float level) |

[setGangWarsActive](https://wiki.blast.hk/moonloader/lua/setGangWarsActive)(bool enable) |

bool result = [isGangWarGoingOn](https://wiki.blast.hk/moonloader/lua/isGangWarGoingOn)() |

[givePlayerClothesOutsideShop](https://wiki.blast.hk/moonloader/lua/givePlayerClothesOutsideShop)(Player player, string clothes, string model, int bodyPart) |

[clearLoadedShop](https://wiki.blast.hk/moonloader/lua/clearLoadedShop)() |

[setGroupSequence](https://wiki.blast.hk/moonloader/lua/setGroupSequence)(int group, int Aspack) |

[setCharDropsWeaponsWhenDead](https://wiki.blast.hk/moonloader/lua/setCharDropsWeaponsWhenDead)(Ped ped, bool droppable) |

[setCharNeverLeavesGroup](https://wiki.blast.hk/moonloader/lua/setCharNeverLeavesGroup)(Ped ped, bool set) |

[setPlayerFireButton](https://wiki.blast.hk/moonloader/lua/setPlayerFireButton)(Player player, bool able) |

[attachFxSystemToCharBone](https://wiki.blast.hk/moonloader/lua/attachFxSystemToCharBone)(Particle particle, Ped ped, int mode) |

[registerAttractorScriptBrainForCodeUse](https://wiki.blast.hk/moonloader/lua/registerAttractorScriptBrainForCodeUse)(int handle, GxtString script) |

[setHeadingLimitForAttachedChar](https://wiki.blast.hk/moonloader/lua/setHeadingLimitForAttachedChar)(Ped ped, int orientation, float limit) |

Marker blip = [addBlipForDeadChar](https://wiki.blast.hk/moonloader/lua/addBlipForDeadChar)(Ped ped) |

float X, float Y, float Z = [getDeadCharCoordinates](https://wiki.blast.hk/moonloader/lua/getDeadCharCoordinates)(Ped ped) |

[taskPlayAnimWithFlags](https://wiki.blast.hk/moonloader/lua/taskPlayAnimWithFlags)(Ped ped, string animation, string ifp, float framedelta, bool loopA, bool lockX, bool lockY, bool lockF, int time, bool force, bool lockZ) |

[setVehicleAirResistanceMultiplier](https://wiki.blast.hk/moonloader/lua/setVehicleAirResistanceMultiplier)(Vehicle car, float multiplier) |

[setCarCoordinatesNoOffset](https://wiki.blast.hk/moonloader/lua/setCarCoordinatesNoOffset)(Vehicle car, float X, float Y, float Z) |

[setUsesCollisionOfClosestObjectOfType](https://wiki.blast.hk/moonloader/lua/setUsesCollisionOfClosestObjectOfType)(float X, float Y, float Z, float radius, Model modelId, bool collisionDetection) |

[setTimeOneDayForward](https://wiki.blast.hk/moonloader/lua/setTimeOneDayForward)() |

[setTimerBeepCountdownTime](https://wiki.blast.hk/moonloader/lua/setTimerBeepCountdownTime)(VarId timer, int reach) |

[attachTrailerToCab](https://wiki.blast.hk/moonloader/lua/attachTrailerToCab)(int trailer, int cab) |

bool result = [isVehicleTouchingObject](https://wiki.blast.hk/moonloader/lua/isVehicleTouchingObject)(Vehicle car, Object object) |

[enableCraneControls](https://wiki.blast.hk/moonloader/lua/enableCraneControls)(bool UP, bool DOWN, bool RELEASE) |

bool result = [isPlayerInPositionForConversation](https://wiki.blast.hk/moonloader/lua/isPlayerInPositionForConversation)(Ped ped) |

[enableConversation](https://wiki.blast.hk/moonloader/lua/enableConversation)(Ped ped, bool enable) |

Ped ped = [getRandomCharInSphereOnlyDrugsBuyers](https://wiki.blast.hk/moonloader/lua/getRandomCharInSphereOnlyDrugsBuyers)(float X, float Y, float Z, float radius) |

int pedtype = [getPedType](https://wiki.blast.hk/moonloader/lua/getPedType)(Ped ped) |

bool result = [taskUseClosestMapAttractor](https://wiki.blast.hk/moonloader/lua/taskUseClosestMapAttractor)(Ped ped, float radius, Model nearModel, float offsetX, float offsetY, float offsetZ, string scriptNamed) |

[planeAttackPlayerUsingDogFight](https://wiki.blast.hk/moonloader/lua/planeAttackPlayerUsingDogFight)(int hydra, Player player, float radius) |

[canTriggerGangWarWhenOnAMission](https://wiki.blast.hk/moonloader/lua/canTriggerGangWarWhenOnAMission)(bool can) |

[controlMovableVehiclePart](https://wiki.blast.hk/moonloader/lua/controlMovableVehiclePart)(Vehicle car, float angle) |

[winchCanPickVehicleUp](https://wiki.blast.hk/moonloader/lua/winchCanPickVehicleUp)(Vehicle car, bool attractive) |

[openCarDoorABit](https://wiki.blast.hk/moonloader/lua/openCarDoorABit)(Vehicle car, int door, float rotation) |

bool result = [isCarDoorFullyOpen](https://wiki.blast.hk/moonloader/lua/isCarDoorFullyOpen)(Vehicle car, int door) |

[setAlwaysDraw3dMarkers](https://wiki.blast.hk/moonloader/lua/setAlwaysDraw3dMarkers)(bool set) |

[streamScript](https://wiki.blast.hk/moonloader/lua/streamScript)(int script) |

bool result = [hasStreamedScriptLoaded](https://wiki.blast.hk/moonloader/lua/hasStreamedScriptLoaded)(int script) |

[setGangWarsTrainingMission](https://wiki.blast.hk/moonloader/lua/setGangWarsTrainingMission)(bool set) |

[setCharHasUsedEntryExit](https://wiki.blast.hk/moonloader/lua/setCharHasUsedEntryExit)(Ped ped, float X, float Y, float radius) |

[setCharMaxHealth](https://wiki.blast.hk/moonloader/lua/setCharMaxHealth)(Ped ped, int health) |

[setNightVision](https://wiki.blast.hk/moonloader/lua/setNightVision)(bool enable) |

[setInfraredVision](https://wiki.blast.hk/moonloader/lua/setInfraredVision)(bool enable) |

[setZoneForGangWarsTraining](https://wiki.blast.hk/moonloader/lua/setZoneForGangWarsTraining)(GxtString zone) |

[setCharCanBeKnockedOffBike](https://wiki.blast.hk/moonloader/lua/setCharCanBeKnockedOffBike)(Ped ped, bool can) |

[setCharCoordinatesDontWarpGang](https://wiki.blast.hk/moonloader/lua/setCharCoordinatesDontWarpGang)(Ped ped, float X, float Y, float Z) |

[addPriceModifier](https://wiki.blast.hk/moonloader/lua/addPriceModifier)(int item, int price) |

[removePriceModifier](https://wiki.blast.hk/moonloader/lua/removePriceModifier)(int item) |

[initZonePopulationSettings](https://wiki.blast.hk/moonloader/lua/initZonePopulationSettings)() |

[explodeCarInCutsceneShakeAndBits](https://wiki.blast.hk/moonloader/lua/explodeCarInCutsceneShakeAndBits)(Vehicle car, bool shake, bool effect, bool sound) |

bool result = [isSkipCutsceneButtonPressed](https://wiki.blast.hk/moonloader/lua/isSkipCutsceneButtonPressed)() |

bool result, float X, float Y, float Z = [getCutsceneOffset](https://wiki.blast.hk/moonloader/lua/getCutsceneOffset)() |

[setObjectScale](https://wiki.blast.hk/moonloader/lua/setObjectScale)(Object object, float scale) |

int popcycle = [getCurrentPopulationZoneType](https://wiki.blast.hk/moonloader/lua/getCurrentPopulationZoneType)() |

int menu = [createMenu](https://wiki.blast.hk/moonloader/lua/createMenu)(GxtString title, float posX, float posY, float width, int columns, bool interactive, bool background, int alignment) |

[setMenuColumnOrientation](https://wiki.blast.hk/moonloader/lua/setMenuColumnOrientation)(int menu, int column, int alignment) |

int item = [getMenuItemSelected](https://wiki.blast.hk/moonloader/lua/getMenuItemSelected)(int menu) |

int item = [getMenuItemAccepted](https://wiki.blast.hk/moonloader/lua/getMenuItemAccepted)(int menu) |

[activateMenuItem](https://wiki.blast.hk/moonloader/lua/activateMenuItem)(int menu, int row, bool enable) |

[deleteMenu](https://wiki.blast.hk/moonloader/lua/deleteMenu)(int menu) |

[setMenuColumn](https://wiki.blast.hk/moonloader/lua/setMenuColumn)(int menu, int column, GxtString header, GxtString data1, GxtString data2, GxtString data3, GxtString data4, GxtString data5, GxtString data6, GxtString data7, GxtString data8, GxtString data9, GxtString data10, GxtString data11, GxtString data12) |

[setBlipEntryExit](https://wiki.blast.hk/moonloader/lua/setBlipEntryExit)(Marker marker, float X, float Y, float radius) |

[switchDeathPenalties](https://wiki.blast.hk/moonloader/lua/switchDeathPenalties)(bool lose) |

[switchArrestPenalties](https://wiki.blast.hk/moonloader/lua/switchArrestPenalties)(bool lose) |

[setExtraHospitalRestartPoint](https://wiki.blast.hk/moonloader/lua/setExtraHospitalRestartPoint)(float X, float Y, float Z, float radius, float angle) |

[setExtraPoliceStationRestartPoint](https://wiki.blast.hk/moonloader/lua/setExtraPoliceStationRestartPoint)(float X, float Y, float Z, float radius, float angle) |

int num = [findNumberTagsTagged](https://wiki.blast.hk/moonloader/lua/findNumberTagsTagged)() |

int percentage = [getTerritoryUnderControlPercentage](https://wiki.blast.hk/moonloader/lua/getTerritoryUnderControlPercentage)() |

bool result = [isObjectInAngledArea2d](https://wiki.blast.hk/moonloader/lua/isObjectInAngledArea2d)(Object object, float x1, float y1, float x2, float y2, float radius, bool sphere) |

bool result = [isObjectInAngledArea3d](https://wiki.blast.hk/moonloader/lua/isObjectInAngledArea3d)(Object object, float x1, float y1, float z1, float x2, float y2, float z2, float depth, bool flag) |

Ped ped = [getRandomCharInSphereNoBrain](https://wiki.blast.hk/moonloader/lua/getRandomCharInSphereNoBrain)(float X, float Y, float Z, float radius) |

[setPlaneUndercarriageUp](https://wiki.blast.hk/moonloader/lua/setPlaneUndercarriageUp)(int plane, bool set) |

[disableAllEntryExits](https://wiki.blast.hk/moonloader/lua/disableAllEntryExits)(bool disable) |

[attachAnimsToModel](https://wiki.blast.hk/moonloader/lua/attachAnimsToModel)(Model modelId, GxtString externalScript) |

[setObjectAsStealable](https://wiki.blast.hk/moonloader/lua/setObjectAsStealable)(Object object, bool liftable) |

[setCreateRandomGangMembers](https://wiki.blast.hk/moonloader/lua/setCreateRandomGangMembers)(bool enable) |

[addSparks](https://wiki.blast.hk/moonloader/lua/addSparks)(float posX, float posY, float posZ, float vecX, float vecY, float vecZ, int density) |

int class = [getVehicleClass](https://wiki.blast.hk/moonloader/lua/getVehicleClass)(Vehicle car) |

[clearConversationForChar](https://wiki.blast.hk/moonloader/lua/clearConversationForChar)(Ped ped) |

[setMenuItemWithNumber](https://wiki.blast.hk/moonloader/lua/setMenuItemWithNumber)(int panel, int column, int row, GxtString gxtString, int number) |

[setMenuItemWith2Numbers](https://wiki.blast.hk/moonloader/lua/setMenuItemWith2Numbers)(int panel, int column, int row, GxtString gxtString, int numbers1, int numbers2) |

[setCutsceneModelTexture](https://wiki.blast.hk/moonloader/lua/setCutsceneModelTexture)(GxtString cutsceneModel, GxtString textureName) |

GxtString nameB = [getNameOfInfoZone](https://wiki.blast.hk/moonloader/lua/getNameOfInfoZone)(float atX, float atY, float atZ) |

[vehicleCanBeTargettedByHsMissile](https://wiki.blast.hk/moonloader/lua/vehicleCanBeTargettedByHsMissile)(Vehicle car, bool targetable) |

[setFreebiesInVehicle](https://wiki.blast.hk/moonloader/lua/setFreebiesInVehicle)(Vehicle car, bool containsGoodies) |

[setScriptLimitToGangSize](https://wiki.blast.hk/moonloader/lua/setScriptLimitToGangSize)(bool max) |

[makePlayerGangDisappear](https://wiki.blast.hk/moonloader/lua/makePlayerGangDisappear)() |

[makePlayerGangReappear](https://wiki.blast.hk/moonloader/lua/makePlayerGangReappear)() |

int textureCRC, int modelCRC = [getClothesItem](https://wiki.blast.hk/moonloader/lua/getClothesItem)(Player player, int bodypart) |

[showUpdateStats](https://wiki.blast.hk/moonloader/lua/showUpdateStats)(bool display) |

[setCoordBlipAppearance](https://wiki.blast.hk/moonloader/lua/setCoordBlipAppearance)(Checkpoint checkpoint, int type) |

[setHeathazeEffect](https://wiki.blast.hk/moonloader/lua/setHeathazeEffect)(bool enable) |

bool result = [isHelpMessageBeingDisplayed](https://wiki.blast.hk/moonloader/lua/isHelpMessageBeingDisplayed)() |

bool result = [hasObjectBeenDamagedByWeapon](https://wiki.blast.hk/moonloader/lua/hasObjectBeenDamagedByWeapon)(Object object, int type) |

[clearObjectLastWeaponDamage](https://wiki.blast.hk/moonloader/lua/clearObjectLastWeaponDamage)(Object object) |

[setPlayerJumpButton](https://wiki.blast.hk/moonloader/lua/setPlayerJumpButton)(Player player, bool enable) |

int r, int g, int b, int a = [getHudColour](https://wiki.blast.hk/moonloader/lua/getHudColour)(int interface) |

[lockDoor](https://wiki.blast.hk/moonloader/lua/lockDoor)(int door, bool lock) |

[setObjectMass](https://wiki.blast.hk/moonloader/lua/setObjectMass)(Object object, float mass) |

float mass = [getObjectMass](https://wiki.blast.hk/moonloader/lua/getObjectMass)(int int) |

[setObjectTurnMass](https://wiki.blast.hk/moonloader/lua/setObjectTurnMass)(Object object, float turnMass) |

float turnMass = [getObjectTurnMass](https://wiki.blast.hk/moonloader/lua/getObjectTurnMass)(Object object) |

[setSpecificZoneToTriggerGangWar](https://wiki.blast.hk/moonloader/lua/setSpecificZoneToTriggerGangWar)(GxtString zone) |

[clearSpecificZonesToTriggerGangWar](https://wiki.blast.hk/moonloader/lua/clearSpecificZonesToTriggerGangWar)() |

[setActiveMenuItem](https://wiki.blast.hk/moonloader/lua/setActiveMenuItem)(int panel, int activeRow) |

[markStreamedScriptAsNoLongerNeeded](https://wiki.blast.hk/moonloader/lua/markStreamedScriptAsNoLongerNeeded)(int externalScript) |

[removeStreamedScript](https://wiki.blast.hk/moonloader/lua/removeStreamedScript)(int externalScript) |

[setMessageFormatting](https://wiki.blast.hk/moonloader/lua/setMessageFormatting)(bool priority, int leftmargin, int maxwidth) |

[startNewStreamedScript](https://wiki.blast.hk/moonloader/lua/startNewStreamedScript)(int externalScript, table args) |

[setWeatherToAppropriateTypeNow](https://wiki.blast.hk/moonloader/lua/setWeatherToAppropriateTypeNow)() |

[winchCanPickObjectUp](https://wiki.blast.hk/moonloader/lua/winchCanPickObjectUp)(Object object, bool enable) |

[switchAudioZone](https://wiki.blast.hk/moonloader/lua/switchAudioZone)(GxtString zone, bool enableSound) |

[setCarEngineOn](https://wiki.blast.hk/moonloader/lua/setCarEngineOn)(Vehicle car, bool on) |

[setCarLightsOn](https://wiki.blast.hk/moonloader/lua/setCarLightsOn)(Vehicle car, bool lights) |

Ped ped = [getUserOfClosestMapAttractor](https://wiki.blast.hk/moonloader/lua/getUserOfClosestMapAttractor)(float sphereX, float sphereY, float sphereZ, float radius, Model modelId, string externalScriptNamed) |

[switchRoadsBackToOriginal](https://wiki.blast.hk/moonloader/lua/switchRoadsBackToOriginal)(float cornerAX, float cornerAY, float cornerAZ, float cornerBX, float cornerBY, float cornerBZ) |

[switchPedRoadsBackToOriginal](https://wiki.blast.hk/moonloader/lua/switchPedRoadsBackToOriginal)(float cornerAX, float cornerAY, float cornerAZ, float cornerBX, float cornerBY, float cornerBZ) |

int landingGearStatus = [getPlaneUndercarriagePosition](https://wiki.blast.hk/moonloader/lua/getPlaneUndercarriagePosition)(int plane) |

[cameraSetVectorTrack](https://wiki.blast.hk/moonloader/lua/cameraSetVectorTrack)(float pointX, float pointY, float pointZ, float transverseX, float transverseY, float transverseZ, int time, bool smooth) |

[cameraSetLerpFov](https://wiki.blast.hk/moonloader/lua/cameraSetLerpFov)(float from, float to, int timelimit, bool smoothTransition) |

[switchAmbientPlanes](https://wiki.blast.hk/moonloader/lua/switchAmbientPlanes)(bool enable) |

[setDarknessEffect](https://wiki.blast.hk/moonloader/lua/setDarknessEffect)(bool enable, int value) |

[cameraResetNewScriptables](https://wiki.blast.hk/moonloader/lua/cameraResetNewScriptables)() |

int value = [getNumberOfInstancesOfStreamedScript](https://wiki.blast.hk/moonloader/lua/getNumberOfInstancesOfStreamedScript)(int externalScript) |

[allocateStreamedScriptToRandomPed](https://wiki.blast.hk/moonloader/lua/allocateStreamedScriptToRandomPed)(int externalScript, Model actorModel, int priority) |

[allocateStreamedScriptToObject](https://wiki.blast.hk/moonloader/lua/allocateStreamedScriptToObject)(int externalScript, Model objectModel, int priority, float radius, int type) |

int handle = [getGroupMember](https://wiki.blast.hk/moonloader/lua/getGroupMember)(int group, int member) |

float height = [getWaterHeightAtCoords](https://wiki.blast.hk/moonloader/lua/getWaterHeightAtCoords)(float atX, float atY, bool ignoreWaves) |

[cameraPersistTrack](https://wiki.blast.hk/moonloader/lua/cameraPersistTrack)(bool lock) |

[cameraPersistPos](https://wiki.blast.hk/moonloader/lua/cameraPersistPos)(bool lock) |

[cameraPersistFov](https://wiki.blast.hk/moonloader/lua/cameraPersistFov)(bool lock) |

bool result = [cameraIsVectorMoveRunning](https://wiki.blast.hk/moonloader/lua/cameraIsVectorMoveRunning)() |

bool result = [cameraIsVectorTrackRunning](https://wiki.blast.hk/moonloader/lua/cameraIsVectorTrackRunning)() |

[cameraSetVectorMove](https://wiki.blast.hk/moonloader/lua/cameraSetVectorMove)(float cameraX, float cameraY, float cameraZ, float positionX, float positionY, float positionZ, int time, bool smoothTransition) |

[drawWindow](https://wiki.blast.hk/moonloader/lua/drawWindow)(float cornerAX, float cornerAY, float cornerBX, float cornerBY, GxtString gxtString, int style) |

[attachCarToObject](https://wiki.blast.hk/moonloader/lua/attachCarToObject)(Vehicle car, Object object, float offsetX, float offsetY, float offsetZ, float rotationX, float rotationY, float rotationZ) |

[setGarageResprayFree](https://wiki.blast.hk/moonloader/lua/setGarageResprayFree)(GxtString garage, bool free) |

[setCharBulletproofVest](https://wiki.blast.hk/moonloader/lua/setCharBulletproofVest)(Ped ped, bool enable) |

[setCinemaCamera](https://wiki.blast.hk/moonloader/lua/setCinemaCamera)(bool lock) |

[setCharFireDamageMultiplier](https://wiki.blast.hk/moonloader/lua/setCharFireDamageMultiplier)(Ped ped, float multiplier) |

[setGroupFollowStatus](https://wiki.blast.hk/moonloader/lua/setGroupFollowStatus)(int group, bool status) |

[setSearchlightClipIfColliding](https://wiki.blast.hk/moonloader/lua/setSearchlightClipIfColliding)(Searchlight searchlight, bool flag) |

bool result = [hasPlayerBoughtItem](https://wiki.blast.hk/moonloader/lua/hasPlayerBoughtItem)(int item) |

[setCameraInFrontOfChar](https://wiki.blast.hk/moonloader/lua/setCameraInFrontOfChar)(Ped ped) |

int maxArmour = [getPlayerMaxArmour](https://wiki.blast.hk/moonloader/lua/getPlayerMaxArmour)(Player player) |

[setCharUsesUpperbodyDamageAnimsOnly](https://wiki.blast.hk/moonloader/lua/setCharUsesUpperbodyDamageAnimsOnly)(Ped ped, bool uninterupted) |

int spokenPhrase = [setCharSayContext](https://wiki.blast.hk/moonloader/lua/setCharSayContext)(Ped ped, int speech) |

[addExplosionVariableShake](https://wiki.blast.hk/moonloader/lua/addExplosionVariableShake)(float atX, float atY, float atZ, int type, float cameraShake) |

[attachMissionAudioToChar](https://wiki.blast.hk/moonloader/lua/attachMissionAudioToChar)(int id, Ped ped) |

[updatePickupMoneyPerDay](https://wiki.blast.hk/moonloader/lua/updatePickupMoneyPerDay)(Pickup pickup, int cash) |

GxtString interiorName = [getNameOfEntryExitCharUsed](https://wiki.blast.hk/moonloader/lua/getNameOfEntryExitCharUsed)(Ped ped) |

float coordX, float coordY, float coordZ, int number = [getPositionOfEntryExitCharUsed](https://wiki.blast.hk/moonloader/lua/getPositionOfEntryExitCharUsed)(Ped ped) |

bool result = [isCharTalking](https://wiki.blast.hk/moonloader/lua/isCharTalking)(Ped ped) |

[disableCharSpeech](https://wiki.blast.hk/moonloader/lua/disableCharSpeech)(Ped ped, bool disable) |

[enableCharSpeech](https://wiki.blast.hk/moonloader/lua/enableCharSpeech)(Ped ped) |

[setUpSkip](https://wiki.blast.hk/moonloader/lua/setUpSkip)(float posX, float posY, float posZ, float angle) |

[clearSkip](https://wiki.blast.hk/moonloader/lua/clearSkip)() |

[preloadBeatTrack](https://wiki.blast.hk/moonloader/lua/preloadBeatTrack)(int soundtrack) |

int status = [getBeatTrackStatus](https://wiki.blast.hk/moonloader/lua/getBeatTrackStatus)() |

[playBeatTrack](https://wiki.blast.hk/moonloader/lua/playBeatTrack)() |

[stopBeatTrack](https://wiki.blast.hk/moonloader/lua/stopBeatTrack)() |

int max = [findMaxNumberOfGroupMembers](https://wiki.blast.hk/moonloader/lua/findMaxNumberOfGroupMembers)() |

[vehicleDoesProvideCover](https://wiki.blast.hk/moonloader/lua/vehicleDoesProvideCover)(Vehicle car, bool providesCover) |

Pickup pickup = [createSnapshotPickup](https://wiki.blast.hk/moonloader/lua/createSnapshotPickup)(float atX, float atY, float atZ) |

Pickup pickup = [createHorseshoePickup](https://wiki.blast.hk/moonloader/lua/createHorseshoePickup)(float atX, float atY, float atZ) |

Pickup pickup = [createOysterPickup](https://wiki.blast.hk/moonloader/lua/createOysterPickup)(float atX, float atY, float atZ) |

bool result = [hasObjectBeenUprooted](https://wiki.blast.hk/moonloader/lua/hasObjectBeenUprooted)(Object object) |

[addSmokeParticle](https://wiki.blast.hk/moonloader/lua/addSmokeParticle)(float atX, float atY, float atZ, float velocityX, float velocityY, float velocityZ, int r, int g, int b, int a, float size, float factor) |

bool result = [isCharStuckUnderCar](https://wiki.blast.hk/moonloader/lua/isCharStuckUnderCar)(Ped ped) |

[controlCarDoor](https://wiki.blast.hk/moonloader/lua/controlCarDoor)(Vehicle car, int door, int unlatch, float angle) |

float angle = [getDoorAngleRatio](https://wiki.blast.hk/moonloader/lua/getDoorAngleRatio)(Vehicle car, int door) |

[setPlayerDisplayVitalStatsButton](https://wiki.blast.hk/moonloader/lua/setPlayerDisplayVitalStatsButton)(Player player, bool display) |

[setCharKeepTask](https://wiki.blast.hk/moonloader/lua/setCharKeepTask)(Ped ped, bool keepTasks) |

int id = [createMenuGrid](https://wiki.blast.hk/moonloader/lua/createMenuGrid)(GxtString gxtString, int positionX, int positionY, float width, int columns, bool interactive, bool background, int alignment) |

bool result = [isCharSwimming](https://wiki.blast.hk/moonloader/lua/isCharSwimming)(Ped ped) |

int status = [getCharSwimState](https://wiki.blast.hk/moonloader/lua/getCharSwimState)(Ped ped) |

[startCharFacialTalk](https://wiki.blast.hk/moonloader/lua/startCharFacialTalk)(Ped ped, int time) |

[stopCharFacialTalk](https://wiki.blast.hk/moonloader/lua/stopCharFacialTalk)(Ped ped) |

bool result = [isBigVehicle](https://wiki.blast.hk/moonloader/lua/isBigVehicle)(Vehicle car) |

[switchPoliceHelis](https://wiki.blast.hk/moonloader/lua/switchPoliceHelis)(bool enable) |

[storeCarModState](https://wiki.blast.hk/moonloader/lua/storeCarModState)() |

[restoreCarModState](https://wiki.blast.hk/moonloader/lua/restoreCarModState)() |

Model modelId = [getCurrentCarMod](https://wiki.blast.hk/moonloader/lua/getCurrentCarMod)(Vehicle car, int slot) |

bool result = [isCarLowRider](https://wiki.blast.hk/moonloader/lua/isCarLowRider)(Vehicle car) |

bool result = [isCarStreetRacer](https://wiki.blast.hk/moonloader/lua/isCarStreetRacer)(Vehicle car) |

[forceDeathRestart](https://wiki.blast.hk/moonloader/lua/forceDeathRestart)() |

[syncWater](https://wiki.blast.hk/moonloader/lua/syncWater)() |

[setCharCoordinatesNoOffset](https://wiki.blast.hk/moonloader/lua/setCharCoordinatesNoOffset)(Ped ped, float atX, float atY, float atZ) |

bool result = [doesScriptFireExist](https://wiki.blast.hk/moonloader/lua/doesScriptFireExist)(int fire) |

[resetStuffUponResurrection](https://wiki.blast.hk/moonloader/lua/resetStuffUponResurrection)() |

bool result = [isEmergencyServicesVehicle](https://wiki.blast.hk/moonloader/lua/isEmergencyServicesVehicle)(Vehicle car) |

[killFxSystemNow](https://wiki.blast.hk/moonloader/lua/killFxSystemNow)(Particle particle) |

bool result = [isObjectWithinBrainActivationRange](https://wiki.blast.hk/moonloader/lua/isObjectWithinBrainActivationRange)(Player player) |

int to = [copySharedCharDecisionMaker](https://wiki.blast.hk/moonloader/lua/copySharedCharDecisionMaker)(int from) |

[reportMissionAudioEventAtPosition](https://wiki.blast.hk/moonloader/lua/reportMissionAudioEventAtPosition)(float atX, float atY, float atZ, int event) |

[reportMissionAudioEventAtObject](https://wiki.blast.hk/moonloader/lua/reportMissionAudioEventAtObject)(int at, int event) |

[attachMissionAudioToObject](https://wiki.blast.hk/moonloader/lua/attachMissionAudioToObject)(int id, Object object) |

int colours = [getNumCarColours](https://wiki.blast.hk/moonloader/lua/getNumCarColours)(Vehicle car) |

[extinguishFireAtPoint](https://wiki.blast.hk/moonloader/lua/extinguishFireAtPoint)(float atX, float atY, float atZ, float radius) |

bool result = [hasTrainDerailed](https://wiki.blast.hk/moonloader/lua/hasTrainDerailed)(Vehicle train) |

[setCharForceDieInCar](https://wiki.blast.hk/moonloader/lua/setCharForceDieInCar)(Ped ped, bool stayInCarWhenDead) |

[setOnlyCreateGangMembers](https://wiki.blast.hk/moonloader/lua/setOnlyCreateGangMembers)(bool enable) |

Model modelId = [getObjectModel](https://wiki.blast.hk/moonloader/lua/getObjectModel)(Object object) |

[setCharUsesCollisionClosestObjectOfType](https://wiki.blast.hk/moonloader/lua/setCharUsesCollisionClosestObjectOfType)(float sphereX, float sphereY, float sphereZ, float radius, Model modelId, bool solid, int forActor) |

[clearAllScriptFireFlags](https://wiki.blast.hk/moonloader/lua/clearAllScriptFireFlags)() |

int blockingCar = [getCarBlockingCar](https://wiki.blast.hk/moonloader/lua/getCarBlockingCar)(Vehicle car) |

int paintjob = [getCurrentVehiclePaintjob](https://wiki.blast.hk/moonloader/lua/getCurrentVehiclePaintjob)(Vehicle car) |

[setHelpMessageBoxSize](https://wiki.blast.hk/moonloader/lua/setHelpMessageBoxSize)(int width) |

[setGunshotSenseRangeForRiot2](https://wiki.blast.hk/moonloader/lua/setGunshotSenseRangeForRiot2)(float range) |

float angle = [getCarMovingComponentOffset](https://wiki.blast.hk/moonloader/lua/getCarMovingComponentOffset)(Vehicle car) |

[setNamedEntryExitFlag](https://wiki.blast.hk/moonloader/lua/setNamedEntryExitFlag)(GxtString interior, int bitmask, bool flag) |

[pauseCurrentBeatTrack](https://wiki.blast.hk/moonloader/lua/pauseCurrentBeatTrack)(bool paused) |

[setPlayerWeaponsScrollable](https://wiki.blast.hk/moonloader/lua/setPlayerWeaponsScrollable)(Player player, bool scrollable) |

[markRoadNodeAsDontWander](https://wiki.blast.hk/moonloader/lua/markRoadNodeAsDontWander)(float atX, float atY, float atZ) |

[unmarkAllRoadNodesAsDontWander](https://wiki.blast.hk/moonloader/lua/unmarkAllRoadNodesAsDontWander)() |

[setCheckpointHeading](https://wiki.blast.hk/moonloader/lua/setCheckpointHeading)(Checkpoint checkpoint, float angle) |

[setMissionRespectTotal](https://wiki.blast.hk/moonloader/lua/setMissionRespectTotal)(int respect) |

[awardPlayerMissionRespect](https://wiki.blast.hk/moonloader/lua/awardPlayerMissionRespect)(int respect) |

[setCarCollision](https://wiki.blast.hk/moonloader/lua/setCarCollision)(Vehicle car, bool collision) |

[changePlaybackToUseAi](https://wiki.blast.hk/moonloader/lua/changePlaybackToUseAi)(Vehicle car) |

[cameraSetShakeSimulationSimple](https://wiki.blast.hk/moonloader/lua/cameraSetShakeSimulationSimple)(int type, float timelimit, float intensity) |

bool result = [isNightVisionActive](https://wiki.blast.hk/moonloader/lua/isNightVisionActive)() |

[setCreateRandomCops](https://wiki.blast.hk/moonloader/lua/setCreateRandomCops)(bool enable) |

[taskSetIgnoreWeaponRangeFlag](https://wiki.blast.hk/moonloader/lua/taskSetIgnoreWeaponRangeFlag)(Ped ped, bool ignore) |

[taskPickUpSecondObject](https://wiki.blast.hk/moonloader/lua/taskPickUpSecondObject)(Ped ped, Object object, float offsetX, float offsetY, float offsetZ, int bone, int int7, string animation, string file, int time) |

[dropSecondObject](https://wiki.blast.hk/moonloader/lua/dropSecondObject)(Ped ped, bool to) |

[removeObjectElegantly](https://wiki.blast.hk/moonloader/lua/removeObjectElegantly)(Object object) |

[drawCrosshair](https://wiki.blast.hk/moonloader/lua/drawCrosshair)(bool draw) |

[setUpConversationNodeWithSpeech](https://wiki.blast.hk/moonloader/lua/setUpConversationNodeWithSpeech)(GxtString question, GxtString answerY, GxtString answerN, int questionWav, int answerYWav, int answerNWav) |

[showBlipsOnAllLevels](https://wiki.blast.hk/moonloader/lua/showBlipsOnAllLevels)(bool enable) |

[setCharDruggedUp](https://wiki.blast.hk/moonloader/lua/setCharDruggedUp)(Ped ped, bool druggedUp) |

bool result = [isCharHeadMissing](https://wiki.blast.hk/moonloader/lua/isCharHeadMissing)(Ped ped) |

int CRC32 = [getHashKey](https://wiki.blast.hk/moonloader/lua/getHashKey)(string string) |

[setUpConversationEndNodeWithSpeech](https://wiki.blast.hk/moonloader/lua/setUpConversationEndNodeWithSpeech)(GxtString gxtString, int speech) |

[randomPassengerSay](https://wiki.blast.hk/moonloader/lua/randomPassengerSay)(int passengers, int audioTable) |

[hideAllFrontendBlips](https://wiki.blast.hk/moonloader/lua/hideAllFrontendBlips)(bool hide) |

[setPlayerInCarCameraMode](https://wiki.blast.hk/moonloader/lua/setPlayerInCarCameraMode)(int mode) |

bool result = [isCharInAnyTrain](https://wiki.blast.hk/moonloader/lua/isCharInAnyTrain)(Ped ped) |

[setUpSkipAfterMission](https://wiki.blast.hk/moonloader/lua/setUpSkipAfterMission)(float posX, float posY, float posZ, float angle) |

[setVehicleIsConsideredByPlayer](https://wiki.blast.hk/moonloader/lua/setVehicleIsConsideredByPlayer)(Vehicle car, bool accessible) |

Model modelId, int class = [getRandomCarModelInMemory](https://wiki.blast.hk/moonloader/lua/getRandomCarModelInMemory)(bool unk) |

int doorStatus = [getCarDoorLockStatus](https://wiki.blast.hk/moonloader/lua/getCarDoorLockStatus)(Vehicle car) |

[setClosestEntryExitFlag](https://wiki.blast.hk/moonloader/lua/setClosestEntryExitFlag)(float atX, float atY, float radius, int bitmask, bool flag) |

[setCharSignalAfterKill](https://wiki.blast.hk/moonloader/lua/setCharSignalAfterKill)(Ped ped, bool signal) |

[setCharWantedByPolice](https://wiki.blast.hk/moonloader/lua/setCharWantedByPolice)(Ped ped, bool wanted) |

[setZoneNoCops](https://wiki.blast.hk/moonloader/lua/setZoneNoCops)(GxtString zone, bool disableCops) |

[addBlood](https://wiki.blast.hk/moonloader/lua/addBlood)(float atX, float atY, float atZ, float offsetX, float offsetY, float offsetZ, int density, int onActor) |

[displayCarNames](https://wiki.blast.hk/moonloader/lua/displayCarNames)(bool show) |

[displayZoneNames](https://wiki.blast.hk/moonloader/lua/displayZoneNames)(bool show) |

bool result = [isCarDoorDamaged](https://wiki.blast.hk/moonloader/lua/isCarDoorDamaged)(Vehicle car, int door) |

[setCharCoordinatesDontWarpGangNoOffset](https://wiki.blast.hk/moonloader/lua/setCharCoordinatesDontWarpGangNoOffset)(Ped ped, float atX, float atY, float atZ) |

[setMinigameInProgress](https://wiki.blast.hk/moonloader/lua/setMinigameInProgress)(bool enable) |

bool result = [isMinigameInProgress](https://wiki.blast.hk/moonloader/lua/isMinigameInProgress)() |

[setForceRandomCarModel](https://wiki.blast.hk/moonloader/lua/setForceRandomCarModel)(Model modelId) |

Vehicle car = [getRandomCarOfTypeInAngledAreaNoSave](https://wiki.blast.hk/moonloader/lua/getRandomCarOfTypeInAngledAreaNoSave)(float x1, float y1, float x2, float y2, float angle, int int6) |

[addNextMessageToPreviousBriefs](https://wiki.blast.hk/moonloader/lua/addNextMessageToPreviousBriefs)(bool int1) |

[failKillFrenzy](https://wiki.blast.hk/moonloader/lua/failKillFrenzy)() |

bool result = [isCopVehicleInArea3dNoSave](https://wiki.blast.hk/moonloader/lua/isCopVehicleInArea3dNoSave)(float cornerAX, float cornerAY, float cornerAZ, float cornerBX, float cornerBY, float cornerBZ) |

[setPetrolTankWeakpoint](https://wiki.blast.hk/moonloader/lua/setPetrolTankWeakpoint)(Vehicle car, bool enabled) |

bool result = [isCharUsingMapAttractor](https://wiki.blast.hk/moonloader/lua/isCharUsingMapAttractor)(Ped ped) |

[setPlayerModel](https://wiki.blast.hk/moonloader/lua/setPlayerModel)(Player player, Model modelId) |

bool result = [areSubtitlesSwitchedOn](https://wiki.blast.hk/moonloader/lua/areSubtitlesSwitchedOn)() |

[removeCharFromCarMaintainPosition](https://wiki.blast.hk/moonloader/lua/removeCharFromCarMaintainPosition)(Ped ped, Vehicle car) |

[setObjectProofs](https://wiki.blast.hk/moonloader/lua/setObjectProofs)(Object object, bool BP, bool FP, bool EP, bool CP, bool MP) |

bool result = [isCarTouchingCar](https://wiki.blast.hk/moonloader/lua/isCarTouchingCar)(Vehicle car1, Vehicle car2) |

bool result = [doesObjectHaveThisModel](https://wiki.blast.hk/moonloader/lua/doesObjectHaveThisModel)(Object object, Model modelId) |

[setTrainForcedToSlowDown](https://wiki.blast.hk/moonloader/lua/setTrainForcedToSlowDown)(Vehicle train, bool forced) |

bool result = [isVehicleOnAllWheels](https://wiki.blast.hk/moonloader/lua/isVehicleOnAllWheels)(Vehicle car) |

bool result = [doesPickupExist](https://wiki.blast.hk/moonloader/lua/doesPickupExist)(Pickup pickup) |

[enableAmbientCrime](https://wiki.blast.hk/moonloader/lua/enableAmbientCrime)(bool enable) |

[clearWantedLevelInGarage](https://wiki.blast.hk/moonloader/lua/clearWantedLevelInGarage)() |

int unk = [setCharSayContextImportant](https://wiki.blast.hk/moonloader/lua/setCharSayContextImportant)(Ped ped, int soundslot, bool flags1, bool flags2, bool flags3) |

[setCharSayScript](https://wiki.blast.hk/moonloader/lua/setCharSayScript)(Ped ped, int sound, bool flags1, bool flags2, bool flags3) |

[forceInteriorLightingForPlayer](https://wiki.blast.hk/moonloader/lua/forceInteriorLightingForPlayer)(Player player, bool force) |

[useDetonator](https://wiki.blast.hk/moonloader/lua/useDetonator)() |

bool result = [isMoneyPickupAtCoords](https://wiki.blast.hk/moonloader/lua/isMoneyPickupAtCoords)(float atX, float atY, float atZ) |

[setMenuColumnWidth](https://wiki.blast.hk/moonloader/lua/setMenuColumnWidth)(int panel, int column, int width) |

[makeRoomInPlayerGangForMissionPeds](https://wiki.blast.hk/moonloader/lua/makeRoomInPlayerGangForMissionPeds)(int group) |

bool result = [isCharGettingInToACar](https://wiki.blast.hk/moonloader/lua/isCharGettingInToACar)(Ped ped) |

[setUpSkipForSpecificVehicle](https://wiki.blast.hk/moonloader/lua/setUpSkipForSpecificVehicle)(float posX, float posY, float posZ, float angle, Vehicle car) |

int price = [getCarModelValue](https://wiki.blast.hk/moonloader/lua/getCarModelValue)(Model modelId) |

int generator = [createCarGeneratorWithPlate](https://wiki.blast.hk/moonloader/lua/createCarGeneratorWithPlate)(float atX, float atY, float atZ, float angle, Model modelId, int color1, int color2, bool forceSpawn, int alarm, int doorLock, int minDelay, int maxDelay, string plate) |

bool result = [findTrainDirection](https://wiki.blast.hk/moonloader/lua/findTrainDirection)(Vehicle train) |

[setAircraftCarrierSamSite](https://wiki.blast.hk/moonloader/lua/setAircraftCarrierSamSite)(bool enable) |

[drawLightWithRange](https://wiki.blast.hk/moonloader/lua/drawLightWithRange)(float atX, float atY, float atZ, int r, int g, int b, float radius) |

[enableBurglaryHouses](https://wiki.blast.hk/moonloader/lua/enableBurglaryHouses)(bool enable) |

bool result = [isPlayerControlOn](https://wiki.blast.hk/moonloader/lua/isPlayerControlOn)(Player player) |

int interior = [getCharActiveInterior](https://wiki.blast.hk/moonloader/lua/getCharActiveInterior)(Ped ped) |

[giveNonPlayerCarNitro](https://wiki.blast.hk/moonloader/lua/giveNonPlayerCarNitro)(Vehicle car) |

[playerTakeOffGoggles](https://wiki.blast.hk/moonloader/lua/playerTakeOffGoggles)(Player player, bool useAnim) |

[allowFixedCameraCollision](https://wiki.blast.hk/moonloader/lua/allowFixedCameraCollision)(bool allow) |

bool result = [hasCharSpottedCharInFront](https://wiki.blast.hk/moonloader/lua/hasCharSpottedCharInFront)(Ped ped, Ped ped2) |

[forceBigMessageAndCounter](https://wiki.blast.hk/moonloader/lua/forceBigMessageAndCounter)(bool stayOnScreen) |

[setVehicleCameraTweak](https://wiki.blast.hk/moonloader/lua/setVehicleCameraTweak)(Model carModel, float distance, float altitudeMultiplier, float angleX) |

[resetVehicleCameraTweak](https://wiki.blast.hk/moonloader/lua/resetVehicleCameraTweak)() |

[reportMissionAudioEventAtChar](https://wiki.blast.hk/moonloader/lua/reportMissionAudioEventAtChar)(Ped ped, int event) |

bool result = [doesDecisionMakerExist](https://wiki.blast.hk/moonloader/lua/doesDecisionMakerExist)(int maker) |

[ignoreHeightDifferenceFollowingNodes](https://wiki.blast.hk/moonloader/lua/ignoreHeightDifferenceFollowingNodes)(Ped ped, bool ignore) |

[shutAllCharsUp](https://wiki.blast.hk/moonloader/lua/shutAllCharsUp)(bool enable) |

[setCharGetOutUpsideDownCar](https://wiki.blast.hk/moonloader/lua/setCharGetOutUpsideDownCar)(Ped ped, bool canGetOut) |

[reportMissionAudioEventAtCar](https://wiki.blast.hk/moonloader/lua/reportMissionAudioEventAtCar)(Vehicle car, int event) |

[doWeaponStuffAtStartOf2pGame](https://wiki.blast.hk/moonloader/lua/doWeaponStuffAtStartOf2pGame)() |

bool result = [hasGameJustReturnedFromFrontend](https://wiki.blast.hk/moonloader/lua/hasGameJustReturnedFromFrontend)() |

int language = [getCurrentLanguage](https://wiki.blast.hk/moonloader/lua/getCurrentLanguage)() |

bool result = [isObjectIntersectingWorld](https://wiki.blast.hk/moonloader/lua/isObjectIntersectingWorld)(Object object) |

int width = [getStringWidth](https://wiki.blast.hk/moonloader/lua/getStringWidth)(GxtString gxtString) |

[resetVehicleHydraulics](https://wiki.blast.hk/moonloader/lua/resetVehicleHydraulics)(Vehicle car) |

[setRespawnPointForDurationOfMission](https://wiki.blast.hk/moonloader/lua/setRespawnPointForDurationOfMission)(float posX, float posY, float posZ) |

bool result = [isThisModelACar](https://wiki.blast.hk/moonloader/lua/isThisModelACar)(Model modelId) |

[switchOnGroundSearchlight](https://wiki.blast.hk/moonloader/lua/switchOnGroundSearchlight)(Searchlight searchlight, bool lightsThroughObstacles) |

bool result = [isGangWarFightingGoingOn](https://wiki.blast.hk/moonloader/lua/isGangWarFightingGoingOn)() |

bool result = [isNextStationAllowed](https://wiki.blast.hk/moonloader/lua/isNextStationAllowed)(Vehicle train) |

[skipToNextAllowedStation](https://wiki.blast.hk/moonloader/lua/skipToNextAllowedStation)(Vehicle train) |

int width = [getStringWidthWithNumber](https://wiki.blast.hk/moonloader/lua/getStringWidthWithNumber)(GxtString gxtString, int number) |

[shutCharUpForScriptedSpeech](https://wiki.blast.hk/moonloader/lua/shutCharUpForScriptedSpeech)(Ped ped, bool muted) |

[enableDisabledAttractorsOnObject](https://wiki.blast.hk/moonloader/lua/enableDisabledAttractorsOnObject)(Object object, bool enable) |

[loadSceneInDirection](https://wiki.blast.hk/moonloader/lua/loadSceneInDirection)(float coordX, float coordY, float coordZ, float angle) |

bool result = [isPlayerUsingJetpack](https://wiki.blast.hk/moonloader/lua/isPlayerUsingJetpack)(Player player) |

[clearThisPrintBigNow](https://wiki.blast.hk/moonloader/lua/clearThisPrintBigNow)(int style) |

bool result = [hasLanguageChanged](https://wiki.blast.hk/moonloader/lua/hasLanguageChanged)() |

[incrementIntStatNoMessage](https://wiki.blast.hk/moonloader/lua/incrementIntStatNoMessage)(int stat, int value) |

[setExtraCarColours](https://wiki.blast.hk/moonloader/lua/setExtraCarColours)(Vehicle car, int tertiaryColor, int quaternaryColor) |

int tertiaryColor, int quaternaryColor = [getExtraCarColours](https://wiki.blast.hk/moonloader/lua/getExtraCarColours)(Vehicle car) |

[manageAllPopulation](https://wiki.blast.hk/moonloader/lua/manageAllPopulation)() |

[setNoResprays](https://wiki.blast.hk/moonloader/lua/setNoResprays)(bool enable) |

bool result = [hasCarBeenResprayed](https://wiki.blast.hk/moonloader/lua/hasCarBeenResprayed)(Vehicle car) |

[attachMissionAudioToCar](https://wiki.blast.hk/moonloader/lua/attachMissionAudioToCar)(int audioId, Vehicle car) |

[setHasBeenOwnedForCarGenerator](https://wiki.blast.hk/moonloader/lua/setHasBeenOwnedForCarGenerator)(int generator, bool owned) |

[setUpConversationNodeWithScriptedSpeech](https://wiki.blast.hk/moonloader/lua/setUpConversationNodeWithScriptedSpeech)(GxtString questionGXT, GxtString answerYesGXT, GxtString answerNoGXT, int questionWAV, int answerYesWAV, int answerNoWAV) |

[setAreaName](https://wiki.blast.hk/moonloader/lua/setAreaName)(GxtString gxtString) |

[taskPlayAnimSecondary](https://wiki.blast.hk/moonloader/lua/taskPlayAnimSecondary)(Ped ped, string animation, string IFP, float framedelta, bool loopA, bool lockX, bool lockY, bool lockF, int time) |

bool result = [isCharTouchingChar](https://wiki.blast.hk/moonloader/lua/isCharTouchingChar)(Ped ped, Ped ped2) |

[disableHeliAudio](https://wiki.blast.hk/moonloader/lua/disableHeliAudio)(Vehicle helicopter, bool disable) |

[taskHandGesture](https://wiki.blast.hk/moonloader/lua/taskHandGesture)(Ped ped, Ped ped2) |

[takePhoto](https://wiki.blast.hk/moonloader/lua/takePhoto)(bool unk) |

[incrementFloatStatNoMessage](https://wiki.blast.hk/moonloader/lua/incrementFloatStatNoMessage)(int stat, float value) |

[setPlayerGroupToFollowAlways](https://wiki.blast.hk/moonloader/lua/setPlayerGroupToFollowAlways)(Player player, bool followAlways) |

[improveCarByCheating](https://wiki.blast.hk/moonloader/lua/improveCarByCheating)(Vehicle car, bool affectedByCheats) |

[changeCarColourFromMenu](https://wiki.blast.hk/moonloader/lua/changeCarColourFromMenu)(int panelID, Vehicle car, int colorslot, int activeRow) |

[highlightMenuItem](https://wiki.blast.hk/moonloader/lua/highlightMenuItem)(int panel, int row, bool highlight) |

[setDisableMilitaryZones](https://wiki.blast.hk/moonloader/lua/setDisableMilitaryZones)(bool disable) |

[setCameraPositionUnfixed](https://wiki.blast.hk/moonloader/lua/setCameraPositionUnfixed)(float xAngle, float zAngle) |

[setRadioToPlayersFavouriteStation](https://wiki.blast.hk/moonloader/lua/setRadioToPlayersFavouriteStation)() |

[setDeathWeaponsPersist](https://wiki.blast.hk/moonloader/lua/setDeathWeaponsPersist)(Ped ped, bool persist) |

[setCharSwimSpeed](https://wiki.blast.hk/moonloader/lua/setCharSwimSpeed)(Ped ped, float speed) |

bool result = [isPlayerClimbing](https://wiki.blast.hk/moonloader/lua/isPlayerClimbing)(Player player) |

bool result = [isThisHelpMessageBeingDisplayed](https://wiki.blast.hk/moonloader/lua/isThisHelpMessageBeingDisplayed)(GxtString gxtString) |

bool result = [isWidescreenOnInOptions](https://wiki.blast.hk/moonloader/lua/isWidescreenOnInOptions)() |

[drawSubtitlesBeforeFade](https://wiki.blast.hk/moonloader/lua/drawSubtitlesBeforeFade)(bool flag) |

[drawOddjobTitleBeforeFade](https://wiki.blast.hk/moonloader/lua/drawOddjobTitleBeforeFade)(bool flag) |

[taskFollowPathNodesToCoordWithRadius](https://wiki.blast.hk/moonloader/lua/taskFollowPathNodesToCoordWithRadius)(Ped ped, float toX, float toY, float toZ, int mode, int time, float stopRadius) |

[setPhotoCameraEffect](https://wiki.blast.hk/moonloader/lua/setPhotoCameraEffect)(bool firstPersonView) |

[fixCar](https://wiki.blast.hk/moonloader/lua/fixCar)(Vehicle car) |

[setPlayerGroupToFollowNever](https://wiki.blast.hk/moonloader/lua/setPlayerGroupToFollowNever)(Player player, bool neverFollow) |

bool result = [isCharAttachedToAnyCar](https://wiki.blast.hk/moonloader/lua/isCharAttachedToAnyCar)(Ped ped) |

Ped ped = [storeCarCharIsAttachedToNoSave](https://wiki.blast.hk/moonloader/lua/storeCarCharIsAttachedToNoSave)(Vehicle car) |

[setUpSkipForVehicleFinishedByScript](https://wiki.blast.hk/moonloader/lua/setUpSkipForVehicleFinishedByScript)(float posX, float posY, float posZ, float angle, Vehicle car) |

bool result = [isSkipWaitingForScriptToFadeIn](https://wiki.blast.hk/moonloader/lua/isSkipWaitingForScriptToFadeIn)() |

[forceAllVehicleLightsOff](https://wiki.blast.hk/moonloader/lua/forceAllVehicleLightsOff)(bool off) |

int mode = [getPlayerInCarCameraMode](https://wiki.blast.hk/moonloader/lua/getPlayerInCarCameraMode)() |

bool result = [isLastBuildingModelShotByPlayer](https://wiki.blast.hk/moonloader/lua/isLastBuildingModelShotByPlayer)(Player player, Model modelId) |

[clearLastBuildingModelShotByPlayer](https://wiki.blast.hk/moonloader/lua/clearLastBuildingModelShotByPlayer)(Player player) |

[setUpConversationEndNodeWithScriptedSpeech](https://wiki.blast.hk/moonloader/lua/setUpConversationEndNodeWithScriptedSpeech)(GxtString dialogueGxt, int wav) |

[activatePimpCheat](https://wiki.blast.hk/moonloader/lua/activatePimpCheat)(bool enable) |

Ped ped = [getRandomCharInAreaOffsetNoSave](https://wiki.blast.hk/moonloader/lua/getRandomCharInAreaOffsetNoSave)(float sphereX, float sphereY, float sphereZ, float radiusX, float radiusY, float radiusZ) |

[setScriptCoopGame](https://wiki.blast.hk/moonloader/lua/setScriptCoopGame)(bool enable) |

Marker marker = [createUser3dMarker](https://wiki.blast.hk/moonloader/lua/createUser3dMarker)(float atX, float atY, float atZ, int color) |

[removeUser3dMarker](https://wiki.blast.hk/moonloader/lua/removeUser3dMarker)(Marker marker) |

[getRidOfPlayerProstitute](https://wiki.blast.hk/moonloader/lua/getRidOfPlayerProstitute)() |

[displayNonMinigameHelpMessages](https://wiki.blast.hk/moonloader/lua/displayNonMinigameHelpMessages)(bool display) |

[setRailtrackResistanceMult](https://wiki.blast.hk/moonloader/lua/setRailtrackResistanceMult)(float tracksFriction) |

[switchObjectBrains](https://wiki.blast.hk/moonloader/lua/switchObjectBrains)(int externalScript, bool canBeStreamedIn) |

[finishSettingUpConversationNoSubtitles](https://wiki.blast.hk/moonloader/lua/finishSettingUpConversationNoSubtitles)() |

[allowPauseInWidescreen](https://wiki.blast.hk/moonloader/lua/allowPauseInWidescreen)(bool enable) |

float x, float y = [getPcMouseMovement](https://wiki.blast.hk/moonloader/lua/getPcMouseMovement)() |

bool result = [isPcUsingJoypad](https://wiki.blast.hk/moonloader/lua/isPcUsingJoypad)() |

bool result = [isMouseUsingVerticalInversion](https://wiki.blast.hk/moonloader/lua/isMouseUsingVerticalInversion)() |

bool result = [startNewCustomScript](https://wiki.blast.hk/moonloader/lua/startNewCustomScript)(zstring filepath, table args) |

[launchCustomMission](https://wiki.blast.hk/moonloader/lua/launchCustomMission)(zstring filepath, table args) |

int handle = [getScmThreadStructNamed](https://wiki.blast.hk/moonloader/lua/getScmThreadStructNamed)(GxtString thread) |

[setCleoSharedVar](https://wiki.blast.hk/moonloader/lua/setCleoSharedVar)(int var, int value) |

int value = [getCleoSharedVar](https://wiki.blast.hk/moonloader/lua/getCleoSharedVar)(int var) |

[sampSpawnPlayer](https://wiki.blast.hk/moonloader/lua/sampSpawnPlayer)() |

uint handle = [sampGetBase](https://wiki.blast.hk/moonloader/lua/sampGetBase)() |

[sampAddChatMessage](https://wiki.blast.hk/moonloader/lua/sampAddChatMessage)(zstring text, uint color) |

[sampSendChat](https://wiki.blast.hk/moonloader/lua/sampSendChat)(zstring text) |

bool result = [isSampAvailable](https://wiki.blast.hk/moonloader/lua/isSampAvailable)() |

[sampRequestClass](https://wiki.blast.hk/moonloader/lua/sampRequestClass)(int class) |

[sampSendScmEvent](https://wiki.blast.hk/moonloader/lua/sampSendScmEvent)(int event, int id, int param1, int param2) |

[sampSetSpecialAction](https://wiki.blast.hk/moonloader/lua/sampSetSpecialAction)(int action) |

[sampSendDeathByPlayer](https://wiki.blast.hk/moonloader/lua/sampSendDeathByPlayer)(int playerId, int reason) |

bool result, Vehicle car = [sampGetCarHandleBySampVehicleId](https://wiki.blast.hk/moonloader/lua/sampGetCarHandleBySampVehicleId)(int id) |

bool result, Ped ped = [sampGetCharHandleBySampPlayerId](https://wiki.blast.hk/moonloader/lua/sampGetCharHandleBySampPlayerId)(int id) |

bool result = [sampIsChatInputActive](https://wiki.blast.hk/moonloader/lua/sampIsChatInputActive)() |

[sampSetSendrate](https://wiki.blast.hk/moonloader/lua/sampSetSendrate)(int type, int rate) |

bool result = [sampIsPlayerConnected](https://wiki.blast.hk/moonloader/lua/sampIsPlayerConnected)(int id) |

uint structPtr = [sampGetPlayerStructPtr](https://wiki.blast.hk/moonloader/lua/sampGetPlayerStructPtr)(int id) |

int health = [sampGetPlayerHealth](https://wiki.blast.hk/moonloader/lua/sampGetPlayerHealth)(int id) |

int armor = [sampGetPlayerArmor](https://wiki.blast.hk/moonloader/lua/sampGetPlayerArmor)(int id) |

[sampSetGamestate](https://wiki.blast.hk/moonloader/lua/sampSetGamestate)(int gamestate) |

[sampDisconnectWithReason](https://wiki.blast.hk/moonloader/lua/sampDisconnectWithReason)(bool timeout) |

[sampSetLocalPlayerName](https://wiki.blast.hk/moonloader/lua/sampSetLocalPlayerName)(zstring name) |

int ping = [sampGetPlayerPing](https://wiki.blast.hk/moonloader/lua/sampGetPlayerPing)(int id) |

bool result, int id = [sampGetPlayerIdByCharHandle](https://wiki.blast.hk/moonloader/lua/sampGetPlayerIdByCharHandle)(Ped ped) |

bool result, int id = [sampGetVehicleIdByCarHandle](https://wiki.blast.hk/moonloader/lua/sampGetVehicleIdByCarHandle)(Vehicle car) |

bool result, float posX, float posY, float posZ = [sampGetStreamedOutPlayerPos](https://wiki.blast.hk/moonloader/lua/sampGetStreamedOutPlayerPos)(int id) |

[sampSendEnterVehicle](https://wiki.blast.hk/moonloader/lua/sampSendEnterVehicle)(int id, bool passenger) |

[sampSendExitVehicle](https://wiki.blast.hk/moonloader/lua/sampSendExitVehicle)(int id) |

[sampSendSpawn](https://wiki.blast.hk/moonloader/lua/sampSendSpawn)() |

[sampSendDamageVehicle](https://wiki.blast.hk/moonloader/lua/sampSendDamageVehicle)(Vehicle car, int panel, int doors, int lights, int tires) |

bool result = [sampRegisterChatCommand](https://wiki.blast.hk/moonloader/lua/sampRegisterChatCommand)(zstring cmd, function func) |

zstring name = [sampGetPlayerNickname](https://wiki.blast.hk/moonloader/lua/sampGetPlayerNickname)(int id) |

uint color = [sampGetPlayerColor](https://wiki.blast.hk/moonloader/lua/sampGetPlayerColor)(int id) |

[sampConnectToServer](https://wiki.blast.hk/moonloader/lua/sampConnectToServer)(zstring ip, uint port) |

zstring ip, uint port = [sampGetCurrentServerAddress](https://wiki.blast.hk/moonloader/lua/sampGetCurrentServerAddress)() |

zstring name = [sampGetCurrentServerName](https://wiki.blast.hk/moonloader/lua/sampGetCurrentServerName)() |

[sampShowDialog](https://wiki.blast.hk/moonloader/lua/sampShowDialog)(int id, zstring caption, zstring text, zstring button1, zstring button2, int style) |

bool result, int button, int list, zstring input = [sampHasDialogRespond](https://wiki.blast.hk/moonloader/lua/sampHasDialogRespond)(int id) |

Bitstream bs = [raknetNewBitStream](https://wiki.blast.hk/moonloader/lua/raknetNewBitStream)() |

[raknetDeleteBitStream](https://wiki.blast.hk/moonloader/lua/raknetDeleteBitStream)(Bitstream bs) |

[raknetResetBitStream](https://wiki.blast.hk/moonloader/lua/raknetResetBitStream)(Bitstream bs) |

[raknetBitStreamWriteBool](https://wiki.blast.hk/moonloader/lua/raknetBitStreamWriteBool)(Bitstream bs, bool value) |

[raknetBitStreamWriteInt8](https://wiki.blast.hk/moonloader/lua/raknetBitStreamWriteInt8)(Bitstream bs, int value) |

[raknetBitStreamWriteInt16](https://wiki.blast.hk/moonloader/lua/raknetBitStreamWriteInt16)(Bitstream bs, int value) |

[raknetBitStreamWriteInt32](https://wiki.blast.hk/moonloader/lua/raknetBitStreamWriteInt32)(Bitstream bs, int value) |

[raknetBitStreamWriteFloat](https://wiki.blast.hk/moonloader/lua/raknetBitStreamWriteFloat)(Bitstream bs, float value) |

[raknetBitStreamWriteBuffer](https://wiki.blast.hk/moonloader/lua/raknetBitStreamWriteBuffer)(Bitstream bs, uint dest, uint size) |

[raknetBitStreamWriteBitStream](https://wiki.blast.hk/moonloader/lua/raknetBitStreamWriteBitStream)(Bitstream bs, Bitstream bitStream) |

[raknetBitStreamWriteString](https://wiki.blast.hk/moonloader/lua/raknetBitStreamWriteString)(Bitstream bs, string str) |

[raknetSendRpcEx](https://wiki.blast.hk/moonloader/lua/raknetSendRpcEx)(int rpc, Bitstream bs, int priority, int reliability, int channel, bool timestamp) |

[raknetSendBitStreamEx](https://wiki.blast.hk/moonloader/lua/raknetSendBitStreamEx)(Bitstream bs, int priority, int reliability, int channel) |

int textlabel = [sampCreate3dText](https://wiki.blast.hk/moonloader/lua/sampCreate3dText)(zstring text, uint color, float posX, float posY, float posZ, float distance, bool ignoreWalls, int playerId, int vehicleId) |

[sampDestroy3dText](https://wiki.blast.hk/moonloader/lua/sampDestroy3dText)(int textlabel) |

bool result = [sampIs3dTextDefined](https://wiki.blast.hk/moonloader/lua/sampIs3dTextDefined)(int 3dText) |

[sampCloseCurrentDialogWithButton](https://wiki.blast.hk/moonloader/lua/sampCloseCurrentDialogWithButton)(int button) |

int list = [sampGetCurrentDialogListItem](https://wiki.blast.hk/moonloader/lua/sampGetCurrentDialogListItem)() |

[sampSetCurrentDialogListItem](https://wiki.blast.hk/moonloader/lua/sampSetCurrentDialogListItem)(int list) |

zstring text = [sampGetCurrentDialogEditboxText](https://wiki.blast.hk/moonloader/lua/sampGetCurrentDialogEditboxText)() |

[sampSetCurrentDialogEditboxText](https://wiki.blast.hk/moonloader/lua/sampSetCurrentDialogEditboxText)(zstring text) |

bool result = [sampIsDialogActive](https://wiki.blast.hk/moonloader/lua/sampIsDialogActive)() |

int type = [sampGetCurrentDialogType](https://wiki.blast.hk/moonloader/lua/sampGetCurrentDialogType)() |

int id = [sampGetCurrentDialogId](https://wiki.blast.hk/moonloader/lua/sampGetCurrentDialogId)() |

int gamestate = [sampGetGamestate](https://wiki.blast.hk/moonloader/lua/sampGetGamestate)() |

Object object = [sampGetObjectHandleBySampId](https://wiki.blast.hk/moonloader/lua/sampGetObjectHandleBySampId)(int id) |

Pickup pickup = [sampGetPickupHandleBySampId](https://wiki.blast.hk/moonloader/lua/sampGetPickupHandleBySampId)(int id) |

int objectId = [sampGetObjectSampIdByHandle](https://wiki.blast.hk/moonloader/lua/sampGetObjectSampIdByHandle)(Object object) |

int pickupId = [sampGetPickupSampIdByHandle](https://wiki.blast.hk/moonloader/lua/sampGetPickupSampIdByHandle)(Pickup pickup) |

int count = [sampGetListboxItemsCount](https://wiki.blast.hk/moonloader/lua/sampGetListboxItemsCount)() |

int animid = [sampGetPlayerAnimationId](https://wiki.blast.hk/moonloader/lua/sampGetPlayerAnimationId)(int playerId) |

zstring file, zstring name = [sampGetAnimationNameAndFile](https://wiki.blast.hk/moonloader/lua/sampGetAnimationNameAndFile)(int animid) |

int id = [sampFindAnimationIdByNameAndFile](https://wiki.blast.hk/moonloader/lua/sampFindAnimationIdByNameAndFile)(zstring name, zstring file) |

int resX, int resY = [getScreenResolution](https://wiki.blast.hk/moonloader/lua/getScreenResolution)() |

zstring text = [sampGetListboxItemText](https://wiki.blast.hk/moonloader/lua/sampGetListboxItemText)(int item) |

bool result = [sampIsPlayerPaused](https://wiki.blast.hk/moonloader/lua/sampIsPlayerPaused)(int id) |

[sampToggleCursor](https://wiki.blast.hk/moonloader/lua/sampToggleCursor)(bool show) |

bool result = [sampIsLocalPlayerSpawned](https://wiki.blast.hk/moonloader/lua/sampIsLocalPlayerSpawned)() |

int action = [sampGetPlayerSpecialAction](https://wiki.blast.hk/moonloader/lua/sampGetPlayerSpecialAction)(int id) |

bool result = [sampUnregisterChatCommand](https://wiki.blast.hk/moonloader/lua/sampUnregisterChatCommand)(zstring cmd) |

bool result = [sampIsPlayerNpc](https://wiki.blast.hk/moonloader/lua/sampIsPlayerNpc)(int id) |

int score = [sampGetPlayerScore](https://wiki.blast.hk/moonloader/lua/sampGetPlayerScore)(int id) |

[sampSetChatString](https://wiki.blast.hk/moonloader/lua/sampSetChatString)(int id, zstring text, zstring prefix, uint color, uint pcolor) |

zstring text, zstring prefix, uint color, uint pcolor = [sampGetChatString](https://wiki.blast.hk/moonloader/lua/sampGetChatString)(int id) |

[sampSetChatInputText](https://wiki.blast.hk/moonloader/lua/sampSetChatInputText)(zstring text) |

zstring text = [sampGetChatInputText](https://wiki.blast.hk/moonloader/lua/sampGetChatInputText)() |

[sampfuncsLog](https://wiki.blast.hk/moonloader/lua/sampfuncsLog)(zstring msg) |

[sampSetChatInputEnabled](https://wiki.blast.hk/moonloader/lua/sampSetChatInputEnabled)(bool enabled) |

uint rakclientPtr = [sampGetRakclientInterface](https://wiki.blast.hk/moonloader/lua/sampGetRakclientInterface)() |

uint rakpeer = [sampGetRakpeer](https://wiki.blast.hk/moonloader/lua/sampGetRakpeer)() |

uint address = [sampGetRakclientFuncAddressByIndex](https://wiki.blast.hk/moonloader/lua/sampGetRakclientFuncAddressByIndex)(int index) |

uint callbackAddress = [sampGetRpcCallbackByRpcId](https://wiki.blast.hk/moonloader/lua/sampGetRpcCallbackByRpcId)(int index) |

uint node = [sampGetRpcNodeByRpcId](https://wiki.blast.hk/moonloader/lua/sampGetRpcNodeByRpcId)(int index) |

uint sampPtr = [sampGetSampInfoPtr](https://wiki.blast.hk/moonloader/lua/sampGetSampInfoPtr)() |

DxutDialog dialog = [dxutCreateDialog](https://wiki.blast.hk/moonloader/lua/dxutCreateDialog)(zstring name) |

bool result, int event, int id = [dxutPopEvent](https://wiki.blast.hk/moonloader/lua/dxutPopEvent)(DxutDialog dialog) |

[dxutAddButton](https://wiki.blast.hk/moonloader/lua/dxutAddButton)(DxutDialog dialog, int id, zstring text, int posX, int posY, int sizeX, int sizeY) |

[dxutAddCheckbox](https://wiki.blast.hk/moonloader/lua/dxutAddCheckbox)(DxutDialog dialog, int id, zstring text, int posX, int posY, int sizeX, int sizeY) |

[dxutSetDialogPos](https://wiki.blast.hk/moonloader/lua/dxutSetDialogPos)(DxutDialog dialog, int posX, int posY, int sizeX, int sizeY) |

int posX, int posY, int sizeX, int sizeY = [dxutGetDialogPosAndSize](https://wiki.blast.hk/moonloader/lua/dxutGetDialogPosAndSize)(DxutDialog dialog) |

[dxutSetDialogVisible](https://wiki.blast.hk/moonloader/lua/dxutSetDialogVisible)(DxutDialog dialog, bool visible) |

bool result = [dxutIsDialogVisible](https://wiki.blast.hk/moonloader/lua/dxutIsDialogVisible)(DxutDialog dialog) |

[dxutAddEditbox](https://wiki.blast.hk/moonloader/lua/dxutAddEditbox)(DxutDialog dialog, int id, zstring text, int posX, int posY, int sizeX, int sizeY) |

zstring text = [dxutGetControlText](https://wiki.blast.hk/moonloader/lua/dxutGetControlText)(DxutDialog dialog, int id) |

[raknetSendRpc](https://wiki.blast.hk/moonloader/lua/raknetSendRpc)(int rpc, Bitstream bs) |

[raknetSendBitStream](https://wiki.blast.hk/moonloader/lua/raknetSendBitStream)(Bitstream bs) |

bool result = [sampIsCursorActive](https://wiki.blast.hk/moonloader/lua/sampIsCursorActive)() |

[sampSetCursorMode](https://wiki.blast.hk/moonloader/lua/sampSetCursorMode)(int mode) |

int mode = [sampGetCursorMode](https://wiki.blast.hk/moonloader/lua/sampGetCursorMode)() |

[dxutSetControlVisible](https://wiki.blast.hk/moonloader/lua/dxutSetControlVisible)(DxutDialog dialog, int id, bool visible) |

[dxutAddStatic](https://wiki.blast.hk/moonloader/lua/dxutAddStatic)(DxutDialog dialog, int id, zstring text, int posX, int posY, int sizeX, int sizeY) |

bool result = [dxutIsCheckboxChecked](https://wiki.blast.hk/moonloader/lua/dxutIsCheckboxChecked)(DxutDialog dialog, int id) |

[dxutSetDialogBackgroundColor](https://wiki.blast.hk/moonloader/lua/dxutSetDialogBackgroundColor)(DxutDialog dialog, uint color) |

[dxutSetControlText](https://wiki.blast.hk/moonloader/lua/dxutSetControlText)(DxutDialog dialog, int id, zstring text) |

bool result = [dxutControlIsVisible](https://wiki.blast.hk/moonloader/lua/dxutControlIsVisible)(DxutDialog dialog, int id) |

[dxutAddSlider](https://wiki.blast.hk/moonloader/lua/dxutAddSlider)(DxutDialog dialog, int id, int posX, int posY, int sizeX, int sizeY, int max) |

int value = [dxutGetSliderValue](https://wiki.blast.hk/moonloader/lua/dxutGetSliderValue)(DxutDialog dialog, int id) |

[dxutSetSliderValue](https://wiki.blast.hk/moonloader/lua/dxutSetSliderValue)(DxutDialog dialog, int id, int value) |

[dxutAddListbox](https://wiki.blast.hk/moonloader/lua/dxutAddListbox)(DxutDialog dialog, int id, int posX, int posY, int sizeX, int sizeY) |

[dxutListboxInsertItem](https://wiki.blast.hk/moonloader/lua/dxutListboxInsertItem)(DxutDialog dialog, int id, zstring element, uint data, int after) |

int element, int count = [dxutGetListboxSelectedItemAndCount](https://wiki.blast.hk/moonloader/lua/dxutGetListboxSelectedItemAndCount)(DxutDialog dialog, int id) |

[dxutListboxDeleteItem](https://wiki.blast.hk/moonloader/lua/dxutListboxDeleteItem)(DxutDialog dialog, int id, int element) |

zstring text, uint data = [dxutGetListboxItemTextAndData](https://wiki.blast.hk/moonloader/lua/dxutGetListboxItemTextAndData)(DxutDialog dialog, int id, int element) |

[dxutCheckboxSetChecked](https://wiki.blast.hk/moonloader/lua/dxutCheckboxSetChecked)(DxutDialog dialog, int id, bool checked) |

[dxutEnableDialogCaption](https://wiki.blast.hk/moonloader/lua/dxutEnableDialogCaption)(DxutDialog dialog, bool enable) |

bool result = [dxutIsDialogCaptionEnabled](https://wiki.blast.hk/moonloader/lua/dxutIsDialogCaptionEnabled)(DxutDialog dialog) |

[dxutSetDialogMinimized](https://wiki.blast.hk/moonloader/lua/dxutSetDialogMinimized)(DxutDialog dialog, bool minimized) |

bool result = [dxutIsDialogMinimized](https://wiki.blast.hk/moonloader/lua/dxutIsDialogMinimized)(DxutDialog dialog) |

[dxutDeleteControl](https://wiki.blast.hk/moonloader/lua/dxutDeleteControl)(DxutDialog dialog, int id) |

[dxutDeleteDialog](https://wiki.blast.hk/moonloader/lua/dxutDeleteDialog)(DxutDialog dialog) |

[dxutSetFocusOnControl](https://wiki.blast.hk/moonloader/lua/dxutSetFocusOnControl)(DxutDialog dialog, int id) |

[dxutSetControlSize](https://wiki.blast.hk/moonloader/lua/dxutSetControlSize)(DxutDialog dialog, int id, int sizeX, int sizeY) |

int sizeX, int sizeY = [dxutGetControlSize](https://wiki.blast.hk/moonloader/lua/dxutGetControlSize)(DxutDialog dialog, int id) |

[dxutSetControlPos](https://wiki.blast.hk/moonloader/lua/dxutSetControlPos)(DxutDialog dialog, int id, int posX, int posY) |

int posX, int posY = [dxutGetControlPos](https://wiki.blast.hk/moonloader/lua/dxutGetControlPos)(DxutDialog dialog, int id) |

[dxutSetCheckboxColor](https://wiki.blast.hk/moonloader/lua/dxutSetCheckboxColor)(DxutDialog dialog, int id, uint color) |

bool result = [dxutIsDialogExists](https://wiki.blast.hk/moonloader/lua/dxutIsDialogExists)(DxutDialog dialog) |

uint settingsPtr = [sampGetServerSettingsPtr](https://wiki.blast.hk/moonloader/lua/sampGetServerSettingsPtr)() |

uint poolsPtr = [sampGetSampPoolsPtr](https://wiki.blast.hk/moonloader/lua/sampGetSampPoolsPtr)() |

uint chatPtr = [sampGetChatInfoPtr](https://wiki.blast.hk/moonloader/lua/sampGetChatInfoPtr)() |

uint inputPtr = [sampGetInputInfoPtr](https://wiki.blast.hk/moonloader/lua/sampGetInputInfoPtr)() |

uint dialogPtr = [sampGetDialogInfoPtr](https://wiki.blast.hk/moonloader/lua/sampGetDialogInfoPtr)() |

uint kill = [sampGetKillInfoPtr](https://wiki.blast.hk/moonloader/lua/sampGetKillInfoPtr)() |

uint miscPtr = [sampGetMiscInfoPtr](https://wiki.blast.hk/moonloader/lua/sampGetMiscInfoPtr)() |

uint tdpoolPtr = [sampGetTextdrawPoolPtr](https://wiki.blast.hk/moonloader/lua/sampGetTextdrawPoolPtr)() |

int objpoolPtr = [sampGetObjectPoolPtr](https://wiki.blast.hk/moonloader/lua/sampGetObjectPoolPtr)() |

uint gzpoolPtr = [sampGetGangzonePoolPtr](https://wiki.blast.hk/moonloader/lua/sampGetGangzonePoolPtr)() |

uint tlabelpoolPtr = [sampGetTextlabelPoolPtr](https://wiki.blast.hk/moonloader/lua/sampGetTextlabelPoolPtr)() |

uint playerpoolPtr = [sampGetPlayerPoolPtr](https://wiki.blast.hk/moonloader/lua/sampGetPlayerPoolPtr)() |

uint vehpoolPtr = [sampGetVehiclePoolPtr](https://wiki.blast.hk/moonloader/lua/sampGetVehiclePoolPtr)() |

uint pickuppoolPtr = [sampGetPickupPoolPtr](https://wiki.blast.hk/moonloader/lua/sampGetPickupPoolPtr)() |

[sampStorePlayerOnfootData](https://wiki.blast.hk/moonloader/lua/sampStorePlayerOnfootData)(int id, uint dstBuffer) |

[sampStorePlayerIncarData](https://wiki.blast.hk/moonloader/lua/sampStorePlayerIncarData)(int id, uint dstBuffer) |

[sampStorePlayerPassengerData](https://wiki.blast.hk/moonloader/lua/sampStorePlayerPassengerData)(int id, uint dstBuffer) |

[sampStorePlayerTrailerData](https://wiki.blast.hk/moonloader/lua/sampStorePlayerTrailerData)(int id, uint dstBuffer) |

[sampStorePlayerAimData](https://wiki.blast.hk/moonloader/lua/sampStorePlayerAimData)(int id, uint dstBuffer) |

[sampSendRconCommand](https://wiki.blast.hk/moonloader/lua/sampSendRconCommand)(zstring cmd) |

[sampSendOnfootData](https://wiki.blast.hk/moonloader/lua/sampSendOnfootData)(uint dataPtr) |

[sampSendIncarData](https://wiki.blast.hk/moonloader/lua/sampSendIncarData)(uint dataPtr) |

[sampSendPassengerData](https://wiki.blast.hk/moonloader/lua/sampSendPassengerData)(uint dataPtr) |

[sampSendAimData](https://wiki.blast.hk/moonloader/lua/sampSendAimData)(uint dataPtr) |

[sampSendBulletData](https://wiki.blast.hk/moonloader/lua/sampSendBulletData)(uint dataPtr) |

[sampSendTrailerData](https://wiki.blast.hk/moonloader/lua/sampSendTrailerData)(uint dataPtr) |

[sampSendUnoccupiedData](https://wiki.blast.hk/moonloader/lua/sampSendUnoccupiedData)(uint dataPtr) |

[sampSendSpectatorData](https://wiki.blast.hk/moonloader/lua/sampSendSpectatorData)(uint dataPtr) |

[sampSendClickPlayer](https://wiki.blast.hk/moonloader/lua/sampSendClickPlayer)(int id, int source) |

[sampSendDialogResponse](https://wiki.blast.hk/moonloader/lua/sampSendDialogResponse)(int id, int button, int listitem, zstring input) |

[sampSendClickTextdraw](https://wiki.blast.hk/moonloader/lua/sampSendClickTextdraw)(int id) |

[sampSendGiveDamage](https://wiki.blast.hk/moonloader/lua/sampSendGiveDamage)(int id, float damage, int weapon, int bodypart) |

[sampSendTakeDamage](https://wiki.blast.hk/moonloader/lua/sampSendTakeDamage)(int id, float damage, int weapon, int bodypart) |

[sampSendEditObject](https://wiki.blast.hk/moonloader/lua/sampSendEditObject)(bool playerObject, int objectId, int response, float posX, float posY, float posZ, float rotX, float rotY, float rotZ) |

[sampSendEditAttachedObject](https://wiki.blast.hk/moonloader/lua/sampSendEditAttachedObject)(int response, int index, int model, int bone, float offsetX, float offsetY, float offsetZ, float rotX, float rotY, float rotZ, float scaleX, float scaleY, float scaleZ) |

[sampSendInteriorChange](https://wiki.blast.hk/moonloader/lua/sampSendInteriorChange)(int id) |

[sampSendRequestSpawn](https://wiki.blast.hk/moonloader/lua/sampSendRequestSpawn)() |

[sampSendPickedUpPickup](https://wiki.blast.hk/moonloader/lua/sampSendPickedUpPickup)(int id) |

[sampSendMenuSelectRow](https://wiki.blast.hk/moonloader/lua/sampSendMenuSelectRow)(int id) |

[sampSendMenuQuit](https://wiki.blast.hk/moonloader/lua/sampSendMenuQuit)() |

[sampSendVehicleDestroyed](https://wiki.blast.hk/moonloader/lua/sampSendVehicleDestroyed)(int id) |

bool result = [sampIsScoreboardOpen](https://wiki.blast.hk/moonloader/lua/sampIsScoreboardOpen)() |

[sampToggleScoreboard](https://wiki.blast.hk/moonloader/lua/sampToggleScoreboard)(bool show) |

zstring text = [sampGetDialogText](https://wiki.blast.hk/moonloader/lua/sampGetDialogText)() |

zstring caption = [sampGetDialogCaption](https://wiki.blast.hk/moonloader/lua/sampGetDialogCaption)() |

[sampSetDialogClientside](https://wiki.blast.hk/moonloader/lua/sampSetDialogClientside)(bool clientside) |

bool result = [sampIsDialogClientside](https://wiki.blast.hk/moonloader/lua/sampIsDialogClientside)() |

bool result = [sampIsChatVisible](https://wiki.blast.hk/moonloader/lua/sampIsChatVisible)() |

int mode = [sampGetChatDisplayMode](https://wiki.blast.hk/moonloader/lua/sampGetChatDisplayMode)() |

[sampSetChatDisplayMode](https://wiki.blast.hk/moonloader/lua/sampSetChatDisplayMode)(int mode) |

[pauseScmThread](https://wiki.blast.hk/moonloader/lua/pauseScmThread)(uint thread) |

[resumeScmThread](https://wiki.blast.hk/moonloader/lua/resumeScmThread)(uint thread) |

bool value = [raknetBitStreamReadBool](https://wiki.blast.hk/moonloader/lua/raknetBitStreamReadBool)(Bitstream bs) |

int value = [raknetBitStreamReadInt8](https://wiki.blast.hk/moonloader/lua/raknetBitStreamReadInt8)(Bitstream bs) |

int value = [raknetBitStreamReadInt16](https://wiki.blast.hk/moonloader/lua/raknetBitStreamReadInt16)(Bitstream bs) |

int value = [raknetBitStreamReadInt32](https://wiki.blast.hk/moonloader/lua/raknetBitStreamReadInt32)(Bitstream bs) |

float value = [raknetBitStreamReadFloat](https://wiki.blast.hk/moonloader/lua/raknetBitStreamReadFloat)(Bitstream bs) |

[raknetBitStreamReadBuffer](https://wiki.blast.hk/moonloader/lua/raknetBitStreamReadBuffer)(Bitstream bs, uint dest, uint size) |

string value = [raknetBitStreamReadString](https://wiki.blast.hk/moonloader/lua/raknetBitStreamReadString)(Bitstream bs, uint size) |

[raknetBitStreamResetReadPointer](https://wiki.blast.hk/moonloader/lua/raknetBitStreamResetReadPointer)(Bitstream bs) |

[raknetBitStreamResetWritePointer](https://wiki.blast.hk/moonloader/lua/raknetBitStreamResetWritePointer)(Bitstream bs) |

[raknetBitStreamIgnoreBits](https://wiki.blast.hk/moonloader/lua/raknetBitStreamIgnoreBits)(Bitstream bs, int amount) |

[raknetBitStreamSetWriteOffset](https://wiki.blast.hk/moonloader/lua/raknetBitStreamSetWriteOffset)(Bitstream bs, int offset) |

[raknetBitStreamSetReadOffset](https://wiki.blast.hk/moonloader/lua/raknetBitStreamSetReadOffset)(Bitstream bs, int offset) |

uint value = [raknetBitStreamGetNumberOfBitsUsed](https://wiki.blast.hk/moonloader/lua/raknetBitStreamGetNumberOfBitsUsed)(Bitstream bs) |

uint value = [raknetBitStreamGetNumberOfBytesUsed](https://wiki.blast.hk/moonloader/lua/raknetBitStreamGetNumberOfBytesUsed)(Bitstream bs) |

uint value = [raknetBitStreamGetNumberOfUnreadBits](https://wiki.blast.hk/moonloader/lua/raknetBitStreamGetNumberOfUnreadBits)(Bitstream bs) |

int value = [raknetBitStreamGetWriteOffset](https://wiki.blast.hk/moonloader/lua/raknetBitStreamGetWriteOffset)(Bitstream bs) |

int value = [raknetBitStreamGetReadOffset](https://wiki.blast.hk/moonloader/lua/raknetBitStreamGetReadOffset)(Bitstream bs) |

uint value = [raknetBitStreamGetDataPtr](https://wiki.blast.hk/moonloader/lua/raknetBitStreamGetDataPtr)(Bitstream bs) |

zstring string = [raknetBitStreamDecodeString](https://wiki.blast.hk/moonloader/lua/raknetBitStreamDecodeString)(Bitstream bs, int size) |

[raknetBitStreamEncodeString](https://wiki.blast.hk/moonloader/lua/raknetBitStreamEncodeString)(Bitstream bs, zstring string) |

[raknetEmulRpcReceiveBitStream](https://wiki.blast.hk/moonloader/lua/raknetEmulRpcReceiveBitStream)(int rpc, Bitstream bs) |

[raknetEmulPacketReceiveBitStream](https://wiki.blast.hk/moonloader/lua/raknetEmulPacketReceiveBitStream)(int packet, Bitstream bs) |

zstring name = [raknetGetRpcName](https://wiki.blast.hk/moonloader/lua/raknetGetRpcName)(int rpc) |

zstring name = [raknetGetPacketName](https://wiki.blast.hk/moonloader/lua/raknetGetPacketName)(int packet) |

bool result = [setSampfuncsGlobalVar](https://wiki.blast.hk/moonloader/lua/setSampfuncsGlobalVar)(zstring var, int value) |

bool result, int value = [getSampfuncsGlobalVar](https://wiki.blast.hk/moonloader/lua/getSampfuncsGlobalVar)(zstring var) |

[sampCreate3dTextEx](https://wiki.blast.hk/moonloader/lua/sampCreate3dTextEx)(int id, zstring text, uint color, float posX, float posY, float posZ, float distance, bool ignoreWalls, int playerId, int vehicleId) |

zstring string, uint color, float posX, float posY, float posZ, float distance, bool ignoreWalls, int playerId, int vehicleId = [sampGet3dTextInfoById](https://wiki.blast.hk/moonloader/lua/sampGet3dTextInfoById)(int id) |

[sampSet3dTextString](https://wiki.blast.hk/moonloader/lua/sampSet3dTextString)(int id, zstring text) |

[sampTextdrawCreate](https://wiki.blast.hk/moonloader/lua/sampTextdrawCreate)(int id, zstring text, float posX, float posY) |

[sampTextdrawSetBoxColorAndSize](https://wiki.blast.hk/moonloader/lua/sampTextdrawSetBoxColorAndSize)(int id, int box, uint color, float sizeX, float sizeY) |

[sampTextdrawSetAlign](https://wiki.blast.hk/moonloader/lua/sampTextdrawSetAlign)(int id, int align) |

[sampTextdrawSetProportional](https://wiki.blast.hk/moonloader/lua/sampTextdrawSetProportional)(int id, int proportional) |

[sampTextdrawSetStyle](https://wiki.blast.hk/moonloader/lua/sampTextdrawSetStyle)(int id, int style) |

[sampTextdrawSetShadow](https://wiki.blast.hk/moonloader/lua/sampTextdrawSetShadow)(int id, int shadow, uint color) |

[sampTextdrawSetOutlineColor](https://wiki.blast.hk/moonloader/lua/sampTextdrawSetOutlineColor)(int id, int outline, uint color) |

[sampTextdrawSetModelRotationZoomVehColor](https://wiki.blast.hk/moonloader/lua/sampTextdrawSetModelRotationZoomVehColor)(int id, int model, float rotX, float rotY, float rotZ, float zoom, int clr1, int clr2) |

[sampTextdrawSetString](https://wiki.blast.hk/moonloader/lua/sampTextdrawSetString)(int id, zstring text) |

[sampTextdrawSetPos](https://wiki.blast.hk/moonloader/lua/sampTextdrawSetPos)(int id, float posX, float posY) |

[sampTextdrawSetLetterSizeAndColor](https://wiki.blast.hk/moonloader/lua/sampTextdrawSetLetterSizeAndColor)(int id, float letSizeX, float letSizeY, uint color) |

int box, uint color, float sizeX, float sizeY = [sampTextdrawGetBoxEnabledColorAndSize](https://wiki.blast.hk/moonloader/lua/sampTextdrawGetBoxEnabledColorAndSize)(int id) |

int align = [sampTextdrawGetAlign](https://wiki.blast.hk/moonloader/lua/sampTextdrawGetAlign)(int id) |

int prop = [sampTextdrawGetProportional](https://wiki.blast.hk/moonloader/lua/sampTextdrawGetProportional)(int id) |

int style = [sampTextdrawGetStyle](https://wiki.blast.hk/moonloader/lua/sampTextdrawGetStyle)(int id) |

int shadow, uint color = [sampTextdrawGetShadowColor](https://wiki.blast.hk/moonloader/lua/sampTextdrawGetShadowColor)(int id) |

int outline, uint color = [sampTextdrawGetOutlineColor](https://wiki.blast.hk/moonloader/lua/sampTextdrawGetOutlineColor)(int id) |

int model, float rotX, float rotY, float rotZ, float zoom, int clr1, int clr2 = [sampTextdrawGetModelRotationZoomVehColor](https://wiki.blast.hk/moonloader/lua/sampTextdrawGetModelRotationZoomVehColor)(int id) |

zstring text = [sampTextdrawGetString](https://wiki.blast.hk/moonloader/lua/sampTextdrawGetString)(int id) |

float posX, float posY = [sampTextdrawGetPos](https://wiki.blast.hk/moonloader/lua/sampTextdrawGetPos)(int id) |

float letSizeX, float letSizeY, uint color = [sampTextdrawGetLetterSizeAndColor](https://wiki.blast.hk/moonloader/lua/sampTextdrawGetLetterSizeAndColor)(int id) |

bool result = [sampTextdrawIsExists](https://wiki.blast.hk/moonloader/lua/sampTextdrawIsExists)(int id) |

[sampTextdrawDelete](https://wiki.blast.hk/moonloader/lua/sampTextdrawDelete)(int id) |

bool result = [isSampfuncsGlobalVarDefined](https://wiki.blast.hk/moonloader/lua/isSampfuncsGlobalVarDefined)(zstring var) |

bool read, bool write = [getSampfuncsGlobalVarAccessForThread](https://wiki.blast.hk/moonloader/lua/getSampfuncsGlobalVarAccessForThread)(zstring var, uint thread) |

[runSampfuncsConsoleCommand](https://wiki.blast.hk/moonloader/lua/runSampfuncsConsoleCommand)(zstring cmd) |

bool result = [sampfuncsRegisterConsoleCommand](https://wiki.blast.hk/moonloader/lua/sampfuncsRegisterConsoleCommand)(zstring cmd, function func) |

bool result = [sampfuncsUnregisterConsoleCommand](https://wiki.blast.hk/moonloader/lua/sampfuncsUnregisterConsoleCommand)(zstring cmd) |

uint thread = [createScmThreadAtPointer](https://wiki.blast.hk/moonloader/lua/createScmThreadAtPointer)(uint pointer, table args) |

[setScmThreadLocalVar](https://wiki.blast.hk/moonloader/lua/setScmThreadLocalVar)(uint thread, int var, any value) |

int value = [getScmThreadLocalVar](https://wiki.blast.hk/moonloader/lua/getScmThreadLocalVar)(uint thread, int var) |

[destroyScmThread](https://wiki.blast.hk/moonloader/lua/destroyScmThread)(uint thread) |

[restartScmThread](https://wiki.blast.hk/moonloader/lua/restartScmThread)(uint thread, table args) |

bool result = [isSampfuncsConsoleActive](https://wiki.blast.hk/moonloader/lua/isSampfuncsConsoleActive)() |

[sampSetClientCommandDescription](https://wiki.blast.hk/moonloader/lua/sampSetClientCommandDescription)(zstring cmd, zstring text) |

[setSampfuncsConsoleCommandDescription](https://wiki.blast.hk/moonloader/lua/setSampfuncsConsoleCommandDescription)(zstring cmd, zstring text) |

[sampForceVehicleSync](https://wiki.blast.hk/moonloader/lua/sampForceVehicleSync)(int id) |

[sampForceUnoccupiedSyncSeatId](https://wiki.blast.hk/moonloader/lua/sampForceUnoccupiedSyncSeatId)(int id, int seatId) |

[sampForceOnfootSync](https://wiki.blast.hk/moonloader/lua/sampForceOnfootSync)() |

[sampForceAimSync](https://wiki.blast.hk/moonloader/lua/sampForceAimSync)() |

[sampForceTrailerSync](https://wiki.blast.hk/moonloader/lua/sampForceTrailerSync)(int id) |

[sampForcePassengerSyncSeatId](https://wiki.blast.hk/moonloader/lua/sampForcePassengerSyncSeatId)(int id, int seatId) |

[sampForceStatsSync](https://wiki.blast.hk/moonloader/lua/sampForceStatsSync)() |

[sampForceWeaponsSync](https://wiki.blast.hk/moonloader/lua/sampForceWeaponsSync)() |

int id = [sampGetMaxPlayerId](https://wiki.blast.hk/moonloader/lua/sampGetMaxPlayerId)(bool streamed) |

int count = [sampGetPlayerCount](https://wiki.blast.hk/moonloader/lua/sampGetPlayerCount)(bool streamed) |

[sampProcessChatInput](https://wiki.blast.hk/moonloader/lua/sampProcessChatInput)(zstring text) |

bool result = [sampIsChatCommandDefined](https://wiki.blast.hk/moonloader/lua/sampIsChatCommandDefined)(zstring cmd) |

bool result = [isSampfuncsConsoleCommandDefined](https://wiki.blast.hk/moonloader/lua/isSampfuncsConsoleCommandDefined)(zstring cmd) |

int version = [getCleoLibraryVersion](https://wiki.blast.hk/moonloader/lua/getCleoLibraryVersion)() |

[main](https://wiki.blast.hk/moonloader/lua/main)() |

[onExitScript](https://wiki.blast.hk/moonloader/lua/onExitScript)(bool quitGame) |

[onQuitGame](https://wiki.blast.hk/moonloader/lua/onQuitGame)() |

[onScriptLoad](https://wiki.blast.hk/moonloader/lua/onScriptLoad)(LuaScript s) |

[onScriptTerminate](https://wiki.blast.hk/moonloader/lua/onScriptTerminate)(LuaScript s, bool quitGame) |

[onSystemInitialized](https://wiki.blast.hk/moonloader/lua/onSystemInitialized)() |

[onScriptMessage](https://wiki.blast.hk/moonloader/lua/onScriptMessage)(string msg, LuaScript s) |

[onSystemMessage](https://wiki.blast.hk/moonloader/lua/onSystemMessage)(string msg, int type, LuaScript s) |

bool process=true, int id, bitstream bitStream = [onReceivePacket](https://wiki.blast.hk/moonloader/lua/onReceivePacket)(int id, bitstream bitStream) |

bool process=true, int id, bitstream bitStream = [onReceiveRpc](https://wiki.blast.hk/moonloader/lua/onReceiveRpc)(int id, bitstream bitStream) |

bool process=true, int id, bitstream bitStream, int priority, int reliability, int orderingChannel = [onSendPacket](https://wiki.blast.hk/moonloader/lua/onSendPacket)(int id, bitstream bitStream, int priority, int reliability, int orderingChannel) |

bool process=true, int id, bitstream bitStream, int priority, int reliability, int orderingChannel, bool shiftTs = [onSendRpc](https://wiki.blast.hk/moonloader/lua/onSendRpc)(int id, bitstream bitStream, int priority, int reliability, int orderingChannel, bool shiftTs) |

[onWindowMessage](https://wiki.blast.hk/moonloader/lua/onWindowMessage)(uint msg, uint wparam, int lparam) |

[onStartNewGame](https://wiki.blast.hk/moonloader/lua/onStartNewGame)(int mpack) |

[onLoadGame](https://wiki.blast.hk/moonloader/lua/onLoadGame)(table saveData) |

table newSaveData = [onSaveGame](https://wiki.blast.hk/moonloader/lua/onSaveGame)(table saveData) |

Ped [PLAYER_PED](https://wiki.blast.hk/moonloader/lua/PLAYER_PED) |

Player [PLAYER_HANDLE](https://wiki.blast.hk/moonloader/lua/PLAYER_HANDLE) |

Ped [playerPed](https://wiki.blast.hk/moonloader/lua/PLAYER_PED) |

Player [playerHandle](https://wiki.blast.hk/moonloader/lua/PLAYER_HANDLE) |
