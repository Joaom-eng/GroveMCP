# Таблица соответствия опкодов | Modding Wiki

Fonte: https://wiki.blast.hk/moonloader/opcodes

Почти все возможности взаимодействия с игрой в MoonLoader реализованы посредством эмуляции опкодов, которые используются в игре для программирования миссий. Многие опкоды не вошли в релиз MoonLoader с самой первой версии, часть вошедших опкодов позже была заменена встроенными реализациями в обновлениях.
 Следующая таблица содержит все опкоды игры, где каждому опкоду соответствует его аналог в Lua и комментарий о различиях или причинах отсутствия.
 Отсутствие пояснения к опкоду в третьей колонке означает, что Lua функция напрямую эмулирует опкод игры без каких-либо изменений в поведении.

Опкод |  Lua |  Пояснение |

[0000](https://wiki.blast.hk/gta-sa/opcodes/0000) |   |  [1] |

[0001](https://wiki.blast.hk/gta-sa/opcodes/0001) |  [wait](https://wiki.blast.hk/moonloader/lua/wait)(int time) |  [2] |

[0003](https://wiki.blast.hk/gta-sa/opcodes/0003) |  [shakeCam](https://wiki.blast.hk/moonloader/lua/shakeCam)(int shake) |   |

[0052](https://wiki.blast.hk/gta-sa/opcodes/0052) |   |  [1:1] |

[0053](https://wiki.blast.hk/gta-sa/opcodes/0053) |  Player player = [createPlayer](https://wiki.blast.hk/moonloader/lua/createPlayer)(Model modelId, float atX, float atY, float atZ) |   |

[0092](https://wiki.blast.hk/gta-sa/opcodes/0092) |   |  [3] |

[0093](https://wiki.blast.hk/gta-sa/opcodes/0093) |   |  [3:1] |

[0094](https://wiki.blast.hk/gta-sa/opcodes/0094) |  `math.abs` |  [2:1] |

[0095](https://wiki.blast.hk/gta-sa/opcodes/0095) |  `math.abs` |  [2:2] |

[0096](https://wiki.blast.hk/gta-sa/opcodes/0096) |  `math.abs` |  [2:3] |

[0097](https://wiki.blast.hk/gta-sa/opcodes/0097) |  `math.abs` |  [2:4] |

[0098](https://wiki.blast.hk/gta-sa/opcodes/0098) |  `math.random` |  [2:5] |

[0099](https://wiki.blast.hk/gta-sa/opcodes/0099) |  `math.random` |  [2:6] |

[009A](https://wiki.blast.hk/gta-sa/opcodes/009A) |  Ped ped = [createChar](https://wiki.blast.hk/moonloader/lua/createChar)(int pedtype, Model modelId, float atX, float atY, float atZ) |   |

[009B](https://wiki.blast.hk/gta-sa/opcodes/009B) |  [deleteChar](https://wiki.blast.hk/moonloader/lua/deleteChar)(Ped ped) |   |

[00A0](https://wiki.blast.hk/gta-sa/opcodes/00A0) |  float positionX, float positionY, float positionZ = [getCharCoordinates](https://wiki.blast.hk/moonloader/lua/getCharCoordinates)(Ped ped) |   |

[00A1](https://wiki.blast.hk/gta-sa/opcodes/00A1) |  [setCharCoordinates](https://wiki.blast.hk/moonloader/lua/setCharCoordinates)(Ped ped, float posX, float posY, float posZ) |   |

[00A3](https://wiki.blast.hk/gta-sa/opcodes/00A3) |  bool result = [isCharInArea2d](https://wiki.blast.hk/moonloader/lua/isCharInArea2d)(Ped ped, float cornerAX, float cornerAY, float cornerBX, float cornerBY, bool sphere) |   |

[00A4](https://wiki.blast.hk/gta-sa/opcodes/00A4) |  bool result = [isCharInArea3d](https://wiki.blast.hk/moonloader/lua/isCharInArea3d)(Ped ped, float cornerAX, float cornerAY, float cornerAZ, float cornerBX, float cornerBY, float cornerBZ, bool sphere) |   |

[00A5](https://wiki.blast.hk/gta-sa/opcodes/00A5) |  Vehicle car = [createCar](https://wiki.blast.hk/moonloader/lua/createCar)(Model modelId, float atX, float atY, float atZ) |   |

[00A6](https://wiki.blast.hk/gta-sa/opcodes/00A6) |  [deleteCar](https://wiki.blast.hk/moonloader/lua/deleteCar)(Vehicle car) |   |

[00A7](https://wiki.blast.hk/gta-sa/opcodes/00A7) |  [carGotoCoordinates](https://wiki.blast.hk/moonloader/lua/carGotoCoordinates)(Vehicle car, float driveToX, float driveToY, float driveToZ) |   |

[00A8](https://wiki.blast.hk/gta-sa/opcodes/00A8) |  [carWanderRandomly](https://wiki.blast.hk/moonloader/lua/carWanderRandomly)(Vehicle car) |   |

[00A9](https://wiki.blast.hk/gta-sa/opcodes/00A9) |  [carSetIdle](https://wiki.blast.hk/moonloader/lua/carSetIdle)(Vehicle car) |   |

[00AA](https://wiki.blast.hk/gta-sa/opcodes/00AA) |  float positionX, float positionY, float positionZ = [getCarCoordinates](https://wiki.blast.hk/moonloader/lua/getCarCoordinates)(Vehicle car) |   |

[00AB](https://wiki.blast.hk/gta-sa/opcodes/00AB) |  [setCarCoordinates](https://wiki.blast.hk/moonloader/lua/setCarCoordinates)(Vehicle car, float atX, float atY, float atZ) |   |

[00AD](https://wiki.blast.hk/gta-sa/opcodes/00AD) |  [setCarCruiseSpeed](https://wiki.blast.hk/moonloader/lua/setCarCruiseSpeed)(Vehicle car, float maxSpeed) |   |

[00AE](https://wiki.blast.hk/gta-sa/opcodes/00AE) |  [setCarDrivingStyle](https://wiki.blast.hk/moonloader/lua/setCarDrivingStyle)(Vehicle car, int behaviour) |   |

[00AF](https://wiki.blast.hk/gta-sa/opcodes/00AF) |  [setCarMission](https://wiki.blast.hk/moonloader/lua/setCarMission)(Vehicle car, int driverBehaviour) |   |

[00B0](https://wiki.blast.hk/gta-sa/opcodes/00B0) |  bool result = [isCarInArea2d](https://wiki.blast.hk/moonloader/lua/isCarInArea2d)(Vehicle car, float cornerAX, float cornerAY, float cornerBX, float cornerBY, bool sphere) |   |

[00B1](https://wiki.blast.hk/gta-sa/opcodes/00B1) |  bool result = [isCarInArea3d](https://wiki.blast.hk/moonloader/lua/isCarInArea3d)(Vehicle car, float cornerAX, float cornerAY, float cornerAZ, float cornerBX, float cornerBY, float cornerBZ, bool sphere) |   |

[00BA](https://wiki.blast.hk/gta-sa/opcodes/00BA) |  [printBig](https://wiki.blast.hk/moonloader/lua/printBig)(GxtString gxtString, int time, int style) |   |

[00BB](https://wiki.blast.hk/gta-sa/opcodes/00BB) |  [printText](https://wiki.blast.hk/moonloader/lua/printText)(GxtString gxtString, int time, int flag) |   |

[00BC](https://wiki.blast.hk/gta-sa/opcodes/00BC) |  [printTextNow](https://wiki.blast.hk/moonloader/lua/printTextNow)(GxtString gxtString, int time, int flag) |   |

[00BE](https://wiki.blast.hk/gta-sa/opcodes/00BE) |  [clearPrints](https://wiki.blast.hk/moonloader/lua/clearPrints)() |   |

[00BF](https://wiki.blast.hk/gta-sa/opcodes/00BF) |  int hours, int mins = [getTimeOfDay](https://wiki.blast.hk/moonloader/lua/getTimeOfDay)() |   |

[00C0](https://wiki.blast.hk/gta-sa/opcodes/00C0) |  [setTimeOfDay](https://wiki.blast.hk/moonloader/lua/setTimeOfDay)(int hours, int minutes) |   |

[00C1](https://wiki.blast.hk/gta-sa/opcodes/00C1) |  int minutes = [getMinutesToTimeOfDay](https://wiki.blast.hk/moonloader/lua/getMinutesToTimeOfDay)(int hours, int minutes) |   |

[00C2](https://wiki.blast.hk/gta-sa/opcodes/00C2) |  bool result = [isPointOnScreen](https://wiki.blast.hk/moonloader/lua/isPointOnScreen)(float sphereX, float sphereY, float sphereZ, float radius) |   |

[00D6](https://wiki.blast.hk/gta-sa/opcodes/00D6) |   |  [3:2] |

[00D7](https://wiki.blast.hk/gta-sa/opcodes/00D7) |   |  [3:3] |

[00D8](https://wiki.blast.hk/gta-sa/opcodes/00D8) |   |  [1:2] |

[00D9](https://wiki.blast.hk/gta-sa/opcodes/00D9) |  Vehicle car = [storeCarCharIsIn](https://wiki.blast.hk/moonloader/lua/storeCarCharIsIn)(Ped ped) |   |

[00DB](https://wiki.blast.hk/gta-sa/opcodes/00DB) |  bool result = [isCharInCar](https://wiki.blast.hk/moonloader/lua/isCharInCar)(Ped ped, Vehicle car) |   |

[00DD](https://wiki.blast.hk/gta-sa/opcodes/00DD) |  bool result = [isCharInModel](https://wiki.blast.hk/moonloader/lua/isCharInModel)(Ped ped, Model carModel) |   |

[00DF](https://wiki.blast.hk/gta-sa/opcodes/00DF) |  bool result = [isCharInAnyCar](https://wiki.blast.hk/moonloader/lua/isCharInAnyCar)(Ped ped) |   |

[00E1](https://wiki.blast.hk/gta-sa/opcodes/00E1) |  bool result = [isButtonPressed](https://wiki.blast.hk/moonloader/lua/isButtonPressed)(Player player, int key) |   |

[00E2](https://wiki.blast.hk/gta-sa/opcodes/00E2) |  int state = [getPadState](https://wiki.blast.hk/moonloader/lua/getPadState)(Player player, int key) |   |

[00EC](https://wiki.blast.hk/gta-sa/opcodes/00EC) |  bool result = [locateCharAnyMeans2d](https://wiki.blast.hk/moonloader/lua/locateCharAnyMeans2d)(Ped ped, float pointX, float pointY, float radiusX, float radiusY, bool sphere) |   |

[00ED](https://wiki.blast.hk/gta-sa/opcodes/00ED) |  bool result = [locateCharOnFoot2d](https://wiki.blast.hk/moonloader/lua/locateCharOnFoot2d)(Ped ped, float pointX, float pointY, float radiusX, float radiusY, bool sphere) |   |

[00EE](https://wiki.blast.hk/gta-sa/opcodes/00EE) |  bool result = [locateCharInCar2d](https://wiki.blast.hk/moonloader/lua/locateCharInCar2d)(Ped ped, float pointX, float pointY, float radiusX, float radiusY, bool sphere) |   |

[00EF](https://wiki.blast.hk/gta-sa/opcodes/00EF) |  bool result = [locateStoppedCharAnyMeans2d](https://wiki.blast.hk/moonloader/lua/locateStoppedCharAnyMeans2d)(Ped ped, float pointX, float pointY, float radiusX, float radiusY, bool sphere) |   |

[00F0](https://wiki.blast.hk/gta-sa/opcodes/00F0) |  bool result = [locateStoppedCharOnFoot2d](https://wiki.blast.hk/moonloader/lua/locateStoppedCharOnFoot2d)(Ped ped, float pointX, float pointY, float radiusX, float radiusY, bool sphere) |   |

[00F1](https://wiki.blast.hk/gta-sa/opcodes/00F1) |  bool result = [locateStoppedCharInCar2d](https://wiki.blast.hk/moonloader/lua/locateStoppedCharInCar2d)(Ped ped, float pointX, float pointY, float radiusX, float radiusY, bool sphere) |   |

[00F2](https://wiki.blast.hk/gta-sa/opcodes/00F2) |  bool result = [locateCharAnyMeansChar2d](https://wiki.blast.hk/moonloader/lua/locateCharAnyMeansChar2d)(Ped ped, Ped nearPed, float radiusX, float radiusY, bool sphere) |   |

[00F3](https://wiki.blast.hk/gta-sa/opcodes/00F3) |  [locateCharOnFootChar2d](https://wiki.blast.hk/moonloader/lua/locateCharOnFootChar2d)(Ped ped, Ped nearPed, float radiusX, float radiusY, bool sphere) |   |

[00F4](https://wiki.blast.hk/gta-sa/opcodes/00F4) |  bool result = [locateCharInCarChar2d](https://wiki.blast.hk/moonloader/lua/locateCharInCarChar2d)(Ped ped, Ped nearPed, float radiusX, float radiusY, bool sphere) |   |

[00FE](https://wiki.blast.hk/gta-sa/opcodes/00FE) |  bool result = [locateCharAnyMeans3d](https://wiki.blast.hk/moonloader/lua/locateCharAnyMeans3d)(Ped ped, float sphereX, float sphereY, float sphereZ, float radiusX, float radiusY, float radiusZ, bool sphere) |   |

[00FF](https://wiki.blast.hk/gta-sa/opcodes/00FF) |  bool result = [locateCharOnFoot3d](https://wiki.blast.hk/moonloader/lua/locateCharOnFoot3d)(Ped ped, float sphereX, float sphereY, float sphereZ, float radiusX, float radiusY, float radiusZ, bool sphere) |   |

[0100](https://wiki.blast.hk/gta-sa/opcodes/0100) |  bool result = [locateCharInCar3d](https://wiki.blast.hk/moonloader/lua/locateCharInCar3d)(Ped ped, float sphereX, float sphereY, float sphereZ, float radiusX, float radiusY, float radiusZ, bool sphere) |   |

[0101](https://wiki.blast.hk/gta-sa/opcodes/0101) |  bool result = [locateStoppedCharAnyMeans3d](https://wiki.blast.hk/moonloader/lua/locateStoppedCharAnyMeans3d)(Ped ped, float sphereX, float sphereY, float sphereZ, float radiusX, float radiusY, float radiusZ, bool sphere) |   |

[0102](https://wiki.blast.hk/gta-sa/opcodes/0102) |  bool result = [locateStoppedCharOnFoot3d](https://wiki.blast.hk/moonloader/lua/locateStoppedCharOnFoot3d)(Ped ped, float sphereX, float sphereY, float sphereZ, float radiusX, float radiusY, float radiusZ, bool sphere) |   |

[0103](https://wiki.blast.hk/gta-sa/opcodes/0103) |  bool result = [locateStoppedCharInCar3d](https://wiki.blast.hk/moonloader/lua/locateStoppedCharInCar3d)(Ped ped, float sphereX, float sphereY, float sphereZ, float radiusX, float radiusY, float radiusZ, bool sphere) |   |

[0104](https://wiki.blast.hk/gta-sa/opcodes/0104) |  bool result = [locateCharAnyMeansChar3d](https://wiki.blast.hk/moonloader/lua/locateCharAnyMeansChar3d)(Ped ped, Ped nearPed, float radiusX, float radiusY, float radiusZ, bool sphere) |   |

[0105](https://wiki.blast.hk/gta-sa/opcodes/0105) |  bool result = [locateCharOnFootChar3d](https://wiki.blast.hk/moonloader/lua/locateCharOnFootChar3d)(Ped ped, Ped nearPed, float radiusX, float radiusY, float radiusZ, bool sphere) |   |

[0106](https://wiki.blast.hk/gta-sa/opcodes/0106) |  bool result = [locateCharInCarChar3d](https://wiki.blast.hk/moonloader/lua/locateCharInCarChar3d)(Ped ped, Ped nearPed, float radiusX, float radiusY, float radiusZ, bool sphere) |   |

[0107](https://wiki.blast.hk/gta-sa/opcodes/0107) |  Object object = [createObject](https://wiki.blast.hk/moonloader/lua/createObject)(Model modelId, float atX, float atY, float atZ) |   |

[0108](https://wiki.blast.hk/gta-sa/opcodes/0108) |  [deleteObject](https://wiki.blast.hk/moonloader/lua/deleteObject)(Object object) |   |

[0109](https://wiki.blast.hk/gta-sa/opcodes/0109) |  [givePlayerMoney](https://wiki.blast.hk/moonloader/lua/givePlayerMoney)(Player player, int money) |   |

[010A](https://wiki.blast.hk/gta-sa/opcodes/010A) |   |  [3:4] |

[010B](https://wiki.blast.hk/gta-sa/opcodes/010B) |  int money = [getPlayerMoney](https://wiki.blast.hk/moonloader/lua/getPlayerMoney)(Player player) |   |

[010C](https://wiki.blast.hk/gta-sa/opcodes/010C) |  [giveRemoteControlledCarToPlayer](https://wiki.blast.hk/moonloader/lua/giveRemoteControlledCarToPlayer)(Player player, float float2, float float3, float float4) |   |

[010D](https://wiki.blast.hk/gta-sa/opcodes/010D) |  [alterWantedLevel](https://wiki.blast.hk/moonloader/lua/alterWantedLevel)(Player player, int wantedLevel) |   |

[010E](https://wiki.blast.hk/gta-sa/opcodes/010E) |  [alterWantedLevelNoDrop](https://wiki.blast.hk/moonloader/lua/alterWantedLevelNoDrop)(Player player, int minimumWantedLevel) |   |

[010F](https://wiki.blast.hk/gta-sa/opcodes/010F) |  bool result = [isWantedLevelGreater](https://wiki.blast.hk/moonloader/lua/isWantedLevelGreater)(Player player, int level) |   |

[0110](https://wiki.blast.hk/gta-sa/opcodes/0110) |  [clearWantedLevel](https://wiki.blast.hk/moonloader/lua/clearWantedLevel)(Player player) |   |

[0111](https://wiki.blast.hk/gta-sa/opcodes/0111) |  [setDeatharrestState](https://wiki.blast.hk/moonloader/lua/setDeatharrestState)(bool value) |   |

[0112](https://wiki.blast.hk/gta-sa/opcodes/0112) |  bool result = [hasDeatharrestBeenExecuted](https://wiki.blast.hk/moonloader/lua/hasDeatharrestBeenExecuted)() |   |

[0114](https://wiki.blast.hk/gta-sa/opcodes/0114) |  [addAmmoToChar](https://wiki.blast.hk/moonloader/lua/addAmmoToChar)(Ped ped, int weapon, int ammo) |   |

[0117](https://wiki.blast.hk/gta-sa/opcodes/0117) |  bool result = [isPlayerDead](https://wiki.blast.hk/moonloader/lua/isPlayerDead)(Player player) |   |

[0118](https://wiki.blast.hk/gta-sa/opcodes/0118) |  bool result = [isCharDead](https://wiki.blast.hk/moonloader/lua/isCharDead)(Ped ped) |   |

[0119](https://wiki.blast.hk/gta-sa/opcodes/0119) |  bool result = [isCarDead](https://wiki.blast.hk/moonloader/lua/isCarDead)(Vehicle car) |   |

[0122](https://wiki.blast.hk/gta-sa/opcodes/0122) |  bool result = [isPlayerPressingHorn](https://wiki.blast.hk/moonloader/lua/isPlayerPressingHorn)(Player player) |   |

[0129](https://wiki.blast.hk/gta-sa/opcodes/0129) |  Ped ped = [createCharInsideCar](https://wiki.blast.hk/moonloader/lua/createCharInsideCar)(Vehicle car, Model pedtype, int model) |   |

[0137](https://wiki.blast.hk/gta-sa/opcodes/0137) |  bool result = [isCarModel](https://wiki.blast.hk/moonloader/lua/isCarModel)(Vehicle car, Model modelId) |   |

[014B](https://wiki.blast.hk/gta-sa/opcodes/014B) |  int carGenerator = [createCarGenerator](https://wiki.blast.hk/moonloader/lua/createCarGenerator)(float atX, float atY, float atZ, float angle, Model modelId, int color1, int color2, bool forceSpawn, int alarm, int doorLock, int minDelay, int maxDelay) |   |

[014C](https://wiki.blast.hk/gta-sa/opcodes/014C) |  [switchCarGenerator](https://wiki.blast.hk/moonloader/lua/switchCarGenerator)(int carGenerator, int carsToGenerate) |   |

[014E](https://wiki.blast.hk/gta-sa/opcodes/014E) |  [displayOnscreenTimer](https://wiki.blast.hk/moonloader/lua/displayOnscreenTimer)(VarId var, bool countInDirection) |   |

[014F](https://wiki.blast.hk/gta-sa/opcodes/014F) |  [clearOnscreenTimer](https://wiki.blast.hk/moonloader/lua/clearOnscreenTimer)(VarId var) |   |

[0151](https://wiki.blast.hk/gta-sa/opcodes/0151) |  [clearOnscreenCounter](https://wiki.blast.hk/moonloader/lua/clearOnscreenCounter)(VarId var) |   |

[0154](https://wiki.blast.hk/gta-sa/opcodes/0154) |  bool result = [isCharInZone](https://wiki.blast.hk/moonloader/lua/isCharInZone)(Ped ped, GxtString zoneName) |   |

[0158](https://wiki.blast.hk/gta-sa/opcodes/0158) |  [pointCameraAtCar](https://wiki.blast.hk/moonloader/lua/pointCameraAtCar)(Vehicle car, int mode, int switchstyle) |   |

[0159](https://wiki.blast.hk/gta-sa/opcodes/0159) |  [pointCameraAtChar](https://wiki.blast.hk/moonloader/lua/pointCameraAtChar)(Ped ped, int mode, int switchstyle) |   |

[015A](https://wiki.blast.hk/gta-sa/opcodes/015A) |  [restoreCamera](https://wiki.blast.hk/moonloader/lua/restoreCamera)() |   |

[015B](https://wiki.blast.hk/gta-sa/opcodes/015B) |  [shakePad](https://wiki.blast.hk/moonloader/lua/shakePad)(Player player, int time, int intensity) |   |

[015D](https://wiki.blast.hk/gta-sa/opcodes/015D) |  [setTimeScale](https://wiki.blast.hk/moonloader/lua/setTimeScale)(float gamespeed) |   |

[015F](https://wiki.blast.hk/gta-sa/opcodes/015F) |  [setFixedCameraPosition](https://wiki.blast.hk/moonloader/lua/setFixedCameraPosition)(float positionX, float positionY, float positionZ, float rotationX, float rotationY, float rotationZ) |   |

[0160](https://wiki.blast.hk/gta-sa/opcodes/0160) |  [pointCameraAtPoint](https://wiki.blast.hk/moonloader/lua/pointCameraAtPoint)(float pointAtX, float pointAtY, float pointAtZ, int switchstyle) |   |

[0161](https://wiki.blast.hk/gta-sa/opcodes/0161) |  Marker marker = [addBlipForCarOld](https://wiki.blast.hk/moonloader/lua/addBlipForCarOld)(Vehicle car, int unused, bool visibility) |   |

[0162](https://wiki.blast.hk/gta-sa/opcodes/0162) |  Marker marker = [addBlipForCharOld](https://wiki.blast.hk/moonloader/lua/addBlipForCharOld)(Ped ped, int int2, int int3) |   |

[0164](https://wiki.blast.hk/gta-sa/opcodes/0164) |  [removeBlip](https://wiki.blast.hk/moonloader/lua/removeBlip)(Marker marker) |   |

[0165](https://wiki.blast.hk/gta-sa/opcodes/0165) |  [changeBlipColour](https://wiki.blast.hk/moonloader/lua/changeBlipColour)(Marker marker, int color) |   |

[0167](https://wiki.blast.hk/gta-sa/opcodes/0167) |  Marker marker = [addBlipForCoordOld](https://wiki.blast.hk/moonloader/lua/addBlipForCoordOld)(float atX, float atY, float atZ, int color, int flag) |   |

[0168](https://wiki.blast.hk/gta-sa/opcodes/0168) |  [changeBlipScale](https://wiki.blast.hk/moonloader/lua/changeBlipScale)(Marker marker, int size) |   |

[0169](https://wiki.blast.hk/gta-sa/opcodes/0169) |  [setFadingColour](https://wiki.blast.hk/moonloader/lua/setFadingColour)(int r, int g, int b) |   |

[016A](https://wiki.blast.hk/gta-sa/opcodes/016A) |  [doFade](https://wiki.blast.hk/moonloader/lua/doFade)(bool in, int time) |   |

[016B](https://wiki.blast.hk/gta-sa/opcodes/016B) |  bool result = [getFadingStatus](https://wiki.blast.hk/moonloader/lua/getFadingStatus)() |   |

[016C](https://wiki.blast.hk/gta-sa/opcodes/016C) |  [addHospitalRestart](https://wiki.blast.hk/moonloader/lua/addHospitalRestart)(float atX, float atY, float atZ, float angle, int townNumber) |   |

[016D](https://wiki.blast.hk/gta-sa/opcodes/016D) |  [addPoliceRestart](https://wiki.blast.hk/moonloader/lua/addPoliceRestart)(float atX, float atY, float atZ, float angle, int townNumber) |   |

[016E](https://wiki.blast.hk/gta-sa/opcodes/016E) |  [overrideNextRestart](https://wiki.blast.hk/moonloader/lua/overrideNextRestart)(float atX, float atY, float atZ, float angle) |   |

[016F](https://wiki.blast.hk/gta-sa/opcodes/016F) |  [drawShadow](https://wiki.blast.hk/moonloader/lua/drawShadow)(Particle particle, float atX, float atY, float atZ, float rotationFactor, float size, int intensity, int flags1, int flags2, int flags3) |   |

[0172](https://wiki.blast.hk/gta-sa/opcodes/0172) |  float angle = [getCharHeading](https://wiki.blast.hk/moonloader/lua/getCharHeading)(Ped ped) |   |

[0173](https://wiki.blast.hk/gta-sa/opcodes/0173) |  [setCharHeading](https://wiki.blast.hk/moonloader/lua/setCharHeading)(Ped ped, float angle) |   |

[0174](https://wiki.blast.hk/gta-sa/opcodes/0174) |  float angle = [getCarHeading](https://wiki.blast.hk/moonloader/lua/getCarHeading)(Vehicle car) |   |

[0175](https://wiki.blast.hk/gta-sa/opcodes/0175) |  [setCarHeading](https://wiki.blast.hk/moonloader/lua/setCarHeading)(Vehicle car, float angle) |   |

[0176](https://wiki.blast.hk/gta-sa/opcodes/0176) |  float angle = [getObjectHeading](https://wiki.blast.hk/moonloader/lua/getObjectHeading)(Object object) |   |

[0177](https://wiki.blast.hk/gta-sa/opcodes/0177) |  [setObjectHeading](https://wiki.blast.hk/moonloader/lua/setObjectHeading)(Object object, float angle) |   |

[0179](https://wiki.blast.hk/gta-sa/opcodes/0179) |  bool result = [isCharTouchingObject](https://wiki.blast.hk/moonloader/lua/isCharTouchingObject)(Ped ped, Object object) |   |

[017B](https://wiki.blast.hk/gta-sa/opcodes/017B) |  [setCharAmmo](https://wiki.blast.hk/moonloader/lua/setCharAmmo)(Ped ped, int weapon, int ammo) |   |

[0180](https://wiki.blast.hk/gta-sa/opcodes/0180) |  [declareMissionFlag](https://wiki.blast.hk/moonloader/lua/declareMissionFlag)(VarId flag) |   |

[0184](https://wiki.blast.hk/gta-sa/opcodes/0184) |   |  [3:5] |

[0185](https://wiki.blast.hk/gta-sa/opcodes/0185) |   |  [3:6] |

[0186](https://wiki.blast.hk/gta-sa/opcodes/0186) |  Marker marker = [addBlipForCar](https://wiki.blast.hk/moonloader/lua/addBlipForCar)(Vehicle car) |   |

[0187](https://wiki.blast.hk/gta-sa/opcodes/0187) |  Marker marker = [addBlipForChar](https://wiki.blast.hk/moonloader/lua/addBlipForChar)(Ped ped) |   |

[0188](https://wiki.blast.hk/gta-sa/opcodes/0188) |  Marker marker = [addBlipForObject](https://wiki.blast.hk/moonloader/lua/addBlipForObject)(Object object) |   |

[018A](https://wiki.blast.hk/gta-sa/opcodes/018A) |  Checkpoint checkpoint = [addBlipForCoord](https://wiki.blast.hk/moonloader/lua/addBlipForCoord)(float atX, float atY, float atZ) |   |

[018B](https://wiki.blast.hk/gta-sa/opcodes/018B) |  [changeBlipDisplay](https://wiki.blast.hk/moonloader/lua/changeBlipDisplay)(Marker marker, int mode) |   |

[018C](https://wiki.blast.hk/gta-sa/opcodes/018C) |  [addOneOffSound](https://wiki.blast.hk/moonloader/lua/addOneOffSound)(float atX, float atY, float atZ, int sound) |   |

[018D](https://wiki.blast.hk/gta-sa/opcodes/018D) |  int unk = [addContinuousSound](https://wiki.blast.hk/moonloader/lua/addContinuousSound)(float atX, float atY, float atZ, int sound) |   |

[018E](https://wiki.blast.hk/gta-sa/opcodes/018E) |  [removeSound](https://wiki.blast.hk/moonloader/lua/removeSound)(int sound) |   |

[018F](https://wiki.blast.hk/gta-sa/opcodes/018F) |  bool result = [isCarStuckOnRoof](https://wiki.blast.hk/moonloader/lua/isCarStuckOnRoof)(Vehicle car) |   |

[0190](https://wiki.blast.hk/gta-sa/opcodes/0190) |  [addUpsidedownCarCheck](https://wiki.blast.hk/moonloader/lua/addUpsidedownCarCheck)(Vehicle car) |   |

[0191](https://wiki.blast.hk/gta-sa/opcodes/0191) |  [removeUpsidedownCarCheck](https://wiki.blast.hk/moonloader/lua/removeUpsidedownCarCheck)(Vehicle car) |   |

[01A1](https://wiki.blast.hk/gta-sa/opcodes/01A1) |  bool result = [isCharInAreaOnFoot2d](https://wiki.blast.hk/moonloader/lua/isCharInAreaOnFoot2d)(Ped ped, float cornerAX, float cornerAY, float cornerBX, float cornerBY, bool sphere) |   |

[01A2](https://wiki.blast.hk/gta-sa/opcodes/01A2) |  bool result = [isCharInAreaInCar2d](https://wiki.blast.hk/moonloader/lua/isCharInAreaInCar2d)(Ped ped, float cornerAX, float cornerAY, float cornerBX, float cornerBY, bool sphere) |   |

[01A3](https://wiki.blast.hk/gta-sa/opcodes/01A3) |  bool result = [isCharStoppedInArea2d](https://wiki.blast.hk/moonloader/lua/isCharStoppedInArea2d)(Ped ped, float cornerAX, float cornerAY, float cornerBX, float cornerBY, bool sphere) |   |

[01A4](https://wiki.blast.hk/gta-sa/opcodes/01A4) |  bool result = [isCharStoppedInAreaOnFoot2d](https://wiki.blast.hk/moonloader/lua/isCharStoppedInAreaOnFoot2d)(Ped ped, float cornerAX, float cornerAY, float cornerBX, float cornerBY, bool sphere) |   |

[01A5](https://wiki.blast.hk/gta-sa/opcodes/01A5) |  bool result = [isCharStoppedInAreaInCar2d](https://wiki.blast.hk/moonloader/lua/isCharStoppedInAreaInCar2d)(Ped ped, float cornerAX, float cornerAY, float cornerBX, float cornerBY, bool sphere) |   |

[01A6](https://wiki.blast.hk/gta-sa/opcodes/01A6) |  bool result = [isCharInAreaOnFoot3d](https://wiki.blast.hk/moonloader/lua/isCharInAreaOnFoot3d)(Ped ped, float cornerAX, float cornerAY, float cornerAZ, float cornerBX, float cornerBY, float cornerBZ, bool sphere) |   |

[01A7](https://wiki.blast.hk/gta-sa/opcodes/01A7) |  bool result = [isCharInAreaInCar3d](https://wiki.blast.hk/moonloader/lua/isCharInAreaInCar3d)(Ped ped, float cornerAX, float cornerAY, float cornerAZ, float cornerBX, float cornerBY, float cornerBZ, bool sphere) |   |

[01A8](https://wiki.blast.hk/gta-sa/opcodes/01A8) |  bool result = [isCharStoppedInArea3d](https://wiki.blast.hk/moonloader/lua/isCharStoppedInArea3d)(Ped ped, float cornerAX, float cornerAY, float cornerAZ, float cornerBX, float cornerBY, float cornerBZ, bool sphere) |   |

[01A9](https://wiki.blast.hk/gta-sa/opcodes/01A9) |  bool result = [isCharStoppedInAreaOnFoot3d](https://wiki.blast.hk/moonloader/lua/isCharStoppedInAreaOnFoot3d)(Ped ped, float cornerAX, float cornerAY, float cornerAZ, float cornerBX, float cornerBY, float cornerBZ, bool sphere) |   |

[01AA](https://wiki.blast.hk/gta-sa/opcodes/01AA) |  bool result = [isCharStoppedInAreaInCar3d](https://wiki.blast.hk/moonloader/lua/isCharStoppedInAreaInCar3d)(Ped ped, float cornerAX, float cornerAY, float cornerAZ, float cornerBX, float cornerBY, float cornerBZ, bool sphere) |   |

[01AB](https://wiki.blast.hk/gta-sa/opcodes/01AB) |  bool result = [isCarStoppedInArea2d](https://wiki.blast.hk/moonloader/lua/isCarStoppedInArea2d)(Vehicle car, float cornerAX, float cornerAY, float cornerBX, float cornerBY, bool sphere) |   |

[01AC](https://wiki.blast.hk/gta-sa/opcodes/01AC) |  bool result = [isCarStoppedInArea3d](https://wiki.blast.hk/moonloader/lua/isCarStoppedInArea3d)(Vehicle car, float cornerAX, float cornerAY, float cornerAZ, float cornerBX, float cornerBY, float cornerBZ, bool sphere) |   |

[01AD](https://wiki.blast.hk/gta-sa/opcodes/01AD) |  bool result = [locateCar2d](https://wiki.blast.hk/moonloader/lua/locateCar2d)(Vehicle car, float pointX, float pointY, float radiusX, float radiusY, bool sphere) |   |

[01AE](https://wiki.blast.hk/gta-sa/opcodes/01AE) |  bool result = [locateStoppedCar2d](https://wiki.blast.hk/moonloader/lua/locateStoppedCar2d)(Vehicle car, float pointX, float pointY, float radiusX, float radiusY, bool sphere) |   |

[01AF](https://wiki.blast.hk/gta-sa/opcodes/01AF) |  bool result = [locateCar3d](https://wiki.blast.hk/moonloader/lua/locateCar3d)(Vehicle car, float sphereX, float sphereY, float sphereZ, float radiusX, float radiusY, float radiusZ, bool sphere) |   |

[01B0](https://wiki.blast.hk/gta-sa/opcodes/01B0) |  bool result = [locateStoppedCar3d](https://wiki.blast.hk/moonloader/lua/locateStoppedCar3d)(Vehicle car, float sphereX, float sphereY, float sphereZ, float radiusX, float radiusY, float radiusZ, bool sphere) |   |

[01B2](https://wiki.blast.hk/gta-sa/opcodes/01B2) |  [giveWeaponToChar](https://wiki.blast.hk/moonloader/lua/giveWeaponToChar)(Ped ped, int weapon, int ammo) |   |

[01B4](https://wiki.blast.hk/gta-sa/opcodes/01B4) |  bool result = [setPlayerControl](https://wiki.blast.hk/moonloader/lua/setPlayerControl)(Player player, bool canMove) |   |

[01B5](https://wiki.blast.hk/gta-sa/opcodes/01B5) |  bool result = [forceWeather](https://wiki.blast.hk/moonloader/lua/forceWeather)(int weather) |   |

[01B6](https://wiki.blast.hk/gta-sa/opcodes/01B6) |  bool result = [forceWeatherNow](https://wiki.blast.hk/moonloader/lua/forceWeatherNow)(int weather) |   |

[01B7](https://wiki.blast.hk/gta-sa/opcodes/01B7) |  [releaseWeather](https://wiki.blast.hk/moonloader/lua/releaseWeather)() |   |

[01B9](https://wiki.blast.hk/gta-sa/opcodes/01B9) |  [setCurrentCharWeapon](https://wiki.blast.hk/moonloader/lua/setCurrentCharWeapon)(Ped ped, int weapon) |   |

[01BB](https://wiki.blast.hk/gta-sa/opcodes/01BB) |  bool result, float positionX, float positionY, float positionZ = [getObjectCoordinates](https://wiki.blast.hk/moonloader/lua/getObjectCoordinates)(Object object) |   |

[01BC](https://wiki.blast.hk/gta-sa/opcodes/01BC) |  bool result = [setObjectCoordinates](https://wiki.blast.hk/moonloader/lua/setObjectCoordinates)(Object object, float atX, float atY, float atZ) |   |

[01BD](https://wiki.blast.hk/gta-sa/opcodes/01BD) |  int timeMs = [getGameTimer](https://wiki.blast.hk/moonloader/lua/getGameTimer)() |   |

[01C0](https://wiki.blast.hk/gta-sa/opcodes/01C0) |  bool result, int level = [storeWantedLevel](https://wiki.blast.hk/moonloader/lua/storeWantedLevel)(Player player) |   |

[01C1](https://wiki.blast.hk/gta-sa/opcodes/01C1) |  bool result = [isCarStopped](https://wiki.blast.hk/moonloader/lua/isCarStopped)(Vehicle car) |   |

[01C2](https://wiki.blast.hk/gta-sa/opcodes/01C2) |  [markCharAsNoLongerNeeded](https://wiki.blast.hk/moonloader/lua/markCharAsNoLongerNeeded)(Ped ped) |   |

[01C3](https://wiki.blast.hk/gta-sa/opcodes/01C3) |  [markCarAsNoLongerNeeded](https://wiki.blast.hk/moonloader/lua/markCarAsNoLongerNeeded)(Vehicle car) |   |

[01C4](https://wiki.blast.hk/gta-sa/opcodes/01C4) |  [markObjectAsNoLongerNeeded](https://wiki.blast.hk/moonloader/lua/markObjectAsNoLongerNeeded)(Object object) |   |

[01C5](https://wiki.blast.hk/gta-sa/opcodes/01C5) |  [dontRemoveChar](https://wiki.blast.hk/moonloader/lua/dontRemoveChar)(Ped ped) |   |

[01C7](https://wiki.blast.hk/gta-sa/opcodes/01C7) |  [dontRemoveObject](https://wiki.blast.hk/moonloader/lua/dontRemoveObject)(Object object) |   |

[01C8](https://wiki.blast.hk/gta-sa/opcodes/01C8) |  bool result, Ped ped = [createCharAsPassenger](https://wiki.blast.hk/moonloader/lua/createCharAsPassenger)(Vehicle car, Model pedtype, int model, int passengerSeat) |   |

[01E3](https://wiki.blast.hk/gta-sa/opcodes/01E3) |  bool result = [printWithNumberBig](https://wiki.blast.hk/moonloader/lua/printWithNumberBig)(GxtString gxtString, int number, int time, int style) |   |

[01E4](https://wiki.blast.hk/gta-sa/opcodes/01E4) |  bool result = [printWithNumber](https://wiki.blast.hk/moonloader/lua/printWithNumber)(GxtString gxtString, int number, int time, int flag) |   |

[01E5](https://wiki.blast.hk/gta-sa/opcodes/01E5) |  bool result = [printWithNumberNow](https://wiki.blast.hk/moonloader/lua/printWithNumberNow)(GxtString gxtString, int number, int time, int flag) |   |

[01E7](https://wiki.blast.hk/gta-sa/opcodes/01E7) |  bool result = [switchRoadsOn](https://wiki.blast.hk/moonloader/lua/switchRoadsOn)(float cornerAX, float cornerAY, float cornerAZ, float cornerBX, float cornerBY, float cornerBZ) |   |

[01E8](https://wiki.blast.hk/gta-sa/opcodes/01E8) |  [switchRoadsOff](https://wiki.blast.hk/moonloader/lua/switchRoadsOff)(float cornerAX, float cornerAY, float cornerAZ, float cornerBX, float cornerBY, float cornerBZ) |   |

[01E9](https://wiki.blast.hk/gta-sa/opcodes/01E9) |  bool result, int passengers = [getNumberOfPassengers](https://wiki.blast.hk/moonloader/lua/getNumberOfPassengers)(Vehicle car) |   |

[01EA](https://wiki.blast.hk/gta-sa/opcodes/01EA) |  int maxPassengers = [getMaximumNumberOfPassengers](https://wiki.blast.hk/moonloader/lua/getMaximumNumberOfPassengers)(Vehicle car) |   |

[01EB](https://wiki.blast.hk/gta-sa/opcodes/01EB) |  bool result = [setCarDensityMultiplier](https://wiki.blast.hk/moonloader/lua/setCarDensityMultiplier)(float multiplier) |   |

[01EC](https://wiki.blast.hk/gta-sa/opcodes/01EC) |  bool result = [setCarHeavy](https://wiki.blast.hk/moonloader/lua/setCarHeavy)(Vehicle car, bool heavy) |   |

[01F0](https://wiki.blast.hk/gta-sa/opcodes/01F0) |  [setMaxWantedLevel](https://wiki.blast.hk/moonloader/lua/setMaxWantedLevel)(int level) |   |

[01F3](https://wiki.blast.hk/gta-sa/opcodes/01F3) |  bool result = [isCarInAirProper](https://wiki.blast.hk/moonloader/lua/isCarInAirProper)(Vehicle car) |   |

[01F4](https://wiki.blast.hk/gta-sa/opcodes/01F4) |  bool result = [isCarUpsidedown](https://wiki.blast.hk/moonloader/lua/isCarUpsidedown)(Vehicle car) |   |

[01F5](https://wiki.blast.hk/gta-sa/opcodes/01F5) |  bool result, Ped ped = [getPlayerChar](https://wiki.blast.hk/moonloader/lua/getPlayerChar)(Player player) |   |

[01F6](https://wiki.blast.hk/gta-sa/opcodes/01F6) |  bool result = [cancelOverrideRestart](https://wiki.blast.hk/moonloader/lua/cancelOverrideRestart)() |   |

[01F7](https://wiki.blast.hk/gta-sa/opcodes/01F7) |  bool result = [setPoliceIgnorePlayer](https://wiki.blast.hk/moonloader/lua/setPoliceIgnorePlayer)(Player player, bool ignored) |   |

[01F9](https://wiki.blast.hk/gta-sa/opcodes/01F9) |  bool result = [startKillFrenzy](https://wiki.blast.hk/moonloader/lua/startKillFrenzy)(GxtString gxtString, int weapon, int timeLimit, int targets, Model targetModels1, Model targetModels2, Model targetModels3, Model targetModels4, bool completedText) |   |

[01FA](https://wiki.blast.hk/gta-sa/opcodes/01FA) |  bool result, int status = [readKillFrenzyStatus](https://wiki.blast.hk/moonloader/lua/readKillFrenzyStatus)() |   |

[01FB](https://wiki.blast.hk/gta-sa/opcodes/01FB) |  `math.sqrt` |  [2:7] |

[0202](https://wiki.blast.hk/gta-sa/opcodes/0202) |  bool result = [locateCharAnyMeansCar2d](https://wiki.blast.hk/moonloader/lua/locateCharAnyMeansCar2d)(Ped ped, Vehicle car, float radiusX, float radiusY, bool sphere) |   |

[0203](https://wiki.blast.hk/gta-sa/opcodes/0203) |  bool result = [locateCharOnFootCar2d](https://wiki.blast.hk/moonloader/lua/locateCharOnFootCar2d)(Ped ped, Vehicle car, float radiusX, float radiusY, bool flag) |   |

[0204](https://wiki.blast.hk/gta-sa/opcodes/0204) |  bool result = [locateCharInCarCar2d](https://wiki.blast.hk/moonloader/lua/locateCharInCarCar2d)(Ped ped, Vehicle car, float radiusX, float radiusY, bool sphere) |   |

[0205](https://wiki.blast.hk/gta-sa/opcodes/0205) |  bool result = [locateCharAnyMeansCar3d](https://wiki.blast.hk/moonloader/lua/locateCharAnyMeansCar3d)(Ped ped, Vehicle car, float radiusX, float radiusY, float radiusZ, bool flag) |   |

[0206](https://wiki.blast.hk/gta-sa/opcodes/0206) |  bool result = [locateCharOnFootCar3d](https://wiki.blast.hk/moonloader/lua/locateCharOnFootCar3d)(Ped ped, Vehicle car, float radiusX, float radiusY, float radiusZ, bool flag) |   |

[0207](https://wiki.blast.hk/gta-sa/opcodes/0207) |  bool result = [locateCharInCarCar3d](https://wiki.blast.hk/moonloader/lua/locateCharInCarCar3d)(Ped ped, Vehicle car, float radiusX, float radiusY, float radiusZ, bool flag) |   |

[0208](https://wiki.blast.hk/gta-sa/opcodes/0208) |  `math.random` |  [2:8] |

[0209](https://wiki.blast.hk/gta-sa/opcodes/0209) |  `math.random` |  [2:9] |

[020A](https://wiki.blast.hk/gta-sa/opcodes/020A) |  [lockCarDoors](https://wiki.blast.hk/moonloader/lua/lockCarDoors)(Vehicle car, int status) |   |

[020B](https://wiki.blast.hk/gta-sa/opcodes/020B) |  bool result = [explodeCar](https://wiki.blast.hk/moonloader/lua/explodeCar)(Vehicle car) |   |

[020C](https://wiki.blast.hk/gta-sa/opcodes/020C) |  bool result = [addExplosion](https://wiki.blast.hk/moonloader/lua/addExplosion)(float atX, float atY, float atZ, int radius) |   |

[020D](https://wiki.blast.hk/gta-sa/opcodes/020D) |  bool result = [isCarUpright](https://wiki.blast.hk/moonloader/lua/isCarUpright)(Vehicle car) |   |

[0213](https://wiki.blast.hk/gta-sa/opcodes/0213) |  bool result, Pickup pickup = [createPickup](https://wiki.blast.hk/moonloader/lua/createPickup)(Model modelId, int type, float atX, float atY, float atZ) |   |

[0214](https://wiki.blast.hk/gta-sa/opcodes/0214) |  bool result = [hasPickupBeenCollected](https://wiki.blast.hk/moonloader/lua/hasPickupBeenCollected)(Pickup pickup) |   |

[0215](https://wiki.blast.hk/gta-sa/opcodes/0215) |  bool result = [removePickup](https://wiki.blast.hk/moonloader/lua/removePickup)(Pickup pickup) |   |

[0216](https://wiki.blast.hk/gta-sa/opcodes/0216) |  bool result = [setTaxiLights](https://wiki.blast.hk/moonloader/lua/setTaxiLights)(Vehicle taxi, bool light) |   |

[0217](https://wiki.blast.hk/gta-sa/opcodes/0217) |  bool result = [printBigQ](https://wiki.blast.hk/moonloader/lua/printBigQ)(GxtString gxtString, int time, int style) |   |

[021B](https://wiki.blast.hk/gta-sa/opcodes/021B) |  bool result = [setTargetCarForMissionGarage](https://wiki.blast.hk/moonloader/lua/setTargetCarForMissionGarage)(GxtString garage, Vehicle car) |   |

[0221](https://wiki.blast.hk/gta-sa/opcodes/0221) |  bool result = [applyBrakesToPlayersCar](https://wiki.blast.hk/moonloader/lua/applyBrakesToPlayersCar)(Player player, bool apply) |   |

[0223](https://wiki.blast.hk/gta-sa/opcodes/0223) |  [setCharHealth](https://wiki.blast.hk/moonloader/lua/setCharHealth)(Ped ped, int health) |   |

[0224](https://wiki.blast.hk/gta-sa/opcodes/0224) |  [setCarHealth](https://wiki.blast.hk/moonloader/lua/setCarHealth)(Vehicle car, int health) |   |

[0226](https://wiki.blast.hk/gta-sa/opcodes/0226) |  int health = [getCharHealth](https://wiki.blast.hk/moonloader/lua/getCharHealth)(Ped ped) |   |

[0227](https://wiki.blast.hk/gta-sa/opcodes/0227) |  int health = [getCarHealth](https://wiki.blast.hk/moonloader/lua/getCarHealth)(Vehicle car) |   |

[0229](https://wiki.blast.hk/gta-sa/opcodes/0229) |  bool result = [changeCarColour](https://wiki.blast.hk/moonloader/lua/changeCarColour)(Vehicle car, int primaryColor, int secondaryColor) |   |

[022A](https://wiki.blast.hk/gta-sa/opcodes/022A) |  [switchPedRoadsOn](https://wiki.blast.hk/moonloader/lua/switchPedRoadsOn)(float cornerAX, float cornerAY, float cornerAZ, float cornerBX, float cornerBY, float cornerBZ) |   |

[022B](https://wiki.blast.hk/gta-sa/opcodes/022B) |  [switchPedRoadsOff](https://wiki.blast.hk/moonloader/lua/switchPedRoadsOff)(float cornerAX, float cornerAY, float cornerAZ, float cornerBX, float cornerBY, float cornerBZ) |   |

[0235](https://wiki.blast.hk/gta-sa/opcodes/0235) |   |  [1:3] |

[0236](https://wiki.blast.hk/gta-sa/opcodes/0236) |   |  [1:4] |

[0237](https://wiki.blast.hk/gta-sa/opcodes/0237) |  [setGangWeapons](https://wiki.blast.hk/moonloader/lua/setGangWeapons)(int gang, int weapons1, int weapons2, int weapons3) |   |

[023B](https://wiki.blast.hk/gta-sa/opcodes/023B) |  bool result = [isCharTouchingObjectOnFoot](https://wiki.blast.hk/moonloader/lua/isCharTouchingObjectOnFoot)(Ped ped, Object object) |   |

[023C](https://wiki.blast.hk/gta-sa/opcodes/023C) |  [loadSpecialCharacter](https://wiki.blast.hk/moonloader/lua/loadSpecialCharacter)(GxtString gxtString, int id) |   |

[023D](https://wiki.blast.hk/gta-sa/opcodes/023D) |  bool result = [hasSpecialCharacterLoaded](https://wiki.blast.hk/moonloader/lua/hasSpecialCharacterLoaded)(int id) |   |

[0241](https://wiki.blast.hk/gta-sa/opcodes/0241) |  bool result = [isPlayerInRemoteMode](https://wiki.blast.hk/moonloader/lua/isPlayerInRemoteMode)(Player player) |   |

[0244](https://wiki.blast.hk/gta-sa/opcodes/0244) |  [setCutsceneOffset](https://wiki.blast.hk/moonloader/lua/setCutsceneOffset)(float posX, float posY, float posZ) |   |

[0245](https://wiki.blast.hk/gta-sa/opcodes/0245) |  [setAnimGroupForChar](https://wiki.blast.hk/moonloader/lua/setAnimGroupForChar)(Ped ped, string style) |   |

[0247](https://wiki.blast.hk/gta-sa/opcodes/0247) |  [requestModel](https://wiki.blast.hk/moonloader/lua/requestModel)(Model modelId) |   |

[0248](https://wiki.blast.hk/gta-sa/opcodes/0248) |  bool result = [hasModelLoaded](https://wiki.blast.hk/moonloader/lua/hasModelLoaded)(Model modelId) |   |

[0249](https://wiki.blast.hk/gta-sa/opcodes/0249) |  [markModelAsNoLongerNeeded](https://wiki.blast.hk/moonloader/lua/markModelAsNoLongerNeeded)(Model modelId) |   |

[024F](https://wiki.blast.hk/gta-sa/opcodes/024F) |  [drawCorona](https://wiki.blast.hk/moonloader/lua/drawCorona)(float atX, float atY, float atZ, float radius, int type, bool lensflares, int r, int g, int b) |   |

[0253](https://wiki.blast.hk/gta-sa/opcodes/0253) |  [storeClock](https://wiki.blast.hk/moonloader/lua/storeClock)() |   |

[0254](https://wiki.blast.hk/gta-sa/opcodes/0254) |  [restoreClock](https://wiki.blast.hk/moonloader/lua/restoreClock)() |   |

[0256](https://wiki.blast.hk/gta-sa/opcodes/0256) |  bool result = [isPlayerPlaying](https://wiki.blast.hk/moonloader/lua/isPlayerPlaying)(Player player) |   |

[0293](https://wiki.blast.hk/gta-sa/opcodes/0293) |  int mode = [getControllerMode](https://wiki.blast.hk/moonloader/lua/getControllerMode)() |   |

[0294](https://wiki.blast.hk/gta-sa/opcodes/0294) |  [setCanResprayCar](https://wiki.blast.hk/moonloader/lua/setCanResprayCar)(Vehicle car, bool sprayable) |   |

[0296](https://wiki.blast.hk/gta-sa/opcodes/0296) |  [unloadSpecialCharacter](https://wiki.blast.hk/moonloader/lua/unloadSpecialCharacter)(int id) |   |

[0297](https://wiki.blast.hk/gta-sa/opcodes/0297) |  [resetNumOfModelsKilledByPlayer](https://wiki.blast.hk/moonloader/lua/resetNumOfModelsKilledByPlayer)(Player player) |   |

[0298](https://wiki.blast.hk/gta-sa/opcodes/0298) |  int quantity = [getNumOfModelsKilledByPlayer](https://wiki.blast.hk/moonloader/lua/getNumOfModelsKilledByPlayer)(Player player, Model modelId) |   |

[0299](https://wiki.blast.hk/gta-sa/opcodes/0299) |  [activateGarage](https://wiki.blast.hk/moonloader/lua/activateGarage)(GxtString garage) |   |

[029B](https://wiki.blast.hk/gta-sa/opcodes/029B) |  Object object = [createObjectNoOffset](https://wiki.blast.hk/moonloader/lua/createObjectNoOffset)(Model modelId, float atX, float atY, float atZ) |   |

[02A0](https://wiki.blast.hk/gta-sa/opcodes/02A0) |  bool result = [isCharStopped](https://wiki.blast.hk/moonloader/lua/isCharStopped)(Ped ped) |   |

[02A3](https://wiki.blast.hk/gta-sa/opcodes/02A3) |  [switchWidescreen](https://wiki.blast.hk/moonloader/lua/switchWidescreen)(bool enable) |   |

[02A4](https://wiki.blast.hk/gta-sa/opcodes/02A4) |   |  [1:5] |

[02A5](https://wiki.blast.hk/gta-sa/opcodes/02A5) |   |  [1:6] |

[02A7](https://wiki.blast.hk/gta-sa/opcodes/02A7) |  Marker marker = [addSpriteBlipForContactPoint](https://wiki.blast.hk/moonloader/lua/addSpriteBlipForContactPoint)(float atX, float atY, float atZ, int icon) |   |

[02A8](https://wiki.blast.hk/gta-sa/opcodes/02A8) |  Marker marker = [addSpriteBlipForCoord](https://wiki.blast.hk/moonloader/lua/addSpriteBlipForCoord)(float atX, float atY, float atZ, int type) |   |

[02A9](https://wiki.blast.hk/gta-sa/opcodes/02A9) |  [setCharOnlyDamagedByPlayer](https://wiki.blast.hk/moonloader/lua/setCharOnlyDamagedByPlayer)(Ped ped, bool enabled) |   |

[02AA](https://wiki.blast.hk/gta-sa/opcodes/02AA) |  [setCarOnlyDamagedByPlayer](https://wiki.blast.hk/moonloader/lua/setCarOnlyDamagedByPlayer)(Vehicle car, bool enabled) |   |

[02AB](https://wiki.blast.hk/gta-sa/opcodes/02AB) |  [setCharProofs](https://wiki.blast.hk/moonloader/lua/setCharProofs)(Ped ped, bool BP, bool FP, bool EP, bool CP, bool MP) |   |

[02AC](https://wiki.blast.hk/gta-sa/opcodes/02AC) |  [setCarProofs](https://wiki.blast.hk/moonloader/lua/setCarProofs)(Vehicle car, bool BP, bool FP, bool EP, bool CP, bool MP) |   |

[02B9](https://wiki.blast.hk/gta-sa/opcodes/02B9) |  [deactivateGarage](https://wiki.blast.hk/moonloader/lua/deactivateGarage)(GxtString garage) |   |

[02BF](https://wiki.blast.hk/gta-sa/opcodes/02BF) |  bool result = [isCarInWater](https://wiki.blast.hk/moonloader/lua/isCarInWater)(Vehicle car) |   |

[02C0](https://wiki.blast.hk/gta-sa/opcodes/02C0) |  float nodeX, float nodeY, float nodeZ = [getClosestCharNode](https://wiki.blast.hk/moonloader/lua/getClosestCharNode)(float closestToX, float closestToY, float closestToZ) |   |

[02C1](https://wiki.blast.hk/gta-sa/opcodes/02C1) |  float nodeX, float nodeY, float nodeZ = [getClosestCarNode](https://wiki.blast.hk/moonloader/lua/getClosestCarNode)(float closestToX, float closestToY, float closestToZ) |   |

[02C2](https://wiki.blast.hk/gta-sa/opcodes/02C2) |  [carGotoCoordinatesAccurate](https://wiki.blast.hk/moonloader/lua/carGotoCoordinatesAccurate)(Vehicle car, float toX, float toY, float toZ) |   |

[02CA](https://wiki.blast.hk/gta-sa/opcodes/02CA) |  bool result = [isCarOnScreen](https://wiki.blast.hk/moonloader/lua/isCarOnScreen)(Vehicle car) |   |

[02CB](https://wiki.blast.hk/gta-sa/opcodes/02CB) |  bool result = [isCharOnScreen](https://wiki.blast.hk/moonloader/lua/isCharOnScreen)(Ped ped) |   |

[02CC](https://wiki.blast.hk/gta-sa/opcodes/02CC) |  bool result = [isObjectOnScreen](https://wiki.blast.hk/moonloader/lua/isObjectOnScreen)(Object object) |   |

[02CE](https://wiki.blast.hk/gta-sa/opcodes/02CE) |  float z = [getGroundZFor3dCoord](https://wiki.blast.hk/moonloader/lua/getGroundZFor3dCoord)(float atX, float atY, float atZ) |   |

[02CF](https://wiki.blast.hk/gta-sa/opcodes/02CF) |  int fire = [startScriptFire](https://wiki.blast.hk/moonloader/lua/startScriptFire)(float atX, float atY, float atZ, int propagation, int size) |   |

[02D0](https://wiki.blast.hk/gta-sa/opcodes/02D0) |  bool result = [isScriptFireExtinguished](https://wiki.blast.hk/moonloader/lua/isScriptFireExtinguished)(int fire) |   |

[02D1](https://wiki.blast.hk/gta-sa/opcodes/02D1) |  [removeScriptFire](https://wiki.blast.hk/moonloader/lua/removeScriptFire)(int fire) |   |

[02D3](https://wiki.blast.hk/gta-sa/opcodes/02D3) |  [boatGotoCoords](https://wiki.blast.hk/moonloader/lua/boatGotoCoords)(Vehicle boat, float toX, float toY, float toZ) |   |

[02D4](https://wiki.blast.hk/gta-sa/opcodes/02D4) |  [boatStop](https://wiki.blast.hk/moonloader/lua/boatStop)(Vehicle car) |   |

[02D6](https://wiki.blast.hk/gta-sa/opcodes/02D6) |  bool result = [isCharShootingInArea](https://wiki.blast.hk/moonloader/lua/isCharShootingInArea)(Ped ped, float cornerAX, float cornerAY, float cornerBX, float cornerBY, int weapon) |   |

[02D8](https://wiki.blast.hk/gta-sa/opcodes/02D8) |  bool result = [isCurrentCharWeapon](https://wiki.blast.hk/moonloader/lua/isCurrentCharWeapon)(Ped ped, int weapon) |   |

[02DB](https://wiki.blast.hk/gta-sa/opcodes/02DB) |  [setBoatCruiseSpeed](https://wiki.blast.hk/moonloader/lua/setBoatCruiseSpeed)(Vehicle boat, float speed) |   |

[02DD](https://wiki.blast.hk/gta-sa/opcodes/02DD) |  Ped ped = [getRandomCharInZone](https://wiki.blast.hk/moonloader/lua/getRandomCharInZone)(GxtString zone, bool pedtype, bool gang, bool criminal_prostitute) |   |

[02E0](https://wiki.blast.hk/gta-sa/opcodes/02E0) |  bool result = [isCharShooting](https://wiki.blast.hk/moonloader/lua/isCharShooting)(Ped ped) |   |

[02E1](https://wiki.blast.hk/gta-sa/opcodes/02E1) |  Pickup pickup = [createMoneyPickup](https://wiki.blast.hk/moonloader/lua/createMoneyPickup)(float atX, float atY, float atZ, int cash, bool permanenceFlag) |   |

[02E2](https://wiki.blast.hk/gta-sa/opcodes/02E2) |  [setCharAccuracy](https://wiki.blast.hk/moonloader/lua/setCharAccuracy)(Ped ped, int accuracy) |   |

[02E3](https://wiki.blast.hk/gta-sa/opcodes/02E3) |  float speed = [getCarSpeed](https://wiki.blast.hk/moonloader/lua/getCarSpeed)(Vehicle car) |   |

[02E4](https://wiki.blast.hk/gta-sa/opcodes/02E4) |  [loadCutscene](https://wiki.blast.hk/moonloader/lua/loadCutscene)(GxtString cutscene) |   |

[02E5](https://wiki.blast.hk/gta-sa/opcodes/02E5) |  Object object = [createCutsceneObject](https://wiki.blast.hk/moonloader/lua/createCutsceneObject)(Model modelId) |   |

[02E6](https://wiki.blast.hk/gta-sa/opcodes/02E6) |  [setCutsceneAnim](https://wiki.blast.hk/moonloader/lua/setCutsceneAnim)(int cutscene, GxtString anim) |   |

[02E7](https://wiki.blast.hk/gta-sa/opcodes/02E7) |  [startCutscene](https://wiki.blast.hk/moonloader/lua/startCutscene)() |   |

[02E8](https://wiki.blast.hk/gta-sa/opcodes/02E8) |  int time = [getCutsceneTime](https://wiki.blast.hk/moonloader/lua/getCutsceneTime)() |   |

[02E9](https://wiki.blast.hk/gta-sa/opcodes/02E9) |  bool result = [hasCutsceneFinished](https://wiki.blast.hk/moonloader/lua/hasCutsceneFinished)() |   |

[02EA](https://wiki.blast.hk/gta-sa/opcodes/02EA) |  [clearCutscene](https://wiki.blast.hk/moonloader/lua/clearCutscene)() |   |

[02EB](https://wiki.blast.hk/gta-sa/opcodes/02EB) |  [restoreCameraJumpcut](https://wiki.blast.hk/moonloader/lua/restoreCameraJumpcut)() |   |

[02EC](https://wiki.blast.hk/gta-sa/opcodes/02EC) |   |  [1:7] |

[02ED](https://wiki.blast.hk/gta-sa/opcodes/02ED) |  [setCollectable1Total](https://wiki.blast.hk/moonloader/lua/setCollectable1Total)(int total) |   |

[02EE](https://wiki.blast.hk/gta-sa/opcodes/02EE) |  bool result = [isProjectileInArea](https://wiki.blast.hk/moonloader/lua/isProjectileInArea)(float cornerAX, float cornerAY, float cornerAZ, float cornerBX, float cornerBY, float cornerBZ) |   |

[02F2](https://wiki.blast.hk/gta-sa/opcodes/02F2) |  bool result = [isCharModel](https://wiki.blast.hk/moonloader/lua/isCharModel)(Ped ped, Model modelId) |   |

[02F3](https://wiki.blast.hk/gta-sa/opcodes/02F3) |  [loadSpecialModel](https://wiki.blast.hk/moonloader/lua/loadSpecialModel)(Model modelId, GxtString gxtString) |   |

[02F6](https://wiki.blast.hk/gta-sa/opcodes/02F6) |  `math.sin` |  [2:10] |

[02F7](https://wiki.blast.hk/gta-sa/opcodes/02F7) |  `math.cos` |  [2:11] |

[02F8](https://wiki.blast.hk/gta-sa/opcodes/02F8) |  float forwardX = [getCarForwardX](https://wiki.blast.hk/moonloader/lua/getCarForwardX)(Vehicle car) |   |

[02F9](https://wiki.blast.hk/gta-sa/opcodes/02F9) |  float forwardY = [getCarForwardY](https://wiki.blast.hk/moonloader/lua/getCarForwardY)(Vehicle car) |   |

[02FA](https://wiki.blast.hk/gta-sa/opcodes/02FA) |  [changeGarageType](https://wiki.blast.hk/moonloader/lua/changeGarageType)(GxtString garage, int type) |   |

[02FD](https://wiki.blast.hk/gta-sa/opcodes/02FD) |  [printWith2NumbersNow](https://wiki.blast.hk/moonloader/lua/printWith2NumbersNow)(GxtString gxtString, int numbers1, int numbers2, int time, int flag) |   |

[02FF](https://wiki.blast.hk/gta-sa/opcodes/02FF) |  [printWith3Numbers](https://wiki.blast.hk/moonloader/lua/printWith3Numbers)(GxtString gxtString, int numbers1, int numbers2, int numbers3, int time, int flag) |   |

[0302](https://wiki.blast.hk/gta-sa/opcodes/0302) |  [printWith4Numbers](https://wiki.blast.hk/moonloader/lua/printWith4Numbers)(GxtString gxtString, int numbers1, int numbers2, int numbers3, int numbers4, int time, int flag) |   |

[0303](https://wiki.blast.hk/gta-sa/opcodes/0303) |  [printWith4NumbersNow](https://wiki.blast.hk/moonloader/lua/printWith4NumbersNow)(GxtString gxtString, int numbers1, int numbers2, int numbers3, int numbers4, int time, int flag) |   |

[0308](https://wiki.blast.hk/gta-sa/opcodes/0308) |  [printWith6Numbers](https://wiki.blast.hk/moonloader/lua/printWith6Numbers)(GxtString gxtString, int numbers1, int numbers2, int numbers3, int numbers4, int numbers5, int numbers6, int time, int flag) |   |

[030C](https://wiki.blast.hk/gta-sa/opcodes/030C) |  [playerMadeProgress](https://wiki.blast.hk/moonloader/lua/playerMadeProgress)(int progress) |   |

[030D](https://wiki.blast.hk/gta-sa/opcodes/030D) |  [setProgressTotal](https://wiki.blast.hk/moonloader/lua/setProgressTotal)(int maxProgress) |   |

[0317](https://wiki.blast.hk/gta-sa/opcodes/0317) |  [registerMissionGiven](https://wiki.blast.hk/moonloader/lua/registerMissionGiven)() |   |

[0318](https://wiki.blast.hk/gta-sa/opcodes/0318) |  [registerMissionPassed](https://wiki.blast.hk/moonloader/lua/registerMissionPassed)(GxtString mission) |   |

[0319](https://wiki.blast.hk/gta-sa/opcodes/0319) |   |  [1:8] |

[031A](https://wiki.blast.hk/gta-sa/opcodes/031A) |  [removeAllScriptFires](https://wiki.blast.hk/moonloader/lua/removeAllScriptFires)() |   |

[031D](https://wiki.blast.hk/gta-sa/opcodes/031D) |  bool result = [hasCharBeenDamagedByWeapon](https://wiki.blast.hk/moonloader/lua/hasCharBeenDamagedByWeapon)(Ped ped, int weapon) |   |

[031E](https://wiki.blast.hk/gta-sa/opcodes/031E) |  bool result = [hasCarBeenDamagedByWeapon](https://wiki.blast.hk/moonloader/lua/hasCarBeenDamagedByWeapon)(Vehicle car, int weapon) |   |

[0321](https://wiki.blast.hk/gta-sa/opcodes/0321) |  [explodeCharHead](https://wiki.blast.hk/moonloader/lua/explodeCharHead)(Ped ped) |   |

[0323](https://wiki.blast.hk/gta-sa/opcodes/0323) |  [anchorBoat](https://wiki.blast.hk/moonloader/lua/anchorBoat)(Vehicle boat, bool anchor) |   |

[0325](https://wiki.blast.hk/gta-sa/opcodes/0325) |  int fire = [startCarFire](https://wiki.blast.hk/moonloader/lua/startCarFire)(Vehicle car) |   |

[0326](https://wiki.blast.hk/gta-sa/opcodes/0326) |  int fire = [startCharFire](https://wiki.blast.hk/moonloader/lua/startCharFire)(Ped ped) |   |

[0327](https://wiki.blast.hk/gta-sa/opcodes/0327) |  Vehicle car = [getRandomCarOfTypeInArea](https://wiki.blast.hk/moonloader/lua/getRandomCarOfTypeInArea)(float cornerAX, float cornerAY, float cornerBX, float cornerBY, Model modelId) |   |

[0329](https://wiki.blast.hk/gta-sa/opcodes/0329) |  bool result = [hasResprayHappened](https://wiki.blast.hk/moonloader/lua/hasResprayHappened)(Vehicle car) |   |

[032A](https://wiki.blast.hk/gta-sa/opcodes/032A) |  [setCameraZoom](https://wiki.blast.hk/moonloader/lua/setCameraZoom)(int mode) |   |

[032B](https://wiki.blast.hk/gta-sa/opcodes/032B) |  Pickup pickup = [createPickupWithAmmo](https://wiki.blast.hk/moonloader/lua/createPickupWithAmmo)(Model modelId, int type, int ammo, float atX, float atY, float atZ) |   |

[032C](https://wiki.blast.hk/gta-sa/opcodes/032C) |  [setCarRamCar](https://wiki.blast.hk/moonloader/lua/setCarRamCar)(Vehicle car, Vehicle car) |   |

[0330](https://wiki.blast.hk/gta-sa/opcodes/0330) |  [setPlayerNeverGetsTired](https://wiki.blast.hk/moonloader/lua/setPlayerNeverGetsTired)(Player player, bool infiniteRun) |   |

[0331](https://wiki.blast.hk/gta-sa/opcodes/0331) |  [setPlayerFastReload](https://wiki.blast.hk/moonloader/lua/setPlayerFastReload)(Player player, bool fastReload) |   |

[0332](https://wiki.blast.hk/gta-sa/opcodes/0332) |  [setCharBleeding](https://wiki.blast.hk/moonloader/lua/setCharBleeding)(Ped ped, bool bleeding) |   |

[0335](https://wiki.blast.hk/gta-sa/opcodes/0335) |  [setFreeResprays](https://wiki.blast.hk/moonloader/lua/setFreeResprays)(bool enable) |   |

[0337](https://wiki.blast.hk/gta-sa/opcodes/0337) |  [setCharVisible](https://wiki.blast.hk/moonloader/lua/setCharVisible)(Ped ped, bool visible) |   |

[0338](https://wiki.blast.hk/gta-sa/opcodes/0338) |  [setCarVisible](https://wiki.blast.hk/moonloader/lua/setCarVisible)(Vehicle car, bool visible) |   |

[0339](https://wiki.blast.hk/gta-sa/opcodes/0339) |  bool result = [isAreaOccupied](https://wiki.blast.hk/moonloader/lua/isAreaOccupied)(float cornerAX, float cornerAY, float cornerAZ, float cornerBX, float cornerBY, float cornerBZ, bool solid, bool car, bool actor, bool object, bool particle) |   |

[033E](https://wiki.blast.hk/gta-sa/opcodes/033E) |  [displayText](https://wiki.blast.hk/moonloader/lua/displayText)(float posX, float posY, GxtString gxtString) |   |

[033F](https://wiki.blast.hk/gta-sa/opcodes/033F) |  [setTextScale](https://wiki.blast.hk/moonloader/lua/setTextScale)(float sizeX, float sizeY) |   |

[0340](https://wiki.blast.hk/gta-sa/opcodes/0340) |  [setTextColour](https://wiki.blast.hk/moonloader/lua/setTextColour)(int r, int g, int b, int a) |   |

[0341](https://wiki.blast.hk/gta-sa/opcodes/0341) |  [setTextJustify](https://wiki.blast.hk/moonloader/lua/setTextJustify)(bool alignJustify) |   |

[0342](https://wiki.blast.hk/gta-sa/opcodes/0342) |  [setTextCentre](https://wiki.blast.hk/moonloader/lua/setTextCentre)(bool centered) |   |

[0343](https://wiki.blast.hk/gta-sa/opcodes/0343) |  [setTextWrapx](https://wiki.blast.hk/moonloader/lua/setTextWrapx)(float linewidth) |   |

[0344](https://wiki.blast.hk/gta-sa/opcodes/0344) |  [setTextCentreSize](https://wiki.blast.hk/moonloader/lua/setTextCentreSize)(float linewidth) |   |

[0345](https://wiki.blast.hk/gta-sa/opcodes/0345) |  [setTextBackground](https://wiki.blast.hk/moonloader/lua/setTextBackground)(bool background) |   |

[0348](https://wiki.blast.hk/gta-sa/opcodes/0348) |  [setTextProportional](https://wiki.blast.hk/moonloader/lua/setTextProportional)(bool proportional) |   |

[0349](https://wiki.blast.hk/gta-sa/opcodes/0349) |  [setTextFont](https://wiki.blast.hk/moonloader/lua/setTextFont)(int font) |   |

[034D](https://wiki.blast.hk/gta-sa/opcodes/034D) |  bool result = [rotateObject](https://wiki.blast.hk/moonloader/lua/rotateObject)(Object object, float fromAngle, float toAngle, bool flag) |   |

[034E](https://wiki.blast.hk/gta-sa/opcodes/034E) |  bool result = [slideObject](https://wiki.blast.hk/moonloader/lua/slideObject)(Object object, float toX, float toY, float toZ, float speedX, float speedY, float speedZ, bool collisionCheck) |   |

[034F](https://wiki.blast.hk/gta-sa/opcodes/034F) |  [removeCharElegantly](https://wiki.blast.hk/moonloader/lua/removeCharElegantly)(Ped ped) |   |

[0350](https://wiki.blast.hk/gta-sa/opcodes/0350) |  [setCharStayInSamePlace](https://wiki.blast.hk/moonloader/lua/setCharStayInSamePlace)(Ped ped, bool enabled) |   |

[0356](https://wiki.blast.hk/gta-sa/opcodes/0356) |  bool result = [isExplosionInArea](https://wiki.blast.hk/moonloader/lua/isExplosionInArea)(int explosionType, float cornerAX, float cornerAY, float cornerAZ, float cornerBX, float cornerBY, float cornerBZ) |   |

[035C](https://wiki.blast.hk/gta-sa/opcodes/035C) |  [placeObjectRelativeToCar](https://wiki.blast.hk/moonloader/lua/placeObjectRelativeToCar)(Object object, Vehicle car, float offsetX, float offsetY, float offsetZ) |   |

[035D](https://wiki.blast.hk/gta-sa/opcodes/035D) |  [makeObjectTargettable](https://wiki.blast.hk/moonloader/lua/makeObjectTargettable)(Object object, bool targetable) |   |

[035F](https://wiki.blast.hk/gta-sa/opcodes/035F) |  [addArmourToChar](https://wiki.blast.hk/moonloader/lua/addArmourToChar)(Ped ped, int points) |   |

[0360](https://wiki.blast.hk/gta-sa/opcodes/0360) |  [openGarage](https://wiki.blast.hk/moonloader/lua/openGarage)(GxtString garage) |   |

[0361](https://wiki.blast.hk/gta-sa/opcodes/0361) |  [closeGarage](https://wiki.blast.hk/moonloader/lua/closeGarage)(GxtString garage) |   |

[0362](https://wiki.blast.hk/gta-sa/opcodes/0362) |  [warpCharFromCarToCoord](https://wiki.blast.hk/moonloader/lua/warpCharFromCarToCoord)(Ped ped, float placeAtX, float placeAtY, float placeAtZ) |   |

[0363](https://wiki.blast.hk/gta-sa/opcodes/0363) |  [setVisibilityOfClosestObjectOfType](https://wiki.blast.hk/moonloader/lua/setVisibilityOfClosestObjectOfType)(float atX, float atY, float atZ, float radius, Model modelId, bool visibility) |   |

[0364](https://wiki.blast.hk/gta-sa/opcodes/0364) |  bool result = [hasCharSpottedChar](https://wiki.blast.hk/moonloader/lua/hasCharSpottedChar)(Ped ped, Ped ped) |   |

[0366](https://wiki.blast.hk/gta-sa/opcodes/0366) |  bool result = [hasObjectBeenDamaged](https://wiki.blast.hk/moonloader/lua/hasObjectBeenDamaged)(Object object) |   |

[036A](https://wiki.blast.hk/gta-sa/opcodes/036A) |  [warpCharIntoCar](https://wiki.blast.hk/moonloader/lua/warpCharIntoCar)(Ped ped, Vehicle car) |   |

[036D](https://wiki.blast.hk/gta-sa/opcodes/036D) |  [printWith2NumbersBig](https://wiki.blast.hk/moonloader/lua/printWith2NumbersBig)(GxtString gxtString, int numbers1, int numbers2, int time, int style) |   |

[0373](https://wiki.blast.hk/gta-sa/opcodes/0373) |  [setCameraBehindPlayer](https://wiki.blast.hk/moonloader/lua/setCameraBehindPlayer)() |   |

[0376](https://wiki.blast.hk/gta-sa/opcodes/0376) |  Ped ped = [createRandomChar](https://wiki.blast.hk/moonloader/lua/createRandomChar)(float atX, float atY, float atZ) |   |

[037E](https://wiki.blast.hk/gta-sa/opcodes/037E) |  bool result = [isSniperBulletInArea](https://wiki.blast.hk/moonloader/lua/isSniperBulletInArea)(float float1, float float2, float float3, float float4, float float5, float float6) |   |

[0381](https://wiki.blast.hk/gta-sa/opcodes/0381) |  [setObjectVelocity](https://wiki.blast.hk/moonloader/lua/setObjectVelocity)(Object object, float velocityInDirectionX, float velocityInDirectionY, float velocityInDirectionZ) |   |

[0382](https://wiki.blast.hk/gta-sa/opcodes/0382) |  [setObjectCollision](https://wiki.blast.hk/moonloader/lua/setObjectCollision)(Object object, bool collision) |   |

[0383](https://wiki.blast.hk/gta-sa/opcodes/0383) |   |  [1:9] |

[0384](https://wiki.blast.hk/gta-sa/opcodes/0384) |  [printStringInStringNow](https://wiki.blast.hk/moonloader/lua/printStringInStringNow)(GxtString gxtString, GxtString string, int time1, int time2) |   |

[038A](https://wiki.blast.hk/gta-sa/opcodes/038A) |  bool result = [isPointObscuredByAMissionEntity](https://wiki.blast.hk/moonloader/lua/isPointObscuredByAMissionEntity)(float cornerAX, float cornerAY, float cornerAZ, float cornerBX, float cornerBY, float cornerBZ) |   |

[038B](https://wiki.blast.hk/gta-sa/opcodes/038B) |  [loadAllModelsNow](https://wiki.blast.hk/moonloader/lua/loadAllModelsNow)() |   |

[038C](https://wiki.blast.hk/gta-sa/opcodes/038C) |  [addToObjectVelocity](https://wiki.blast.hk/moonloader/lua/addToObjectVelocity)(Object object, float velocityX, float velocityY, float velocityZ) |   |

[038D](https://wiki.blast.hk/gta-sa/opcodes/038D) |  [drawSprite](https://wiki.blast.hk/moonloader/lua/drawSprite)(int texture, float positionX, float positionY, float width, float height, int r, int g, int b, int a) |   |

[038E](https://wiki.blast.hk/gta-sa/opcodes/038E) |  [drawRect](https://wiki.blast.hk/moonloader/lua/drawRect)(float positionX, float positionY, float width, float height, int r, int g, int b, int a) |   |

[038F](https://wiki.blast.hk/gta-sa/opcodes/038F) |  int id = [loadSprite](https://wiki.blast.hk/moonloader/lua/loadSprite)(string name) |   |

[0390](https://wiki.blast.hk/gta-sa/opcodes/0390) |  bool result = [loadTextureDictionary](https://wiki.blast.hk/moonloader/lua/loadTextureDictionary)(zstring txd) |   |

[0391](https://wiki.blast.hk/gta-sa/opcodes/0391) |  [removeTextureDictionary](https://wiki.blast.hk/moonloader/lua/removeTextureDictionary)() |   |

[0392](https://wiki.blast.hk/gta-sa/opcodes/0392) |  [setObjectDynamic](https://wiki.blast.hk/moonloader/lua/setObjectDynamic)(Object object, bool moveable) |   |

[0393](https://wiki.blast.hk/gta-sa/opcodes/0393) |  [setCharAnimSpeed](https://wiki.blast.hk/moonloader/lua/setCharAnimSpeed)(Ped ped, string animation, float speed) |   |

[0394](https://wiki.blast.hk/gta-sa/opcodes/0394) |  [playMissionPassedTune](https://wiki.blast.hk/moonloader/lua/playMissionPassedTune)(int music) |   |

[0395](https://wiki.blast.hk/gta-sa/opcodes/0395) |  [clearArea](https://wiki.blast.hk/moonloader/lua/clearArea)(float atX, float atY, float atZ, float radius, bool area) |   |

[0396](https://wiki.blast.hk/gta-sa/opcodes/0396) |  [freezeOnscreenTimer](https://wiki.blast.hk/moonloader/lua/freezeOnscreenTimer)(bool timer) |   |

[0397](https://wiki.blast.hk/gta-sa/opcodes/0397) |  [switchCarSiren](https://wiki.blast.hk/moonloader/lua/switchCarSiren)(Vehicle car, bool siren) |   |

[039C](https://wiki.blast.hk/gta-sa/opcodes/039C) |  [setCarWatertight](https://wiki.blast.hk/moonloader/lua/setCarWatertight)(Vehicle car, bool watertight) |   |

[039E](https://wiki.blast.hk/gta-sa/opcodes/039E) |  [setCharCantBeDraggedOut](https://wiki.blast.hk/moonloader/lua/setCharCantBeDraggedOut)(Ped ped, bool locked) |   |

[039F](https://wiki.blast.hk/gta-sa/opcodes/039F) |  [turnCarToFaceCoord](https://wiki.blast.hk/moonloader/lua/turnCarToFaceCoord)(Vehicle car, float coordX, float coordY) |   |

[03A1](https://wiki.blast.hk/gta-sa/opcodes/03A1) |  [drawSphere](https://wiki.blast.hk/moonloader/lua/drawSphere)(float atX, float atY, float atZ, float radius) |   |

[03A2](https://wiki.blast.hk/gta-sa/opcodes/03A2) |  [setCarStatus](https://wiki.blast.hk/moonloader/lua/setCarStatus)(Vehicle car, int action) |   |

[03A3](https://wiki.blast.hk/gta-sa/opcodes/03A3) |  bool result = [isCharMale](https://wiki.blast.hk/moonloader/lua/isCharMale)(Ped ped) |   |

[03A4](https://wiki.blast.hk/gta-sa/opcodes/03A4) |   |  [3:7] |

[03A7](https://wiki.blast.hk/gta-sa/opcodes/03A7) |   |  [1:10] |

[03A8](https://wiki.blast.hk/gta-sa/opcodes/03A8) |   |  [1:11] |

[03AA](https://wiki.blast.hk/gta-sa/opcodes/03AA) |  [policeRadioMessage](https://wiki.blast.hk/moonloader/lua/policeRadioMessage)(float float1, float float2, float float3) |   |

[03AB](https://wiki.blast.hk/gta-sa/opcodes/03AB) |  [setCarStrong](https://wiki.blast.hk/moonloader/lua/setCarStrong)(Vehicle car, bool strong) |   |

[03AD](https://wiki.blast.hk/gta-sa/opcodes/03AD) |  [switchRubbish](https://wiki.blast.hk/moonloader/lua/switchRubbish)(bool int1) |   |

[03AF](https://wiki.blast.hk/gta-sa/opcodes/03AF) |  [switchStreaming](https://wiki.blast.hk/moonloader/lua/switchStreaming)(bool streaming) |   |

[03B0](https://wiki.blast.hk/gta-sa/opcodes/03B0) |  bool result = [isGarageOpen](https://wiki.blast.hk/moonloader/lua/isGarageOpen)(GxtString garage) |   |

[03B1](https://wiki.blast.hk/gta-sa/opcodes/03B1) |  bool result = [isGarageClosed](https://wiki.blast.hk/moonloader/lua/isGarageClosed)(GxtString garage) |   |

[03B6](https://wiki.blast.hk/gta-sa/opcodes/03B6) |  [swapNearestBuildingModel](https://wiki.blast.hk/moonloader/lua/swapNearestBuildingModel)(float atX, float atY, float atZ, float radius, Model from, Model to) |   |

[03B7](https://wiki.blast.hk/gta-sa/opcodes/03B7) |  [switchWorldProcessing](https://wiki.blast.hk/moonloader/lua/switchWorldProcessing)(bool cutsceneOnly) |   |

[03BA](https://wiki.blast.hk/gta-sa/opcodes/03BA) |  [clearAreaOfCars](https://wiki.blast.hk/moonloader/lua/clearAreaOfCars)(float cornerAX, float cornerAY, float cornerAZ, float cornerBX, float cornerBY, float cornerBZ) |   |

[03BC](https://wiki.blast.hk/gta-sa/opcodes/03BC) |  int sphere = [addSphere](https://wiki.blast.hk/moonloader/lua/addSphere)(float atX, float atY, float atZ, float radius) |   |

[03BD](https://wiki.blast.hk/gta-sa/opcodes/03BD) |  [removeSphere](https://wiki.blast.hk/moonloader/lua/removeSphere)(int sphere) |   |

[03BF](https://wiki.blast.hk/gta-sa/opcodes/03BF) |  [setEveryoneIgnorePlayer](https://wiki.blast.hk/moonloader/lua/setEveryoneIgnorePlayer)(Player player, bool ignored) |   |

[03C0](https://wiki.blast.hk/gta-sa/opcodes/03C0) |  Vehicle car = [storeCarCharIsInNoSave](https://wiki.blast.hk/moonloader/lua/storeCarCharIsInNoSave)(Ped ped) |   |

[03C3](https://wiki.blast.hk/gta-sa/opcodes/03C3) |  [displayOnscreenTimerWithString](https://wiki.blast.hk/moonloader/lua/displayOnscreenTimerWithString)(VarId timer, int type, GxtString gxtString) |   |

[03C4](https://wiki.blast.hk/gta-sa/opcodes/03C4) |  [displayOnscreenCounterWithString](https://wiki.blast.hk/moonloader/lua/displayOnscreenCounterWithString)(VarId var, bool type, GxtString gxtString) |   |

[03C5](https://wiki.blast.hk/gta-sa/opcodes/03C5) |  [createRandomCarForCarPark](https://wiki.blast.hk/moonloader/lua/createRandomCarForCarPark)(float coordsX, float coordsY, float coordsZ, float zAngle) |   |

[03C7](https://wiki.blast.hk/gta-sa/opcodes/03C7) |  [setWantedMultiplier](https://wiki.blast.hk/moonloader/lua/setWantedMultiplier)(float sensitivity) |   |

[03C8](https://wiki.blast.hk/gta-sa/opcodes/03C8) |  [setCameraInFrontOfPlayer](https://wiki.blast.hk/moonloader/lua/setCameraInFrontOfPlayer)() |   |

[03C9](https://wiki.blast.hk/gta-sa/opcodes/03C9) |  bool result = [isCarVisiblyDamaged](https://wiki.blast.hk/moonloader/lua/isCarVisiblyDamaged)(Vehicle car) |   |

[03CA](https://wiki.blast.hk/gta-sa/opcodes/03CA) |  bool result = [doesObjectExist](https://wiki.blast.hk/moonloader/lua/doesObjectExist)(Object object) |   |

[03CB](https://wiki.blast.hk/gta-sa/opcodes/03CB) |  [loadScene](https://wiki.blast.hk/moonloader/lua/loadScene)(float atX, float atY, float atZ) |   |

[03CC](https://wiki.blast.hk/gta-sa/opcodes/03CC) |  [addStuckCarCheck](https://wiki.blast.hk/moonloader/lua/addStuckCarCheck)(Vehicle car, float stuckCheckDistance, int time) |   |

[03CD](https://wiki.blast.hk/gta-sa/opcodes/03CD) |  [removeStuckCarCheck](https://wiki.blast.hk/moonloader/lua/removeStuckCarCheck)(Vehicle car) |   |

[03CE](https://wiki.blast.hk/gta-sa/opcodes/03CE) |  bool result = [isCarStuck](https://wiki.blast.hk/moonloader/lua/isCarStuck)(Vehicle car) |   |

[03CF](https://wiki.blast.hk/gta-sa/opcodes/03CF) |  [loadMissionAudio](https://wiki.blast.hk/moonloader/lua/loadMissionAudio)(int asId, int name) |   |

[03D0](https://wiki.blast.hk/gta-sa/opcodes/03D0) |  bool result = [hasMissionAudioLoaded](https://wiki.blast.hk/moonloader/lua/hasMissionAudioLoaded)(int id) |   |

[03D1](https://wiki.blast.hk/gta-sa/opcodes/03D1) |  [playMissionAudio](https://wiki.blast.hk/moonloader/lua/playMissionAudio)(int id) |   |

[03D2](https://wiki.blast.hk/gta-sa/opcodes/03D2) |  bool result = [hasMissionAudioFinished](https://wiki.blast.hk/moonloader/lua/hasMissionAudioFinished)(int id) |   |

[03D3](https://wiki.blast.hk/gta-sa/opcodes/03D3) |  float nodeX, float nodeY, float nodeZ, float angle = [getClosestCarNodeWithHeading](https://wiki.blast.hk/moonloader/lua/getClosestCarNodeWithHeading)(float X, float Y, float Z) |   |

[03D4](https://wiki.blast.hk/gta-sa/opcodes/03D4) |  bool result = [hasImportGarageSlotBeenFilled](https://wiki.blast.hk/moonloader/lua/hasImportGarageSlotBeenFilled)(int int1, int int2) |   |

[03D5](https://wiki.blast.hk/gta-sa/opcodes/03D5) |  [clearThisPrint](https://wiki.blast.hk/moonloader/lua/clearThisPrint)(GxtString text) |   |

[03D6](https://wiki.blast.hk/gta-sa/opcodes/03D6) |  [clearThisBigPrint](https://wiki.blast.hk/moonloader/lua/clearThisBigPrint)(GxtString text) |   |

[03D7](https://wiki.blast.hk/gta-sa/opcodes/03D7) |  [setMissionAudioPosition](https://wiki.blast.hk/moonloader/lua/setMissionAudioPosition)(int id, float locationX, float locationY, float locationZ) |   |

[03D8](https://wiki.blast.hk/gta-sa/opcodes/03D8) |  [activateSaveMenu](https://wiki.blast.hk/moonloader/lua/activateSaveMenu)() |   |

[03D9](https://wiki.blast.hk/gta-sa/opcodes/03D9) |  bool result = [hasSaveGameFinished](https://wiki.blast.hk/moonloader/lua/hasSaveGameFinished)() |   |

[03DA](https://wiki.blast.hk/gta-sa/opcodes/03DA) |  [noSpecialCameraForThisGarage](https://wiki.blast.hk/moonloader/lua/noSpecialCameraForThisGarage)(int int1) |   |

[03DC](https://wiki.blast.hk/gta-sa/opcodes/03DC) |  Marker marker = [addBlipForPickup](https://wiki.blast.hk/moonloader/lua/addBlipForPickup)(Pickup pickup) |   |

[03DE](https://wiki.blast.hk/gta-sa/opcodes/03DE) |  [setPedDensityMultiplier](https://wiki.blast.hk/moonloader/lua/setPedDensityMultiplier)(float multiplier) |   |

[03E0](https://wiki.blast.hk/gta-sa/opcodes/03E0) |  [setTextDrawBeforeFade](https://wiki.blast.hk/moonloader/lua/setTextDrawBeforeFade)(bool int1) |   |

[03E1](https://wiki.blast.hk/gta-sa/opcodes/03E1) |  int collected = [getCollectable1sCollected](https://wiki.blast.hk/moonloader/lua/getCollectable1sCollected)() |   |

[03E3](https://wiki.blast.hk/gta-sa/opcodes/03E3) |  [setSpritesDrawBeforeFade](https://wiki.blast.hk/moonloader/lua/setSpritesDrawBeforeFade)(bool antialiased) |   |

[03E4](https://wiki.blast.hk/gta-sa/opcodes/03E4) |  [setTextRightJustify](https://wiki.blast.hk/moonloader/lua/setTextRightJustify)(bool alignRight) |   |

[03E5](https://wiki.blast.hk/gta-sa/opcodes/03E5) |  [printHelp](https://wiki.blast.hk/moonloader/lua/printHelp)(GxtString gxtString) |   |

[03E6](https://wiki.blast.hk/gta-sa/opcodes/03E6) |  [clearHelp](https://wiki.blast.hk/moonloader/lua/clearHelp)() |   |

[03E7](https://wiki.blast.hk/gta-sa/opcodes/03E7) |  [flashHudObject](https://wiki.blast.hk/moonloader/lua/flashHudObject)(int hudComponent) |   |

[03E8](https://wiki.blast.hk/gta-sa/opcodes/03E8) |   |  [1:12] |

[03EA](https://wiki.blast.hk/gta-sa/opcodes/03EA) |  [setGenerateCarsAroundCamera](https://wiki.blast.hk/moonloader/lua/setGenerateCarsAroundCamera)(bool int1) |   |

[03EB](https://wiki.blast.hk/gta-sa/opcodes/03EB) |  [clearSmallPrints](https://wiki.blast.hk/moonloader/lua/clearSmallPrints)() |   |

[03ED](https://wiki.blast.hk/gta-sa/opcodes/03ED) |  [setUpsidedownCarNotDamaged](https://wiki.blast.hk/moonloader/lua/setUpsidedownCarNotDamaged)(Vehicle car, bool disableFlippedExplosion) |   |

[03EE](https://wiki.blast.hk/gta-sa/opcodes/03EE) |  bool result = [isPlayerControllable](https://wiki.blast.hk/moonloader/lua/isPlayerControllable)(Player player) |   |

[03EF](https://wiki.blast.hk/gta-sa/opcodes/03EF) |  [makePlayerSafe](https://wiki.blast.hk/moonloader/lua/makePlayerSafe)(Player player) |   |

[03F0](https://wiki.blast.hk/gta-sa/opcodes/03F0) |  [useRenderCommands](https://wiki.blast.hk/moonloader/lua/useRenderCommands) |  [2:12] |

[03F0](https://wiki.blast.hk/gta-sa/opcodes/03F0) |  [useRenderCommands](https://wiki.blast.hk/moonloader/lua/useRenderCommands)(bool enable) |  [4] |

[03F3](https://wiki.blast.hk/gta-sa/opcodes/03F3) |  int primaryColor, int secondaryColor = [getCarColours](https://wiki.blast.hk/moonloader/lua/getCarColours)(Vehicle car) |   |

[03F4](https://wiki.blast.hk/gta-sa/opcodes/03F4) |  [setAllCarsCanBeDamaged](https://wiki.blast.hk/moonloader/lua/setAllCarsCanBeDamaged)(bool enable) |   |

[03F5](https://wiki.blast.hk/gta-sa/opcodes/03F5) |  [setCarCanBeDamaged](https://wiki.blast.hk/moonloader/lua/setCarCanBeDamaged)(Vehicle car, bool enable) |   |

[03FD](https://wiki.blast.hk/gta-sa/opcodes/03FD) |  [setDrunkInputDelay](https://wiki.blast.hk/moonloader/lua/setDrunkInputDelay)(Player player, int handlingResponsiveness) |   |

[03FE](https://wiki.blast.hk/gta-sa/opcodes/03FE) |  [setCharMoney](https://wiki.blast.hk/moonloader/lua/setCharMoney)(Ped ped, int money) |   |

[0400](https://wiki.blast.hk/gta-sa/opcodes/0400) |  float X, float Y, float Z = [getOffsetFromObjectInWorldCoords](https://wiki.blast.hk/moonloader/lua/getOffsetFromObjectInWorldCoords)(Object object, float offsetX, float offsetY, float offsetZ) |   |

[0407](https://wiki.blast.hk/gta-sa/opcodes/0407) |  float X, float Y, float Z = [getOffsetFromCarInWorldCoords](https://wiki.blast.hk/moonloader/lua/getOffsetFromCarInWorldCoords)(Vehicle car, float offsetX, float offsetY, float offsetZ) |   |

[0409](https://wiki.blast.hk/gta-sa/opcodes/0409) |   |  [1:13] |

[040B](https://wiki.blast.hk/gta-sa/opcodes/040B) |   |  [1:14] |

[040C](https://wiki.blast.hk/gta-sa/opcodes/040C) |   |  [1:15] |

[040D](https://wiki.blast.hk/gta-sa/opcodes/040D) |  [clearMissionAudio](https://wiki.blast.hk/moonloader/lua/clearMissionAudio)(int id) |   |

[0414](https://wiki.blast.hk/gta-sa/opcodes/0414) |  [setFreeHealthCare](https://wiki.blast.hk/moonloader/lua/setFreeHealthCare)(Player player, bool free) |   |

[0416](https://wiki.blast.hk/gta-sa/opcodes/0416) |   |  [1:16] |

[0417](https://wiki.blast.hk/gta-sa/opcodes/0417) |  [loadAndLaunchMissionInternal](https://wiki.blast.hk/moonloader/lua/loadAndLaunchMissionInternal)(int mission) |   |

[0418](https://wiki.blast.hk/gta-sa/opcodes/0418) |  [setObjectDrawLast](https://wiki.blast.hk/moonloader/lua/setObjectDrawLast)(Object object, bool drawLast) |   |

[041A](https://wiki.blast.hk/gta-sa/opcodes/041A) |  int ammo = [getAmmoInCharWeapon](https://wiki.blast.hk/moonloader/lua/getAmmoInCharWeapon)(Ped ped, int int) |   |

[041D](https://wiki.blast.hk/gta-sa/opcodes/041D) |  [setNearClip](https://wiki.blast.hk/moonloader/lua/setNearClip)(float clip) |   |

[041E](https://wiki.blast.hk/gta-sa/opcodes/041E) |  [setRadioChannel](https://wiki.blast.hk/moonloader/lua/setRadioChannel)(int radioStation) |   |

[0423](https://wiki.blast.hk/gta-sa/opcodes/0423) |  [setCarTraction](https://wiki.blast.hk/moonloader/lua/setCarTraction)(Vehicle car, float traction) |   |

[0424](https://wiki.blast.hk/gta-sa/opcodes/0424) |  bool result = [areMeasurementsInMetres](https://wiki.blast.hk/moonloader/lua/areMeasurementsInMetres)() |   |

[0425](https://wiki.blast.hk/gta-sa/opcodes/0425) |  float feet = [convertMetresToFeet](https://wiki.blast.hk/moonloader/lua/convertMetresToFeet)(float meters) |   |

[0428](https://wiki.blast.hk/gta-sa/opcodes/0428) |  [setCarAvoidLevelTransitions](https://wiki.blast.hk/moonloader/lua/setCarAvoidLevelTransitions)(Vehicle car, bool avoidLevelTransitions) |   |

[042B](https://wiki.blast.hk/gta-sa/opcodes/042B) |  [clearAreaOfChars](https://wiki.blast.hk/moonloader/lua/clearAreaOfChars)(float cornerAX, float cornerAY, float cornerAZ, float cornerBX, float cornerBY, float cornerBZ) |   |

[042C](https://wiki.blast.hk/gta-sa/opcodes/042C) |  [setTotalNumberOfMissions](https://wiki.blast.hk/moonloader/lua/setTotalNumberOfMissions)(int totalMissions) |   |

[042D](https://wiki.blast.hk/gta-sa/opcodes/042D) |  int imperial = [convertMetresToFeetInt](https://wiki.blast.hk/moonloader/lua/convertMetresToFeetInt)(int metric) |   |

[042E](https://wiki.blast.hk/gta-sa/opcodes/042E) |  [registerFastestTime](https://wiki.blast.hk/moonloader/lua/registerFastestTime)(int stat, int to) |   |

[042F](https://wiki.blast.hk/gta-sa/opcodes/042F) |  [registerHighestScore](https://wiki.blast.hk/moonloader/lua/registerHighestScore)(int int1, int int2) |   |

[0430](https://wiki.blast.hk/gta-sa/opcodes/0430) |  [warpCharIntoCarAsPassenger](https://wiki.blast.hk/moonloader/lua/warpCharIntoCarAsPassenger)(Ped ped, Vehicle car, int passengerSeat) |   |

[0431](https://wiki.blast.hk/gta-sa/opcodes/0431) |  bool result = [isCarPassengerSeatFree](https://wiki.blast.hk/moonloader/lua/isCarPassengerSeatFree)(Vehicle car, int seat) |   |

[0432](https://wiki.blast.hk/gta-sa/opcodes/0432) |  Ped ped = [getCharInCarPassengerSeat](https://wiki.blast.hk/moonloader/lua/getCharInCarPassengerSeat)(Vehicle car, int seat) |   |

[0433](https://wiki.blast.hk/gta-sa/opcodes/0433) |  [setCharIsChrisCriminal](https://wiki.blast.hk/moonloader/lua/setCharIsChrisCriminal)(Ped ped, bool flag) |   |

[0434](https://wiki.blast.hk/gta-sa/opcodes/0434) |  [startCredits](https://wiki.blast.hk/moonloader/lua/startCredits)() |   |

[0435](https://wiki.blast.hk/gta-sa/opcodes/0435) |  [stopCredits](https://wiki.blast.hk/moonloader/lua/stopCredits)() |   |

[0436](https://wiki.blast.hk/gta-sa/opcodes/0436) |  bool result = [areCreditsFinished](https://wiki.blast.hk/moonloader/lua/areCreditsFinished)() |   |

[043C](https://wiki.blast.hk/gta-sa/opcodes/043C) |  [setMusicDoesFade](https://wiki.blast.hk/moonloader/lua/setMusicDoesFade)(bool enable) |   |

[043E](https://wiki.blast.hk/gta-sa/opcodes/043E) |   |  [1:17] |

[043F](https://wiki.blast.hk/gta-sa/opcodes/043F) |   |  [1:18] |

[0440](https://wiki.blast.hk/gta-sa/opcodes/0440) |   |  [1:19] |

[0441](https://wiki.blast.hk/gta-sa/opcodes/0441) |  Model modelId = [getCarModel](https://wiki.blast.hk/moonloader/lua/getCarModel)(Vehicle veh) |   |

[0445](https://wiki.blast.hk/gta-sa/opcodes/0445) |  bool result = [areAnyCarCheatsActivated](https://wiki.blast.hk/moonloader/lua/areAnyCarCheatsActivated)() |   |

[0446](https://wiki.blast.hk/gta-sa/opcodes/0446) |  [setCharSuffersCriticalHits](https://wiki.blast.hk/moonloader/lua/setCharSuffersCriticalHits)(Ped ped, bool enable) |   |

[0448](https://wiki.blast.hk/gta-sa/opcodes/0448) |  bool result = [isCharSittingInCar](https://wiki.blast.hk/moonloader/lua/isCharSittingInCar)(Ped ped, Vehicle car) |   |

[0449](https://wiki.blast.hk/gta-sa/opcodes/0449) |  bool result = [isCharSittingInAnyCar](https://wiki.blast.hk/moonloader/lua/isCharSittingInAnyCar)(Ped ped) |   |

[044B](https://wiki.blast.hk/gta-sa/opcodes/044B) |  bool result = [isCharOnFoot](https://wiki.blast.hk/moonloader/lua/isCharOnFoot)(Ped ped) |   |

[044D](https://wiki.blast.hk/gta-sa/opcodes/044D) |  [loadSplashScreen](https://wiki.blast.hk/moonloader/lua/loadSplashScreen)(GxtString gxtString) |   |

[0450](https://wiki.blast.hk/gta-sa/opcodes/0450) |  [setJamesCarOnPathToPlayer](https://wiki.blast.hk/moonloader/lua/setJamesCarOnPathToPlayer)(int int1) |   |

[0451](https://wiki.blast.hk/gta-sa/opcodes/0451) |   |  [1:20] |

[0453](https://wiki.blast.hk/gta-sa/opcodes/0453) |  [setObjectRotation](https://wiki.blast.hk/moonloader/lua/setObjectRotation)(Object object, float rotationX, float rotationY, float rotationZ) |   |

[0454](https://wiki.blast.hk/gta-sa/opcodes/0454) |  float X, float Y, float Z = [getDebugCameraCoordinates](https://wiki.blast.hk/moonloader/lua/getDebugCameraCoordinates)() |   |

[0457](https://wiki.blast.hk/gta-sa/opcodes/0457) |  bool result = [isPlayerTargettingChar](https://wiki.blast.hk/moonloader/lua/isPlayerTargettingChar)(Player player, Ped ped) |   |

[0458](https://wiki.blast.hk/gta-sa/opcodes/0458) |  bool result = [isPlayerTargettingObject](https://wiki.blast.hk/moonloader/lua/isPlayerTargettingObject)(Player player, Object object) |   |

[0459](https://wiki.blast.hk/gta-sa/opcodes/0459) |   |  [3:8] |

[045A](https://wiki.blast.hk/gta-sa/opcodes/045A) |  [displayTextWithNumber](https://wiki.blast.hk/moonloader/lua/displayTextWithNumber)(float x, float y, GxtString gxtString, int number) |   |

[045B](https://wiki.blast.hk/gta-sa/opcodes/045B) |  [displayTextWith2Numbers](https://wiki.blast.hk/moonloader/lua/displayTextWith2Numbers)(float x, float y, GxtString gxtString, int numbersX, int numbersY) |   |

[045C](https://wiki.blast.hk/gta-sa/opcodes/045C) |  [failCurrentMission](https://wiki.blast.hk/moonloader/lua/failCurrentMission)() |   |

[045D](https://wiki.blast.hk/gta-sa/opcodes/045D) |   |  [1:21] |

[0460](https://wiki.blast.hk/gta-sa/opcodes/0460) |  [setInterpolationParameters](https://wiki.blast.hk/moonloader/lua/setInterpolationParameters)(float delay, int time) |   |

[0463](https://wiki.blast.hk/gta-sa/opcodes/0463) |  float X, float Y, float Z = [getDebugCameraPointAt](https://wiki.blast.hk/moonloader/lua/getDebugCameraPointAt)() |   |

[0464](https://wiki.blast.hk/gta-sa/opcodes/0464) |  [attachCharToCar](https://wiki.blast.hk/moonloader/lua/attachCharToCar)(Ped ped, Vehicle car, float offsetX, float offsetY, float offsetZ, int position, float shootingAngleLimit, int weapon) |   |

[0465](https://wiki.blast.hk/gta-sa/opcodes/0465) |  [detachCharFromCar](https://wiki.blast.hk/moonloader/lua/detachCharFromCar)(Ped ped) |   |

[0466](https://wiki.blast.hk/gta-sa/opcodes/0466) |  [setCarStayInFastLane](https://wiki.blast.hk/moonloader/lua/setCarStayInFastLane)(Vehicle car, bool flag) |   |

[0467](https://wiki.blast.hk/gta-sa/opcodes/0467) |  [clearCharLastWeaponDamage](https://wiki.blast.hk/moonloader/lua/clearCharLastWeaponDamage)(Ped ped) |   |

[0468](https://wiki.blast.hk/gta-sa/opcodes/0468) |  [clearCarLastWeaponDamage](https://wiki.blast.hk/moonloader/lua/clearCarLastWeaponDamage)(Vehicle car) |   |

[0469](https://wiki.blast.hk/gta-sa/opcodes/0469) |  int int10 = [getRandomCopInArea](https://wiki.blast.hk/moonloader/lua/getRandomCopInArea)(float float1, float float2, float float3, float float4, bool int5, bool int6, bool int7, bool int8, bool int9) |   |

[046C](https://wiki.blast.hk/gta-sa/opcodes/046C) |  Ped ped = [getDriverOfCar](https://wiki.blast.hk/moonloader/lua/getDriverOfCar)(Vehicle car) |   |

[046D](https://wiki.blast.hk/gta-sa/opcodes/046D) |  int followers = [getNumberOfFollowers](https://wiki.blast.hk/moonloader/lua/getNumberOfFollowers)(Ped ped) |   |

[046E](https://wiki.blast.hk/gta-sa/opcodes/046E) |  [giveRemoteControlledModelToPlayer](https://wiki.blast.hk/moonloader/lua/giveRemoteControlledModelToPlayer)(Player player, float atX, float atY, float atZ, float angle, Model RCModel) |   |

[0470](https://wiki.blast.hk/gta-sa/opcodes/0470) |  int weapon = [getCurrentCharWeapon](https://wiki.blast.hk/moonloader/lua/getCurrentCharWeapon)(Ped ped) |   |

[0471](https://wiki.blast.hk/gta-sa/opcodes/0471) |  bool result = [locateCharAnyMeansObject2d](https://wiki.blast.hk/moonloader/lua/locateCharAnyMeansObject2d)(Ped ped, Object object, float radiusX, float radiusY, bool sphere) |   |

[0472](https://wiki.blast.hk/gta-sa/opcodes/0472) |  bool result = [locateCharOnFootObject2d](https://wiki.blast.hk/moonloader/lua/locateCharOnFootObject2d)(Ped ped, Object object, float radiusX, float radiusY, bool sphere) |   |

[0473](https://wiki.blast.hk/gta-sa/opcodes/0473) |  bool result = [locateCharInCarObject2d](https://wiki.blast.hk/moonloader/lua/locateCharInCarObject2d)(Ped ped, Object object, float radiusX, float radiusY, bool sphere) |   |

[0474](https://wiki.blast.hk/gta-sa/opcodes/0474) |  bool result = [locateCharAnyMeansObject3d](https://wiki.blast.hk/moonloader/lua/locateCharAnyMeansObject3d)(Ped ped, Object object, float radiusX, float radiusY, float radiusZ, bool sphere) |   |

[0475](https://wiki.blast.hk/gta-sa/opcodes/0475) |  bool result = [locateCharOnFootObject3d](https://wiki.blast.hk/moonloader/lua/locateCharOnFootObject3d)(Ped ped, Object object, float radiusX, float radiusY, float radiusZ, bool sphere) |   |

[0476](https://wiki.blast.hk/gta-sa/opcodes/0476) |  bool result = [locateCharInCarObject3d](https://wiki.blast.hk/moonloader/lua/locateCharInCarObject3d)(Ped ped, Object object, float radiusX, float radiusY, float radiusZ, bool sphere) |   |

[0477](https://wiki.blast.hk/gta-sa/opcodes/0477) |  [setCarTempAction](https://wiki.blast.hk/moonloader/lua/setCarTempAction)(Vehicle car, int action, int time) |   |

[047A](https://wiki.blast.hk/gta-sa/opcodes/047A) |  bool result = [isCharOnAnyBike](https://wiki.blast.hk/moonloader/lua/isCharOnAnyBike)(Ped ped) |   |

[0480](https://wiki.blast.hk/gta-sa/opcodes/0480) |  bool result = [canCharSeeDeadChar](https://wiki.blast.hk/moonloader/lua/canCharSeeDeadChar)(Ped ped, int pedtype) |   |

[0481](https://wiki.blast.hk/gta-sa/opcodes/0481) |  [setEnterCarRangeMultiplier](https://wiki.blast.hk/moonloader/lua/setEnterCarRangeMultiplier)(float float1) |   |

[0482](https://wiki.blast.hk/gta-sa/opcodes/0482) |   |  [1:22] |

[0484](https://wiki.blast.hk/gta-sa/opcodes/0484) |  Vehicle car = [getRemoteControlledCar](https://wiki.blast.hk/moonloader/lua/getRemoteControlledCar)(Player player) |   |

[0485](https://wiki.blast.hk/gta-sa/opcodes/0485) |  bool result = [isPcVersion](https://wiki.blast.hk/moonloader/lua/isPcVersion)() |   |

[0488](https://wiki.blast.hk/gta-sa/opcodes/0488) |  bool result = [isModelAvailable](https://wiki.blast.hk/moonloader/lua/isModelAvailable)(Model modelId) |   |

[0489](https://wiki.blast.hk/gta-sa/opcodes/0489) |  [shutCharUp](https://wiki.blast.hk/moonloader/lua/shutCharUp)(Ped ped, bool muted) |   |

[048A](https://wiki.blast.hk/gta-sa/opcodes/048A) |  [setEnableRcDetonate](https://wiki.blast.hk/moonloader/lua/setEnableRcDetonate)(bool detonation) |   |

[048B](https://wiki.blast.hk/gta-sa/opcodes/048B) |  [setCarRandomRouteSeed](https://wiki.blast.hk/moonloader/lua/setCarRandomRouteSeed)(Vehicle car, int routeSeed) |   |

[048C](https://wiki.blast.hk/gta-sa/opcodes/048C) |  bool result = [isAnyPickupAtCoords](https://wiki.blast.hk/moonloader/lua/isAnyPickupAtCoords)(float pickupX, float pickupY, float pickupZ) |   |

[048F](https://wiki.blast.hk/gta-sa/opcodes/048F) |  [removeAllCharWeapons](https://wiki.blast.hk/moonloader/lua/removeAllCharWeapons)(Ped ped) |   |

[0491](https://wiki.blast.hk/gta-sa/opcodes/0491) |  bool result = [hasCharGotWeapon](https://wiki.blast.hk/moonloader/lua/hasCharGotWeapon)(Ped ped, int weapon) |   |

[0493](https://wiki.blast.hk/gta-sa/opcodes/0493) |  [setTankDetonateCars](https://wiki.blast.hk/moonloader/lua/setTankDetonateCars)(int tank, bool detonate) |   |

[0494](https://wiki.blast.hk/gta-sa/opcodes/0494) |  int offset1, int offset2, int offset3, int offset4 = [getPositionOfAnalogueSticks](https://wiki.blast.hk/moonloader/lua/getPositionOfAnalogueSticks)(int joystick) |   |

[0495](https://wiki.blast.hk/gta-sa/opcodes/0495) |  bool result = [isCarOnFire](https://wiki.blast.hk/moonloader/lua/isCarOnFire)(Vehicle car) |   |

[0496](https://wiki.blast.hk/gta-sa/opcodes/0496) |  bool result = [isCarTireBurst](https://wiki.blast.hk/moonloader/lua/isCarTireBurst)(Vehicle car, int tire) |   |

[049C](https://wiki.blast.hk/gta-sa/opcodes/049C) |  [initialiseObjectPath](https://wiki.blast.hk/moonloader/lua/initialiseObjectPath)(int int1, float float2) |   |

[049E](https://wiki.blast.hk/gta-sa/opcodes/049E) |  [setObjectPathSpeed](https://wiki.blast.hk/moonloader/lua/setObjectPathSpeed)(int int1, int int2) |   |

[049F](https://wiki.blast.hk/gta-sa/opcodes/049F) |  [setObjectPathPosition](https://wiki.blast.hk/moonloader/lua/setObjectPathPosition)(int int1, float float2) |   |

[04A1](https://wiki.blast.hk/gta-sa/opcodes/04A1) |  [clearObjectPath](https://wiki.blast.hk/moonloader/lua/clearObjectPath)(int int1) |   |

[04A2](https://wiki.blast.hk/gta-sa/opcodes/04A2) |  [heliGotoCoords](https://wiki.blast.hk/moonloader/lua/heliGotoCoords)(Vehicle heli, float toX, float toY, float toZ, float altitudeMin, float altitudeMax) |   |

[04A3](https://wiki.blast.hk/gta-sa/opcodes/04A3) |   |  [3:9] |

[04A4](https://wiki.blast.hk/gta-sa/opcodes/04A4) |   |  [3:10] |

[04A5](https://wiki.blast.hk/gta-sa/opcodes/04A5) |  float coordsX, float coordsY, float coordsZ = [getDeadCharPickupCoords](https://wiki.blast.hk/moonloader/lua/getDeadCharPickupCoords)(Ped ped) |   |

[04A6](https://wiki.blast.hk/gta-sa/opcodes/04A6) |  Pickup pickup = [createProtectionPickup](https://wiki.blast.hk/moonloader/lua/createProtectionPickup)(float atX, float atY, float atZ, int int4, int int5) |   |

[04A7](https://wiki.blast.hk/gta-sa/opcodes/04A7) |  bool result = [isCharInAnyBoat](https://wiki.blast.hk/moonloader/lua/isCharInAnyBoat)(Ped ped) |   |

[04A9](https://wiki.blast.hk/gta-sa/opcodes/04A9) |  bool result = [isCharInAnyHeli](https://wiki.blast.hk/moonloader/lua/isCharInAnyHeli)(Ped ped) |   |

[04AB](https://wiki.blast.hk/gta-sa/opcodes/04AB) |  bool result = [isCharInAnyPlane](https://wiki.blast.hk/moonloader/lua/isCharInAnyPlane)(Ped ped) |   |

[04AD](https://wiki.blast.hk/gta-sa/opcodes/04AD) |  bool result = [isCharInWater](https://wiki.blast.hk/moonloader/lua/isCharInWater)(Ped ped) |   |

[04AE](https://wiki.blast.hk/gta-sa/opcodes/04AE) |   |  [3:11] |

[04AF](https://wiki.blast.hk/gta-sa/opcodes/04AF) |   |  [3:12] |

[04B0](https://wiki.blast.hk/gta-sa/opcodes/04B0) |   |  [3:13] |

[04B1](https://wiki.blast.hk/gta-sa/opcodes/04B1) |   |  [3:14] |

[04B2](https://wiki.blast.hk/gta-sa/opcodes/04B2) |   |  [3:15] |

[04B3](https://wiki.blast.hk/gta-sa/opcodes/04B3) |   |  [3:16] |

[04B4](https://wiki.blast.hk/gta-sa/opcodes/04B4) |   |  [3:17] |

[04B5](https://wiki.blast.hk/gta-sa/opcodes/04B5) |   |  [3:18] |

[04B6](https://wiki.blast.hk/gta-sa/opcodes/04B6) |   |  [3:19] |

[04B7](https://wiki.blast.hk/gta-sa/opcodes/04B7) |   |  [3:20] |

[04B8](https://wiki.blast.hk/gta-sa/opcodes/04B8) |  int weapon, int ammo, Model modelId = [getCharWeaponInSlot](https://wiki.blast.hk/moonloader/lua/getCharWeaponInSlot)(Ped ped, int slot) |   |

[04B9](https://wiki.blast.hk/gta-sa/opcodes/04B9) |  float float6, float float7, float float8, float float9, float float10, float float11, float float12 = [getClosestStraightRoad](https://wiki.blast.hk/moonloader/lua/getClosestStraightRoad)(float atX, float atY, float atZ, float height, float radius) |   |

[04BA](https://wiki.blast.hk/gta-sa/opcodes/04BA) |  [setCarForwardSpeed](https://wiki.blast.hk/moonloader/lua/setCarForwardSpeed)(Vehicle car, float speed) |   |

[04BB](https://wiki.blast.hk/gta-sa/opcodes/04BB) |  [setInteriorVisible](https://wiki.blast.hk/moonloader/lua/setInteriorVisible)(int interior) |   |

[04BC](https://wiki.blast.hk/gta-sa/opcodes/04BC) |   |  [1:23] |

[04BD](https://wiki.blast.hk/gta-sa/opcodes/04BD) |  [markCarAsConvoyCar](https://wiki.blast.hk/moonloader/lua/markCarAsConvoyCar)(Vehicle car, bool convoy) |   |

[04BE](https://wiki.blast.hk/gta-sa/opcodes/04BE) |  [resetHavocCausedByPlayer](https://wiki.blast.hk/moonloader/lua/resetHavocCausedByPlayer)(int int1) |   |

[04BF](https://wiki.blast.hk/gta-sa/opcodes/04BF) |  int int2 = [getHavocCausedByPlayer](https://wiki.blast.hk/moonloader/lua/getHavocCausedByPlayer)(int int1) |   |

[04C0](https://wiki.blast.hk/gta-sa/opcodes/04C0) |  [createScriptRoadblock](https://wiki.blast.hk/moonloader/lua/createScriptRoadblock)(float cornerAX, float cornerAY, float cornerAZ, float cornerBX, float cornerBY, float cornerBZ, int type) |   |

[04C1](https://wiki.blast.hk/gta-sa/opcodes/04C1) |  [clearAllScriptRoadblocks](https://wiki.blast.hk/moonloader/lua/clearAllScriptRoadblocks)() |   |

[04C4](https://wiki.blast.hk/gta-sa/opcodes/04C4) |  float X, float Y, float Z = [getOffsetFromCharInWorldCoords](https://wiki.blast.hk/moonloader/lua/getOffsetFromCharInWorldCoords)(Ped ped, float offsetX, float offsetY, float offsetZ) |   |

[04C5](https://wiki.blast.hk/gta-sa/opcodes/04C5) |  bool result = [hasCharBeenPhotographed](https://wiki.blast.hk/moonloader/lua/hasCharBeenPhotographed)(Ped ped) |   |

[04C7](https://wiki.blast.hk/gta-sa/opcodes/04C7) |  [switchSecurityCamera](https://wiki.blast.hk/moonloader/lua/switchSecurityCamera)(bool int1) |   |

[04C8](https://wiki.blast.hk/gta-sa/opcodes/04C8) |  bool result = [isCharInFlyingVehicle](https://wiki.blast.hk/moonloader/lua/isCharInFlyingVehicle)(Ped ped) |   |

[04CE](https://wiki.blast.hk/gta-sa/opcodes/04CE) |  Marker marker = [addShortRangeSpriteBlipForCoord](https://wiki.blast.hk/moonloader/lua/addShortRangeSpriteBlipForCoord)(float atX, float atY, float atZ, int icon) |   |

[04D0](https://wiki.blast.hk/gta-sa/opcodes/04D0) |  [setHeliOrientation](https://wiki.blast.hk/moonloader/lua/setHeliOrientation)(Vehicle heli, float angle) |   |

[04D1](https://wiki.blast.hk/gta-sa/opcodes/04D1) |  [clearHeliOrientation](https://wiki.blast.hk/moonloader/lua/clearHeliOrientation)(Vehicle heli) |   |

[04D2](https://wiki.blast.hk/gta-sa/opcodes/04D2) |  [planeGotoCoords](https://wiki.blast.hk/moonloader/lua/planeGotoCoords)(int plane, float X, float Y, float Z, float z1, float z2) |   |

[04D3](https://wiki.blast.hk/gta-sa/opcodes/04D3) |  float X, float Y, float Z = [getNthClosestCarNode](https://wiki.blast.hk/moonloader/lua/getNthClosestCarNode)(float X, float Y, float Z, int type) |   |

[04D5](https://wiki.blast.hk/gta-sa/opcodes/04D5) |  [drawWeaponshopCorona](https://wiki.blast.hk/moonloader/lua/drawWeaponshopCorona)(float X, float Y, float Z, float radius, int type, int flare, int r, int g, int b) |   |

[04D6](https://wiki.blast.hk/gta-sa/opcodes/04D6) |  [setEnableRcDetonateOnContact](https://wiki.blast.hk/moonloader/lua/setEnableRcDetonateOnContact)(bool enable) |   |

[04D7](https://wiki.blast.hk/gta-sa/opcodes/04D7) |  [freezeCharPosition](https://wiki.blast.hk/moonloader/lua/freezeCharPosition)(Ped ped, bool locked) |   |

[04D8](https://wiki.blast.hk/gta-sa/opcodes/04D8) |  [setCharDrownsInWater](https://wiki.blast.hk/moonloader/lua/setCharDrownsInWater)(Ped ped, bool drowns) |   |

[04D9](https://wiki.blast.hk/gta-sa/opcodes/04D9) |  [setObjectRecordsCollisions](https://wiki.blast.hk/moonloader/lua/setObjectRecordsCollisions)(Object object, bool set) |   |

[04DA](https://wiki.blast.hk/gta-sa/opcodes/04DA) |  bool result = [hasObjectCollidedWithAnything](https://wiki.blast.hk/moonloader/lua/hasObjectCollidedWithAnything)(Object object) |   |

[04DB](https://wiki.blast.hk/gta-sa/opcodes/04DB) |  [removeRcBuggy](https://wiki.blast.hk/moonloader/lua/removeRcBuggy)() |   |

[04DD](https://wiki.blast.hk/gta-sa/opcodes/04DD) |  int armour = [getCharArmour](https://wiki.blast.hk/moonloader/lua/getCharArmour)(Ped ped) |   |

[04DF](https://wiki.blast.hk/gta-sa/opcodes/04DF) |  [setHeliStabiliser](https://wiki.blast.hk/moonloader/lua/setHeliStabiliser)(Vehicle heli, bool limiter) |   |

[04E0](https://wiki.blast.hk/gta-sa/opcodes/04E0) |  [setCarStraightLineDistance](https://wiki.blast.hk/moonloader/lua/setCarStraightLineDistance)(Vehicle car, int radius) |   |

[04E1](https://wiki.blast.hk/gta-sa/opcodes/04E1) |  [popCarBoot](https://wiki.blast.hk/moonloader/lua/popCarBoot)(Vehicle car) |   |

[04E2](https://wiki.blast.hk/gta-sa/opcodes/04E2) |  [shutPlayerUp](https://wiki.blast.hk/moonloader/lua/shutPlayerUp)(Player player, bool shut) |   |

[04E3](https://wiki.blast.hk/gta-sa/opcodes/04E3) |  [setPlayerMood](https://wiki.blast.hk/moonloader/lua/setPlayerMood)(Player player, int flag, int time) |   |

[04E4](https://wiki.blast.hk/gta-sa/opcodes/04E4) |  [requestCollision](https://wiki.blast.hk/moonloader/lua/requestCollision)(float X, float Y) |   |

[04E5](https://wiki.blast.hk/gta-sa/opcodes/04E5) |  bool result = [locateObject2d](https://wiki.blast.hk/moonloader/lua/locateObject2d)(Object object, float X, float Y, float radiusX, float radiusY, bool sphere) |   |

[04E6](https://wiki.blast.hk/gta-sa/opcodes/04E6) |  bool result = [locateObject3d](https://wiki.blast.hk/moonloader/lua/locateObject3d)(Object object, float X, float Y, float Z, float radiusX, float radiusY, float radiusZ, bool flag) |   |

[04E7](https://wiki.blast.hk/gta-sa/opcodes/04E7) |  bool result = [isObjectInWater](https://wiki.blast.hk/moonloader/lua/isObjectInWater)(Object object) |   |

[04E9](https://wiki.blast.hk/gta-sa/opcodes/04E9) |  bool result = [isObjectInArea2d](https://wiki.blast.hk/moonloader/lua/isObjectInArea2d)(Object object, float cornerAX, float cornerAY, float cornerBX, float cornerBY, bool sphere) |   |

[04EA](https://wiki.blast.hk/gta-sa/opcodes/04EA) |  bool result = [isObjectInArea3d](https://wiki.blast.hk/moonloader/lua/isObjectInArea3d)(Object object, float cornerAX, float cornerAY, float cornerAZ, float cornerBX, float cornerBY, float cornerBZ, bool flag) |   |

[04EB](https://wiki.blast.hk/gta-sa/opcodes/04EB) |  [taskToggleDuck](https://wiki.blast.hk/moonloader/lua/taskToggleDuck)(Ped ped, bool crouch) |   |

[04ED](https://wiki.blast.hk/gta-sa/opcodes/04ED) |  [requestAnimation](https://wiki.blast.hk/moonloader/lua/requestAnimation)(string animation) |   |

[04EE](https://wiki.blast.hk/gta-sa/opcodes/04EE) |  bool result = [hasAnimationLoaded](https://wiki.blast.hk/moonloader/lua/hasAnimationLoaded)(string animation) |   |

[04EF](https://wiki.blast.hk/gta-sa/opcodes/04EF) |  [removeAnimation](https://wiki.blast.hk/moonloader/lua/removeAnimation)(string animation) |   |

[04F0](https://wiki.blast.hk/gta-sa/opcodes/04F0) |  bool result = [isCharWaitingForWorldCollision](https://wiki.blast.hk/moonloader/lua/isCharWaitingForWorldCollision)(Ped ped) |   |

[04F1](https://wiki.blast.hk/gta-sa/opcodes/04F1) |  bool result = [isCarWaitingForWorldCollision](https://wiki.blast.hk/moonloader/lua/isCarWaitingForWorldCollision)(Vehicle car) |   |

[04F4](https://wiki.blast.hk/gta-sa/opcodes/04F4) |  [attachCharToObject](https://wiki.blast.hk/moonloader/lua/attachCharToObject)(Ped ped, Object object, float offsetX, float offsetY, float offsetZ, int orientation, float angle, int lockWeapon) |   |

[04F5](https://wiki.blast.hk/gta-sa/opcodes/04F5) |   |  [1:24] |

[04F7](https://wiki.blast.hk/gta-sa/opcodes/04F7) |  [displayNthOnscreenCounterWithString](https://wiki.blast.hk/moonloader/lua/displayNthOnscreenCounterWithString)(VarId text, int type, int line, GxtString gxtString) |   |

[04F8](https://wiki.blast.hk/gta-sa/opcodes/04F8) |  [addSetPiece](https://wiki.blast.hk/moonloader/lua/addSetPiece)(int type, float rectX1, float rectY1, float rectX2, float rectY2, float spawnAX, float spawnAY, float headedTowards1X, float headedTowards1Y, float spawnBX, float spawnBY, float headedTowards2X, float headedTowards2Y) |   |

[04F9](https://wiki.blast.hk/gta-sa/opcodes/04F9) |  [setExtraColours](https://wiki.blast.hk/moonloader/lua/setExtraColours)(int color, bool fade) |   |

[04FA](https://wiki.blast.hk/gta-sa/opcodes/04FA) |  [clearExtraColours](https://wiki.blast.hk/moonloader/lua/clearExtraColours)(bool fade) |   |

[04FC](https://wiki.blast.hk/gta-sa/opcodes/04FC) |  int twowheelstime, float twowheelsdistance, int wheelietime, float wheelieDistance, int stoppieTime, float stoppieDistance = [getWheelieStats](https://wiki.blast.hk/moonloader/lua/getWheelieStats)(Player player) |   |

[04FE](https://wiki.blast.hk/gta-sa/opcodes/04FE) |  [burstCarTire](https://wiki.blast.hk/moonloader/lua/burstCarTire)(Vehicle car, int tire) |   |

[0500](https://wiki.blast.hk/gta-sa/opcodes/0500) |  bool result = [isPlayerWearing](https://wiki.blast.hk/moonloader/lua/isPlayerWearing)(Player player, string bodypart, int skin) |   |

[0501](https://wiki.blast.hk/gta-sa/opcodes/0501) |  [setPlayerCanDoDriveBy](https://wiki.blast.hk/moonloader/lua/setPlayerCanDoDriveBy)(Player player, bool mode) |   |

[0503](https://wiki.blast.hk/gta-sa/opcodes/0503) |  int handleAs = [createSwatRope](https://wiki.blast.hk/moonloader/lua/createSwatRope)(int pedtype, Model modelId, float X, float Y, float Z) |   |

[0506](https://wiki.blast.hk/gta-sa/opcodes/0506) |  [setCarModelComponents](https://wiki.blast.hk/moonloader/lua/setCarModelComponents)(Model car, int variation1, int variation2) |   |

[0507](https://wiki.blast.hk/gta-sa/opcodes/0507) |   |  [1:25] |

[0508](https://wiki.blast.hk/gta-sa/opcodes/0508) |  [closeAllCarDoors](https://wiki.blast.hk/moonloader/lua/closeAllCarDoors)(Vehicle car) |   |

[0509](https://wiki.blast.hk/gta-sa/opcodes/0509) |  float distance = [getDistanceBetweenCoords2d](https://wiki.blast.hk/moonloader/lua/getDistanceBetweenCoords2d)(float x1, float y1, float x2, float y2) |   |

[050A](https://wiki.blast.hk/gta-sa/opcodes/050A) |  float distance = [getDistanceBetweenCoords3d](https://wiki.blast.hk/moonloader/lua/getDistanceBetweenCoords3d)(float x1, float y1, float z1, float x2, float y2, float z2) |   |

[050B](https://wiki.blast.hk/gta-sa/opcodes/050B) |   |  [1:26] |

[050E](https://wiki.blast.hk/gta-sa/opcodes/050E) |  [sortOutObjectCollisionWithCar](https://wiki.blast.hk/moonloader/lua/sortOutObjectCollisionWithCar)(Object object, Vehicle car) |   |

[050F](https://wiki.blast.hk/gta-sa/opcodes/050F) |  int level = [getMaxWantedLevel](https://wiki.blast.hk/moonloader/lua/getMaxWantedLevel)() |   |

[0512](https://wiki.blast.hk/gta-sa/opcodes/0512) |  [printHelpForever](https://wiki.blast.hk/moonloader/lua/printHelpForever)(GxtString text) |   |

[0513](https://wiki.blast.hk/gta-sa/opcodes/0513) |  [printHelpForeverWithNumber](https://wiki.blast.hk/moonloader/lua/printHelpForeverWithNumber)(GxtString text, int number) |   |

[0515](https://wiki.blast.hk/gta-sa/opcodes/0515) |   |  [1:27] |

[0517](https://wiki.blast.hk/gta-sa/opcodes/0517) |  Pickup pickup = [createLockedPropertyPickup](https://wiki.blast.hk/moonloader/lua/createLockedPropertyPickup)(float pX, float pY, float pZ, GxtString gxtString) |   |

[0518](https://wiki.blast.hk/gta-sa/opcodes/0518) |  Pickup pickup = [createForsalePropertyPickup](https://wiki.blast.hk/moonloader/lua/createForsalePropertyPickup)(float pX, float pY, float pZ, int price, GxtString gxtString) |   |

[0519](https://wiki.blast.hk/gta-sa/opcodes/0519) |  [freezeCarPosition](https://wiki.blast.hk/moonloader/lua/freezeCarPosition)(Vehicle car, bool locked) |   |

[051A](https://wiki.blast.hk/gta-sa/opcodes/051A) |  bool result = [hasCharBeenDamagedByChar](https://wiki.blast.hk/moonloader/lua/hasCharBeenDamagedByChar)(Ped ped, Ped byActor) |   |

[051B](https://wiki.blast.hk/gta-sa/opcodes/051B) |  bool result = [hasCharBeenDamagedByCar](https://wiki.blast.hk/moonloader/lua/hasCharBeenDamagedByCar)(Ped ped, Vehicle byCar) |   |

[051C](https://wiki.blast.hk/gta-sa/opcodes/051C) |  bool result = [hasCarBeenDamagedByChar](https://wiki.blast.hk/moonloader/lua/hasCarBeenDamagedByChar)(Vehicle car, Ped byActor) |   |

[051D](https://wiki.blast.hk/gta-sa/opcodes/051D) |  bool result = [hasCarBeenDamagedByCar](https://wiki.blast.hk/moonloader/lua/hasCarBeenDamagedByCar)(Vehicle car, Vehicle byCar) |   |

[051E](https://wiki.blast.hk/gta-sa/opcodes/051E) |  int radio = [getRadioChannel](https://wiki.blast.hk/moonloader/lua/getRadioChannel)() |   |

[0521](https://wiki.blast.hk/gta-sa/opcodes/0521) |   |  [1:28] |

[0522](https://wiki.blast.hk/gta-sa/opcodes/0522) |   |  [1:29] |

[0523](https://wiki.blast.hk/gta-sa/opcodes/0523) |   |  [1:30] |

[0524](https://wiki.blast.hk/gta-sa/opcodes/0524) |   |  [1:31] |

[0525](https://wiki.blast.hk/gta-sa/opcodes/0525) |   |  [1:32] |

[0526](https://wiki.blast.hk/gta-sa/opcodes/0526) |  [setCharStayInCarWhenJacked](https://wiki.blast.hk/moonloader/lua/setCharStayInCarWhenJacked)(Ped ped, bool stay) |   |

[052C](https://wiki.blast.hk/gta-sa/opcodes/052C) |  [setPlayerDrunkenness](https://wiki.blast.hk/moonloader/lua/setPlayerDrunkenness)(Player player, int drunk) |   |

[053E](https://wiki.blast.hk/gta-sa/opcodes/053E) |  Vehicle car = [getRandomCarOfTypeInAreaNoSave](https://wiki.blast.hk/moonloader/lua/getRandomCarOfTypeInAreaNoSave)(float x1, float y1, float x2, float y2, Model modelId) |   |

[053F](https://wiki.blast.hk/gta-sa/opcodes/053F) |  [setCanBurstCarTires](https://wiki.blast.hk/moonloader/lua/setCanBurstCarTires)(Vehicle car, bool vulnerability) |   |

[0540](https://wiki.blast.hk/gta-sa/opcodes/0540) |   |  [1:33] |

[0541](https://wiki.blast.hk/gta-sa/opcodes/0541) |  [fireHunterGun](https://wiki.blast.hk/moonloader/lua/fireHunterGun)(Vehicle car) |   |

[0545](https://wiki.blast.hk/gta-sa/opcodes/0545) |   |  [1:34] |

[0547](https://wiki.blast.hk/gta-sa/opcodes/0547) |  bool result = [isCharTouchingVehicle](https://wiki.blast.hk/moonloader/lua/isCharTouchingVehicle)(Ped ped, Vehicle car) |   |

[0548](https://wiki.blast.hk/gta-sa/opcodes/0548) |   |  [1:35] |

[054A](https://wiki.blast.hk/gta-sa/opcodes/054A) |  [setCharCanBeShotInVehicle](https://wiki.blast.hk/moonloader/lua/setCharCanBeShotInVehicle)(Ped ped, bool can) |   |

[054B](https://wiki.blast.hk/gta-sa/opcodes/054B) |   |  [1:36] |

[054C](https://wiki.blast.hk/gta-sa/opcodes/054C) |  [loadMissionText](https://wiki.blast.hk/moonloader/lua/loadMissionText)(GxtString table) |   |

[054D](https://wiki.blast.hk/gta-sa/opcodes/054D) |   |  [1:37] |

[054E](https://wiki.blast.hk/gta-sa/opcodes/054E) |  [clearCharLastDamageEntity](https://wiki.blast.hk/moonloader/lua/clearCharLastDamageEntity)(Ped ped) |   |

[054F](https://wiki.blast.hk/gta-sa/opcodes/054F) |  [clearCarLastDamageEntity](https://wiki.blast.hk/moonloader/lua/clearCarLastDamageEntity)(Vehicle car) |   |

[0550](https://wiki.blast.hk/gta-sa/opcodes/0550) |  [freezeObjectPosition](https://wiki.blast.hk/moonloader/lua/freezeObjectPosition)(Object object, bool freeze) |   |

[0551](https://wiki.blast.hk/gta-sa/opcodes/0551) |   |  [1:38] |

[0552](https://wiki.blast.hk/gta-sa/opcodes/0552) |   |  [1:39] |

[0555](https://wiki.blast.hk/gta-sa/opcodes/0555) |  [removeWeaponFromChar](https://wiki.blast.hk/moonloader/lua/removeWeaponFromChar)(Ped ped, int weapon) |   |

[0557](https://wiki.blast.hk/gta-sa/opcodes/0557) |   |  [1:40] |

[055B](https://wiki.blast.hk/gta-sa/opcodes/055B) |   |  [1:41] |

[055D](https://wiki.blast.hk/gta-sa/opcodes/055D) |  [makePlayerFireProof](https://wiki.blast.hk/moonloader/lua/makePlayerFireProof)(Player player, bool fireproof) |   |

[055E](https://wiki.blast.hk/gta-sa/opcodes/055E) |  [increasePlayerMaxHealth](https://wiki.blast.hk/moonloader/lua/increasePlayerMaxHealth)(Player player, int increase) |   |

[055F](https://wiki.blast.hk/gta-sa/opcodes/055F) |  [increasePlayerMaxArmour](https://wiki.blast.hk/moonloader/lua/increasePlayerMaxArmour)(Player player, int increase) |   |

[0560](https://wiki.blast.hk/gta-sa/opcodes/0560) |  Ped ped = [createRandomCharAsDriver](https://wiki.blast.hk/moonloader/lua/createRandomCharAsDriver)(Vehicle car) |   |

[0561](https://wiki.blast.hk/gta-sa/opcodes/0561) |  Ped ped = [createRandomCharAsPassenger](https://wiki.blast.hk/moonloader/lua/createRandomCharAsPassenger)(Vehicle car, int seat) |   |

[0563](https://wiki.blast.hk/gta-sa/opcodes/0563) |  [ensurePlayerHasDriveByWeapon](https://wiki.blast.hk/moonloader/lua/ensurePlayerHasDriveByWeapon)(Player player, int ammo) |   |

[0564](https://wiki.blast.hk/gta-sa/opcodes/0564) |  [makeHeliComeCrashingDown](https://wiki.blast.hk/moonloader/lua/makeHeliComeCrashingDown)(Vehicle heli) |   |

[0565](https://wiki.blast.hk/gta-sa/opcodes/0565) |  [addExplosionNoSound](https://wiki.blast.hk/moonloader/lua/addExplosionNoSound)(float pX, float pY, float pZ, int type) |   |

[0566](https://wiki.blast.hk/gta-sa/opcodes/0566) |  [linkObjectToInterior](https://wiki.blast.hk/moonloader/lua/linkObjectToInterior)(Object object, int interior) |   |

[0568](https://wiki.blast.hk/gta-sa/opcodes/0568) |  [setCharNeverTargetted](https://wiki.blast.hk/moonloader/lua/setCharNeverTargetted)(Ped ped, bool untargetable) |   |

[0569](https://wiki.blast.hk/gta-sa/opcodes/0569) |   |  [1:42] |

[056A](https://wiki.blast.hk/gta-sa/opcodes/056A) |  bool result = [wasCutsceneSkipped](https://wiki.blast.hk/moonloader/lua/wasCutsceneSkipped)() |   |

[056C](https://wiki.blast.hk/gta-sa/opcodes/056C) |  bool result = [isCharInAnyPoliceVehicle](https://wiki.blast.hk/moonloader/lua/isCharInAnyPoliceVehicle)(Ped ped) |   |

[056D](https://wiki.blast.hk/gta-sa/opcodes/056D) |  bool result = [doesCharExist](https://wiki.blast.hk/moonloader/lua/doesCharExist)(Ped ped) |   |

[056E](https://wiki.blast.hk/gta-sa/opcodes/056E) |  bool result = [doesVehicleExist](https://wiki.blast.hk/moonloader/lua/doesVehicleExist)(Vehicle car) |   |

[0570](https://wiki.blast.hk/gta-sa/opcodes/0570) |  Marker blip = [addShortRangeSpriteBlipForContactPoint](https://wiki.blast.hk/moonloader/lua/addShortRangeSpriteBlipForContactPoint)(float pX, float pY, float pZ, int icon) |   |

[0572](https://wiki.blast.hk/gta-sa/opcodes/0572) |  [setAllTaxisHaveNitro](https://wiki.blast.hk/moonloader/lua/setAllTaxisHaveNitro)(bool toggle) |   |

[0574](https://wiki.blast.hk/gta-sa/opcodes/0574) |  [freezeCarPositionAndDontLoadCollision](https://wiki.blast.hk/moonloader/lua/freezeCarPositionAndDontLoadCollision)(Vehicle car, bool keep) |   |

[0575](https://wiki.blast.hk/gta-sa/opcodes/0575) |  [freezeCharPositionAndDontLoadCollision](https://wiki.blast.hk/moonloader/lua/freezeCharPositionAndDontLoadCollision)(Ped ped, bool keep) |   |

[057B](https://wiki.blast.hk/gta-sa/opcodes/057B) |   |  [1:43] |

[057D](https://wiki.blast.hk/gta-sa/opcodes/057D) |   |  [1:44] |

[057E](https://wiki.blast.hk/gta-sa/opcodes/057E) |  [setPlayerIsInStadium](https://wiki.blast.hk/moonloader/lua/setPlayerIsInStadium)(bool set) |   |

[057F](https://wiki.blast.hk/gta-sa/opcodes/057F) |   |  [1:45] |

[0581](https://wiki.blast.hk/gta-sa/opcodes/0581) |  [displayRadar](https://wiki.blast.hk/moonloader/lua/displayRadar)(bool enable) |   |

[0582](https://wiki.blast.hk/gta-sa/opcodes/0582) |  [registerBestPosition](https://wiki.blast.hk/moonloader/lua/registerBestPosition)(int stat, float float) |   |

[0583](https://wiki.blast.hk/gta-sa/opcodes/0583) |  bool result = [isPlayerInInfoZone](https://wiki.blast.hk/moonloader/lua/isPlayerInInfoZone)(Player player, GxtString zone) |   |

[0585](https://wiki.blast.hk/gta-sa/opcodes/0585) |   |  [1:46] |

[0587](https://wiki.blast.hk/gta-sa/opcodes/0587) |  [setLoadCollisionForCarFlag](https://wiki.blast.hk/moonloader/lua/setLoadCollisionForCarFlag)(Vehicle car, bool enable) |   |

[0588](https://wiki.blast.hk/gta-sa/opcodes/0588) |  [setLoadCollisionForCharFlag](https://wiki.blast.hk/moonloader/lua/setLoadCollisionForCharFlag)(Ped ped, bool enable) |   |

[058A](https://wiki.blast.hk/gta-sa/opcodes/058A) |  [addBigGunFlash](https://wiki.blast.hk/moonloader/lua/addBigGunFlash)(float fromX, float fromY, float fromZ, float toX, float toY, float toZ) |   |

[058C](https://wiki.blast.hk/gta-sa/opcodes/058C) |  float progress = [getProgressPercentage](https://wiki.blast.hk/moonloader/lua/getProgressPercentage)() |   |

[058D](https://wiki.blast.hk/gta-sa/opcodes/058D) |   |  [1:47] |

[058E](https://wiki.blast.hk/gta-sa/opcodes/058E) |   |  [1:48] |

[0591](https://wiki.blast.hk/gta-sa/opcodes/0591) |   |  [1:49] |

[0592](https://wiki.blast.hk/gta-sa/opcodes/0592) |   |  [1:50] |

[0594](https://wiki.blast.hk/gta-sa/opcodes/0594) |  [setVehicleToFadeIn](https://wiki.blast.hk/moonloader/lua/setVehicleToFadeIn)(Vehicle car, int flag) |   |

[0595](https://wiki.blast.hk/gta-sa/opcodes/0595) |  [registerOddjobMissionPassed](https://wiki.blast.hk/moonloader/lua/registerOddjobMissionPassed)() |   |

[0596](https://wiki.blast.hk/gta-sa/opcodes/0596) |  bool result = [isPlayerInShortcutTaxi](https://wiki.blast.hk/moonloader/lua/isPlayerInShortcutTaxi)(Player player) |   |

[0597](https://wiki.blast.hk/gta-sa/opcodes/0597) |  bool result = [isCharDucking](https://wiki.blast.hk/moonloader/lua/isCharDucking)(Ped ped) |   |

[059A](https://wiki.blast.hk/gta-sa/opcodes/059A) |   |  [1:51] |

[059B](https://wiki.blast.hk/gta-sa/opcodes/059B) |   |  [1:52] |

[059C](https://wiki.blast.hk/gta-sa/opcodes/059C) |  [setOnscreenCounterFlashWhenFirstDisplayed](https://wiki.blast.hk/moonloader/lua/setOnscreenCounterFlashWhenFirstDisplayed)(VarId text, bool flashing) |   |

[059D](https://wiki.blast.hk/gta-sa/opcodes/059D) |  [shuffleCardDecks](https://wiki.blast.hk/moonloader/lua/shuffleCardDecks)(bool shuffle) |   |

[059E](https://wiki.blast.hk/gta-sa/opcodes/059E) |  int card = [fetchNextCard](https://wiki.blast.hk/moonloader/lua/fetchNextCard)() |   |

[059F](https://wiki.blast.hk/gta-sa/opcodes/059F) |  float vecX, float vecY, float vecZ = [getObjectVelocity](https://wiki.blast.hk/moonloader/lua/getObjectVelocity)(Object object) |   |

[05A0](https://wiki.blast.hk/gta-sa/opcodes/05A0) |  bool result = [isDebugCameraOn](https://wiki.blast.hk/moonloader/lua/isDebugCameraOn)() |   |

[05A1](https://wiki.blast.hk/gta-sa/opcodes/05A1) |  [addToObjectRotationVelocity](https://wiki.blast.hk/moonloader/lua/addToObjectRotationVelocity)(Object object, float vecX, float vecY, float vecZ) |   |

[05A2](https://wiki.blast.hk/gta-sa/opcodes/05A2) |  [setObjectRotationVelocity](https://wiki.blast.hk/moonloader/lua/setObjectRotationVelocity)(Object object, float vecX, float vecY, float vecZ) |   |

[05A3](https://wiki.blast.hk/gta-sa/opcodes/05A3) |  bool result = [isObjectStatic](https://wiki.blast.hk/moonloader/lua/isObjectStatic)(Object object) |   |

[05A4](https://wiki.blast.hk/gta-sa/opcodes/05A4) |  float angle = [getAngleBetween2dVectors](https://wiki.blast.hk/moonloader/lua/getAngleBetween2dVectors)(float vecX, float vecY, float vecX, float vecY) |   |

[05A5](https://wiki.blast.hk/gta-sa/opcodes/05A5) |  bool result = [do2dRectanglesCollide](https://wiki.blast.hk/moonloader/lua/do2dRectanglesCollide)(float areaX, float areaY, float scaleX, float scaleY, float overlapareaX, float overlapareaY, float overlapscaleX, float overlapscaleY) |   |

[05A6](https://wiki.blast.hk/gta-sa/opcodes/05A6) |  float axisX, float axisY, float axisZ = [getObjectRotationVelocity](https://wiki.blast.hk/moonloader/lua/getObjectRotationVelocity)(Object object) |   |

[05A7](https://wiki.blast.hk/gta-sa/opcodes/05A7) |  [addVelocityRelativeToObjectVelocity](https://wiki.blast.hk/moonloader/lua/addVelocityRelativeToObjectVelocity)(Object object, float vecX, float vecY, float vecZ) |   |

[05A8](https://wiki.blast.hk/gta-sa/opcodes/05A8) |  float speed = [getObjectSpeed](https://wiki.blast.hk/moonloader/lua/getObjectSpeed)(Object object) |   |

[05A9](https://wiki.blast.hk/gta-sa/opcodes/05A9) |   |  [3:21] |

[05AA](https://wiki.blast.hk/gta-sa/opcodes/05AA) |   |  [3:22] |

[05AD](https://wiki.blast.hk/gta-sa/opcodes/05AD) |   |  [3:23] |

[05AE](https://wiki.blast.hk/gta-sa/opcodes/05AE) |   |  [3:24] |

[05B0](https://wiki.blast.hk/gta-sa/opcodes/05B0) |  bool result, float X, float Y = [get2dLinesIntersectPoint](https://wiki.blast.hk/moonloader/lua/get2dLinesIntersectPoint)(float l1x1, float l1y1, float l1x2, float l1y2, float l2x1, float l2y1, float l2x2, float l2y2) |   |

[05B1](https://wiki.blast.hk/gta-sa/opcodes/05B1) |   |  [1:53] |

[05B2](https://wiki.blast.hk/gta-sa/opcodes/05B2) |   |  [1:54] |

[05B3](https://wiki.blast.hk/gta-sa/opcodes/05B3) |   |  [1:55] |

[05B5](https://wiki.blast.hk/gta-sa/opcodes/05B5) |   |  [1:56] |

[05B6](https://wiki.blast.hk/gta-sa/opcodes/05B6) |   |  [1:57] |

[05B7](https://wiki.blast.hk/gta-sa/opcodes/05B7) |   |  [1:58] |

[05B8](https://wiki.blast.hk/gta-sa/opcodes/05B8) |   |  [1:59] |

[05B9](https://wiki.blast.hk/gta-sa/opcodes/05B9) |  [taskPause](https://wiki.blast.hk/moonloader/lua/taskPause)(Ped ped, int timeMS) |   |

[05BA](https://wiki.blast.hk/gta-sa/opcodes/05BA) |  [taskStandStill](https://wiki.blast.hk/moonloader/lua/taskStandStill)(Ped ped, int timeMS) |   |

[05BB](https://wiki.blast.hk/gta-sa/opcodes/05BB) |  [taskFallAndGetUp](https://wiki.blast.hk/moonloader/lua/taskFallAndGetUp)(Ped ped, bool int2, int time) |   |

[05BC](https://wiki.blast.hk/gta-sa/opcodes/05BC) |  [taskJump](https://wiki.blast.hk/moonloader/lua/taskJump)(Ped ped, bool jump) |   |

[05BD](https://wiki.blast.hk/gta-sa/opcodes/05BD) |  [taskTired](https://wiki.blast.hk/moonloader/lua/taskTired)(Ped ped, int timeMS) |   |

[05BE](https://wiki.blast.hk/gta-sa/opcodes/05BE) |  [taskDie](https://wiki.blast.hk/moonloader/lua/taskDie)(Ped ped) |   |

[05BF](https://wiki.blast.hk/gta-sa/opcodes/05BF) |  [taskLookAtChar](https://wiki.blast.hk/moonloader/lua/taskLookAtChar)(Ped ped, int lookAt, int timeMS) |   |

[05C0](https://wiki.blast.hk/gta-sa/opcodes/05C0) |  [taskLookAtVehicle](https://wiki.blast.hk/moonloader/lua/taskLookAtVehicle)(Ped ped, int lookAt, int timeMS) |   |

[05C1](https://wiki.blast.hk/gta-sa/opcodes/05C1) |  [taskSay](https://wiki.blast.hk/moonloader/lua/taskSay)(Ped ped, int audio) |   |

[05C2](https://wiki.blast.hk/gta-sa/opcodes/05C2) |  [taskShakeFist](https://wiki.blast.hk/moonloader/lua/taskShakeFist)(Ped ped) |   |

[05C3](https://wiki.blast.hk/gta-sa/opcodes/05C3) |  [taskCower](https://wiki.blast.hk/moonloader/lua/taskCower)(Ped ped) |   |

[05C4](https://wiki.blast.hk/gta-sa/opcodes/05C4) |  [taskHandsUp](https://wiki.blast.hk/moonloader/lua/taskHandsUp)(Ped ped, int timeMS) |   |

[05C5](https://wiki.blast.hk/gta-sa/opcodes/05C5) |  [taskDuck](https://wiki.blast.hk/moonloader/lua/taskDuck)(Ped ped, int timeMS) |   |

[05C6](https://wiki.blast.hk/gta-sa/opcodes/05C6) |   |  [1:60] |

[05C7](https://wiki.blast.hk/gta-sa/opcodes/05C7) |  [taskUseAtm](https://wiki.blast.hk/moonloader/lua/taskUseAtm)(Ped ped) |   |

[05C8](https://wiki.blast.hk/gta-sa/opcodes/05C8) |  [taskScratchHead](https://wiki.blast.hk/moonloader/lua/taskScratchHead)(Ped ped) |   |

[05C9](https://wiki.blast.hk/gta-sa/opcodes/05C9) |  [taskLookAbout](https://wiki.blast.hk/moonloader/lua/taskLookAbout)(Ped ped, int timeMS) |   |

[05CA](https://wiki.blast.hk/gta-sa/opcodes/05CA) |  [taskEnterCarAsPassenger](https://wiki.blast.hk/moonloader/lua/taskEnterCarAsPassenger)(Ped ped, Vehicle car, int time, int passengerSeat) |   |

[05CB](https://wiki.blast.hk/gta-sa/opcodes/05CB) |  [taskEnterCarAsDriver](https://wiki.blast.hk/moonloader/lua/taskEnterCarAsDriver)(Ped ped, Vehicle car, int timeMS) |   |

[05CC](https://wiki.blast.hk/gta-sa/opcodes/05CC) |   |  [1:61] |

[05CD](https://wiki.blast.hk/gta-sa/opcodes/05CD) |  [taskLeaveCar](https://wiki.blast.hk/moonloader/lua/taskLeaveCar)(Ped ped, Vehicle car) |   |

[05CE](https://wiki.blast.hk/gta-sa/opcodes/05CE) |   |  [1:62] |

[05CF](https://wiki.blast.hk/gta-sa/opcodes/05CF) |  [taskLeaveCarAndFlee](https://wiki.blast.hk/moonloader/lua/taskLeaveCarAndFlee)(Ped ped, Vehicle car, float X, float Y, float Z) |   |

[05D0](https://wiki.blast.hk/gta-sa/opcodes/05D0) |   |  [1:63] |

[05D1](https://wiki.blast.hk/gta-sa/opcodes/05D1) |  [taskCarDriveToCoord](https://wiki.blast.hk/moonloader/lua/taskCarDriveToCoord)(Ped ped, Vehicle car, float toX, float toY, float toZ, float speed, int int7, int model, int int9) |   |

[05D2](https://wiki.blast.hk/gta-sa/opcodes/05D2) |  [taskCarDriveWander](https://wiki.blast.hk/moonloader/lua/taskCarDriveWander)(Ped ped, Vehicle hijackCar, float searchRadius, int trafficBehavior) |   |

[05D3](https://wiki.blast.hk/gta-sa/opcodes/05D3) |  [taskGoStraightToCoord](https://wiki.blast.hk/moonloader/lua/taskGoStraightToCoord)(Ped ped, float toX, float toY, float toZ, int mode, int time) |   |

[05D4](https://wiki.blast.hk/gta-sa/opcodes/05D4) |  [taskAchieveHeading](https://wiki.blast.hk/moonloader/lua/taskAchieveHeading)(Ped ped, float angle) |   |

[05D5](https://wiki.blast.hk/gta-sa/opcodes/05D5) |   |  [1:64] |

[05D6](https://wiki.blast.hk/gta-sa/opcodes/05D6) |  [flushRoute](https://wiki.blast.hk/moonloader/lua/flushRoute)() |   |

[05D7](https://wiki.blast.hk/gta-sa/opcodes/05D7) |  [extendRoute](https://wiki.blast.hk/moonloader/lua/extendRoute)(float pointX, float pointY, float pointZ) |   |

[05D8](https://wiki.blast.hk/gta-sa/opcodes/05D8) |  [taskFollowPointRoute](https://wiki.blast.hk/moonloader/lua/taskFollowPointRoute)(Ped ped, int flags1, int flags2) |   |

[05D9](https://wiki.blast.hk/gta-sa/opcodes/05D9) |  [taskGotoChar](https://wiki.blast.hk/moonloader/lua/taskGotoChar)(Ped ped, Ped toActor, int timelimit, float stopWithinRadius) |   |

[05DA](https://wiki.blast.hk/gta-sa/opcodes/05DA) |  [taskFleePoint](https://wiki.blast.hk/moonloader/lua/taskFleePoint)(Ped ped, float fromX, float fromY, float fromZ, float awayRadius, int timelimit) |   |

[05DB](https://wiki.blast.hk/gta-sa/opcodes/05DB) |  [taskFleeChar](https://wiki.blast.hk/moonloader/lua/taskFleeChar)(Ped ped, Ped fromActor, float radius, int timelimit) |   |

[05DC](https://wiki.blast.hk/gta-sa/opcodes/05DC) |  [taskSmartFleePoint](https://wiki.blast.hk/moonloader/lua/taskSmartFleePoint)(Ped ped, float fromX, float fromY, float fromZ, float stopAtRadius, int timelimit) |   |

[05DD](https://wiki.blast.hk/gta-sa/opcodes/05DD) |  [taskSmartFleeChar](https://wiki.blast.hk/moonloader/lua/taskSmartFleeChar)(Ped ped, Ped fromActor, float originRadius, int timelimit) |   |

[05DE](https://wiki.blast.hk/gta-sa/opcodes/05DE) |  [taskWanderStandard](https://wiki.blast.hk/moonloader/lua/taskWanderStandard)(Ped ped) |   |

[05E2](https://wiki.blast.hk/gta-sa/opcodes/05E2) |  [taskKillCharOnFoot](https://wiki.blast.hk/moonloader/lua/taskKillCharOnFoot)(Ped ped, Ped killActor) |   |

[05E5](https://wiki.blast.hk/gta-sa/opcodes/05E5) |   |  [1:65] |

[05E6](https://wiki.blast.hk/gta-sa/opcodes/05E6) |   |  [1:66] |

[05E7](https://wiki.blast.hk/gta-sa/opcodes/05E7) |   |  [1:67] |

[05E8](https://wiki.blast.hk/gta-sa/opcodes/05E8) |   |  [1:68] |

[05E9](https://wiki.blast.hk/gta-sa/opcodes/05E9) |   |  [1:69] |

[05EA](https://wiki.blast.hk/gta-sa/opcodes/05EA) |   |  [1:70] |

[05EB](https://wiki.blast.hk/gta-sa/opcodes/05EB) |  [startPlaybackRecordedCar](https://wiki.blast.hk/moonloader/lua/startPlaybackRecordedCar)(Vehicle car, int path) |   |

[05EC](https://wiki.blast.hk/gta-sa/opcodes/05EC) |  [stopPlaybackRecordedCar](https://wiki.blast.hk/moonloader/lua/stopPlaybackRecordedCar)(Vehicle car) |   |

[05ED](https://wiki.blast.hk/gta-sa/opcodes/05ED) |  [pausePlaybackRecordedCar](https://wiki.blast.hk/moonloader/lua/pausePlaybackRecordedCar)(Vehicle car) |   |

[05EE](https://wiki.blast.hk/gta-sa/opcodes/05EE) |  [unpausePlaybackRecordedCar](https://wiki.blast.hk/moonloader/lua/unpausePlaybackRecordedCar)(Vehicle car) |   |

[05EF](https://wiki.blast.hk/gta-sa/opcodes/05EF) |   |  [1:71] |

[05F0](https://wiki.blast.hk/gta-sa/opcodes/05F0) |   |  [1:72] |

[05F1](https://wiki.blast.hk/gta-sa/opcodes/05F1) |  [setCarEscortCarLeft](https://wiki.blast.hk/moonloader/lua/setCarEscortCarLeft)(Vehicle car, Vehicle followCar) |   |

[05F2](https://wiki.blast.hk/gta-sa/opcodes/05F2) |  [setCarEscortCarRight](https://wiki.blast.hk/moonloader/lua/setCarEscortCarRight)(Vehicle car, Vehicle followCar) |   |

[05F3](https://wiki.blast.hk/gta-sa/opcodes/05F3) |  [setCarEscortCarRear](https://wiki.blast.hk/moonloader/lua/setCarEscortCarRear)(Vehicle car, Vehicle followCar) |   |

[05F4](https://wiki.blast.hk/gta-sa/opcodes/05F4) |  [setCarEscortCarFront](https://wiki.blast.hk/moonloader/lua/setCarEscortCarFront)(Vehicle car, Vehicle followCar) |   |

[05F5](https://wiki.blast.hk/gta-sa/opcodes/05F5) |  [taskFollowPathNodesToCoord](https://wiki.blast.hk/moonloader/lua/taskFollowPathNodesToCoord)(Ped ped, float pathX, float pathY, float pathZ, int mode, int time) |   |

[05F6](https://wiki.blast.hk/gta-sa/opcodes/05F6) |  bool result = [isCharInAngledArea2d](https://wiki.blast.hk/moonloader/lua/isCharInAngledArea2d)(Ped ped, float x1, float y1, float x2, float y2, float angle, bool sphere) |   |

[05F7](https://wiki.blast.hk/gta-sa/opcodes/05F7) |  bool result = [isCharInAngledAreaOnFoot2d](https://wiki.blast.hk/moonloader/lua/isCharInAngledAreaOnFoot2d)(Ped ped, float x1, float y1, float x2, float y2, float angle, bool sphere) |   |

[05F8](https://wiki.blast.hk/gta-sa/opcodes/05F8) |  bool result = [isCharInAngledAreaInCar2d](https://wiki.blast.hk/moonloader/lua/isCharInAngledAreaInCar2d)(Ped ped, float x1, float y1, float x2, float y2, float angle, bool sphere) |   |

[05F9](https://wiki.blast.hk/gta-sa/opcodes/05F9) |  bool result = [isCharStoppedInAngledArea2d](https://wiki.blast.hk/moonloader/lua/isCharStoppedInAngledArea2d)(Ped ped, float x1, float y1, float x2, float y2, float height, bool flag) |   |

[05FA](https://wiki.blast.hk/gta-sa/opcodes/05FA) |  bool result = [isCharStoppedInAngledAreaOnFoot2d](https://wiki.blast.hk/moonloader/lua/isCharStoppedInAngledAreaOnFoot2d)(Ped ped, float x1, float y1, float x2, float y2, float angle, bool sphere) |   |

[05FB](https://wiki.blast.hk/gta-sa/opcodes/05FB) |  bool result = [isCharStoppedInAngledAreaInCar2d](https://wiki.blast.hk/moonloader/lua/isCharStoppedInAngledAreaInCar2d)(Ped ped, float x1, float y1, float x2, float y2, float height, bool flag) |   |

[05FC](https://wiki.blast.hk/gta-sa/opcodes/05FC) |  bool result = [isCharInAngledArea3d](https://wiki.blast.hk/moonloader/lua/isCharInAngledArea3d)(Ped ped, float x1, float y1, float z1, float x2, float y2, float z2, float angle, bool sphere) |   |

[05FD](https://wiki.blast.hk/gta-sa/opcodes/05FD) |  bool result = [isCharInAngledAreaOnFoot3d](https://wiki.blast.hk/moonloader/lua/isCharInAngledAreaOnFoot3d)(Ped ped, float x1, float y1, float z1, float x2, float y2, float z2, float angle, bool sphere) |   |

[05FE](https://wiki.blast.hk/gta-sa/opcodes/05FE) |  bool result = [isCharInAngledAreaInCar3d](https://wiki.blast.hk/moonloader/lua/isCharInAngledAreaInCar3d)(Ped ped, float x1, float y1, float z1, float x2, float y2, float z2, float depth, bool flag) |   |

[05FF](https://wiki.blast.hk/gta-sa/opcodes/05FF) |  bool result = [isCharStoppedInAngledArea3d](https://wiki.blast.hk/moonloader/lua/isCharStoppedInAngledArea3d)(Ped ped, float x1, float y1, float z1, float x2, float y2, float z2, float depth, bool flag) |   |

[0600](https://wiki.blast.hk/gta-sa/opcodes/0600) |  bool result = [isCharStoppedInAngledAreaOnFoot3d](https://wiki.blast.hk/moonloader/lua/isCharStoppedInAngledAreaOnFoot3d)(Ped ped, float x1, float y1, float z1, float x2, float y2, float z2, float depth, bool flag) |   |

[0601](https://wiki.blast.hk/gta-sa/opcodes/0601) |  bool result = [isCharStoppedInAngledAreaInCar3d](https://wiki.blast.hk/moonloader/lua/isCharStoppedInAngledAreaInCar3d)(Ped ped, float x1, float y1, float z1, float x2, float y2, float z2, float depth, bool flag) |   |

[0602](https://wiki.blast.hk/gta-sa/opcodes/0602) |  bool result = [isCharInTaxi](https://wiki.blast.hk/moonloader/lua/isCharInTaxi)(Ped ped) |   |

[0603](https://wiki.blast.hk/gta-sa/opcodes/0603) |  [taskGoToCoordAnyMeans](https://wiki.blast.hk/moonloader/lua/taskGoToCoordAnyMeans)(Ped ped, float toX, float toY, float toZ, int mode, Vehicle useCar) |   |

[0604](https://wiki.blast.hk/gta-sa/opcodes/0604) |  float zAngle = [getHeadingFromVector2d](https://wiki.blast.hk/moonloader/lua/getHeadingFromVector2d)(float pX, float pY) |   |

[0605](https://wiki.blast.hk/gta-sa/opcodes/0605) |  [taskPlayAnim](https://wiki.blast.hk/moonloader/lua/taskPlayAnim)(Ped ped, string animation, string IFP, float framedelta, bool loop, bool lockX, bool lockY, bool lockF, int time) |   |

[0606](https://wiki.blast.hk/gta-sa/opcodes/0606) |  [loadPathNodesInArea](https://wiki.blast.hk/moonloader/lua/loadPathNodesInArea)(float x1, float y1, float x2, float y2) |   |

[0607](https://wiki.blast.hk/gta-sa/opcodes/0607) |  [releasePathNodes](https://wiki.blast.hk/moonloader/lua/releasePathNodes)() |   |

[0608](https://wiki.blast.hk/gta-sa/opcodes/0608) |   |  [1:73] |

[0609](https://wiki.blast.hk/gta-sa/opcodes/0609) |   |  [1:74] |

[060A](https://wiki.blast.hk/gta-sa/opcodes/060A) |  int maker = [loadCharDecisionMaker](https://wiki.blast.hk/moonloader/lua/loadCharDecisionMaker)(int type) |   |

[060B](https://wiki.blast.hk/gta-sa/opcodes/060B) |  [setCharDecisionMaker](https://wiki.blast.hk/moonloader/lua/setCharDecisionMaker)(Ped ped, int maker) |   |

[060C](https://wiki.blast.hk/gta-sa/opcodes/060C) |   |  [1:75] |

[060D](https://wiki.blast.hk/gta-sa/opcodes/060D) |  [setTextDropshadow](https://wiki.blast.hk/moonloader/lua/setTextDropshadow)(int shadow, int r, int g, int b, int a) |   |

[060E](https://wiki.blast.hk/gta-sa/opcodes/060E) |  bool result = [isPlaybackGoingOnForCar](https://wiki.blast.hk/moonloader/lua/isPlaybackGoingOnForCar)(Vehicle car) |   |

[060F](https://wiki.blast.hk/gta-sa/opcodes/060F) |  [setSenseRange](https://wiki.blast.hk/moonloader/lua/setSenseRange)(Ped ped, float accuracy) |   |

[0610](https://wiki.blast.hk/gta-sa/opcodes/0610) |   |  [1:76] |

[0611](https://wiki.blast.hk/gta-sa/opcodes/0611) |  bool result = [isCharPlayingAnim](https://wiki.blast.hk/moonloader/lua/isCharPlayingAnim)(Ped ped, string animation) |   |

[0612](https://wiki.blast.hk/gta-sa/opcodes/0612) |  [setCharAnimPlayingFlag](https://wiki.blast.hk/moonloader/lua/setCharAnimPlayingFlag)(Ped ped, string animation, bool flag) |   |

[0613](https://wiki.blast.hk/gta-sa/opcodes/0613) |  float time = [getCharAnimCurrentTime](https://wiki.blast.hk/moonloader/lua/getCharAnimCurrentTime)(Ped ped, string animation) |   |

[0614](https://wiki.blast.hk/gta-sa/opcodes/0614) |  [setCharAnimCurrentTime](https://wiki.blast.hk/moonloader/lua/setCharAnimCurrentTime)(Ped ped, string animation, float time) |   |

[0615](https://wiki.blast.hk/gta-sa/opcodes/0615) |  int task = [openSequenceTask](https://wiki.blast.hk/moonloader/lua/openSequenceTask)() |   |

[0616](https://wiki.blast.hk/gta-sa/opcodes/0616) |  [closeSequenceTask](https://wiki.blast.hk/moonloader/lua/closeSequenceTask)(int task) |   |

[0617](https://wiki.blast.hk/gta-sa/opcodes/0617) |   |  [1:77] |

[0618](https://wiki.blast.hk/gta-sa/opcodes/0618) |  [performSequenceTask](https://wiki.blast.hk/moonloader/lua/performSequenceTask)(Ped ped, int task) |   |

[0619](https://wiki.blast.hk/gta-sa/opcodes/0619) |  [setCharCollision](https://wiki.blast.hk/moonloader/lua/setCharCollision)(Ped ped, bool enable) |   |

[061A](https://wiki.blast.hk/gta-sa/opcodes/061A) |  float totalTime = [getCharAnimTotalTime](https://wiki.blast.hk/moonloader/lua/getCharAnimTotalTime)(Ped ped, string animation) |   |

[061B](https://wiki.blast.hk/gta-sa/opcodes/061B) |  [clearSequenceTask](https://wiki.blast.hk/moonloader/lua/clearSequenceTask)(int task) |   |

[061C](https://wiki.blast.hk/gta-sa/opcodes/061C) |   |  [1:78] |

[061D](https://wiki.blast.hk/gta-sa/opcodes/061D) |  int handle = [addAttractor](https://wiki.blast.hk/moonloader/lua/addAttractor)(float originX, float originY, float originZ, float zAngle, float unknownAngle, int taskSequence) |   |

[061E](https://wiki.blast.hk/gta-sa/opcodes/061E) |  [clearAttractor](https://wiki.blast.hk/moonloader/lua/clearAttractor)(int handle) |   |

[061F](https://wiki.blast.hk/gta-sa/opcodes/061F) |   |  [1:79] |

[0620](https://wiki.blast.hk/gta-sa/opcodes/0620) |   |  [1:80] |

[0621](https://wiki.blast.hk/gta-sa/opcodes/0621) |  Ped ped = [createCharAtAttractor](https://wiki.blast.hk/moonloader/lua/createCharAtAttractor)(int pedtype, Model modelId, int ASOrigin, int task) |   |

[0622](https://wiki.blast.hk/gta-sa/opcodes/0622) |  [taskLeaveCarImmediately](https://wiki.blast.hk/moonloader/lua/taskLeaveCarImmediately)(Ped ped, Vehicle car) |   |

[0623](https://wiki.blast.hk/gta-sa/opcodes/0623) |  [incrementIntStat](https://wiki.blast.hk/moonloader/lua/incrementIntStat)(int stat, int add) |   |

[0624](https://wiki.blast.hk/gta-sa/opcodes/0624) |  [incrementFloatStat](https://wiki.blast.hk/moonloader/lua/incrementFloatStat)(int stat, float add) |   |

[0625](https://wiki.blast.hk/gta-sa/opcodes/0625) |  [decrementIntStat](https://wiki.blast.hk/moonloader/lua/decrementIntStat)(int stat, int int) |   |

[0626](https://wiki.blast.hk/gta-sa/opcodes/0626) |  [decrementFloatStat](https://wiki.blast.hk/moonloader/lua/decrementFloatStat)(int stat, float float) |   |

[0627](https://wiki.blast.hk/gta-sa/opcodes/0627) |  [registerIntStat](https://wiki.blast.hk/moonloader/lua/registerIntStat)(int stat, int int) |   |

[0628](https://wiki.blast.hk/gta-sa/opcodes/0628) |  [registerFloatStat](https://wiki.blast.hk/moonloader/lua/registerFloatStat)(int stat, float value) |   |

[0629](https://wiki.blast.hk/gta-sa/opcodes/0629) |  [setIntStat](https://wiki.blast.hk/moonloader/lua/setIntStat)(int stat, int int) |   |

[062A](https://wiki.blast.hk/gta-sa/opcodes/062A) |  [setFloatStat](https://wiki.blast.hk/moonloader/lua/setFloatStat)(int stat, float float) |   |

[062B](https://wiki.blast.hk/gta-sa/opcodes/062B) |   |  [1:81] |

[062C](https://wiki.blast.hk/gta-sa/opcodes/062C) |   |  [1:82] |

[062D](https://wiki.blast.hk/gta-sa/opcodes/062D) |   |  [1:83] |

[062E](https://wiki.blast.hk/gta-sa/opcodes/062E) |  int status = [getScriptTaskStatus](https://wiki.blast.hk/moonloader/lua/getScriptTaskStatus)(Ped ped, int task) |   |

[062F](https://wiki.blast.hk/gta-sa/opcodes/062F) |  int group = [createGroup](https://wiki.blast.hk/moonloader/lua/createGroup)(int type) |   |

[0630](https://wiki.blast.hk/gta-sa/opcodes/0630) |  [setGroupLeader](https://wiki.blast.hk/moonloader/lua/setGroupLeader)(int group, Ped ped) |   |

[0631](https://wiki.blast.hk/gta-sa/opcodes/0631) |  [setGroupMember](https://wiki.blast.hk/moonloader/lua/setGroupMember)(int group, Ped ped) |   |

[0632](https://wiki.blast.hk/gta-sa/opcodes/0632) |  [removeGroup](https://wiki.blast.hk/moonloader/lua/removeGroup)(int group) |   |

[0633](https://wiki.blast.hk/gta-sa/opcodes/0633) |  [taskLeaveAnyCar](https://wiki.blast.hk/moonloader/lua/taskLeaveAnyCar)(Ped ped) |   |

[0634](https://wiki.blast.hk/gta-sa/opcodes/0634) |  [taskKillCharOnFootWhileDucking](https://wiki.blast.hk/moonloader/lua/taskKillCharOnFootWhileDucking)(Ped ped, int weapon, int flags, int time, int chance) |   |

[0635](https://wiki.blast.hk/gta-sa/opcodes/0635) |  [taskAimGunAtChar](https://wiki.blast.hk/moonloader/lua/taskAimGunAtChar)(Ped ped, int aimAt, int timeMS) |   |

[0636](https://wiki.blast.hk/gta-sa/opcodes/0636) |   |  [1:84] |

[0637](https://wiki.blast.hk/gta-sa/opcodes/0637) |  [taskGoToCoordWhileShooting](https://wiki.blast.hk/moonloader/lua/taskGoToCoordWhileShooting)(Ped ped, float toX, float toY, float toZ, int mode, float turnRadius, float stopRadius, int lookAtActor) |   |

[0638](https://wiki.blast.hk/gta-sa/opcodes/0638) |  [taskStayInSamePlace](https://wiki.blast.hk/moonloader/lua/taskStayInSamePlace)(Ped ped, bool stay) |   |

[0639](https://wiki.blast.hk/gta-sa/opcodes/0639) |  [taskTurnCharToFaceChar](https://wiki.blast.hk/moonloader/lua/taskTurnCharToFaceChar)(Ped ped, int rotateTo) |   |

[0642](https://wiki.blast.hk/gta-sa/opcodes/0642) |  bool result = [isCharAtScriptedAttractor](https://wiki.blast.hk/moonloader/lua/isCharAtScriptedAttractor)(Ped ped, int origin) |   |

[0643](https://wiki.blast.hk/gta-sa/opcodes/0643) |  [setSequenceToRepeat](https://wiki.blast.hk/moonloader/lua/setSequenceToRepeat)(int pack, bool loop) |   |

[0646](https://wiki.blast.hk/gta-sa/opcodes/0646) |  int progess = [getSequenceProgress](https://wiki.blast.hk/moonloader/lua/getSequenceProgress)(Ped ped) |   |

[0647](https://wiki.blast.hk/gta-sa/opcodes/0647) |  [clearLookAt](https://wiki.blast.hk/moonloader/lua/clearLookAt)(Ped ped) |   |

[0648](https://wiki.blast.hk/gta-sa/opcodes/0648) |  [setFollowNodeThresholdDistance](https://wiki.blast.hk/moonloader/lua/setFollowNodeThresholdDistance)(Ped ped, float dist) |   |

[064A](https://wiki.blast.hk/gta-sa/opcodes/064A) |   |  [1:85] |

[064B](https://wiki.blast.hk/gta-sa/opcodes/064B) |  Particle particle = [createFxSystem](https://wiki.blast.hk/moonloader/lua/createFxSystem)(string particle, float pX, float pY, float pZ, int type) |   |

[064C](https://wiki.blast.hk/gta-sa/opcodes/064C) |  [playFxSystem](https://wiki.blast.hk/moonloader/lua/playFxSystem)(Particle particle) |   |

[064D](https://wiki.blast.hk/gta-sa/opcodes/064D) |   |  [1:86] |

[064E](https://wiki.blast.hk/gta-sa/opcodes/064E) |  [stopFxSystem](https://wiki.blast.hk/moonloader/lua/stopFxSystem)(Particle particle) |   |

[064F](https://wiki.blast.hk/gta-sa/opcodes/064F) |  [playAndKillFxSystem](https://wiki.blast.hk/moonloader/lua/playAndKillFxSystem)(Particle particle) |   |

[0650](https://wiki.blast.hk/gta-sa/opcodes/0650) |  [killFxSystem](https://wiki.blast.hk/moonloader/lua/killFxSystem)(Particle particle) |   |

[0651](https://wiki.blast.hk/gta-sa/opcodes/0651) |   |  [1:87] |

[0652](https://wiki.blast.hk/gta-sa/opcodes/0652) |  int stat = [getIntStat](https://wiki.blast.hk/moonloader/lua/getIntStat)(int stat) |   |

[0653](https://wiki.blast.hk/gta-sa/opcodes/0653) |  float stat = [getFloatStat](https://wiki.blast.hk/moonloader/lua/getFloatStat)(int stat) |   |

[0654](https://wiki.blast.hk/gta-sa/opcodes/0654) |  [setObjectRenderScorched](https://wiki.blast.hk/moonloader/lua/setObjectRenderScorched)(Object object, bool fireproof) |   |

[0655](https://wiki.blast.hk/gta-sa/opcodes/0655) |  [taskLookAtObject](https://wiki.blast.hk/moonloader/lua/taskLookAtObject)(Ped ped, int lookAt, int timeMS) |   |

[0656](https://wiki.blast.hk/gta-sa/opcodes/0656) |  float float = [limitAngle](https://wiki.blast.hk/moonloader/lua/limitAngle)(float angle) |   |

[0657](https://wiki.blast.hk/gta-sa/opcodes/0657) |  [openCarDoor](https://wiki.blast.hk/moonloader/lua/openCarDoor)(Vehicle car, int door) |   |

[0659](https://wiki.blast.hk/gta-sa/opcodes/0659) |   |  [1:88] |

[065A](https://wiki.blast.hk/gta-sa/opcodes/065A) |   |  [1:89] |

[065B](https://wiki.blast.hk/gta-sa/opcodes/065B) |  float X, float Y, float Z = [getPickupCoordinates](https://wiki.blast.hk/moonloader/lua/getPickupCoordinates)(Pickup pickup) |   |

[065C](https://wiki.blast.hk/gta-sa/opcodes/065C) |  [removeDecisionMaker](https://wiki.blast.hk/moonloader/lua/removeDecisionMaker)(int maker) |   |

[065D](https://wiki.blast.hk/gta-sa/opcodes/065D) |   |  [1:90] |

[065E](https://wiki.blast.hk/gta-sa/opcodes/065E) |   |  [1:91] |

[065F](https://wiki.blast.hk/gta-sa/opcodes/065F) |   |  [1:92] |

[0660](https://wiki.blast.hk/gta-sa/opcodes/0660) |   |  [1:93] |

[0661](https://wiki.blast.hk/gta-sa/opcodes/0661) |   |  [1:94] |

[0662](https://wiki.blast.hk/gta-sa/opcodes/0662) |   |  [1:95] |

[0663](https://wiki.blast.hk/gta-sa/opcodes/0663) |   |  [1:96] |

[0664](https://wiki.blast.hk/gta-sa/opcodes/0664) |   |  [1:97] |

[0665](https://wiki.blast.hk/gta-sa/opcodes/0665) |  Model modelId = [getCharModel](https://wiki.blast.hk/moonloader/lua/getCharModel)(Ped ped) |   |

[0666](https://wiki.blast.hk/gta-sa/opcodes/0666) |   |  [1:98] |

[0667](https://wiki.blast.hk/gta-sa/opcodes/0667) |  [taskAimGunAtCoord](https://wiki.blast.hk/moonloader/lua/taskAimGunAtCoord)(Ped ped, float atX, float atY, float atZ, int timeMS) |   |

[0668](https://wiki.blast.hk/gta-sa/opcodes/0668) |  [taskShootAtCoord](https://wiki.blast.hk/moonloader/lua/taskShootAtCoord)(Ped ped, float atX, float atY, float atZ, int timeMS) |   |

[0669](https://wiki.blast.hk/gta-sa/opcodes/0669) |  Particle particle = [createFxSystemOnChar](https://wiki.blast.hk/moonloader/lua/createFxSystemOnChar)(string particle, Ped ped, float offsetX, float offsetY, float offsetZ, int type) |   |

[066A](https://wiki.blast.hk/gta-sa/opcodes/066A) |  Particle particle = [createFxSystemOnCharWithDirection](https://wiki.blast.hk/moonloader/lua/createFxSystemOnCharWithDirection)(string particle, Ped ped, float offsetX, float offsetY, float offsetZ, float rotationX, float rotationY, float rotationZ, int type) |   |

[066B](https://wiki.blast.hk/gta-sa/opcodes/066B) |  Particle particle = [createFxSystemOnCar](https://wiki.blast.hk/moonloader/lua/createFxSystemOnCar)(string particle, Vehicle car, float offsetX, float offsetY, float offsetZ, int type) |   |

[066C](https://wiki.blast.hk/gta-sa/opcodes/066C) |  Particle particle = [createFxSystemOnCarWithDirection](https://wiki.blast.hk/moonloader/lua/createFxSystemOnCarWithDirection)(string particle, Vehicle car, float offsetX, float offsetY, float offsetZ, float rotationX, float rotationY, float rotationZ, int type) |   |

[066D](https://wiki.blast.hk/gta-sa/opcodes/066D) |  Particle particle = [createFxSystemOnObject](https://wiki.blast.hk/moonloader/lua/createFxSystemOnObject)(string particle, Object object, float offsetX, float offsetY, float offsetZ, int type) |   |

[066E](https://wiki.blast.hk/gta-sa/opcodes/066E) |  Particle particle = [createFxSystemOnObjectWithDirection](https://wiki.blast.hk/moonloader/lua/createFxSystemOnObjectWithDirection)(string particle, Object object, float offsetX, float offsetY, float offsetZ, float rotationX, float rotationY, float rotationZ, int flag) |   |

[066F](https://wiki.blast.hk/gta-sa/opcodes/066F) |   |  [1:99] |

[0670](https://wiki.blast.hk/gta-sa/opcodes/0670) |   |  [1:100] |

[0671](https://wiki.blast.hk/gta-sa/opcodes/0671) |   |  [1:101] |

[0672](https://wiki.blast.hk/gta-sa/opcodes/0672) |  [taskDestroyCar](https://wiki.blast.hk/moonloader/lua/taskDestroyCar)(Ped ped, Vehicle car) |   |

[0673](https://wiki.blast.hk/gta-sa/opcodes/0673) |  [taskDiveAndGetUp](https://wiki.blast.hk/moonloader/lua/taskDiveAndGetUp)(Ped ped, float toOffsetX, float toOffsetY, int time) |   |

[0674](https://wiki.blast.hk/gta-sa/opcodes/0674) |  [customPlateForNextCar](https://wiki.blast.hk/moonloader/lua/customPlateForNextCar)(Model modelId, string numberplate) |   |

[0675](https://wiki.blast.hk/gta-sa/opcodes/0675) |   |  [1:102] |

[0676](https://wiki.blast.hk/gta-sa/opcodes/0676) |  [taskShuffleToNextCarSeat](https://wiki.blast.hk/moonloader/lua/taskShuffleToNextCarSeat)(Ped ped, Vehicle car) |   |

[0677](https://wiki.blast.hk/gta-sa/opcodes/0677) |  [taskChatWithChar](https://wiki.blast.hk/moonloader/lua/taskChatWithChar)(Ped ped, int withActor, bool flag, int unknownFlag) |   |

[0678](https://wiki.blast.hk/gta-sa/opcodes/0678) |   |  [1:103] |

[0679](https://wiki.blast.hk/gta-sa/opcodes/0679) |  [attachCameraToVehicle](https://wiki.blast.hk/moonloader/lua/attachCameraToVehicle)(Vehicle car, float offsetX, float offsetY, float offsetZ, float rotationX, float rotationY, float rotationZ, float tilt, int switchstyle) |   |

[067A](https://wiki.blast.hk/gta-sa/opcodes/067A) |  [attachCameraToVehicleLookAtVehicle](https://wiki.blast.hk/moonloader/lua/attachCameraToVehicleLookAtVehicle)(Vehicle car, float offsetX, float offsetY, float offsetZ, int toCar, float tilt, int switchstyle) |   |

[067B](https://wiki.blast.hk/gta-sa/opcodes/067B) |  [attachCameraToVehicleLookAtChar](https://wiki.blast.hk/moonloader/lua/attachCameraToVehicleLookAtChar)(Vehicle car, float offsetX, float offsetY, float offsetZ, Ped ped, float tilt, int switchstyle) |   |

[067C](https://wiki.blast.hk/gta-sa/opcodes/067C) |  [attachCameraToChar](https://wiki.blast.hk/moonloader/lua/attachCameraToChar)(Ped ped, float offsetX, float offsetY, float offsetZ, float rotationX, float rotationY, float rotationZ, float tilt, int switchstyle) |   |

[067E](https://wiki.blast.hk/gta-sa/opcodes/067E) |  [attachCameraToCharLookAtChar](https://wiki.blast.hk/moonloader/lua/attachCameraToCharLookAtChar)(Ped ped, float offsetX, float offsetY, float offsetZ, int targetActor, float tilt, int switchstyle) |   |

[067F](https://wiki.blast.hk/gta-sa/opcodes/067F) |  [forceCarLights](https://wiki.blast.hk/moonloader/lua/forceCarLights)(Vehicle car, int lights) |   |

[0680](https://wiki.blast.hk/gta-sa/opcodes/0680) |  [addPedtypeAsAttractorUser](https://wiki.blast.hk/moonloader/lua/addPedtypeAsAttractorUser)(int ASOrigin, int pedtype) |   |

[0681](https://wiki.blast.hk/gta-sa/opcodes/0681) |  [attachObjectToCar](https://wiki.blast.hk/moonloader/lua/attachObjectToCar)(Object object, Vehicle car, float offsetX, float offsetY, float offsetZ, float rotationX, float rotationY, float rotationZ) |   |

[0682](https://wiki.blast.hk/gta-sa/opcodes/0682) |  [detachObject](https://wiki.blast.hk/moonloader/lua/detachObject)(Object object, float X, float Y, float Z, bool collisionDetection) |   |

[0683](https://wiki.blast.hk/gta-sa/opcodes/0683) |  [attachCarToCar](https://wiki.blast.hk/moonloader/lua/attachCarToCar)(Vehicle car, int toCar, float offsetX, float offsetY, float offsetZ, float rotationX, float rotationY, float rotationZ) |   |

[0684](https://wiki.blast.hk/gta-sa/opcodes/0684) |  [detachCar](https://wiki.blast.hk/moonloader/lua/detachCar)(Vehicle car, float X, float Y, float Z, bool collisionDetection) |   |

[0685](https://wiki.blast.hk/gta-sa/opcodes/0685) |  bool result = [isObjectAttached](https://wiki.blast.hk/moonloader/lua/isObjectAttached)(Object object) |   |

[0686](https://wiki.blast.hk/gta-sa/opcodes/0686) |  bool result = [isVehicleAttached](https://wiki.blast.hk/moonloader/lua/isVehicleAttached)(Vehicle car) |   |

[0687](https://wiki.blast.hk/gta-sa/opcodes/0687) |  [clearCharTasks](https://wiki.blast.hk/moonloader/lua/clearCharTasks)(Ped ped) |   |

[0688](https://wiki.blast.hk/gta-sa/opcodes/0688) |  [taskTogglePedThreatScanner](https://wiki.blast.hk/moonloader/lua/taskTogglePedThreatScanner)(Ped ped, bool unknownFlag1, bool unknownFlag2, bool unknownFlag3) |   |

[0689](https://wiki.blast.hk/gta-sa/opcodes/0689) |  [popCarDoor](https://wiki.blast.hk/moonloader/lua/popCarDoor)(Vehicle car, int door, bool visible) |   |

[068A](https://wiki.blast.hk/gta-sa/opcodes/068A) |  [fixCarDoor](https://wiki.blast.hk/moonloader/lua/fixCarDoor)(Vehicle car, int door) |   |

[068B](https://wiki.blast.hk/gta-sa/opcodes/068B) |  [taskEveryoneLeaveCar](https://wiki.blast.hk/moonloader/lua/taskEveryoneLeaveCar)(Vehicle car) |   |

[068C](https://wiki.blast.hk/gta-sa/opcodes/068C) |  bool result = [isPlayerTargettingAnything](https://wiki.blast.hk/moonloader/lua/isPlayerTargettingAnything)(Player player) |   |

[068D](https://wiki.blast.hk/gta-sa/opcodes/068D) |  float X, float Y, float Z = [getActiveCameraCoordinates](https://wiki.blast.hk/moonloader/lua/getActiveCameraCoordinates)() |   |

[068E](https://wiki.blast.hk/gta-sa/opcodes/068E) |  float X, float Y, float Z = [getActiveCameraPointAt](https://wiki.blast.hk/moonloader/lua/getActiveCameraPointAt)() |   |

[068F](https://wiki.blast.hk/gta-sa/opcodes/068F) |   |  [1:104] |

[0697](https://wiki.blast.hk/gta-sa/opcodes/0697) |  [popCarPanel](https://wiki.blast.hk/moonloader/lua/popCarPanel)(Vehicle car, int component, bool effectFlag) |   |

[0698](https://wiki.blast.hk/gta-sa/opcodes/0698) |  [fixCarPanel](https://wiki.blast.hk/moonloader/lua/fixCarPanel)(Vehicle car, int componentB) |   |

[0699](https://wiki.blast.hk/gta-sa/opcodes/0699) |  [fixCarTire](https://wiki.blast.hk/moonloader/lua/fixCarTire)(Vehicle car, int tire) |   |

[069A](https://wiki.blast.hk/gta-sa/opcodes/069A) |  [attachObjectToObject](https://wiki.blast.hk/moonloader/lua/attachObjectToObject)(Object object, int toObject, float offsetX, float offsetY, float offsetZ, float rotationX, float rotationY, float rotationZ) |   |

[069B](https://wiki.blast.hk/gta-sa/opcodes/069B) |  [attachObjectToChar](https://wiki.blast.hk/moonloader/lua/attachObjectToChar)(Object object, Ped ped, float offsetX, float offsetY, float offsetZ, float rotationX, float rotationY, float rotationZ) |   |

[069C](https://wiki.blast.hk/gta-sa/opcodes/069C) |   |  [1:105] |

[069D](https://wiki.blast.hk/gta-sa/opcodes/069D) |   |  [1:106] |

[069E](https://wiki.blast.hk/gta-sa/opcodes/069E) |   |  [1:107] |

[069F](https://wiki.blast.hk/gta-sa/opcodes/069F) |   |  [1:108] |

[06A0](https://wiki.blast.hk/gta-sa/opcodes/06A0) |   |  [1:109] |

[06A1](https://wiki.blast.hk/gta-sa/opcodes/06A1) |   |  [1:110] |

[06A2](https://wiki.blast.hk/gta-sa/opcodes/06A2) |  float vecX, float vecY, float vecZ = [getCarSpeedVector](https://wiki.blast.hk/moonloader/lua/getCarSpeedVector)(Vehicle car) |   |

[06A3](https://wiki.blast.hk/gta-sa/opcodes/06A3) |  float mass = [getCarMass](https://wiki.blast.hk/moonloader/lua/getCarMass)(Vehicle car) |   |

[06A4](https://wiki.blast.hk/gta-sa/opcodes/06A4) |   |  [1:111] |

[06A5](https://wiki.blast.hk/gta-sa/opcodes/06A5) |  [taskDiveFromAttachmentAndGetUp](https://wiki.blast.hk/moonloader/lua/taskDiveFromAttachmentAndGetUp)(Ped ped, int timeMS) |   |

[06A6](https://wiki.blast.hk/gta-sa/opcodes/06A6) |   |  [1:112] |

[06A7](https://wiki.blast.hk/gta-sa/opcodes/06A7) |  [attachCharToBike](https://wiki.blast.hk/moonloader/lua/attachCharToBike)(Ped ped, Vehicle car, float offsetX, float offsetY, float offsetZ, int position, float shootingAngle1, float shootingAngle2, int weapon) |   |

[06A8](https://wiki.blast.hk/gta-sa/opcodes/06A8) |  [taskGotoCharOffset](https://wiki.blast.hk/moonloader/lua/taskGotoCharOffset)(Ped ped, int toActor, int timelimit, float approachDistance, float approachAngle) |   |

[06A9](https://wiki.blast.hk/gta-sa/opcodes/06A9) |  [taskLookAtCoord](https://wiki.blast.hk/moonloader/lua/taskLookAtCoord)(Ped ped, float toX, float toY, float toZ, int timeMS) |   |

[06AA](https://wiki.blast.hk/gta-sa/opcodes/06AA) |   |  [1:113] |

[06AB](https://wiki.blast.hk/gta-sa/opcodes/06AB) |  [hideCharWeaponForScriptedCutscene](https://wiki.blast.hk/moonloader/lua/hideCharWeaponForScriptedCutscene)(Ped ped, bool hide) |   |

[06AC](https://wiki.blast.hk/gta-sa/opcodes/06AC) |  float speed = [getCharSpeed](https://wiki.blast.hk/moonloader/lua/getCharSpeed)(Ped ped) |   |

[06AD](https://wiki.blast.hk/gta-sa/opcodes/06AD) |  [setGroupDecisionMaker](https://wiki.blast.hk/moonloader/lua/setGroupDecisionMaker)(int group, int maker) |   |

[06AE](https://wiki.blast.hk/gta-sa/opcodes/06AE) |  int maker = [loadGroupDecisionMaker](https://wiki.blast.hk/moonloader/lua/loadGroupDecisionMaker)(int type) |   |

[06AF](https://wiki.blast.hk/gta-sa/opcodes/06AF) |  [disablePlayerSprint](https://wiki.blast.hk/moonloader/lua/disablePlayerSprint)(Player player, bool mode) |   |

[06B0](https://wiki.blast.hk/gta-sa/opcodes/06B0) |  [taskSitDown](https://wiki.blast.hk/moonloader/lua/taskSitDown)(Ped ped, int timeMS) |   |

[06B1](https://wiki.blast.hk/gta-sa/opcodes/06B1) |  Searchlight searchlight = [createSearchlight](https://wiki.blast.hk/moonloader/lua/createSearchlight)(float atX, float atY, float atZ, float targetX, float targetY, float targetZ, float radius1, float radius2) |   |

[06B2](https://wiki.blast.hk/gta-sa/opcodes/06B2) |  [deleteSearchlight](https://wiki.blast.hk/moonloader/lua/deleteSearchlight)(Searchlight searchlight) |   |

[06B3](https://wiki.blast.hk/gta-sa/opcodes/06B3) |  bool result = [doesSearchlightExist](https://wiki.blast.hk/moonloader/lua/doesSearchlightExist)(Searchlight searchlight) |   |

[06B4](https://wiki.blast.hk/gta-sa/opcodes/06B4) |  [moveSearchlightBetweenCoords](https://wiki.blast.hk/moonloader/lua/moveSearchlightBetweenCoords)(Searchlight searchlight, float fromX, float fromY, float fromZ, float toX, float toY, float toZ, float speed) |   |

[06B5](https://wiki.blast.hk/gta-sa/opcodes/06B5) |  [pointSearchlightAtCoord](https://wiki.blast.hk/moonloader/lua/pointSearchlightAtCoord)(Searchlight searchlight, float toX, float toY, float toZ, float speed) |   |

[06B6](https://wiki.blast.hk/gta-sa/opcodes/06B6) |  [pointSearchlightAtChar](https://wiki.blast.hk/moonloader/lua/pointSearchlightAtChar)(Searchlight searchlight, Ped ped, float speed) |   |

[06B7](https://wiki.blast.hk/gta-sa/opcodes/06B7) |  bool result = [isCharInSearchlight](https://wiki.blast.hk/moonloader/lua/isCharInSearchlight)(Searchlight searchlight, Ped ped) |   |

[06B9](https://wiki.blast.hk/gta-sa/opcodes/06B9) |  bool result = [hasCutsceneLoaded](https://wiki.blast.hk/moonloader/lua/hasCutsceneLoaded)() |   |

[06BA](https://wiki.blast.hk/gta-sa/opcodes/06BA) |  [taskTurnCharToFaceCoord](https://wiki.blast.hk/moonloader/lua/taskTurnCharToFaceCoord)(Ped ped, float atX, float atY, float atZ) |   |

[06BB](https://wiki.blast.hk/gta-sa/opcodes/06BB) |  [taskDrivePointRoute](https://wiki.blast.hk/moonloader/lua/taskDrivePointRoute)(Ped ped, Vehicle car, float speed) |   |

[06BC](https://wiki.blast.hk/gta-sa/opcodes/06BC) |  [fireSingleBullet](https://wiki.blast.hk/moonloader/lua/fireSingleBullet)(float fromX, float fromY, float fromZ, float targetX, float targetY, float targetZ, int energy) |   |

[06BD](https://wiki.blast.hk/gta-sa/opcodes/06BD) |  bool result = [isLineOfSightClear](https://wiki.blast.hk/moonloader/lua/isLineOfSightClear)(float fromX, float fromY, float fromZ, float toX, float toY, float toZ, bool checkBuildings, bool checkVehicles, bool checkActors, bool checkObjects, bool checkParticles) |   |

[06BE](https://wiki.blast.hk/gta-sa/opcodes/06BE) |  float roll = [getCarRoll](https://wiki.blast.hk/moonloader/lua/getCarRoll)(Vehicle car) |   |

[06BF](https://wiki.blast.hk/gta-sa/opcodes/06BF) |  [pointSearchlightAtVehicle](https://wiki.blast.hk/moonloader/lua/pointSearchlightAtVehicle)(Searchlight searchlight, Vehicle car, float speed) |   |

[06C0](https://wiki.blast.hk/gta-sa/opcodes/06C0) |  bool result = [isVehicleInSearchlight](https://wiki.blast.hk/moonloader/lua/isVehicleInSearchlight)(int int, Vehicle car) |   |

[06C1](https://wiki.blast.hk/gta-sa/opcodes/06C1) |  Searchlight searchlight = [createSearchlightOnVehicle](https://wiki.blast.hk/moonloader/lua/createSearchlightOnVehicle)(Vehicle car, float offsetX, float offsetY, float offsetZ, float targetX, float targetY, float targetZ, float radius, float radius) |   |

[06C2](https://wiki.blast.hk/gta-sa/opcodes/06C2) |  [taskGoToCoordWhileAiming](https://wiki.blast.hk/moonloader/lua/taskGoToCoordWhileAiming)(Ped ped, float toX, float toY, float toZ, int mode, float turnRadius, float stopRadius, Ped ped, float offsetX, float offsetY, float offsetZ) |   |

[06C3](https://wiki.blast.hk/gta-sa/opcodes/06C3) |  int num = [getNumberOfFiresInRange](https://wiki.blast.hk/moonloader/lua/getNumberOfFiresInRange)(float atX, float atY, float atZ, float radius) |   |

[06C4](https://wiki.blast.hk/gta-sa/opcodes/06C4) |  Marker marker = [addBlipForSearchlight](https://wiki.blast.hk/moonloader/lua/addBlipForSearchlight)(Searchlight searchlight) |   |

[06C5](https://wiki.blast.hk/gta-sa/opcodes/06C5) |  [skipToEndAndStopPlaybackRecordedCar](https://wiki.blast.hk/moonloader/lua/skipToEndAndStopPlaybackRecordedCar)(Vehicle car) |   |

[06C6](https://wiki.blast.hk/gta-sa/opcodes/06C6) |   |  [1:114] |

[06C7](https://wiki.blast.hk/gta-sa/opcodes/06C7) |  [taskCarTempAction](https://wiki.blast.hk/moonloader/lua/taskCarTempAction)(Ped ped, Vehicle car, int performAction, int timelimit) |   |

[06C8](https://wiki.blast.hk/gta-sa/opcodes/06C8) |  [setLaRiots](https://wiki.blast.hk/moonloader/lua/setLaRiots)(bool enable) |   |

[06C9](https://wiki.blast.hk/gta-sa/opcodes/06C9) |  [removeCharFromGroup](https://wiki.blast.hk/moonloader/lua/removeCharFromGroup)(Ped ped) |   |

[06CA](https://wiki.blast.hk/gta-sa/opcodes/06CA) |  [attachSearchlightToSearchlightObject](https://wiki.blast.hk/moonloader/lua/attachSearchlightToSearchlightObject)(Searchlight searchlight, int tower, int housing, int bulb, float offsetX, float offsetY, float offsetZ) |   |

[06CB](https://wiki.blast.hk/gta-sa/opcodes/06CB) |   |  [1:115] |

[06CE](https://wiki.blast.hk/gta-sa/opcodes/06CE) |   |  [1:116] |

[06CF](https://wiki.blast.hk/gta-sa/opcodes/06CF) |   |  [1:117] |

[06D0](https://wiki.blast.hk/gta-sa/opcodes/06D0) |  [switchEmergencyServices](https://wiki.blast.hk/moonloader/lua/switchEmergencyServices)(bool enable) |   |

[06D1](https://wiki.blast.hk/gta-sa/opcodes/06D1) |   |  [3:25] |

[06D2](https://wiki.blast.hk/gta-sa/opcodes/06D2) |   |  [3:26] |

[06D5](https://wiki.blast.hk/gta-sa/opcodes/06D5) |  Checkpoint checkpoint = [createCheckpoint](https://wiki.blast.hk/moonloader/lua/createCheckpoint)(int type, float atX, float atY, float atZ, float pointX, float pointY, float pointZ, float radius) |   |

[06D6](https://wiki.blast.hk/gta-sa/opcodes/06D6) |  [deleteCheckpoint](https://wiki.blast.hk/moonloader/lua/deleteCheckpoint)(Checkpoint checkpoint) |   |

[06D7](https://wiki.blast.hk/gta-sa/opcodes/06D7) |  [switchRandomTrains](https://wiki.blast.hk/moonloader/lua/switchRandomTrains)(bool enable) |   |

[06D8](https://wiki.blast.hk/gta-sa/opcodes/06D8) |  Vehicle train = [createMissionTrain](https://wiki.blast.hk/moonloader/lua/createMissionTrain)(int type, float atX, float atY, float atZ, bool direction) |   |

[06D9](https://wiki.blast.hk/gta-sa/opcodes/06D9) |  [deleteMissionTrains](https://wiki.blast.hk/moonloader/lua/deleteMissionTrains)() |   |

[06DA](https://wiki.blast.hk/gta-sa/opcodes/06DA) |  [markMissionTrainsAsNoLongerNeeded](https://wiki.blast.hk/moonloader/lua/markMissionTrainsAsNoLongerNeeded)() |   |

[06DB](https://wiki.blast.hk/gta-sa/opcodes/06DB) |  [deleteAllTrains](https://wiki.blast.hk/moonloader/lua/deleteAllTrains)() |   |

[06DC](https://wiki.blast.hk/gta-sa/opcodes/06DC) |  [setTrainSpeed](https://wiki.blast.hk/moonloader/lua/setTrainSpeed)(Vehicle train, float speed) |   |

[06DD](https://wiki.blast.hk/gta-sa/opcodes/06DD) |  [setTrainCruiseSpeed](https://wiki.blast.hk/moonloader/lua/setTrainCruiseSpeed)(Vehicle train, float speed) |   |

[06DE](https://wiki.blast.hk/gta-sa/opcodes/06DE) |  int caboose = [getTrainCaboose](https://wiki.blast.hk/moonloader/lua/getTrainCaboose)(Vehicle train) |   |

[06DF](https://wiki.blast.hk/gta-sa/opcodes/06DF) |  [deletePlayer](https://wiki.blast.hk/moonloader/lua/deletePlayer)(Player player) |   |

[06E0](https://wiki.blast.hk/gta-sa/opcodes/06E0) |  [setTwoPlayerCameraMode](https://wiki.blast.hk/moonloader/lua/setTwoPlayerCameraMode)(bool mode) |   |

[06E1](https://wiki.blast.hk/gta-sa/opcodes/06E1) |  [taskCarMission](https://wiki.blast.hk/moonloader/lua/taskCarMission)(Ped ped, Vehicle car, int targetCar, int order, float maxSpeed, int trafficFlag) |   |

[06E2](https://wiki.blast.hk/gta-sa/opcodes/06E2) |  [taskGoToObject](https://wiki.blast.hk/moonloader/lua/taskGoToObject)(Ped ped, int toObject, int timelimit, float stopWithinRadius) |   |

[06E3](https://wiki.blast.hk/gta-sa/opcodes/06E3) |  [taskWeaponRoll](https://wiki.blast.hk/moonloader/lua/taskWeaponRoll)(Ped ped, bool roll) |   |

[06E4](https://wiki.blast.hk/gta-sa/opcodes/06E4) |  [taskCharArrestChar](https://wiki.blast.hk/moonloader/lua/taskCharArrestChar)(Ped ped, int bustActor) |   |

[06E5](https://wiki.blast.hk/gta-sa/opcodes/06E5) |  Model itemID = [getAvailableVehicleMod](https://wiki.blast.hk/moonloader/lua/getAvailableVehicleMod)(Vehicle car, int poolIndex) |   |

[06E6](https://wiki.blast.hk/gta-sa/opcodes/06E6) |  int type = [getVehicleModType](https://wiki.blast.hk/moonloader/lua/getVehicleModType)(Model component) |   |

[06E7](https://wiki.blast.hk/gta-sa/opcodes/06E7) |  int componentId = [addVehicleMod](https://wiki.blast.hk/moonloader/lua/addVehicleMod)(Vehicle car, Model component) |   |

[06E8](https://wiki.blast.hk/gta-sa/opcodes/06E8) |  [removeVehicleMod](https://wiki.blast.hk/moonloader/lua/removeVehicleMod)(Vehicle car, int componentId) |   |

[06E9](https://wiki.blast.hk/gta-sa/opcodes/06E9) |  [requestVehicleMod](https://wiki.blast.hk/moonloader/lua/requestVehicleMod)(Model component) |   |

[06EA](https://wiki.blast.hk/gta-sa/opcodes/06EA) |  bool result = [hasVehicleModLoaded](https://wiki.blast.hk/moonloader/lua/hasVehicleModLoaded)(Model component) |   |

[06EB](https://wiki.blast.hk/gta-sa/opcodes/06EB) |  [markVehicleModAsNoLongerNeeded](https://wiki.blast.hk/moonloader/lua/markVehicleModAsNoLongerNeeded)(Model component) |   |

[06EC](https://wiki.blast.hk/gta-sa/opcodes/06EC) |  int num = [getNumAvailablePaintjobs](https://wiki.blast.hk/moonloader/lua/getNumAvailablePaintjobs)(Vehicle car) |   |

[06ED](https://wiki.blast.hk/gta-sa/opcodes/06ED) |  [giveVehiclePaintjob](https://wiki.blast.hk/moonloader/lua/giveVehiclePaintjob)(int set, int paintjob) |   |

[06EE](https://wiki.blast.hk/gta-sa/opcodes/06EE) |  bool result = [isGroupMember](https://wiki.blast.hk/moonloader/lua/isGroupMember)(Ped ped, int group) |   |

[06EF](https://wiki.blast.hk/gta-sa/opcodes/06EF) |  bool result = [isGroupLeader](https://wiki.blast.hk/moonloader/lua/isGroupLeader)(Ped ped, int group) |   |

[06F0](https://wiki.blast.hk/gta-sa/opcodes/06F0) |  [setGroupSeparationRange](https://wiki.blast.hk/moonloader/lua/setGroupSeparationRange)(int group, float range) |   |

[06F1](https://wiki.blast.hk/gta-sa/opcodes/06F1) |  [limitTwoPlayerDistance](https://wiki.blast.hk/moonloader/lua/limitTwoPlayerDistance)(float distance) |   |

[06F2](https://wiki.blast.hk/gta-sa/opcodes/06F2) |  [releaseTwoPlayerDistance](https://wiki.blast.hk/moonloader/lua/releaseTwoPlayerDistance)() |   |

[06F3](https://wiki.blast.hk/gta-sa/opcodes/06F3) |  [setPlayerPlayerTargetting](https://wiki.blast.hk/moonloader/lua/setPlayerPlayerTargetting)(bool can) |   |

[06F4](https://wiki.blast.hk/gta-sa/opcodes/06F4) |   |  [1:118] |

[06F5](https://wiki.blast.hk/gta-sa/opcodes/06F5) |  float X, float Y, float Z = [getScriptFireCoords](https://wiki.blast.hk/moonloader/lua/getScriptFireCoords)(int fire) |   |

[06F6](https://wiki.blast.hk/gta-sa/opcodes/06F6) |   |  [1:119] |

[06F7](https://wiki.blast.hk/gta-sa/opcodes/06F7) |   |  [1:120] |

[06F8](https://wiki.blast.hk/gta-sa/opcodes/06F8) |  float X, float Y, float Z, float ZAngle = [getNthClosestCarNodeWithHeading](https://wiki.blast.hk/moonloader/lua/getNthClosestCarNodeWithHeading)(float forX, float forY, float forZ, int direction) |   |

[06F9](https://wiki.blast.hk/gta-sa/opcodes/06F9) |   |  [1:121] |

[06FA](https://wiki.blast.hk/gta-sa/opcodes/06FA) |  [setPlayersCanBeInSeparateCars](https://wiki.blast.hk/moonloader/lua/setPlayersCanBeInSeparateCars)(bool allow) |   |

[06FB](https://wiki.blast.hk/gta-sa/opcodes/06FB) |   |  [1:122] |

[06FC](https://wiki.blast.hk/gta-sa/opcodes/06FC) |  bool result = [doesCarHaveStuckCarCheck](https://wiki.blast.hk/moonloader/lua/doesCarHaveStuckCarCheck)(Vehicle car) |   |

[06FD](https://wiki.blast.hk/gta-sa/opcodes/06FD) |  [setPlaybackSpeed](https://wiki.blast.hk/moonloader/lua/setPlaybackSpeed)(Vehicle car, float speed) |   |

[06FE](https://wiki.blast.hk/gta-sa/opcodes/06FE) |   |  [1:123] |

[06FF](https://wiki.blast.hk/gta-sa/opcodes/06FF) |  bool result = [areAnyCharsNearChar](https://wiki.blast.hk/moonloader/lua/areAnyCharsNearChar)(Ped ped, float range) |   |

[0700](https://wiki.blast.hk/gta-sa/opcodes/0700) |   |  [1:124] |

[0701](https://wiki.blast.hk/gta-sa/opcodes/0701) |  [skipCutsceneEnd](https://wiki.blast.hk/moonloader/lua/skipCutsceneEnd)() |   |

[0702](https://wiki.blast.hk/gta-sa/opcodes/0702) |  int percentage = [getPercentageTaggedInArea](https://wiki.blast.hk/moonloader/lua/getPercentageTaggedInArea)(float x1, float y1, float x2, float y2) |   |

[0703](https://wiki.blast.hk/gta-sa/opcodes/0703) |  [setTagStatusInArea](https://wiki.blast.hk/moonloader/lua/setTagStatusInArea)(float x1, float y1, float x2, float y2, bool value) |   |

[0704](https://wiki.blast.hk/gta-sa/opcodes/0704) |  [carGotoCoordinatesRacing](https://wiki.blast.hk/moonloader/lua/carGotoCoordinatesRacing)(Vehicle car, float toX, float toY, float toZ) |   |

[0705](https://wiki.blast.hk/gta-sa/opcodes/0705) |  [startPlaybackRecordedCarUsingAi](https://wiki.blast.hk/moonloader/lua/startPlaybackRecordedCarUsingAi)(Vehicle car, int path) |   |

[0706](https://wiki.blast.hk/gta-sa/opcodes/0706) |  [skipInPlaybackRecordedCar](https://wiki.blast.hk/moonloader/lua/skipInPlaybackRecordedCar)(Vehicle car, float path) |   |

[0707](https://wiki.blast.hk/gta-sa/opcodes/0707) |   |  [3:27] |

[0708](https://wiki.blast.hk/gta-sa/opcodes/0708) |  [clearCharDecisionMakerEventResponse](https://wiki.blast.hk/moonloader/lua/clearCharDecisionMakerEventResponse)(int maker, int event) |   |

[0709](https://wiki.blast.hk/gta-sa/opcodes/0709) |  [addCharDecisionMakerEventResponse](https://wiki.blast.hk/moonloader/lua/addCharDecisionMakerEventResponse)(int maker, int event, int taskID, float respect, float hate, float like, float dislike, bool inCar, bool onFoot) |   |

[070A](https://wiki.blast.hk/gta-sa/opcodes/070A) |  [taskPickUpObject](https://wiki.blast.hk/moonloader/lua/taskPickUpObject)(Ped ped, Object object, float offsetX, float offsetY, float offsetZ, int boneId1, int boneId2, string performAnimation, int IFPFile, int time) |   |

[070B](https://wiki.blast.hk/gta-sa/opcodes/070B) |  [dropObject](https://wiki.blast.hk/moonloader/lua/dropObject)(Ped ped, bool object) |   |

[070C](https://wiki.blast.hk/gta-sa/opcodes/070C) |  [explodeCarInCutscene](https://wiki.blast.hk/moonloader/lua/explodeCarInCutscene)(Vehicle car) |   |

[070D](https://wiki.blast.hk/gta-sa/opcodes/070D) |  [buildPlayerModel](https://wiki.blast.hk/moonloader/lua/buildPlayerModel)(Player player) |   |

[070E](https://wiki.blast.hk/gta-sa/opcodes/070E) |  [planeAttackPlayer](https://wiki.blast.hk/moonloader/lua/planeAttackPlayer)(int hydra, Vehicle car, float radius) |   |

[070F](https://wiki.blast.hk/gta-sa/opcodes/070F) |  [planeFlyInDirection](https://wiki.blast.hk/moonloader/lua/planeFlyInDirection)(int plane, float direction, float altitudemin, float altitudemax) |   |

[0710](https://wiki.blast.hk/gta-sa/opcodes/0710) |  [planeFollowEntity](https://wiki.blast.hk/moonloader/lua/planeFollowEntity)(int plane, Ped ped, Vehicle car, float radius) |   |

[0711](https://wiki.blast.hk/gta-sa/opcodes/0711) |   |  [1:125] |

[0712](https://wiki.blast.hk/gta-sa/opcodes/0712) |   |  [1:126] |

[0713](https://wiki.blast.hk/gta-sa/opcodes/0713) |  [taskDriveBy](https://wiki.blast.hk/moonloader/lua/taskDriveBy)(Ped ped, int drivebyActor, Vehicle car, float pX, float pY, float pZ, float radiusX, int radiusY, bool radiusZ, int firingRate) |   |

[0714](https://wiki.blast.hk/gta-sa/opcodes/0714) |  [setCarStayInSlowLane](https://wiki.blast.hk/moonloader/lua/setCarStayInSlowLane)(Vehicle car, bool stay) |   |

[0715](https://wiki.blast.hk/gta-sa/opcodes/0715) |  [takeRemoteControlOfCar](https://wiki.blast.hk/moonloader/lua/takeRemoteControlOfCar)(Player player, Vehicle car) |   |

[0716](https://wiki.blast.hk/gta-sa/opcodes/0716) |  bool result = [isClosestObjectOfTypeSmashedOrDamaged](https://wiki.blast.hk/moonloader/lua/isClosestObjectOfTypeSmashedOrDamaged)(Model object, float atX, float atY, float atZ, float radius, bool smashed, bool damaged) |   |

[0717](https://wiki.blast.hk/gta-sa/opcodes/0717) |  [startSettingUpConversation](https://wiki.blast.hk/moonloader/lua/startSettingUpConversation)(Ped ped) |   |

[0718](https://wiki.blast.hk/gta-sa/opcodes/0718) |   |  [1:127] |

[0719](https://wiki.blast.hk/gta-sa/opcodes/0719) |  [finishSettingUpConversation](https://wiki.blast.hk/moonloader/lua/finishSettingUpConversation)() |   |

[071A](https://wiki.blast.hk/gta-sa/opcodes/071A) |  bool result = [isConversationAtNode](https://wiki.blast.hk/moonloader/lua/isConversationAtNode)(Ped ped, GxtString gxtString) |   |

[071B](https://wiki.blast.hk/gta-sa/opcodes/071B) |   |  [1:128] |

[071C](https://wiki.blast.hk/gta-sa/opcodes/071C) |   |  [1:129] |

[071D](https://wiki.blast.hk/gta-sa/opcodes/071D) |   |  [1:130] |

[071E](https://wiki.blast.hk/gta-sa/opcodes/071E) |  int health = [getObjectHealth](https://wiki.blast.hk/moonloader/lua/getObjectHealth)(Object object) |   |

[071F](https://wiki.blast.hk/gta-sa/opcodes/071F) |  [setObjectHealth](https://wiki.blast.hk/moonloader/lua/setObjectHealth)(Object object, int health) |   |

[0720](https://wiki.blast.hk/gta-sa/opcodes/0720) |   |  [1:131] |

[0721](https://wiki.blast.hk/gta-sa/opcodes/0721) |   |  [1:132] |

[0722](https://wiki.blast.hk/gta-sa/opcodes/0722) |   |  [1:133] |

[0723](https://wiki.blast.hk/gta-sa/opcodes/0723) |  [breakObject](https://wiki.blast.hk/moonloader/lua/breakObject)(Object object, int intensity) |   |

[0724](https://wiki.blast.hk/gta-sa/opcodes/0724) |  [heliAttackPlayer](https://wiki.blast.hk/moonloader/lua/heliAttackPlayer)(Vehicle heli, Player player, float radius) |   |

[0725](https://wiki.blast.hk/gta-sa/opcodes/0725) |   |  [1:134] |

[0726](https://wiki.blast.hk/gta-sa/opcodes/0726) |  [heliFollowEntity](https://wiki.blast.hk/moonloader/lua/heliFollowEntity)(Vehicle heli, Ped ped, Vehicle car, float radius) |   |

[0727](https://wiki.blast.hk/gta-sa/opcodes/0727) |  [policeHeliChaseEntity](https://wiki.blast.hk/moonloader/lua/policeHeliChaseEntity)(Vehicle heli, Ped ped, Vehicle car, float radius) |   |

[0728](https://wiki.blast.hk/gta-sa/opcodes/0728) |   |  [1:135] |

[0729](https://wiki.blast.hk/gta-sa/opcodes/0729) |  [taskUseMobilePhone](https://wiki.blast.hk/moonloader/lua/taskUseMobilePhone)(Ped ped, bool hold) |   |

[072A](https://wiki.blast.hk/gta-sa/opcodes/072A) |  [taskWarpCharIntoCarAsDriver](https://wiki.blast.hk/moonloader/lua/taskWarpCharIntoCarAsDriver)(Ped ped, Vehicle car) |   |

[072B](https://wiki.blast.hk/gta-sa/opcodes/072B) |  [taskWarpCharIntoCarAsPassenger](https://wiki.blast.hk/moonloader/lua/taskWarpCharIntoCarAsPassenger)(Ped ped, Vehicle car, int passengerseat) |   |

[072C](https://wiki.blast.hk/gta-sa/opcodes/072C) |  [switchCopsOnBikes](https://wiki.blast.hk/moonloader/lua/switchCopsOnBikes)(bool generate) |   |

[072D](https://wiki.blast.hk/gta-sa/opcodes/072D) |  bool result = [isFlameInAngledArea2d](https://wiki.blast.hk/moonloader/lua/isFlameInAngledArea2d)(float x1, float y1, float x2, float y2, float angle, bool sphere) |   |

[072E](https://wiki.blast.hk/gta-sa/opcodes/072E) |  bool result = [isFlameInAngledArea3d](https://wiki.blast.hk/moonloader/lua/isFlameInAngledArea3d)(float x1, float y1, float z1, float x2, float y2, float z2, float angle, bool sphere) |   |

[072F](https://wiki.blast.hk/gta-sa/opcodes/072F) |  [addStuckCarCheckWithWarp](https://wiki.blast.hk/moonloader/lua/addStuckCarCheckWithWarp)(Vehicle car, float checkDistance, int time, bool stuck, bool flipped, bool warp, int path) |   |

[0730](https://wiki.blast.hk/gta-sa/opcodes/0730) |  [damageCarPanel](https://wiki.blast.hk/moonloader/lua/damageCarPanel)(Vehicle car, int door) |   |

[0731](https://wiki.blast.hk/gta-sa/opcodes/0731) |  [setCarRoll](https://wiki.blast.hk/moonloader/lua/setCarRoll)(Vehicle car, float roll) |   |

[0732](https://wiki.blast.hk/gta-sa/opcodes/0732) |  bool result = [suppressCarModel](https://wiki.blast.hk/moonloader/lua/suppressCarModel)(Model modelId) |   |

[0733](https://wiki.blast.hk/gta-sa/opcodes/0733) |  [dontSuppressCarModel](https://wiki.blast.hk/moonloader/lua/dontSuppressCarModel)(Model modelId) |   |

[0734](https://wiki.blast.hk/gta-sa/opcodes/0734) |  [dontSuppressAnyCarModels](https://wiki.blast.hk/moonloader/lua/dontSuppressAnyCarModels)() |   |

[0735](https://wiki.blast.hk/gta-sa/opcodes/0735) |  bool result = [isPs2KeyboardKeyPressed](https://wiki.blast.hk/moonloader/lua/isPs2KeyboardKeyPressed)(int key) |   |

[0736](https://wiki.blast.hk/gta-sa/opcodes/0736) |  bool result = [isPs2KeyboardKeyJustPressed](https://wiki.blast.hk/moonloader/lua/isPs2KeyboardKeyJustPressed)(int key) |   |

[0737](https://wiki.blast.hk/gta-sa/opcodes/0737) |  bool result = [isCharHoldingObject](https://wiki.blast.hk/moonloader/lua/isCharHoldingObject)(Ped ped, int liftingObject) |   |

[0738](https://wiki.blast.hk/gta-sa/opcodes/0738) |   |  [1:136] |

[0739](https://wiki.blast.hk/gta-sa/opcodes/0739) |   |  [1:137] |

[073A](https://wiki.blast.hk/gta-sa/opcodes/073A) |   |  [1:138] |

[073B](https://wiki.blast.hk/gta-sa/opcodes/073B) |  [setCarCanGoAgainstTraffic](https://wiki.blast.hk/moonloader/lua/setCarCanGoAgainstTraffic)(Vehicle car, bool can) |   |

[073C](https://wiki.blast.hk/gta-sa/opcodes/073C) |  [damageCarDoor](https://wiki.blast.hk/moonloader/lua/damageCarDoor)(Vehicle car, int door) |   |

[073D](https://wiki.blast.hk/gta-sa/opcodes/073D) |   |  [1:139] |

[073E](https://wiki.blast.hk/gta-sa/opcodes/073E) |  Vehicle car = [getRandomCarInSphereNoSave](https://wiki.blast.hk/moonloader/lua/getRandomCarInSphereNoSave)(float X, float Y, float Z, float radius, int model) |   |

[073F](https://wiki.blast.hk/gta-sa/opcodes/073F) |  Ped ped = [getRandomCharInSphere](https://wiki.blast.hk/moonloader/lua/getRandomCharInSphere)(float X, float Y, float Z, float radius, bool pedtypeCivilian, bool gang, bool prostitute) |   |

[0740](https://wiki.blast.hk/gta-sa/opcodes/0740) |   |  [1:140] |

[0741](https://wiki.blast.hk/gta-sa/opcodes/0741) |  bool result = [hasCharBeenArrested](https://wiki.blast.hk/moonloader/lua/hasCharBeenArrested)(Ped ped) |   |

[0742](https://wiki.blast.hk/gta-sa/opcodes/0742) |  [setPlaneThrottle](https://wiki.blast.hk/moonloader/lua/setPlaneThrottle)(int plane, float throttle) |   |

[0743](https://wiki.blast.hk/gta-sa/opcodes/0743) |  [heliLandAtCoords](https://wiki.blast.hk/moonloader/lua/heliLandAtCoords)(Vehicle heli, float X, float Y, float Z, float minaltitude, float maxaltitude) |   |

[0744](https://wiki.blast.hk/gta-sa/opcodes/0744) |   |  [1:141] |

[0745](https://wiki.blast.hk/gta-sa/opcodes/0745) |  [planeStartsInAir](https://wiki.blast.hk/moonloader/lua/planeStartsInAir)(int hydra) |   |

[0746](https://wiki.blast.hk/gta-sa/opcodes/0746) |  [setRelationship](https://wiki.blast.hk/moonloader/lua/setRelationship)(int acquaintance, int pedtype, int toPedtype) |   |

[0747](https://wiki.blast.hk/gta-sa/opcodes/0747) |  [clearRelationship](https://wiki.blast.hk/moonloader/lua/clearRelationship)(int acquaintance, int pedtype, int toPedtype) |   |

[0748](https://wiki.blast.hk/gta-sa/opcodes/0748) |   |  [1:142] |

[0749](https://wiki.blast.hk/gta-sa/opcodes/0749) |  [clearGroupDecisionMakerEventResponse](https://wiki.blast.hk/moonloader/lua/clearGroupDecisionMakerEventResponse)(int maker, int event) |   |

[074A](https://wiki.blast.hk/gta-sa/opcodes/074A) |  [addGroupDecisionMakerEventResponse](https://wiki.blast.hk/moonloader/lua/addGroupDecisionMakerEventResponse)(int maker, int event, int taskID, float respect, float hate, float like, float dislike, bool inCar, bool onFoot) |   |

[074B](https://wiki.blast.hk/gta-sa/opcodes/074B) |  [drawSpriteWithRotation](https://wiki.blast.hk/moonloader/lua/drawSpriteWithRotation)(int texture, float x, float y, float scaleX, float scaleY, float angle, int r, int g, int b, int a) |   |

[074C](https://wiki.blast.hk/gta-sa/opcodes/074C) |  [taskUseAttractor](https://wiki.blast.hk/moonloader/lua/taskUseAttractor)(Ped ped, int attractor) |   |

[074D](https://wiki.blast.hk/gta-sa/opcodes/074D) |  [taskShootAtChar](https://wiki.blast.hk/moonloader/lua/taskShootAtChar)(Ped ped, int atActor, int timelimit) |   |

[074E](https://wiki.blast.hk/gta-sa/opcodes/074E) |  [setInformRespectedFriends](https://wiki.blast.hk/moonloader/lua/setInformRespectedFriends)(int flags, float radius, int pedsToScan) |   |

[074F](https://wiki.blast.hk/gta-sa/opcodes/074F) |  bool result = [isCharRespondingToEvent](https://wiki.blast.hk/moonloader/lua/isCharRespondingToEvent)(Ped ped, int event) |   |

[0750](https://wiki.blast.hk/gta-sa/opcodes/0750) |  [setObjectVisible](https://wiki.blast.hk/moonloader/lua/setObjectVisible)(Object object, bool visibility) |   |

[0751](https://wiki.blast.hk/gta-sa/opcodes/0751) |  [taskFleeCharAnyMeans](https://wiki.blast.hk/moonloader/lua/taskFleeCharAnyMeans)(Ped ped, int fleeFrom, float runDistance, int time, bool changeCourse, int unkTime1, int unkTime2, float awayRadius) |   |

[0752](https://wiki.blast.hk/gta-sa/opcodes/0752) |   |  [1:143] |

[0754](https://wiki.blast.hk/gta-sa/opcodes/0754) |  [flushPatrolRoute](https://wiki.blast.hk/moonloader/lua/flushPatrolRoute)() |   |

[0755](https://wiki.blast.hk/gta-sa/opcodes/0755) |  [extendPatrolRoute](https://wiki.blast.hk/moonloader/lua/extendPatrolRoute)(float X, float Y, float Z, string animation, string IFPFile) |   |

[0758](https://wiki.blast.hk/gta-sa/opcodes/0758) |   |  [1:144] |

[0759](https://wiki.blast.hk/gta-sa/opcodes/0759) |   |  [1:145] |

[075A](https://wiki.blast.hk/gta-sa/opcodes/075A) |  bool result = [playObjectAnim](https://wiki.blast.hk/moonloader/lua/playObjectAnim)(Object object, string animation, string IFPFile, float framedelta, bool lockF, bool loop) |   |

[075B](https://wiki.blast.hk/gta-sa/opcodes/075B) |  [setRadarZoom](https://wiki.blast.hk/moonloader/lua/setRadarZoom)(int zoom) |   |

[075C](https://wiki.blast.hk/gta-sa/opcodes/075C) |  bool result = [doesBlipExist](https://wiki.blast.hk/moonloader/lua/doesBlipExist)(Marker marker) |   |

[075D](https://wiki.blast.hk/gta-sa/opcodes/075D) |  [loadPrices](https://wiki.blast.hk/moonloader/lua/loadPrices)(GxtString shopping) |   |

[075E](https://wiki.blast.hk/gta-sa/opcodes/075E) |  [loadShop](https://wiki.blast.hk/moonloader/lua/loadShop)(GxtString shopping) |   |

[075F](https://wiki.blast.hk/gta-sa/opcodes/075F) |  int num = [getNumberOfItemsInShop](https://wiki.blast.hk/moonloader/lua/getNumberOfItemsInShop)() |   |

[0760](https://wiki.blast.hk/gta-sa/opcodes/0760) |  int item = [getItemInShop](https://wiki.blast.hk/moonloader/lua/getItemInShop)(int index) |   |

[0761](https://wiki.blast.hk/gta-sa/opcodes/0761) |  int price = [getPriceOfItem](https://wiki.blast.hk/moonloader/lua/getPriceOfItem)(int item) |   |

[0762](https://wiki.blast.hk/gta-sa/opcodes/0762) |  [taskDead](https://wiki.blast.hk/moonloader/lua/taskDead)(Ped ped) |   |

[0763](https://wiki.blast.hk/gta-sa/opcodes/0763) |  [setCarAsMissionCar](https://wiki.blast.hk/moonloader/lua/setCarAsMissionCar)(Vehicle car) |   |

[0764](https://wiki.blast.hk/gta-sa/opcodes/0764) |   |  [1:146] |

[0765](https://wiki.blast.hk/gta-sa/opcodes/0765) |   |  [1:147] |

[0766](https://wiki.blast.hk/gta-sa/opcodes/0766) |   |  [1:148] |

[0767](https://wiki.blast.hk/gta-sa/opcodes/0767) |  [setZonePopulationType](https://wiki.blast.hk/moonloader/lua/setZonePopulationType)(GxtString zone, int popcycle) |   |

[076A](https://wiki.blast.hk/gta-sa/opcodes/076A) |  [setZoneDealerStrength](https://wiki.blast.hk/moonloader/lua/setZoneDealerStrength)(GxtString zone, int density) |   |

[076B](https://wiki.blast.hk/gta-sa/opcodes/076B) |  int strength = [getZoneDealerStrength](https://wiki.blast.hk/moonloader/lua/getZoneDealerStrength)(GxtString zone) |   |

[076C](https://wiki.blast.hk/gta-sa/opcodes/076C) |  [setZoneGangStrength](https://wiki.blast.hk/moonloader/lua/setZoneGangStrength)(GxtString zone, int gang, int density) |   |

[076D](https://wiki.blast.hk/gta-sa/opcodes/076D) |  int density = [getZoneGangStrength](https://wiki.blast.hk/moonloader/lua/getZoneGangStrength)(GxtString zone, int gang) |   |

[076E](https://wiki.blast.hk/gta-sa/opcodes/076E) |   |  [1:149] |

[076F](https://wiki.blast.hk/gta-sa/opcodes/076F) |  bool result = [isMessageBeingDisplayed](https://wiki.blast.hk/moonloader/lua/isMessageBeingDisplayed)() |   |

[0770](https://wiki.blast.hk/gta-sa/opcodes/0770) |  [setCharIsTargetPriority](https://wiki.blast.hk/moonloader/lua/setCharIsTargetPriority)(Ped ped, bool targetPriority) |   |

[0771](https://wiki.blast.hk/gta-sa/opcodes/0771) |  [customPlateDesignForNextCar](https://wiki.blast.hk/moonloader/lua/customPlateDesignForNextCar)(Model modelNumplate, int townTexture) |   |

[0772](https://wiki.blast.hk/gta-sa/opcodes/0772) |  [taskGotoCar](https://wiki.blast.hk/moonloader/lua/taskGotoCar)(Ped ped, Vehicle car, int timeMS, float stopAtDistance) |   |

[0773](https://wiki.blast.hk/gta-sa/opcodes/0773) |   |  [1:150] |

[0774](https://wiki.blast.hk/gta-sa/opcodes/0774) |   |  [1:151] |

[0775](https://wiki.blast.hk/gta-sa/opcodes/0775) |   |  [1:152] |

[0776](https://wiki.blast.hk/gta-sa/opcodes/0776) |  [requestIpl](https://wiki.blast.hk/moonloader/lua/requestIpl)(string group) |   |

[0777](https://wiki.blast.hk/gta-sa/opcodes/0777) |  [removeIpl](https://wiki.blast.hk/moonloader/lua/removeIpl)(string group) |   |

[0778](https://wiki.blast.hk/gta-sa/opcodes/0778) |  [removeIplDiscreetly](https://wiki.blast.hk/moonloader/lua/removeIplDiscreetly)(string group) |   |

[0779](https://wiki.blast.hk/gta-sa/opcodes/0779) |   |  [1:153] |

[077A](https://wiki.blast.hk/gta-sa/opcodes/077A) |  [setCharRelationship](https://wiki.blast.hk/moonloader/lua/setCharRelationship)(Ped ped, int acquaintance, int pedtype) |   |

[077B](https://wiki.blast.hk/gta-sa/opcodes/077B) |  [clearCharRelationship](https://wiki.blast.hk/moonloader/lua/clearCharRelationship)(Ped ped, int acquaintance, int pedtype) |   |

[077C](https://wiki.blast.hk/gta-sa/opcodes/077C) |  [clearAllCharRelationships](https://wiki.blast.hk/moonloader/lua/clearAllCharRelationships)(Ped ped, int acquaintance) |   |

[077D](https://wiki.blast.hk/gta-sa/opcodes/077D) |  float pitch = [getCarPitch](https://wiki.blast.hk/moonloader/lua/getCarPitch)(Vehicle car) |   |

[077E](https://wiki.blast.hk/gta-sa/opcodes/077E) |  int interior = [getActiveInterior](https://wiki.blast.hk/moonloader/lua/getActiveInterior)() |   |

[077F](https://wiki.blast.hk/gta-sa/opcodes/077F) |   |  [1:154] |

[0780](https://wiki.blast.hk/gta-sa/opcodes/0780) |  [heliKeepEntityInView](https://wiki.blast.hk/moonloader/lua/heliKeepEntityInView)(Vehicle heli, Ped ped, Vehicle car, float minaltitude, float maxaltitude) |   |

[0781](https://wiki.blast.hk/gta-sa/opcodes/0781) |  int model = [getWeapontypeModel](https://wiki.blast.hk/moonloader/lua/getWeapontypeModel)(int id) |   |

[0782](https://wiki.blast.hk/gta-sa/opcodes/0782) |  int slot = [getWeapontypeSlot](https://wiki.blast.hk/moonloader/lua/getWeapontypeSlot)(int id) |   |

[0783](https://wiki.blast.hk/gta-sa/opcodes/0783) |  int info = [getShoppingExtraInfo](https://wiki.blast.hk/moonloader/lua/getShoppingExtraInfo)(int item, int flag) |   |

[0784](https://wiki.blast.hk/gta-sa/opcodes/0784) |  [givePlayerClothes](https://wiki.blast.hk/moonloader/lua/givePlayerClothes)(Player player, int texture, int model, int bodypart) |   |

[0785](https://wiki.blast.hk/gta-sa/opcodes/0785) |   |  [1:155] |

[0786](https://wiki.blast.hk/gta-sa/opcodes/0786) |  int num = [getNumberOfFiresInArea](https://wiki.blast.hk/moonloader/lua/getNumberOfFiresInArea)(float x1, float y1, float z1, float x2, float y2, float z2) |   |

[0787](https://wiki.blast.hk/gta-sa/opcodes/0787) |   |  [1:156] |

[0788](https://wiki.blast.hk/gta-sa/opcodes/0788) |  [attachWinchToHeli](https://wiki.blast.hk/moonloader/lua/attachWinchToHeli)(Vehicle heli, bool magnet) |   |

[0789](https://wiki.blast.hk/gta-sa/opcodes/0789) |  [releaseEntityFromWinch](https://wiki.blast.hk/moonloader/lua/releaseEntityFromWinch)(Vehicle heli) |   |

[078A](https://wiki.blast.hk/gta-sa/opcodes/078A) |  int carriage = [getTrainCarriage](https://wiki.blast.hk/moonloader/lua/getTrainCarriage)(Vehicle train, int handle) |   |

[078B](https://wiki.blast.hk/gta-sa/opcodes/078B) |  Vehicle carHandle, Ped pedHandle, Object objectHandle = [grabEntityOnWinch](https://wiki.blast.hk/moonloader/lua/grabEntityOnWinch)(Vehicle heli) |   |

[078C](https://wiki.blast.hk/gta-sa/opcodes/078C) |  GxtString name = [getNameOfItem](https://wiki.blast.hk/moonloader/lua/getNameOfItem)(int item) |   |

[078D](https://wiki.blast.hk/gta-sa/opcodes/078D) |   |  [1:157] |

[078E](https://wiki.blast.hk/gta-sa/opcodes/078E) |   |  [1:158] |

[078F](https://wiki.blast.hk/gta-sa/opcodes/078F) |  [taskClimb](https://wiki.blast.hk/moonloader/lua/taskClimb)(Ped ped, bool climb) |   |

[0790](https://wiki.blast.hk/gta-sa/opcodes/0790) |  [buyItem](https://wiki.blast.hk/moonloader/lua/buyItem)(int item) |   |

[0791](https://wiki.blast.hk/gta-sa/opcodes/0791) |   |  [1:159] |

[0792](https://wiki.blast.hk/gta-sa/opcodes/0792) |  [clearCharTasksImmediately](https://wiki.blast.hk/moonloader/lua/clearCharTasksImmediately)(Ped ped) |   |

[0793](https://wiki.blast.hk/gta-sa/opcodes/0793) |  [storeClothesState](https://wiki.blast.hk/moonloader/lua/storeClothesState)() |   |

[0794](https://wiki.blast.hk/gta-sa/opcodes/0794) |  [restoreClothesState](https://wiki.blast.hk/moonloader/lua/restoreClothesState)() |   |

[0795](https://wiki.blast.hk/gta-sa/opcodes/0795) |   |  [1:160] |

[0796](https://wiki.blast.hk/gta-sa/opcodes/0796) |  float length = [getRopeHeightForObject](https://wiki.blast.hk/moonloader/lua/getRopeHeightForObject)(int magnet) |   |

[0797](https://wiki.blast.hk/gta-sa/opcodes/0797) |  [setRopeHeightForObject](https://wiki.blast.hk/moonloader/lua/setRopeHeightForObject)(int magnet, float length) |   |

[0798](https://wiki.blast.hk/gta-sa/opcodes/0798) |  Vehicle carHandle, Ped pedHandle, Object objectHandle = [grabEntityOnRopeForObject](https://wiki.blast.hk/moonloader/lua/grabEntityOnRopeForObject)(int magnet) |   |

[0799](https://wiki.blast.hk/gta-sa/opcodes/0799) |  [releaseEntityFromRopeForObject](https://wiki.blast.hk/moonloader/lua/releaseEntityFromRopeForObject)(int magnet) |   |

[079A](https://wiki.blast.hk/gta-sa/opcodes/079A) |   |  [1:161] |

[079B](https://wiki.blast.hk/gta-sa/opcodes/079B) |   |  [1:162] |

[079C](https://wiki.blast.hk/gta-sa/opcodes/079C) |   |  [1:163] |

[079D](https://wiki.blast.hk/gta-sa/opcodes/079D) |  [playerEnteredDockCrane](https://wiki.blast.hk/moonloader/lua/playerEnteredDockCrane)() |   |

[079E](https://wiki.blast.hk/gta-sa/opcodes/079E) |  [playerEnteredBuildingsiteCrane](https://wiki.blast.hk/moonloader/lua/playerEnteredBuildingsiteCrane)() |   |

[079F](https://wiki.blast.hk/gta-sa/opcodes/079F) |  [playerLeftCrane](https://wiki.blast.hk/moonloader/lua/playerLeftCrane)() |   |

[07A0](https://wiki.blast.hk/gta-sa/opcodes/07A0) |  [performSequenceTaskFromProgress](https://wiki.blast.hk/moonloader/lua/performSequenceTaskFromProgress)(Ped ped, int sequence, int unkProgress1, int unkProgress2) |   |

[07A1](https://wiki.blast.hk/gta-sa/opcodes/07A1) |  [setNextDesiredMoveState](https://wiki.blast.hk/moonloader/lua/setNextDesiredMoveState)(int speed) |   |

[07A2](https://wiki.blast.hk/gta-sa/opcodes/07A2) |   |  [1:164] |

[07A3](https://wiki.blast.hk/gta-sa/opcodes/07A3) |  [taskGotoCharAiming](https://wiki.blast.hk/moonloader/lua/taskGotoCharAiming)(Ped ped, int followActor, float minradius, float maxradius) |   |

[07A4](https://wiki.blast.hk/gta-sa/opcodes/07A4) |  int unkProgress1, int unkProgress2 = [getSequenceProgressRecursive](https://wiki.blast.hk/moonloader/lua/getSequenceProgressRecursive)(Ped ped) |   |

[07A5](https://wiki.blast.hk/gta-sa/opcodes/07A5) |  [taskKillCharOnFootTimed](https://wiki.blast.hk/moonloader/lua/taskKillCharOnFootTimed)(Ped ped, int attackActor, int time) |   |

[07A6](https://wiki.blast.hk/gta-sa/opcodes/07A6) |  float X, float Y, float Z = [getNearestTagPosition](https://wiki.blast.hk/moonloader/lua/getNearestTagPosition)(float X, float Y, float Z) |   |

[07A7](https://wiki.blast.hk/gta-sa/opcodes/07A7) |  [taskJetpack](https://wiki.blast.hk/moonloader/lua/taskJetpack)(Ped ped) |   |

[07A8](https://wiki.blast.hk/gta-sa/opcodes/07A8) |  [setArea51SamSite](https://wiki.blast.hk/moonloader/lua/setArea51SamSite)(bool enable) |   |

[07A9](https://wiki.blast.hk/gta-sa/opcodes/07A9) |  bool result, Searchlight searchlight = [isCharInAnySearchlight](https://wiki.blast.hk/moonloader/lua/isCharInAnySearchlight)(Ped ped) |   |

[07AA](https://wiki.blast.hk/gta-sa/opcodes/07AA) |   |  [1:165] |

[07AB](https://wiki.blast.hk/gta-sa/opcodes/07AB) |  bool result = [isTrailerAttachedToCab](https://wiki.blast.hk/moonloader/lua/isTrailerAttachedToCab)(Vehicle trailer, Vehicle car) |   |

[07AC](https://wiki.blast.hk/gta-sa/opcodes/07AC) |  [detachTrailerFromCab](https://wiki.blast.hk/moonloader/lua/detachTrailerFromCab)(Vehicle trailer, Vehicle cab) |   |

[07AD](https://wiki.blast.hk/gta-sa/opcodes/07AD) |   |  [1:166] |

[07AE](https://wiki.blast.hk/gta-sa/opcodes/07AE) |   |  [1:167] |

[07AF](https://wiki.blast.hk/gta-sa/opcodes/07AF) |  int group = [getPlayerGroup](https://wiki.blast.hk/moonloader/lua/getPlayerGroup)(Player player) |   |

[07B0](https://wiki.blast.hk/gta-sa/opcodes/07B0) |  GxtString shop = [getLoadedShop](https://wiki.blast.hk/moonloader/lua/getLoadedShop)() |   |

[07B1](https://wiki.blast.hk/gta-sa/opcodes/07B1) |  int int2, int int3, int int4 = [getBeatProximity](https://wiki.blast.hk/moonloader/lua/getBeatProximity)(int track) |   |

[07B2](https://wiki.blast.hk/gta-sa/opcodes/07B2) |   |  [1:168] |

[07B3](https://wiki.blast.hk/gta-sa/opcodes/07B3) |  [setGroupDefaultTaskAllocator](https://wiki.blast.hk/moonloader/lua/setGroupDefaultTaskAllocator)(int group, int command) |   |

[07B4](https://wiki.blast.hk/gta-sa/opcodes/07B4) |  [setPlayerGroupRecruitment](https://wiki.blast.hk/moonloader/lua/setPlayerGroupRecruitment)(Player player, bool enabled) |   |

[07B5](https://wiki.blast.hk/gta-sa/opcodes/07B5) |   |  [1:169] |

[07B6](https://wiki.blast.hk/gta-sa/opcodes/07B6) |   |  [1:170] |

[07B7](https://wiki.blast.hk/gta-sa/opcodes/07B7) |   |  [1:171] |

[07B8](https://wiki.blast.hk/gta-sa/opcodes/07B8) |   |  [1:172] |

[07BA](https://wiki.blast.hk/gta-sa/opcodes/07BA) |   |  [1:173] |

[07BB](https://wiki.blast.hk/gta-sa/opcodes/07BB) |  [activateHeliSpeedCheat](https://wiki.blast.hk/moonloader/lua/activateHeliSpeedCheat)(Vehicle heli, int power) |   |

[07BC](https://wiki.blast.hk/gta-sa/opcodes/07BC) |  [taskSetCharDecisionMaker](https://wiki.blast.hk/moonloader/lua/taskSetCharDecisionMaker)(Ped ped, int maker) |   |

[07BD](https://wiki.blast.hk/gta-sa/opcodes/07BD) |  [deleteMissionTrain](https://wiki.blast.hk/moonloader/lua/deleteMissionTrain)(Vehicle train) |   |

[07BE](https://wiki.blast.hk/gta-sa/opcodes/07BE) |  [markMissionTrainAsNoLongerNeeded](https://wiki.blast.hk/moonloader/lua/markMissionTrainAsNoLongerNeeded)(Vehicle train) |   |

[07BF](https://wiki.blast.hk/gta-sa/opcodes/07BF) |  [setBlipAlwaysDisplayOnZoomedRadar](https://wiki.blast.hk/moonloader/lua/setBlipAlwaysDisplayOnZoomedRadar)(Marker marker, bool displayAlways) |   |

[07C0](https://wiki.blast.hk/gta-sa/opcodes/07C0) |  [requestCarRecording](https://wiki.blast.hk/moonloader/lua/requestCarRecording)(int path) |   |

[07C1](https://wiki.blast.hk/gta-sa/opcodes/07C1) |  bool result = [hasCarRecordingBeenLoaded](https://wiki.blast.hk/moonloader/lua/hasCarRecordingBeenLoaded)(int path) |   |

[07C2](https://wiki.blast.hk/gta-sa/opcodes/07C2) |   |  [1:174] |

[07C3](https://wiki.blast.hk/gta-sa/opcodes/07C3) |  float x, float y, float z, float w = [getObjectQuaternion](https://wiki.blast.hk/moonloader/lua/getObjectQuaternion)(Object object) |  [4:1] |

[07C4](https://wiki.blast.hk/gta-sa/opcodes/07C4) |  [setObjectQuaternion](https://wiki.blast.hk/moonloader/lua/setObjectQuaternion)(Object object, float x, float y, float z, float w) |  [4:2] |

[07C5](https://wiki.blast.hk/gta-sa/opcodes/07C5) |  float x, float y, float z, float w = [getVehicleQuaternion](https://wiki.blast.hk/moonloader/lua/getVehicleQuaternion)(Vehicle car) |  [4:3] |

[07C6](https://wiki.blast.hk/gta-sa/opcodes/07C6) |  [setVehicleQuaternion](https://wiki.blast.hk/moonloader/lua/setVehicleQuaternion)(Vehicle car, float x, float y, float z, float w) |  [4:4] |

[07C7](https://wiki.blast.hk/gta-sa/opcodes/07C7) |  [setMissionTrainCoordinates](https://wiki.blast.hk/moonloader/lua/setMissionTrainCoordinates)(Vehicle train, float X, float Y, float Z) |   |

[07C8](https://wiki.blast.hk/gta-sa/opcodes/07C8) |   |  [1:175] |

[07C9](https://wiki.blast.hk/gta-sa/opcodes/07C9) |  [taskComplexPickupObject](https://wiki.blast.hk/moonloader/lua/taskComplexPickupObject)(Ped ped, Object object) |   |

[07CA](https://wiki.blast.hk/gta-sa/opcodes/07CA) |   |  [1:176] |

[07CB](https://wiki.blast.hk/gta-sa/opcodes/07CB) |  [listenToPlayerGroupCommands](https://wiki.blast.hk/moonloader/lua/listenToPlayerGroupCommands)(Ped ped, bool listen) |   |

[07CC](https://wiki.blast.hk/gta-sa/opcodes/07CC) |  [setPlayerEnterCarButton](https://wiki.blast.hk/moonloader/lua/setPlayerEnterCarButton)(Player player, bool can) |   |

[07CD](https://wiki.blast.hk/gta-sa/opcodes/07CD) |  [taskCharSlideToCoord](https://wiki.blast.hk/moonloader/lua/taskCharSlideToCoord)(Ped ped, float toX, float toY, float toZ, float angle, float withinRadius) |   |

[07CE](https://wiki.blast.hk/gta-sa/opcodes/07CE) |   |  [1:177] |

[07CF](https://wiki.blast.hk/gta-sa/opcodes/07CF) |   |  [1:178] |

[07D0](https://wiki.blast.hk/gta-sa/opcodes/07D0) |  int weekday = [getCurrentDayOfWeek](https://wiki.blast.hk/moonloader/lua/getCurrentDayOfWeek)() |   |

[07D1](https://wiki.blast.hk/gta-sa/opcodes/07D1) |   |  [1:179] |

[07D2](https://wiki.blast.hk/gta-sa/opcodes/07D2) |   |  [1:180] |

[07D3](https://wiki.blast.hk/gta-sa/opcodes/07D3) |  [registerScriptBrainForCodeUse](https://wiki.blast.hk/moonloader/lua/registerScriptBrainForCodeUse)(int id, GxtString gxtString) |   |

[07D4](https://wiki.blast.hk/gta-sa/opcodes/07D4) |   |  [1:181] |

[07D5](https://wiki.blast.hk/gta-sa/opcodes/07D5) |  [applyForceToCar](https://wiki.blast.hk/moonloader/lua/applyForceToCar)(Vehicle car, float vecX, float vecY, float vecZ, float rotationX, float rotationY, float rotationZ) |   |

[07D6](https://wiki.blast.hk/gta-sa/opcodes/07D6) |   |  [3:28] |

[07D7](https://wiki.blast.hk/gta-sa/opcodes/07D7) |   |  [3:29] |

[07DA](https://wiki.blast.hk/gta-sa/opcodes/07DA) |  [addToCarRotationVelocity](https://wiki.blast.hk/moonloader/lua/addToCarRotationVelocity)(Vehicle car, float vecX, float vecY, float vecZ) |   |

[07DB](https://wiki.blast.hk/gta-sa/opcodes/07DB) |  [setCarRotationVelocity](https://wiki.blast.hk/moonloader/lua/setCarRotationVelocity)(Vehicle car, float vecX, float vecY, float vecZ) |   |

[07DC](https://wiki.blast.hk/gta-sa/opcodes/07DC) |   |  [1:182] |

[07DD](https://wiki.blast.hk/gta-sa/opcodes/07DD) |  [setCharShootRate](https://wiki.blast.hk/moonloader/lua/setCharShootRate)(Ped ped, int rate) |   |

[07DE](https://wiki.blast.hk/gta-sa/opcodes/07DE) |  bool result = [isModelInCdimage](https://wiki.blast.hk/moonloader/lua/isModelInCdimage)(Model modelId) |   |

[07DF](https://wiki.blast.hk/gta-sa/opcodes/07DF) |  [removeOilPuddlesInArea](https://wiki.blast.hk/moonloader/lua/removeOilPuddlesInArea)(float x1, float y1, float x2, float y2) |   |

[07E0](https://wiki.blast.hk/gta-sa/opcodes/07E0) |  [setBlipAsFriendly](https://wiki.blast.hk/moonloader/lua/setBlipAsFriendly)(Marker marker, bool type) |   |

[07E1](https://wiki.blast.hk/gta-sa/opcodes/07E1) |  [taskSwimToCoord](https://wiki.blast.hk/moonloader/lua/taskSwimToCoord)(Ped ped, float toX, float toY, float toZ) |   |

[07E2](https://wiki.blast.hk/gta-sa/opcodes/07E2) |   |  [1:183] |

[07E3](https://wiki.blast.hk/gta-sa/opcodes/07E3) |   |  [1:184] |

[07E4](https://wiki.blast.hk/gta-sa/opcodes/07E4) |  float x1, float y1, float z1, float x2, float y2, float z2 = [getModelDimensions](https://wiki.blast.hk/moonloader/lua/getModelDimensions)(Model modelId) |   |

[07E5](https://wiki.blast.hk/gta-sa/opcodes/07E5) |  int maker = [copyCharDecisionMaker](https://wiki.blast.hk/moonloader/lua/copyCharDecisionMaker)(Ped ped) |   |

[07E6](https://wiki.blast.hk/gta-sa/opcodes/07E6) |  int maker = [copyGroupDecisionMaker](https://wiki.blast.hk/moonloader/lua/copyGroupDecisionMaker)(int group) |   |

[07E7](https://wiki.blast.hk/gta-sa/opcodes/07E7) |  [taskDrivePointRouteAdvanced](https://wiki.blast.hk/moonloader/lua/taskDrivePointRouteAdvanced)(Ped ped, Vehicle car, float speed, int flag1, int flag2, int flag3) |   |

[07E8](https://wiki.blast.hk/gta-sa/opcodes/07E8) |  bool result = [isRelationshipSet](https://wiki.blast.hk/moonloader/lua/isRelationshipSet)(int acquaintance, int ofActors, int toActors) |   |

[07E9](https://wiki.blast.hk/gta-sa/opcodes/07E9) |   |  [1:185] |

[07EA](https://wiki.blast.hk/gta-sa/opcodes/07EA) |   |  [1:186] |

[07EB](https://wiki.blast.hk/gta-sa/opcodes/07EB) |   |  [1:187] |

[07EC](https://wiki.blast.hk/gta-sa/opcodes/07EC) |   |  [1:188] |

[07ED](https://wiki.blast.hk/gta-sa/opcodes/07ED) |   |  [1:189] |

[07EE](https://wiki.blast.hk/gta-sa/opcodes/07EE) |  [setCarAlwaysCreateSkids](https://wiki.blast.hk/moonloader/lua/setCarAlwaysCreateSkids)(Vehicle car, bool enable) |   |

[07EF](https://wiki.blast.hk/gta-sa/opcodes/07EF) |  int city = [getCityFromCoords](https://wiki.blast.hk/moonloader/lua/getCityFromCoords)(float X, float Y, float Z) |   |

[07F0](https://wiki.blast.hk/gta-sa/opcodes/07F0) |  bool result = [hasObjectOfTypeBeenSmashed](https://wiki.blast.hk/moonloader/lua/hasObjectOfTypeBeenSmashed)(float X, float Y, float Z, float radius, Model modelId) |   |

[07F1](https://wiki.blast.hk/gta-sa/opcodes/07F1) |  bool result = [isPlayerPerformingWheelie](https://wiki.blast.hk/moonloader/lua/isPlayerPerformingWheelie)(Player player) |   |

[07F2](https://wiki.blast.hk/gta-sa/opcodes/07F2) |  bool result = [isPlayerPerformingStoppie](https://wiki.blast.hk/moonloader/lua/isPlayerPerformingStoppie)(Player player) |   |

[07F3](https://wiki.blast.hk/gta-sa/opcodes/07F3) |  [setCheckpointCoords](https://wiki.blast.hk/moonloader/lua/setCheckpointCoords)(Checkpoint checkpoint, float X, float Y, float Z) |   |

[07F4](https://wiki.blast.hk/gta-sa/opcodes/07F4) |   |  [1:190] |

[07F5](https://wiki.blast.hk/gta-sa/opcodes/07F5) |  [controlCarHydraulics](https://wiki.blast.hk/moonloader/lua/controlCarHydraulics)(Vehicle car, float f1, float f2, float f3, float f4) |   |

[07F6](https://wiki.blast.hk/gta-sa/opcodes/07F6) |  int numberOfLeaders, int numberOfMembers = [getGroupSize](https://wiki.blast.hk/moonloader/lua/getGroupSize)(int group) |   |

[07F7](https://wiki.blast.hk/gta-sa/opcodes/07F7) |  [setObjectCollisionDamageEffect](https://wiki.blast.hk/moonloader/lua/setObjectCollisionDamageEffect)(Object object, bool destructible) |   |

[07F8](https://wiki.blast.hk/gta-sa/opcodes/07F8) |  [setCarFollowCar](https://wiki.blast.hk/moonloader/lua/setCarFollowCar)(Vehicle car, int followCar, float radius) |   |

[07F9](https://wiki.blast.hk/gta-sa/opcodes/07F9) |  [playerEnteredQuarryCrane](https://wiki.blast.hk/moonloader/lua/playerEnteredQuarryCrane)() |   |

[07FA](https://wiki.blast.hk/gta-sa/opcodes/07FA) |  [playerEnteredLasVegasCrane](https://wiki.blast.hk/moonloader/lua/playerEnteredLasVegasCrane)() |   |

[07FB](https://wiki.blast.hk/gta-sa/opcodes/07FB) |  [switchEntryExit](https://wiki.blast.hk/moonloader/lua/switchEntryExit)(GxtString interior, bool access) |   |

[07FC](https://wiki.blast.hk/gta-sa/opcodes/07FC) |  [displayTextWithFloat](https://wiki.blast.hk/moonloader/lua/displayTextWithFloat)(float X, float Y, GxtString GXT, float value, int flag) |   |

[07FD](https://wiki.blast.hk/gta-sa/opcodes/07FD) |  bool result = [doesGroupExist](https://wiki.blast.hk/moonloader/lua/doesGroupExist)(int group) |   |

[07FE](https://wiki.blast.hk/gta-sa/opcodes/07FE) |  [giveMeleeAttackToChar](https://wiki.blast.hk/moonloader/lua/giveMeleeAttackToChar)(Ped ped, int fightingStyle, int moves) |   |

[07FF](https://wiki.blast.hk/gta-sa/opcodes/07FF) |  [setCarHydraulics](https://wiki.blast.hk/moonloader/lua/setCarHydraulics)(Vehicle car, bool hydraulics) |   |

[0800](https://wiki.blast.hk/gta-sa/opcodes/0800) |  bool result = [is2playerGameGoingOn](https://wiki.blast.hk/moonloader/lua/is2playerGameGoingOn)() |   |

[0801](https://wiki.blast.hk/gta-sa/opcodes/0801) |  float fov = [getCameraFov](https://wiki.blast.hk/moonloader/lua/getCameraFov)() |   |

[0803](https://wiki.blast.hk/gta-sa/opcodes/0803) |  bool result = [doesCarHaveHydraulics](https://wiki.blast.hk/moonloader/lua/doesCarHaveHydraulics)(Vehicle car) |   |

[0804](https://wiki.blast.hk/gta-sa/opcodes/0804) |  [taskCharSlideToCoordAndPlayAnim](https://wiki.blast.hk/moonloader/lua/taskCharSlideToCoordAndPlayAnim)(Ped ped, float toX, float toY, float toZ, float angle, float radius, string animation, int ifp1, float ifp2, bool LA, bool LX, bool LY, bool LF, int LT) |   |

[0805](https://wiki.blast.hk/gta-sa/opcodes/0805) |   |  [1:191] |

[0806](https://wiki.blast.hk/gta-sa/opcodes/0806) |  int number = [getTotalNumberOfPedsKilledByPlayer](https://wiki.blast.hk/moonloader/lua/getTotalNumberOfPedsKilledByPlayer)(Player player) |   |

[0807](https://wiki.blast.hk/gta-sa/opcodes/0807) |   |  [1:192] |

[0808](https://wiki.blast.hk/gta-sa/opcodes/0808) |   |  [1:193] |

[0809](https://wiki.blast.hk/gta-sa/opcodes/0809) |   |  [1:194] |

[080A](https://wiki.blast.hk/gta-sa/opcodes/080A) |  float X, float Y, float Z = [getLevelDesignCoordsForObject](https://wiki.blast.hk/moonloader/lua/getLevelDesignCoordsForObject)(Object object, int spoot) |   |

[080B](https://wiki.blast.hk/gta-sa/opcodes/080B) |   |  [1:195] |

[080C](https://wiki.blast.hk/gta-sa/opcodes/080C) |   |  [1:196] |

[080D](https://wiki.blast.hk/gta-sa/opcodes/080D) |   |  [1:197] |

[080E](https://wiki.blast.hk/gta-sa/opcodes/080E) |  int event = [getCharHighestPriorityEvent](https://wiki.blast.hk/moonloader/lua/getCharHighestPriorityEvent)(Ped ped) |   |

[080F](https://wiki.blast.hk/gta-sa/opcodes/080F) |   |  [1:198] |

[0810](https://wiki.blast.hk/gta-sa/opcodes/0810) |  float X, float Y, float Z = [getParkingNodeInArea](https://wiki.blast.hk/moonloader/lua/getParkingNodeInArea)(float x1, float y1, float z1, float x2, float y2, float z2) |   |

[0811](https://wiki.blast.hk/gta-sa/opcodes/0811) |  Vehicle car = [getCarCharIsUsing](https://wiki.blast.hk/moonloader/lua/getCarCharIsUsing)(Ped ped) |   |

[0812](https://wiki.blast.hk/gta-sa/opcodes/0812) |  [taskPlayAnimNonInterruptable](https://wiki.blast.hk/moonloader/lua/taskPlayAnimNonInterruptable)(Ped ped, string animation, string IFP, float framedelta, bool loopA, bool lockX, bool lockY, bool lockF, int time) |   |

[0813](https://wiki.blast.hk/gta-sa/opcodes/0813) |   |  [1:199] |

[0814](https://wiki.blast.hk/gta-sa/opcodes/0814) |  [addStuntJump](https://wiki.blast.hk/moonloader/lua/addStuntJump)(float startX, float startY, float startZ, float radiusX, float radiusY, float radiusZ, float goalX, float goalY, float goalZ, float radius2X, float radius2Y, float radius2Z, float cameraX, float cameraY, float cameraZ, int reward) |   |

[0815](https://wiki.blast.hk/gta-sa/opcodes/0815) |  [setObjectCoordinatesAndVelocity](https://wiki.blast.hk/moonloader/lua/setObjectCoordinatesAndVelocity)(Object object, float X, float Y, float Z) |   |

[0816](https://wiki.blast.hk/gta-sa/opcodes/0816) |  [setCharKindaStayInSamePlace](https://wiki.blast.hk/moonloader/lua/setCharKindaStayInSamePlace)(Ped ped, bool stay) |   |

[0817](https://wiki.blast.hk/gta-sa/opcodes/0817) |  [taskFollowPatrolRoute](https://wiki.blast.hk/moonloader/lua/taskFollowPatrolRoute)(Ped ped, int walkMode, int routeMode) |   |

[0818](https://wiki.blast.hk/gta-sa/opcodes/0818) |  bool result = [isCharInAir](https://wiki.blast.hk/moonloader/lua/isCharInAir)(Ped ped) |   |

[0819](https://wiki.blast.hk/gta-sa/opcodes/0819) |  float height = [getCharHeightAboveGround](https://wiki.blast.hk/moonloader/lua/getCharHeightAboveGround)(Ped ped) |   |

[081A](https://wiki.blast.hk/gta-sa/opcodes/081A) |  [setCharWeaponSkill](https://wiki.blast.hk/moonloader/lua/setCharWeaponSkill)(Ped ped, int skill) |   |

[081B](https://wiki.blast.hk/gta-sa/opcodes/081B) |   |  [1:200] |

[081C](https://wiki.blast.hk/gta-sa/opcodes/081C) |  [setTextEdge](https://wiki.blast.hk/moonloader/lua/setTextEdge)(int size, int r, int g, int b, int a) |   |

[081D](https://wiki.blast.hk/gta-sa/opcodes/081D) |  [setCarEngineBroken](https://wiki.blast.hk/moonloader/lua/setCarEngineBroken)(Vehicle car, bool broken) |   |

[081E](https://wiki.blast.hk/gta-sa/opcodes/081E) |  bool result = [isThisModelABoat](https://wiki.blast.hk/moonloader/lua/isThisModelABoat)(Model modelId) |   |

[081F](https://wiki.blast.hk/gta-sa/opcodes/081F) |  bool result = [isThisModelAPlane](https://wiki.blast.hk/moonloader/lua/isThisModelAPlane)(Model modelId) |   |

[0820](https://wiki.blast.hk/gta-sa/opcodes/0820) |  bool result = [isThisModelAHeli](https://wiki.blast.hk/moonloader/lua/isThisModelAHeli)(Model modelId) |   |

[0821](https://wiki.blast.hk/gta-sa/opcodes/0821) |   |  [1:201] |

[0822](https://wiki.blast.hk/gta-sa/opcodes/0822) |  [setFirstPersonInCarCameraMode](https://wiki.blast.hk/moonloader/lua/setFirstPersonInCarCameraMode)(bool enable) |   |

[0823](https://wiki.blast.hk/gta-sa/opcodes/0823) |  [taskGreetPartner](https://wiki.blast.hk/moonloader/lua/taskGreetPartner)(Ped ped, Ped ped2, float unk1, int unk2) |   |

[0824](https://wiki.blast.hk/gta-sa/opcodes/0824) |   |  [1:202] |

[0825](https://wiki.blast.hk/gta-sa/opcodes/0825) |  [setHeliBladesFullSpeed](https://wiki.blast.hk/moonloader/lua/setHeliBladesFullSpeed)(Vehicle heli) |   |

[0826](https://wiki.blast.hk/gta-sa/opcodes/0826) |  [displayHud](https://wiki.blast.hk/moonloader/lua/displayHud)(bool enable) |   |

[0827](https://wiki.blast.hk/gta-sa/opcodes/0827) |  [connectLods](https://wiki.blast.hk/moonloader/lua/connectLods)(Object object, int lod) |   |

[0828](https://wiki.blast.hk/gta-sa/opcodes/0828) |  [setMaxFireGenerations](https://wiki.blast.hk/moonloader/lua/setMaxFireGenerations)(int max) |   |

[0829](https://wiki.blast.hk/gta-sa/opcodes/0829) |  [taskDieNamedAnim](https://wiki.blast.hk/moonloader/lua/taskDieNamedAnim)(Ped ped, string animation, string ifp1, float ifp2, int time) |   |

[082A](https://wiki.blast.hk/gta-sa/opcodes/082A) |  [setPlayerDuckButton](https://wiki.blast.hk/moonloader/lua/setPlayerDuckButton)(Player player, bool able) |   |

[0830](https://wiki.blast.hk/gta-sa/opcodes/0830) |  [setPoolTableCoords](https://wiki.blast.hk/moonloader/lua/setPoolTableCoords)(float x1, float y1, float z1, float x2, float y2, float z2) |   |

[0831](https://wiki.blast.hk/gta-sa/opcodes/0831) |   |  [1:203] |

[0832](https://wiki.blast.hk/gta-sa/opcodes/0832) |   |  [1:204] |

[0833](https://wiki.blast.hk/gta-sa/opcodes/0833) |  bool result = [hasObjectBeenPhotographed](https://wiki.blast.hk/moonloader/lua/hasObjectBeenPhotographed)(Object object) |   |

[0834](https://wiki.blast.hk/gta-sa/opcodes/0834) |  [doCameraBump](https://wiki.blast.hk/moonloader/lua/doCameraBump)(float rotationZ, float rotationY) |   |

[0835](https://wiki.blast.hk/gta-sa/opcodes/0835) |  int day, int month = [getCurrentDate](https://wiki.blast.hk/moonloader/lua/getCurrentDate)() |   |

[0836](https://wiki.blast.hk/gta-sa/opcodes/0836) |  [setObjectAnimSpeed](https://wiki.blast.hk/moonloader/lua/setObjectAnimSpeed)(Object object, string animation, float speed) |   |

[0837](https://wiki.blast.hk/gta-sa/opcodes/0837) |  bool result = [isObjectPlayingAnim](https://wiki.blast.hk/moonloader/lua/isObjectPlayingAnim)(Object object, string anim) |   |

[0838](https://wiki.blast.hk/gta-sa/opcodes/0838) |   |  [1:205] |

[0839](https://wiki.blast.hk/gta-sa/opcodes/0839) |  float progress = [getObjectAnimCurrentTime](https://wiki.blast.hk/moonloader/lua/getObjectAnimCurrentTime)(Object object, string animation) |   |

[083A](https://wiki.blast.hk/gta-sa/opcodes/083A) |  [setObjectAnimCurrentTime](https://wiki.blast.hk/moonloader/lua/setObjectAnimCurrentTime)(Object object, string animation, float progress) |   |

[083B](https://wiki.blast.hk/gta-sa/opcodes/083B) |   |  [1:206] |

[083C](https://wiki.blast.hk/gta-sa/opcodes/083C) |  [setCharVelocity](https://wiki.blast.hk/moonloader/lua/setCharVelocity)(Ped ped, float vecX, float vecY, float vecZ) |   |

[083D](https://wiki.blast.hk/gta-sa/opcodes/083D) |  float vecX, float vecY, float vecZ = [getCharVelocity](https://wiki.blast.hk/moonloader/lua/getCharVelocity)(Ped ped) |   |

[083E](https://wiki.blast.hk/gta-sa/opcodes/083E) |  [setCharRotation](https://wiki.blast.hk/moonloader/lua/setCharRotation)(Ped ped, float vecX, float vecY, float vecZ) |   |

[083F](https://wiki.blast.hk/gta-sa/opcodes/083F) |  float value = [getCarUprightValue](https://wiki.blast.hk/moonloader/lua/getCarUprightValue)(Vehicle car) |   |

[0840](https://wiki.blast.hk/gta-sa/opcodes/0840) |  [setVehicleInterior](https://wiki.blast.hk/moonloader/lua/setVehicleInterior)(Vehicle car, int interior) |   |

[0841](https://wiki.blast.hk/gta-sa/opcodes/0841) |  [selectWeaponsForVehicle](https://wiki.blast.hk/moonloader/lua/selectWeaponsForVehicle)(Vehicle car, bool gun) |   |

[0842](https://wiki.blast.hk/gta-sa/opcodes/0842) |  int city = [getCityPlayerIsIn](https://wiki.blast.hk/moonloader/lua/getCityPlayerIsIn)(Player player) |   |

[0843](https://wiki.blast.hk/gta-sa/opcodes/0843) |  GxtString name = [getNameOfZone](https://wiki.blast.hk/moonloader/lua/getNameOfZone)(float X, float Y, float Z) |   |

[0844](https://wiki.blast.hk/gta-sa/opcodes/0844) |   |  [3:30] |

[0845](https://wiki.blast.hk/gta-sa/opcodes/0845) |   |  [3:31] |

[0846](https://wiki.blast.hk/gta-sa/opcodes/0846) |   |  [3:32] |

[0847](https://wiki.blast.hk/gta-sa/opcodes/0847) |   |  [3:33] |

[0848](https://wiki.blast.hk/gta-sa/opcodes/0848) |   |  [1:207] |

[0849](https://wiki.blast.hk/gta-sa/opcodes/0849) |   |  [1:208] |

[084A](https://wiki.blast.hk/gta-sa/opcodes/084A) |   |  [1:209] |

[084B](https://wiki.blast.hk/gta-sa/opcodes/084B) |   |  [1:210] |

[084C](https://wiki.blast.hk/gta-sa/opcodes/084C) |   |  [1:211] |

[084D](https://wiki.blast.hk/gta-sa/opcodes/084D) |  [activateInteriorPeds](https://wiki.blast.hk/moonloader/lua/activateInteriorPeds)(bool activate) |   |

[084E](https://wiki.blast.hk/gta-sa/opcodes/084E) |  [setVehicleCanBeTargetted](https://wiki.blast.hk/moonloader/lua/setVehicleCanBeTargetted)(Vehicle car, bool unk) |   |

[084F](https://wiki.blast.hk/gta-sa/opcodes/084F) |   |  [1:212] |

[0850](https://wiki.blast.hk/gta-sa/opcodes/0850) |  [taskFollowFootsteps](https://wiki.blast.hk/moonloader/lua/taskFollowFootsteps)(Ped ped, int followActor) |   |

[0851](https://wiki.blast.hk/gta-sa/opcodes/0851) |  [damageChar](https://wiki.blast.hk/moonloader/lua/damageChar)(Ped ped, int health, bool affectArmour) |   |

[0852](https://wiki.blast.hk/gta-sa/opcodes/0852) |  [setCarCanBeVisiblyDamaged](https://wiki.blast.hk/moonloader/lua/setCarCanBeVisiblyDamaged)(Vehicle car, bool can) |   |

[0853](https://wiki.blast.hk/gta-sa/opcodes/0853) |  [setHeliReachedTargetDistance](https://wiki.blast.hk/moonloader/lua/setHeliReachedTargetDistance)(Vehicle heli, int dist) |   |

[0855](https://wiki.blast.hk/gta-sa/opcodes/0855) |  float level = [getSoundLevelAtCoords](https://wiki.blast.hk/moonloader/lua/getSoundLevelAtCoords)(Ped ped, float X, float Y, float Z) |   |

[0856](https://wiki.blast.hk/gta-sa/opcodes/0856) |  [setCharAllowedToDuck](https://wiki.blast.hk/moonloader/lua/setCharAllowedToDuck)(Ped ped, bool enable) |   |

[0857](https://wiki.blast.hk/gta-sa/opcodes/0857) |   |  [1:213] |

[0858](https://wiki.blast.hk/gta-sa/opcodes/0858) |  [setHeadingForAttachedPlayer](https://wiki.blast.hk/moonloader/lua/setHeadingForAttachedPlayer)(Player player, float toAngle, float rotationSpeed) |   |

[0859](https://wiki.blast.hk/gta-sa/opcodes/0859) |  [taskWalkAlongsideChar](https://wiki.blast.hk/moonloader/lua/taskWalkAlongsideChar)(Ped ped, int alongisdeActor) |   |

[085A](https://wiki.blast.hk/gta-sa/opcodes/085A) |  [createEmergencyServicesCar](https://wiki.blast.hk/moonloader/lua/createEmergencyServicesCar)(Model car, float X, float Y, float Z) |   |

[085B](https://wiki.blast.hk/gta-sa/opcodes/085B) |  [taskKindaStayInSamePlace](https://wiki.blast.hk/moonloader/lua/taskKindaStayInSamePlace)(Ped ped, bool stay) |   |

[085C](https://wiki.blast.hk/gta-sa/opcodes/085C) |   |  [1:214] |

[085D](https://wiki.blast.hk/gta-sa/opcodes/085D) |   |  [1:215] |

[085E](https://wiki.blast.hk/gta-sa/opcodes/085E) |  [startPlaybackRecordedCarLooped](https://wiki.blast.hk/moonloader/lua/startPlaybackRecordedCarLooped)(Vehicle car, int path) |   |

[085F](https://wiki.blast.hk/gta-sa/opcodes/085F) |   |  [1:216] |

[0860](https://wiki.blast.hk/gta-sa/opcodes/0860) |  [setCharInterior](https://wiki.blast.hk/moonloader/lua/setCharInterior)(Ped ped, int interior) |   |

[0861](https://wiki.blast.hk/gta-sa/opcodes/0861) |  bool result = [isAttachedPlayerHeadingAchieved](https://wiki.blast.hk/moonloader/lua/isAttachedPlayerHeadingAchieved)(Player player) |   |

[0862](https://wiki.blast.hk/gta-sa/opcodes/0862) |   |  [1:217] |

[0863](https://wiki.blast.hk/gta-sa/opcodes/0863) |   |  [1:218] |

[0864](https://wiki.blast.hk/gta-sa/opcodes/0864) |  [enableEntryExitPlayerGroupWarping](https://wiki.blast.hk/moonloader/lua/enableEntryExitPlayerGroupWarping)(float X, float Y, float radius, bool access) |   |

[0866](https://wiki.blast.hk/gta-sa/opcodes/0866) |  Object object = [getClosestStealableObject](https://wiki.blast.hk/moonloader/lua/getClosestStealableObject)(float X, float Y, float Z, float radius) |   |

[0867](https://wiki.blast.hk/gta-sa/opcodes/0867) |  bool result = [isProceduralInteriorActive](https://wiki.blast.hk/moonloader/lua/isProceduralInteriorActive)(int interior) |   |

[0868](https://wiki.blast.hk/gta-sa/opcodes/0868) |   |  [1:219] |

[0869](https://wiki.blast.hk/gta-sa/opcodes/0869) |   |  [1:220] |

[086A](https://wiki.blast.hk/gta-sa/opcodes/086A) |   |  [1:221] |

[086B](https://wiki.blast.hk/gta-sa/opcodes/086B) |   |  [1:222] |

[086C](https://wiki.blast.hk/gta-sa/opcodes/086C) |   |  [1:223] |

[086D](https://wiki.blast.hk/gta-sa/opcodes/086D) |   |  [1:224] |

[086E](https://wiki.blast.hk/gta-sa/opcodes/086E) |   |  [1:225] |

[086F](https://wiki.blast.hk/gta-sa/opcodes/086F) |   |  [1:226] |

[0870](https://wiki.blast.hk/gta-sa/opcodes/0870) |   |  [1:227] |

[0871](https://wiki.blast.hk/gta-sa/opcodes/0871) |   |  [3:34] |

[0872](https://wiki.blast.hk/gta-sa/opcodes/0872) |   |  [3:35] |

[0873](https://wiki.blast.hk/gta-sa/opcodes/0873) |  [removeCarRecording](https://wiki.blast.hk/moonloader/lua/removeCarRecording)(int path) |   |

[0874](https://wiki.blast.hk/gta-sa/opcodes/0874) |  [setZonePopulationRace](https://wiki.blast.hk/moonloader/lua/setZonePopulationRace)(GxtString zone, int popcycle) |   |

[0875](https://wiki.blast.hk/gta-sa/opcodes/0875) |  [setObjectOnlyDamagedByPlayer](https://wiki.blast.hk/moonloader/lua/setObjectOnlyDamagedByPlayer)(Object object, bool player) |   |

[0876](https://wiki.blast.hk/gta-sa/opcodes/0876) |  [createBirds](https://wiki.blast.hk/moonloader/lua/createBirds)(float x1, float y1, float z1, float x2, float y2, float z2, int flag1, int flag2) |   |

[0877](https://wiki.blast.hk/gta-sa/opcodes/0877) |   |  [1:228] |

[0878](https://wiki.blast.hk/gta-sa/opcodes/0878) |  [setVehicleDirtLevel](https://wiki.blast.hk/moonloader/lua/setVehicleDirtLevel)(Vehicle car, float level) |   |

[0879](https://wiki.blast.hk/gta-sa/opcodes/0879) |  [setGangWarsActive](https://wiki.blast.hk/moonloader/lua/setGangWarsActive)(bool enable) |   |

[087A](https://wiki.blast.hk/gta-sa/opcodes/087A) |  bool result = [isGangWarGoingOn](https://wiki.blast.hk/moonloader/lua/isGangWarGoingOn)() |   |

[087B](https://wiki.blast.hk/gta-sa/opcodes/087B) |  [givePlayerClothesOutsideShop](https://wiki.blast.hk/moonloader/lua/givePlayerClothesOutsideShop)(Player player, string clothes, string model, int bodyPart) |   |

[087C](https://wiki.blast.hk/gta-sa/opcodes/087C) |  [clearLoadedShop](https://wiki.blast.hk/moonloader/lua/clearLoadedShop)() |   |

[087D](https://wiki.blast.hk/gta-sa/opcodes/087D) |  [setGroupSequence](https://wiki.blast.hk/moonloader/lua/setGroupSequence)(int group, int Aspack) |   |

[087E](https://wiki.blast.hk/gta-sa/opcodes/087E) |  [setCharDropsWeaponsWhenDead](https://wiki.blast.hk/moonloader/lua/setCharDropsWeaponsWhenDead)(Ped ped, bool droppable) |   |

[087F](https://wiki.blast.hk/gta-sa/opcodes/087F) |  [setCharNeverLeavesGroup](https://wiki.blast.hk/moonloader/lua/setCharNeverLeavesGroup)(Ped ped, bool set) |   |

[0880](https://wiki.blast.hk/gta-sa/opcodes/0880) |   |  [1:229] |

[0881](https://wiki.blast.hk/gta-sa/opcodes/0881) |  [setPlayerFireButton](https://wiki.blast.hk/moonloader/lua/setPlayerFireButton)(Player player, bool able) |   |

[0882](https://wiki.blast.hk/gta-sa/opcodes/0882) |   |  [1:230] |

[0883](https://wiki.blast.hk/gta-sa/opcodes/0883) |  [attachFxSystemToCharBone](https://wiki.blast.hk/moonloader/lua/attachFxSystemToCharBone)(Particle particle, Ped ped, int mode) |   |

[0884](https://wiki.blast.hk/gta-sa/opcodes/0884) |  [registerAttractorScriptBrainForCodeUse](https://wiki.blast.hk/moonloader/lua/registerAttractorScriptBrainForCodeUse)(int handle, GxtString script) |   |

[0885](https://wiki.blast.hk/gta-sa/opcodes/0885) |   |  [1:231] |

[0886](https://wiki.blast.hk/gta-sa/opcodes/0886) |   |  [1:232] |

[0887](https://wiki.blast.hk/gta-sa/opcodes/0887) |  [setHeadingLimitForAttachedChar](https://wiki.blast.hk/moonloader/lua/setHeadingLimitForAttachedChar)(Ped ped, int orientation, float limit) |   |

[0888](https://wiki.blast.hk/gta-sa/opcodes/0888) |  Marker blip = [addBlipForDeadChar](https://wiki.blast.hk/moonloader/lua/addBlipForDeadChar)(Ped ped) |   |

[0889](https://wiki.blast.hk/gta-sa/opcodes/0889) |  float X, float Y, float Z = [getDeadCharCoordinates](https://wiki.blast.hk/moonloader/lua/getDeadCharCoordinates)(Ped ped) |   |

[088A](https://wiki.blast.hk/gta-sa/opcodes/088A) |  [taskPlayAnimWithFlags](https://wiki.blast.hk/moonloader/lua/taskPlayAnimWithFlags)(Ped ped, string animation, string ifp, float framedelta, bool loopA, bool lockX, bool lockY, bool lockF, int time, bool force, bool lockZ) |   |

[088B](https://wiki.blast.hk/gta-sa/opcodes/088B) |  [setVehicleAirResistanceMultiplier](https://wiki.blast.hk/moonloader/lua/setVehicleAirResistanceMultiplier)(Vehicle car, float multiplier) |   |

[088C](https://wiki.blast.hk/gta-sa/opcodes/088C) |  [setCarCoordinatesNoOffset](https://wiki.blast.hk/moonloader/lua/setCarCoordinatesNoOffset)(Vehicle car, float X, float Y, float Z) |   |

[088D](https://wiki.blast.hk/gta-sa/opcodes/088D) |  [setUsesCollisionOfClosestObjectOfType](https://wiki.blast.hk/moonloader/lua/setUsesCollisionOfClosestObjectOfType)(float X, float Y, float Z, float radius, Model modelId, bool collisionDetection) |   |

[088E](https://wiki.blast.hk/gta-sa/opcodes/088E) |  [setTimeOneDayForward](https://wiki.blast.hk/moonloader/lua/setTimeOneDayForward)() |   |

[088F](https://wiki.blast.hk/gta-sa/opcodes/088F) |   |  [1:233] |

[0890](https://wiki.blast.hk/gta-sa/opcodes/0890) |  [setTimerBeepCountdownTime](https://wiki.blast.hk/moonloader/lua/setTimerBeepCountdownTime)(VarId timer, int reach) |   |

[0891](https://wiki.blast.hk/gta-sa/opcodes/0891) |   |  [1:234] |

[0892](https://wiki.blast.hk/gta-sa/opcodes/0892) |   |  [1:235] |

[0893](https://wiki.blast.hk/gta-sa/opcodes/0893) |  [attachTrailerToCab](https://wiki.blast.hk/moonloader/lua/attachTrailerToCab)(int trailer, int cab) |   |

[0894](https://wiki.blast.hk/gta-sa/opcodes/0894) |   |  [1:236] |

[0895](https://wiki.blast.hk/gta-sa/opcodes/0895) |   |  [1:237] |

[0896](https://wiki.blast.hk/gta-sa/opcodes/0896) |   |  [1:238] |

[0897](https://wiki.blast.hk/gta-sa/opcodes/0897) |  bool result = [isVehicleTouchingObject](https://wiki.blast.hk/moonloader/lua/isVehicleTouchingObject)(Vehicle car, Object object) |   |

[0898](https://wiki.blast.hk/gta-sa/opcodes/0898) |  [enableCraneControls](https://wiki.blast.hk/moonloader/lua/enableCraneControls)(bool UP, bool DOWN, bool RELEASE) |   |

[0899](https://wiki.blast.hk/gta-sa/opcodes/0899) |   |  [1:239] |

[089A](https://wiki.blast.hk/gta-sa/opcodes/089A) |   |  [1:240] |

[089B](https://wiki.blast.hk/gta-sa/opcodes/089B) |  bool result = [isPlayerInPositionForConversation](https://wiki.blast.hk/moonloader/lua/isPlayerInPositionForConversation)(Ped ped) |   |

[089C](https://wiki.blast.hk/gta-sa/opcodes/089C) |  [enableConversation](https://wiki.blast.hk/moonloader/lua/enableConversation)(Ped ped, bool enable) |   |

[089D](https://wiki.blast.hk/gta-sa/opcodes/089D) |   |  [1:241] |

[089E](https://wiki.blast.hk/gta-sa/opcodes/089E) |  Ped ped = [getRandomCharInSphereOnlyDrugsBuyers](https://wiki.blast.hk/moonloader/lua/getRandomCharInSphereOnlyDrugsBuyers)(float X, float Y, float Z, float radius) |   |

[089F](https://wiki.blast.hk/gta-sa/opcodes/089F) |  int pedtype = [getPedType](https://wiki.blast.hk/moonloader/lua/getPedType)(Ped ped) |   |

[08A0](https://wiki.blast.hk/gta-sa/opcodes/08A0) |  bool result = [taskUseClosestMapAttractor](https://wiki.blast.hk/moonloader/lua/taskUseClosestMapAttractor)(Ped ped, float radius, Model nearModel, float offsetX, float offsetY, float offsetZ, string scriptNamed) |   |

[08A1](https://wiki.blast.hk/gta-sa/opcodes/08A1) |   |  [1:242] |

[08A2](https://wiki.blast.hk/gta-sa/opcodes/08A2) |  [planeAttackPlayerUsingDogFight](https://wiki.blast.hk/moonloader/lua/planeAttackPlayerUsingDogFight)(int hydra, Player player, float radius) |   |

[08A3](https://wiki.blast.hk/gta-sa/opcodes/08A3) |  [canTriggerGangWarWhenOnAMission](https://wiki.blast.hk/moonloader/lua/canTriggerGangWarWhenOnAMission)(bool can) |   |

[08A4](https://wiki.blast.hk/gta-sa/opcodes/08A4) |  [controlMovableVehiclePart](https://wiki.blast.hk/moonloader/lua/controlMovableVehiclePart)(Vehicle car, float angle) |   |

[08A5](https://wiki.blast.hk/gta-sa/opcodes/08A5) |  [winchCanPickVehicleUp](https://wiki.blast.hk/moonloader/lua/winchCanPickVehicleUp)(Vehicle car, bool attractive) |   |

[08A6](https://wiki.blast.hk/gta-sa/opcodes/08A6) |  [openCarDoorABit](https://wiki.blast.hk/moonloader/lua/openCarDoorABit)(Vehicle car, int door, float rotation) |   |

[08A7](https://wiki.blast.hk/gta-sa/opcodes/08A7) |  bool result = [isCarDoorFullyOpen](https://wiki.blast.hk/moonloader/lua/isCarDoorFullyOpen)(Vehicle car, int door) |   |

[08A8](https://wiki.blast.hk/gta-sa/opcodes/08A8) |  [setAlwaysDraw3dMarkers](https://wiki.blast.hk/moonloader/lua/setAlwaysDraw3dMarkers)(bool set) |   |

[08A9](https://wiki.blast.hk/gta-sa/opcodes/08A9) |  [streamScript](https://wiki.blast.hk/moonloader/lua/streamScript)(int script) |   |

[08AA](https://wiki.blast.hk/gta-sa/opcodes/08AA) |   |  [1:243] |

[08AB](https://wiki.blast.hk/gta-sa/opcodes/08AB) |  bool result = [hasStreamedScriptLoaded](https://wiki.blast.hk/moonloader/lua/hasStreamedScriptLoaded)(int script) |   |

[08AC](https://wiki.blast.hk/gta-sa/opcodes/08AC) |  [setGangWarsTrainingMission](https://wiki.blast.hk/moonloader/lua/setGangWarsTrainingMission)(bool set) |   |

[08AD](https://wiki.blast.hk/gta-sa/opcodes/08AD) |  [setCharHasUsedEntryExit](https://wiki.blast.hk/moonloader/lua/setCharHasUsedEntryExit)(Ped ped, float X, float Y, float radius) |   |

[08AE](https://wiki.blast.hk/gta-sa/opcodes/08AE) |   |  [1:244] |

[08AF](https://wiki.blast.hk/gta-sa/opcodes/08AF) |  [setCharMaxHealth](https://wiki.blast.hk/moonloader/lua/setCharMaxHealth)(Ped ped, int health) |   |

[08B0](https://wiki.blast.hk/gta-sa/opcodes/08B0) |   |  [1:245] |

[08B1](https://wiki.blast.hk/gta-sa/opcodes/08B1) |  [setNightVision](https://wiki.blast.hk/moonloader/lua/setNightVision)(bool enable) |   |

[08B2](https://wiki.blast.hk/gta-sa/opcodes/08B2) |  [setInfraredVision](https://wiki.blast.hk/moonloader/lua/setInfraredVision)(bool enable) |   |

[08B3](https://wiki.blast.hk/gta-sa/opcodes/08B3) |  [setZoneForGangWarsTraining](https://wiki.blast.hk/moonloader/lua/setZoneForGangWarsTraining)(GxtString zone) |   |

[08B4](https://wiki.blast.hk/gta-sa/opcodes/08B4) |   |  [3:36] |

[08B5](https://wiki.blast.hk/gta-sa/opcodes/08B5) |   |  [3:37] |

[08B6](https://wiki.blast.hk/gta-sa/opcodes/08B6) |   |  [3:38] |

[08B7](https://wiki.blast.hk/gta-sa/opcodes/08B7) |   |  [3:39] |

[08B8](https://wiki.blast.hk/gta-sa/opcodes/08B8) |   |  [3:40] |

[08B9](https://wiki.blast.hk/gta-sa/opcodes/08B9) |   |  [3:41] |

[08BA](https://wiki.blast.hk/gta-sa/opcodes/08BA) |   |  [3:42] |

[08BB](https://wiki.blast.hk/gta-sa/opcodes/08BB) |   |  [3:43] |

[08BC](https://wiki.blast.hk/gta-sa/opcodes/08BC) |   |  [3:44] |

[08BD](https://wiki.blast.hk/gta-sa/opcodes/08BD) |   |  [3:45] |

[08BE](https://wiki.blast.hk/gta-sa/opcodes/08BE) |   |  [3:46] |

[08BF](https://wiki.blast.hk/gta-sa/opcodes/08BF) |   |  [3:47] |

[08C0](https://wiki.blast.hk/gta-sa/opcodes/08C0) |   |  [3:48] |

[08C1](https://wiki.blast.hk/gta-sa/opcodes/08C1) |   |  [3:49] |

[08C2](https://wiki.blast.hk/gta-sa/opcodes/08C2) |   |  [3:50] |

[08C3](https://wiki.blast.hk/gta-sa/opcodes/08C3) |   |  [3:51] |

[08C4](https://wiki.blast.hk/gta-sa/opcodes/08C4) |   |  [3:52] |

[08C5](https://wiki.blast.hk/gta-sa/opcodes/08C5) |   |  [3:53] |

[08C6](https://wiki.blast.hk/gta-sa/opcodes/08C6) |  [setCharCanBeKnockedOffBike](https://wiki.blast.hk/moonloader/lua/setCharCanBeKnockedOffBike)(Ped ped, bool can) |   |

[08C7](https://wiki.blast.hk/gta-sa/opcodes/08C7) |  [setCharCoordinatesDontWarpGang](https://wiki.blast.hk/moonloader/lua/setCharCoordinatesDontWarpGang)(Ped ped, float X, float Y, float Z) |   |

[08C8](https://wiki.blast.hk/gta-sa/opcodes/08C8) |  [addPriceModifier](https://wiki.blast.hk/moonloader/lua/addPriceModifier)(int item, int price) |   |

[08C9](https://wiki.blast.hk/gta-sa/opcodes/08C9) |  [removePriceModifier](https://wiki.blast.hk/moonloader/lua/removePriceModifier)(int item) |   |

[08CA](https://wiki.blast.hk/gta-sa/opcodes/08CA) |  [initZonePopulationSettings](https://wiki.blast.hk/moonloader/lua/initZonePopulationSettings)() |   |

[08CB](https://wiki.blast.hk/gta-sa/opcodes/08CB) |  [explodeCarInCutsceneShakeAndBits](https://wiki.blast.hk/moonloader/lua/explodeCarInCutsceneShakeAndBits)(Vehicle car, bool shake, bool effect, bool sound) |   |

[08CC](https://wiki.blast.hk/gta-sa/opcodes/08CC) |   |  [1:246] |

[08CD](https://wiki.blast.hk/gta-sa/opcodes/08CD) |   |  [1:247] |

[08CE](https://wiki.blast.hk/gta-sa/opcodes/08CE) |   |  [1:248] |

[08CF](https://wiki.blast.hk/gta-sa/opcodes/08CF) |   |  [1:249] |

[08D0](https://wiki.blast.hk/gta-sa/opcodes/08D0) |  bool result = [isSkipCutsceneButtonPressed](https://wiki.blast.hk/moonloader/lua/isSkipCutsceneButtonPressed)() |   |

[08D1](https://wiki.blast.hk/gta-sa/opcodes/08D1) |  bool result, float X, float Y, float Z = [getCutsceneOffset](https://wiki.blast.hk/moonloader/lua/getCutsceneOffset)() |   |

[08D2](https://wiki.blast.hk/gta-sa/opcodes/08D2) |  [setObjectScale](https://wiki.blast.hk/moonloader/lua/setObjectScale)(Object object, float scale) |   |

[08D3](https://wiki.blast.hk/gta-sa/opcodes/08D3) |  int popcycle = [getCurrentPopulationZoneType](https://wiki.blast.hk/moonloader/lua/getCurrentPopulationZoneType)() |   |

[08D4](https://wiki.blast.hk/gta-sa/opcodes/08D4) |  int menu = [createMenu](https://wiki.blast.hk/moonloader/lua/createMenu)(GxtString title, float posX, float posY, float width, int columns, bool interactive, bool background, int alignment) |   |

[08D5](https://wiki.blast.hk/gta-sa/opcodes/08D5) |   |  [1:250] |

[08D6](https://wiki.blast.hk/gta-sa/opcodes/08D6) |  [setMenuColumnOrientation](https://wiki.blast.hk/moonloader/lua/setMenuColumnOrientation)(int menu, int column, int alignment) |   |

[08D7](https://wiki.blast.hk/gta-sa/opcodes/08D7) |  int item = [getMenuItemSelected](https://wiki.blast.hk/moonloader/lua/getMenuItemSelected)(int menu) |   |

[08D8](https://wiki.blast.hk/gta-sa/opcodes/08D8) |  int item = [getMenuItemAccepted](https://wiki.blast.hk/moonloader/lua/getMenuItemAccepted)(int menu) |   |

[08D9](https://wiki.blast.hk/gta-sa/opcodes/08D9) |  [activateMenuItem](https://wiki.blast.hk/moonloader/lua/activateMenuItem)(int menu, int row, bool enable) |   |

[08DA](https://wiki.blast.hk/gta-sa/opcodes/08DA) |  [deleteMenu](https://wiki.blast.hk/moonloader/lua/deleteMenu)(int menu) |   |

[08DB](https://wiki.blast.hk/gta-sa/opcodes/08DB) |  [setMenuColumn](https://wiki.blast.hk/moonloader/lua/setMenuColumn)(int menu, int column, GxtString header, GxtString data1, GxtString data2, GxtString data3, GxtString data4, GxtString data5, GxtString data6, GxtString data7, GxtString data8, GxtString data9, GxtString data10, GxtString data11, GxtString data12) |   |

[08DC](https://wiki.blast.hk/gta-sa/opcodes/08DC) |  [setBlipEntryExit](https://wiki.blast.hk/moonloader/lua/setBlipEntryExit)(Marker marker, float X, float Y, float radius) |   |

[08DD](https://wiki.blast.hk/gta-sa/opcodes/08DD) |  [switchDeathPenalties](https://wiki.blast.hk/moonloader/lua/switchDeathPenalties)(bool lose) |   |

[08DE](https://wiki.blast.hk/gta-sa/opcodes/08DE) |  [switchArrestPenalties](https://wiki.blast.hk/moonloader/lua/switchArrestPenalties)(bool lose) |   |

[08DF](https://wiki.blast.hk/gta-sa/opcodes/08DF) |  [setExtraHospitalRestartPoint](https://wiki.blast.hk/moonloader/lua/setExtraHospitalRestartPoint)(float X, float Y, float Z, float radius, float angle) |   |

[08E0](https://wiki.blast.hk/gta-sa/opcodes/08E0) |  [setExtraPoliceStationRestartPoint](https://wiki.blast.hk/moonloader/lua/setExtraPoliceStationRestartPoint)(float X, float Y, float Z, float radius, float angle) |   |

[08E1](https://wiki.blast.hk/gta-sa/opcodes/08E1) |  int num = [findNumberTagsTagged](https://wiki.blast.hk/moonloader/lua/findNumberTagsTagged)() |   |

[08E2](https://wiki.blast.hk/gta-sa/opcodes/08E2) |  int percentage = [getTerritoryUnderControlPercentage](https://wiki.blast.hk/moonloader/lua/getTerritoryUnderControlPercentage)() |   |

[08E3](https://wiki.blast.hk/gta-sa/opcodes/08E3) |  bool result = [isObjectInAngledArea2d](https://wiki.blast.hk/moonloader/lua/isObjectInAngledArea2d)(Object object, float x1, float y1, float x2, float y2, float radius, bool sphere) |   |

[08E4](https://wiki.blast.hk/gta-sa/opcodes/08E4) |  bool result = [isObjectInAngledArea3d](https://wiki.blast.hk/moonloader/lua/isObjectInAngledArea3d)(Object object, float x1, float y1, float z1, float x2, float y2, float z2, float depth, bool flag) |   |

[08E5](https://wiki.blast.hk/gta-sa/opcodes/08E5) |  Ped ped = [getRandomCharInSphereNoBrain](https://wiki.blast.hk/moonloader/lua/getRandomCharInSphereNoBrain)(float X, float Y, float Z, float radius) |   |

[08E6](https://wiki.blast.hk/gta-sa/opcodes/08E6) |  [setPlaneUndercarriageUp](https://wiki.blast.hk/moonloader/lua/setPlaneUndercarriageUp)(int plane, bool set) |   |

[08E7](https://wiki.blast.hk/gta-sa/opcodes/08E7) |  [disableAllEntryExits](https://wiki.blast.hk/moonloader/lua/disableAllEntryExits)(bool disable) |   |

[08E8](https://wiki.blast.hk/gta-sa/opcodes/08E8) |  [attachAnimsToModel](https://wiki.blast.hk/moonloader/lua/attachAnimsToModel)(Model modelId, GxtString externalScript) |   |

[08E9](https://wiki.blast.hk/gta-sa/opcodes/08E9) |  [setObjectAsStealable](https://wiki.blast.hk/moonloader/lua/setObjectAsStealable)(Object object, bool liftable) |   |

[08EA](https://wiki.blast.hk/gta-sa/opcodes/08EA) |  [setCreateRandomGangMembers](https://wiki.blast.hk/moonloader/lua/setCreateRandomGangMembers)(bool enable) |   |

[08EB](https://wiki.blast.hk/gta-sa/opcodes/08EB) |  [addSparks](https://wiki.blast.hk/moonloader/lua/addSparks)(float posX, float posY, float posZ, float vecX, float vecY, float vecZ, int density) |   |

[08EC](https://wiki.blast.hk/gta-sa/opcodes/08EC) |  int class = [getVehicleClass](https://wiki.blast.hk/moonloader/lua/getVehicleClass)(Vehicle car) |   |

[08ED](https://wiki.blast.hk/gta-sa/opcodes/08ED) |  [clearConversationForChar](https://wiki.blast.hk/moonloader/lua/clearConversationForChar)(Ped ped) |   |

[08EE](https://wiki.blast.hk/gta-sa/opcodes/08EE) |  [setMenuItemWithNumber](https://wiki.blast.hk/moonloader/lua/setMenuItemWithNumber)(int panel, int column, int row, GxtString gxtString, int number) |   |

[08EF](https://wiki.blast.hk/gta-sa/opcodes/08EF) |  [setMenuItemWith2Numbers](https://wiki.blast.hk/moonloader/lua/setMenuItemWith2Numbers)(int panel, int column, int row, GxtString gxtString, int numbers1, int numbers2) |   |

[08F0](https://wiki.blast.hk/gta-sa/opcodes/08F0) |  [setCutsceneModelTexture](https://wiki.blast.hk/moonloader/lua/setCutsceneModelTexture)(GxtString cutsceneModel, GxtString textureName) |   |

[08F1](https://wiki.blast.hk/gta-sa/opcodes/08F1) |  GxtString nameB = [getNameOfInfoZone](https://wiki.blast.hk/moonloader/lua/getNameOfInfoZone)(float atX, float atY, float atZ) |   |

[08F2](https://wiki.blast.hk/gta-sa/opcodes/08F2) |  [vehicleCanBeTargettedByHsMissile](https://wiki.blast.hk/moonloader/lua/vehicleCanBeTargettedByHsMissile)(Vehicle car, bool targetable) |   |

[08F3](https://wiki.blast.hk/gta-sa/opcodes/08F3) |  [setFreebiesInVehicle](https://wiki.blast.hk/moonloader/lua/setFreebiesInVehicle)(Vehicle car, bool containsGoodies) |   |

[08F4](https://wiki.blast.hk/gta-sa/opcodes/08F4) |  [setScriptLimitToGangSize](https://wiki.blast.hk/moonloader/lua/setScriptLimitToGangSize)(bool max) |   |

[08F5](https://wiki.blast.hk/gta-sa/opcodes/08F5) |  [makePlayerGangDisappear](https://wiki.blast.hk/moonloader/lua/makePlayerGangDisappear)() |   |

[08F6](https://wiki.blast.hk/gta-sa/opcodes/08F6) |  [makePlayerGangReappear](https://wiki.blast.hk/moonloader/lua/makePlayerGangReappear)() |   |

[08F7](https://wiki.blast.hk/gta-sa/opcodes/08F7) |  int textureCRC, int modelCRC = [getClothesItem](https://wiki.blast.hk/moonloader/lua/getClothesItem)(Player player, int bodypart) |   |

[08F8](https://wiki.blast.hk/gta-sa/opcodes/08F8) |  [showUpdateStats](https://wiki.blast.hk/moonloader/lua/showUpdateStats)(bool display) |   |

[08F9](https://wiki.blast.hk/gta-sa/opcodes/08F9) |   |  [3:54] |

[08FA](https://wiki.blast.hk/gta-sa/opcodes/08FA) |   |  [3:55] |

[08FB](https://wiki.blast.hk/gta-sa/opcodes/08FB) |  [setCoordBlipAppearance](https://wiki.blast.hk/moonloader/lua/setCoordBlipAppearance)(Checkpoint checkpoint, int type) |   |

[08FC](https://wiki.blast.hk/gta-sa/opcodes/08FC) |   |  [1:251] |

[08FD](https://wiki.blast.hk/gta-sa/opcodes/08FD) |  [setHeathazeEffect](https://wiki.blast.hk/moonloader/lua/setHeathazeEffect)(bool enable) |   |

[08FE](https://wiki.blast.hk/gta-sa/opcodes/08FE) |  bool result = [isHelpMessageBeingDisplayed](https://wiki.blast.hk/moonloader/lua/isHelpMessageBeingDisplayed)() |   |

[08FF](https://wiki.blast.hk/gta-sa/opcodes/08FF) |  bool result = [hasObjectBeenDamagedByWeapon](https://wiki.blast.hk/moonloader/lua/hasObjectBeenDamagedByWeapon)(Object object, int type) |   |

[0900](https://wiki.blast.hk/gta-sa/opcodes/0900) |  [clearObjectLastWeaponDamage](https://wiki.blast.hk/moonloader/lua/clearObjectLastWeaponDamage)(Object object) |   |

[0901](https://wiki.blast.hk/gta-sa/opcodes/0901) |  [setPlayerJumpButton](https://wiki.blast.hk/moonloader/lua/setPlayerJumpButton)(Player player, bool enable) |   |

[0902](https://wiki.blast.hk/gta-sa/opcodes/0902) |   |  [1:252] |

[0903](https://wiki.blast.hk/gta-sa/opcodes/0903) |   |  [1:253] |

[0904](https://wiki.blast.hk/gta-sa/opcodes/0904) |  int r, int g, int b, int a = [getHudColour](https://wiki.blast.hk/moonloader/lua/getHudColour)(int interface) |   |

[0905](https://wiki.blast.hk/gta-sa/opcodes/0905) |  [lockDoor](https://wiki.blast.hk/moonloader/lua/lockDoor)(int door, bool lock) |   |

[0906](https://wiki.blast.hk/gta-sa/opcodes/0906) |  [setObjectMass](https://wiki.blast.hk/moonloader/lua/setObjectMass)(Object object, float mass) |   |

[0907](https://wiki.blast.hk/gta-sa/opcodes/0907) |  float mass = [getObjectMass](https://wiki.blast.hk/moonloader/lua/getObjectMass)(int int) |   |

[0908](https://wiki.blast.hk/gta-sa/opcodes/0908) |  [setObjectTurnMass](https://wiki.blast.hk/moonloader/lua/setObjectTurnMass)(Object object, float turnMass) |   |

[0909](https://wiki.blast.hk/gta-sa/opcodes/0909) |  float turnMass = [getObjectTurnMass](https://wiki.blast.hk/moonloader/lua/getObjectTurnMass)(Object object) |   |

[090A](https://wiki.blast.hk/gta-sa/opcodes/090A) |   |  [1:254] |

[090B](https://wiki.blast.hk/gta-sa/opcodes/090B) |   |  [1:255] |

[090C](https://wiki.blast.hk/gta-sa/opcodes/090C) |  [setSpecificZoneToTriggerGangWar](https://wiki.blast.hk/moonloader/lua/setSpecificZoneToTriggerGangWar)(GxtString zone) |   |

[090D](https://wiki.blast.hk/gta-sa/opcodes/090D) |  [clearSpecificZonesToTriggerGangWar](https://wiki.blast.hk/moonloader/lua/clearSpecificZonesToTriggerGangWar)() |   |

[090E](https://wiki.blast.hk/gta-sa/opcodes/090E) |  [setActiveMenuItem](https://wiki.blast.hk/moonloader/lua/setActiveMenuItem)(int panel, int activeRow) |   |

[090F](https://wiki.blast.hk/gta-sa/opcodes/090F) |  [markStreamedScriptAsNoLongerNeeded](https://wiki.blast.hk/moonloader/lua/markStreamedScriptAsNoLongerNeeded)(int externalScript) |   |

[0910](https://wiki.blast.hk/gta-sa/opcodes/0910) |  [removeStreamedScript](https://wiki.blast.hk/moonloader/lua/removeStreamedScript)(int externalScript) |   |

[0911](https://wiki.blast.hk/gta-sa/opcodes/0911) |   |  [1:256] |

[0912](https://wiki.blast.hk/gta-sa/opcodes/0912) |  [setMessageFormatting](https://wiki.blast.hk/moonloader/lua/setMessageFormatting)(bool priority, int leftmargin, int maxwidth) |   |

[0913](https://wiki.blast.hk/gta-sa/opcodes/0913) |  [startNewStreamedScript](https://wiki.blast.hk/moonloader/lua/startNewStreamedScript)(int externalScript, table args) |   |

[0914](https://wiki.blast.hk/gta-sa/opcodes/0914) |   |  [1:257] |

[0915](https://wiki.blast.hk/gta-sa/opcodes/0915) |  [setWeatherToAppropriateTypeNow](https://wiki.blast.hk/moonloader/lua/setWeatherToAppropriateTypeNow)() |   |

[0916](https://wiki.blast.hk/gta-sa/opcodes/0916) |  [winchCanPickObjectUp](https://wiki.blast.hk/moonloader/lua/winchCanPickObjectUp)(Object object, bool enable) |   |

[0917](https://wiki.blast.hk/gta-sa/opcodes/0917) |  [switchAudioZone](https://wiki.blast.hk/moonloader/lua/switchAudioZone)(GxtString zone, bool enableSound) |   |

[0918](https://wiki.blast.hk/gta-sa/opcodes/0918) |  [setCarEngineOn](https://wiki.blast.hk/moonloader/lua/setCarEngineOn)(Vehicle car, bool on) |   |

[0919](https://wiki.blast.hk/gta-sa/opcodes/0919) |  [setCarLightsOn](https://wiki.blast.hk/moonloader/lua/setCarLightsOn)(Vehicle car, bool lights) |   |

[091A](https://wiki.blast.hk/gta-sa/opcodes/091A) |   |  [1:258] |

[091B](https://wiki.blast.hk/gta-sa/opcodes/091B) |   |  [1:259] |

[091C](https://wiki.blast.hk/gta-sa/opcodes/091C) |  Ped ped = [getUserOfClosestMapAttractor](https://wiki.blast.hk/moonloader/lua/getUserOfClosestMapAttractor)(float sphereX, float sphereY, float sphereZ, float radius, Model modelId, string externalScriptNamed) |   |

[091D](https://wiki.blast.hk/gta-sa/opcodes/091D) |  [switchRoadsBackToOriginal](https://wiki.blast.hk/moonloader/lua/switchRoadsBackToOriginal)(float cornerAX, float cornerAY, float cornerAZ, float cornerBX, float cornerBY, float cornerBZ) |   |

[091E](https://wiki.blast.hk/gta-sa/opcodes/091E) |  [switchPedRoadsBackToOriginal](https://wiki.blast.hk/moonloader/lua/switchPedRoadsBackToOriginal)(float cornerAX, float cornerAY, float cornerAZ, float cornerBX, float cornerBY, float cornerBZ) |   |

[091F](https://wiki.blast.hk/gta-sa/opcodes/091F) |  int landingGearStatus = [getPlaneUndercarriagePosition](https://wiki.blast.hk/moonloader/lua/getPlaneUndercarriagePosition)(int plane) |   |

[0920](https://wiki.blast.hk/gta-sa/opcodes/0920) |  [cameraSetVectorTrack](https://wiki.blast.hk/moonloader/lua/cameraSetVectorTrack)(float pointX, float pointY, float pointZ, float transverseX, float transverseY, float transverseZ, int time, bool smooth) |   |

[0921](https://wiki.blast.hk/gta-sa/opcodes/0921) |   |  [1:260] |

[0922](https://wiki.blast.hk/gta-sa/opcodes/0922) |  [cameraSetLerpFov](https://wiki.blast.hk/moonloader/lua/cameraSetLerpFov)(float from, float to, int timelimit, bool smoothTransition) |   |

[0923](https://wiki.blast.hk/gta-sa/opcodes/0923) |  [switchAmbientPlanes](https://wiki.blast.hk/moonloader/lua/switchAmbientPlanes)(bool enable) |   |

[0924](https://wiki.blast.hk/gta-sa/opcodes/0924) |  [setDarknessEffect](https://wiki.blast.hk/moonloader/lua/setDarknessEffect)(bool enable, int value) |   |

[0925](https://wiki.blast.hk/gta-sa/opcodes/0925) |  [cameraResetNewScriptables](https://wiki.blast.hk/moonloader/lua/cameraResetNewScriptables)() |   |

[0926](https://wiki.blast.hk/gta-sa/opcodes/0926) |  int value = [getNumberOfInstancesOfStreamedScript](https://wiki.blast.hk/moonloader/lua/getNumberOfInstancesOfStreamedScript)(int externalScript) |   |

[0927](https://wiki.blast.hk/gta-sa/opcodes/0927) |   |  [1:261] |

[0928](https://wiki.blast.hk/gta-sa/opcodes/0928) |  [allocateStreamedScriptToRandomPed](https://wiki.blast.hk/moonloader/lua/allocateStreamedScriptToRandomPed)(int externalScript, Model actorModel, int priority) |   |

[0929](https://wiki.blast.hk/gta-sa/opcodes/0929) |  [allocateStreamedScriptToObject](https://wiki.blast.hk/moonloader/lua/allocateStreamedScriptToObject)(int externalScript, Model objectModel, int priority, float radius, int type) |   |

[092A](https://wiki.blast.hk/gta-sa/opcodes/092A) |   |  [1:262] |

[092B](https://wiki.blast.hk/gta-sa/opcodes/092B) |  int handle = [getGroupMember](https://wiki.blast.hk/moonloader/lua/getGroupMember)(int group, int member) |   |

[092C](https://wiki.blast.hk/gta-sa/opcodes/092C) |   |  [1:263] |

[092D](https://wiki.blast.hk/gta-sa/opcodes/092D) |   |  [1:264] |

[092E](https://wiki.blast.hk/gta-sa/opcodes/092E) |  float height = [getWaterHeightAtCoords](https://wiki.blast.hk/moonloader/lua/getWaterHeightAtCoords)(float atX, float atY, bool ignoreWaves) |   |

[092F](https://wiki.blast.hk/gta-sa/opcodes/092F) |  [cameraPersistTrack](https://wiki.blast.hk/moonloader/lua/cameraPersistTrack)(bool lock) |   |

[0930](https://wiki.blast.hk/gta-sa/opcodes/0930) |  [cameraPersistPos](https://wiki.blast.hk/moonloader/lua/cameraPersistPos)(bool lock) |   |

[0931](https://wiki.blast.hk/gta-sa/opcodes/0931) |  [cameraPersistFov](https://wiki.blast.hk/moonloader/lua/cameraPersistFov)(bool lock) |   |

[0932](https://wiki.blast.hk/gta-sa/opcodes/0932) |   |  [1:265] |

[0933](https://wiki.blast.hk/gta-sa/opcodes/0933) |  bool result = [cameraIsVectorMoveRunning](https://wiki.blast.hk/moonloader/lua/cameraIsVectorMoveRunning)() |   |

[0934](https://wiki.blast.hk/gta-sa/opcodes/0934) |  bool result = [cameraIsVectorTrackRunning](https://wiki.blast.hk/moonloader/lua/cameraIsVectorTrackRunning)() |   |

[0935](https://wiki.blast.hk/gta-sa/opcodes/0935) |   |  [1:266] |

[0936](https://wiki.blast.hk/gta-sa/opcodes/0936) |  [cameraSetVectorMove](https://wiki.blast.hk/moonloader/lua/cameraSetVectorMove)(float cameraX, float cameraY, float cameraZ, float positionX, float positionY, float positionZ, int time, bool smoothTransition) |   |

[0937](https://wiki.blast.hk/gta-sa/opcodes/0937) |  [drawWindow](https://wiki.blast.hk/moonloader/lua/drawWindow)(float cornerAX, float cornerAY, float cornerBX, float cornerBY, GxtString gxtString, int style) |   |

[0938](https://wiki.blast.hk/gta-sa/opcodes/0938) |   |  [1:267] |

[0939](https://wiki.blast.hk/gta-sa/opcodes/0939) |  [attachCarToObject](https://wiki.blast.hk/moonloader/lua/attachCarToObject)(Vehicle car, Object object, float offsetX, float offsetY, float offsetZ, float rotationX, float rotationY, float rotationZ) |   |

[093A](https://wiki.blast.hk/gta-sa/opcodes/093A) |  [setGarageResprayFree](https://wiki.blast.hk/moonloader/lua/setGarageResprayFree)(GxtString garage, bool free) |   |

[093B](https://wiki.blast.hk/gta-sa/opcodes/093B) |  [setCharBulletproofVest](https://wiki.blast.hk/moonloader/lua/setCharBulletproofVest)(Ped ped, bool enable) |   |

[093C](https://wiki.blast.hk/gta-sa/opcodes/093C) |   |  [1:268] |

[093D](https://wiki.blast.hk/gta-sa/opcodes/093D) |  [setCinemaCamera](https://wiki.blast.hk/moonloader/lua/setCinemaCamera)(bool lock) |   |

[093E](https://wiki.blast.hk/gta-sa/opcodes/093E) |  [setCharFireDamageMultiplier](https://wiki.blast.hk/moonloader/lua/setCharFireDamageMultiplier)(Ped ped, float multiplier) |   |

[093F](https://wiki.blast.hk/gta-sa/opcodes/093F) |   |  [1:269] |

[0940](https://wiki.blast.hk/gta-sa/opcodes/0940) |  [setGroupFollowStatus](https://wiki.blast.hk/moonloader/lua/setGroupFollowStatus)(int group, bool status) |   |

[0941](https://wiki.blast.hk/gta-sa/opcodes/0941) |  [setSearchlightClipIfColliding](https://wiki.blast.hk/moonloader/lua/setSearchlightClipIfColliding)(Searchlight searchlight, bool flag) |   |

[0942](https://wiki.blast.hk/gta-sa/opcodes/0942) |  bool result = [hasPlayerBoughtItem](https://wiki.blast.hk/moonloader/lua/hasPlayerBoughtItem)(int item) |   |

[0943](https://wiki.blast.hk/gta-sa/opcodes/0943) |   |  [1:270] |

[0944](https://wiki.blast.hk/gta-sa/opcodes/0944) |  [setCameraInFrontOfChar](https://wiki.blast.hk/moonloader/lua/setCameraInFrontOfChar)(Ped ped) |   |

[0945](https://wiki.blast.hk/gta-sa/opcodes/0945) |  int maxArmour = [getPlayerMaxArmour](https://wiki.blast.hk/moonloader/lua/getPlayerMaxArmour)(Player player) |   |

[0946](https://wiki.blast.hk/gta-sa/opcodes/0946) |  [setCharUsesUpperbodyDamageAnimsOnly](https://wiki.blast.hk/moonloader/lua/setCharUsesUpperbodyDamageAnimsOnly)(Ped ped, bool uninterupted) |   |

[0947](https://wiki.blast.hk/gta-sa/opcodes/0947) |  int spokenPhrase = [setCharSayContext](https://wiki.blast.hk/moonloader/lua/setCharSayContext)(Ped ped, int speech) |   |

[0948](https://wiki.blast.hk/gta-sa/opcodes/0948) |  [addExplosionVariableShake](https://wiki.blast.hk/moonloader/lua/addExplosionVariableShake)(float atX, float atY, float atZ, int type, float cameraShake) |   |

[0949](https://wiki.blast.hk/gta-sa/opcodes/0949) |  [attachMissionAudioToChar](https://wiki.blast.hk/moonloader/lua/attachMissionAudioToChar)(int id, Ped ped) |   |

[094A](https://wiki.blast.hk/gta-sa/opcodes/094A) |  [updatePickupMoneyPerDay](https://wiki.blast.hk/moonloader/lua/updatePickupMoneyPerDay)(Pickup pickup, int cash) |   |

[094B](https://wiki.blast.hk/gta-sa/opcodes/094B) |  GxtString interiorName = [getNameOfEntryExitCharUsed](https://wiki.blast.hk/moonloader/lua/getNameOfEntryExitCharUsed)(Ped ped) |   |

[094C](https://wiki.blast.hk/gta-sa/opcodes/094C) |  float coordX, float coordY, float coordZ, int number = [getPositionOfEntryExitCharUsed](https://wiki.blast.hk/moonloader/lua/getPositionOfEntryExitCharUsed)(Ped ped) |   |

[094D](https://wiki.blast.hk/gta-sa/opcodes/094D) |  bool result = [isCharTalking](https://wiki.blast.hk/moonloader/lua/isCharTalking)(Ped ped) |   |

[094E](https://wiki.blast.hk/gta-sa/opcodes/094E) |  [disableCharSpeech](https://wiki.blast.hk/moonloader/lua/disableCharSpeech)(Ped ped, bool disable) |   |

[094F](https://wiki.blast.hk/gta-sa/opcodes/094F) |  [enableCharSpeech](https://wiki.blast.hk/moonloader/lua/enableCharSpeech)(Ped ped) |   |

[0950](https://wiki.blast.hk/gta-sa/opcodes/0950) |  [setUpSkip](https://wiki.blast.hk/moonloader/lua/setUpSkip)(float posX, float posY, float posZ, float angle) |   |

[0951](https://wiki.blast.hk/gta-sa/opcodes/0951) |  [clearSkip](https://wiki.blast.hk/moonloader/lua/clearSkip)() |   |

[0952](https://wiki.blast.hk/gta-sa/opcodes/0952) |  [preloadBeatTrack](https://wiki.blast.hk/moonloader/lua/preloadBeatTrack)(int soundtrack) |   |

[0953](https://wiki.blast.hk/gta-sa/opcodes/0953) |  int status = [getBeatTrackStatus](https://wiki.blast.hk/moonloader/lua/getBeatTrackStatus)() |   |

[0954](https://wiki.blast.hk/gta-sa/opcodes/0954) |  [playBeatTrack](https://wiki.blast.hk/moonloader/lua/playBeatTrack)() |   |

[0955](https://wiki.blast.hk/gta-sa/opcodes/0955) |  [stopBeatTrack](https://wiki.blast.hk/moonloader/lua/stopBeatTrack)() |   |

[0956](https://wiki.blast.hk/gta-sa/opcodes/0956) |  int max = [findMaxNumberOfGroupMembers](https://wiki.blast.hk/moonloader/lua/findMaxNumberOfGroupMembers)() |   |

[0957](https://wiki.blast.hk/gta-sa/opcodes/0957) |  [vehicleDoesProvideCover](https://wiki.blast.hk/moonloader/lua/vehicleDoesProvideCover)(Vehicle car, bool providesCover) |   |

[0958](https://wiki.blast.hk/gta-sa/opcodes/0958) |  Pickup pickup = [createSnapshotPickup](https://wiki.blast.hk/moonloader/lua/createSnapshotPickup)(float atX, float atY, float atZ) |   |

[0959](https://wiki.blast.hk/gta-sa/opcodes/0959) |  Pickup pickup = [createHorseshoePickup](https://wiki.blast.hk/moonloader/lua/createHorseshoePickup)(float atX, float atY, float atZ) |   |

[095A](https://wiki.blast.hk/gta-sa/opcodes/095A) |  Pickup pickup = [createOysterPickup](https://wiki.blast.hk/moonloader/lua/createOysterPickup)(float atX, float atY, float atZ) |   |

[095B](https://wiki.blast.hk/gta-sa/opcodes/095B) |  bool result = [hasObjectBeenUprooted](https://wiki.blast.hk/moonloader/lua/hasObjectBeenUprooted)(Object object) |   |

[095C](https://wiki.blast.hk/gta-sa/opcodes/095C) |  [addSmokeParticle](https://wiki.blast.hk/moonloader/lua/addSmokeParticle)(float atX, float atY, float atZ, float velocityX, float velocityY, float velocityZ, int r, int g, int b, int a, float size, float factor) |   |

[095D](https://wiki.blast.hk/gta-sa/opcodes/095D) |  bool result = [isCharStuckUnderCar](https://wiki.blast.hk/moonloader/lua/isCharStuckUnderCar)(Ped ped) |   |

[095E](https://wiki.blast.hk/gta-sa/opcodes/095E) |  [controlCarDoor](https://wiki.blast.hk/moonloader/lua/controlCarDoor)(Vehicle car, int door, int unlatch, float angle) |   |

[095F](https://wiki.blast.hk/gta-sa/opcodes/095F) |  float angle = [getDoorAngleRatio](https://wiki.blast.hk/moonloader/lua/getDoorAngleRatio)(Vehicle car, int door) |   |

[0960](https://wiki.blast.hk/gta-sa/opcodes/0960) |  [setPlayerDisplayVitalStatsButton](https://wiki.blast.hk/moonloader/lua/setPlayerDisplayVitalStatsButton)(Player player, bool display) |   |

[0961](https://wiki.blast.hk/gta-sa/opcodes/0961) |  [setCharKeepTask](https://wiki.blast.hk/moonloader/lua/setCharKeepTask)(Ped ped, bool keepTasks) |   |

[0962](https://wiki.blast.hk/gta-sa/opcodes/0962) |   |  [1:271] |

[0963](https://wiki.blast.hk/gta-sa/opcodes/0963) |   |  [1:272] |

[0964](https://wiki.blast.hk/gta-sa/opcodes/0964) |  int id = [createMenuGrid](https://wiki.blast.hk/moonloader/lua/createMenuGrid)(GxtString gxtString, int positionX, int positionY, float width, int columns, bool interactive, bool background, int alignment) |   |

[0965](https://wiki.blast.hk/gta-sa/opcodes/0965) |  bool result = [isCharSwimming](https://wiki.blast.hk/moonloader/lua/isCharSwimming)(Ped ped) |   |

[0966](https://wiki.blast.hk/gta-sa/opcodes/0966) |  int status = [getCharSwimState](https://wiki.blast.hk/moonloader/lua/getCharSwimState)(Ped ped) |   |

[0967](https://wiki.blast.hk/gta-sa/opcodes/0967) |  [startCharFacialTalk](https://wiki.blast.hk/moonloader/lua/startCharFacialTalk)(Ped ped, int time) |   |

[0968](https://wiki.blast.hk/gta-sa/opcodes/0968) |  [stopCharFacialTalk](https://wiki.blast.hk/moonloader/lua/stopCharFacialTalk)(Ped ped) |   |

[0969](https://wiki.blast.hk/gta-sa/opcodes/0969) |  bool result = [isBigVehicle](https://wiki.blast.hk/moonloader/lua/isBigVehicle)(Vehicle car) |   |

[096A](https://wiki.blast.hk/gta-sa/opcodes/096A) |  [switchPoliceHelis](https://wiki.blast.hk/moonloader/lua/switchPoliceHelis)(bool enable) |   |

[096B](https://wiki.blast.hk/gta-sa/opcodes/096B) |  [storeCarModState](https://wiki.blast.hk/moonloader/lua/storeCarModState)() |   |

[096C](https://wiki.blast.hk/gta-sa/opcodes/096C) |  [restoreCarModState](https://wiki.blast.hk/moonloader/lua/restoreCarModState)() |   |

[096D](https://wiki.blast.hk/gta-sa/opcodes/096D) |  Model modelId = [getCurrentCarMod](https://wiki.blast.hk/moonloader/lua/getCurrentCarMod)(Vehicle car, int slot) |   |

[096E](https://wiki.blast.hk/gta-sa/opcodes/096E) |  bool result = [isCarLowRider](https://wiki.blast.hk/moonloader/lua/isCarLowRider)(Vehicle car) |   |

[096F](https://wiki.blast.hk/gta-sa/opcodes/096F) |  bool result = [isCarStreetRacer](https://wiki.blast.hk/moonloader/lua/isCarStreetRacer)(Vehicle car) |   |

[0970](https://wiki.blast.hk/gta-sa/opcodes/0970) |  [forceDeathRestart](https://wiki.blast.hk/moonloader/lua/forceDeathRestart)() |   |

[0971](https://wiki.blast.hk/gta-sa/opcodes/0971) |  [syncWater](https://wiki.blast.hk/moonloader/lua/syncWater)() |   |

[0972](https://wiki.blast.hk/gta-sa/opcodes/0972) |  [setCharCoordinatesNoOffset](https://wiki.blast.hk/moonloader/lua/setCharCoordinatesNoOffset)(Ped ped, float atX, float atY, float atZ) |   |

[0973](https://wiki.blast.hk/gta-sa/opcodes/0973) |  bool result = [doesScriptFireExist](https://wiki.blast.hk/moonloader/lua/doesScriptFireExist)(int fire) |   |

[0974](https://wiki.blast.hk/gta-sa/opcodes/0974) |  [resetStuffUponResurrection](https://wiki.blast.hk/moonloader/lua/resetStuffUponResurrection)() |   |

[0975](https://wiki.blast.hk/gta-sa/opcodes/0975) |  bool result = [isEmergencyServicesVehicle](https://wiki.blast.hk/moonloader/lua/isEmergencyServicesVehicle)(Vehicle car) |   |

[0976](https://wiki.blast.hk/gta-sa/opcodes/0976) |  [killFxSystemNow](https://wiki.blast.hk/moonloader/lua/killFxSystemNow)(Particle particle) |   |

[0977](https://wiki.blast.hk/gta-sa/opcodes/0977) |  bool result = [isObjectWithinBrainActivationRange](https://wiki.blast.hk/moonloader/lua/isObjectWithinBrainActivationRange)(Player player) |   |

[0978](https://wiki.blast.hk/gta-sa/opcodes/0978) |  int to = [copySharedCharDecisionMaker](https://wiki.blast.hk/moonloader/lua/copySharedCharDecisionMaker)(int from) |   |

[0979](https://wiki.blast.hk/gta-sa/opcodes/0979) |   |  [1:273] |

[097A](https://wiki.blast.hk/gta-sa/opcodes/097A) |  [reportMissionAudioEventAtPosition](https://wiki.blast.hk/moonloader/lua/reportMissionAudioEventAtPosition)(float atX, float atY, float atZ, int event) |   |

[097B](https://wiki.blast.hk/gta-sa/opcodes/097B) |  [reportMissionAudioEventAtObject](https://wiki.blast.hk/moonloader/lua/reportMissionAudioEventAtObject)(int at, int event) |   |

[097C](https://wiki.blast.hk/gta-sa/opcodes/097C) |  [attachMissionAudioToObject](https://wiki.blast.hk/moonloader/lua/attachMissionAudioToObject)(int id, Object object) |   |

[097D](https://wiki.blast.hk/gta-sa/opcodes/097D) |  int colours = [getNumCarColours](https://wiki.blast.hk/moonloader/lua/getNumCarColours)(Vehicle car) |   |

[097E](https://wiki.blast.hk/gta-sa/opcodes/097E) |   |  [1:274] |

[097F](https://wiki.blast.hk/gta-sa/opcodes/097F) |   |  [1:275] |

[0980](https://wiki.blast.hk/gta-sa/opcodes/0980) |  [extinguishFireAtPoint](https://wiki.blast.hk/moonloader/lua/extinguishFireAtPoint)(float atX, float atY, float atZ, float radius) |   |

[0981](https://wiki.blast.hk/gta-sa/opcodes/0981) |  bool result = [hasTrainDerailed](https://wiki.blast.hk/moonloader/lua/hasTrainDerailed)(Vehicle train) |   |

[0982](https://wiki.blast.hk/gta-sa/opcodes/0982) |  [setCharForceDieInCar](https://wiki.blast.hk/moonloader/lua/setCharForceDieInCar)(Ped ped, bool stayInCarWhenDead) |   |

[0983](https://wiki.blast.hk/gta-sa/opcodes/0983) |  [setOnlyCreateGangMembers](https://wiki.blast.hk/moonloader/lua/setOnlyCreateGangMembers)(bool enable) |   |

[0984](https://wiki.blast.hk/gta-sa/opcodes/0984) |  Model modelId = [getObjectModel](https://wiki.blast.hk/moonloader/lua/getObjectModel)(Object object) |   |

[0985](https://wiki.blast.hk/gta-sa/opcodes/0985) |  [setCharUsesCollisionClosestObjectOfType](https://wiki.blast.hk/moonloader/lua/setCharUsesCollisionClosestObjectOfType)(float sphereX, float sphereY, float sphereZ, float radius, Model modelId, bool solid, int forActor) |   |

[0986](https://wiki.blast.hk/gta-sa/opcodes/0986) |  [clearAllScriptFireFlags](https://wiki.blast.hk/moonloader/lua/clearAllScriptFireFlags)() |   |

[0987](https://wiki.blast.hk/gta-sa/opcodes/0987) |  int blockingCar = [getCarBlockingCar](https://wiki.blast.hk/moonloader/lua/getCarBlockingCar)(Vehicle car) |   |

[0988](https://wiki.blast.hk/gta-sa/opcodes/0988) |  int paintjob = [getCurrentVehiclePaintjob](https://wiki.blast.hk/moonloader/lua/getCurrentVehiclePaintjob)(Vehicle car) |   |

[0989](https://wiki.blast.hk/gta-sa/opcodes/0989) |  [setHelpMessageBoxSize](https://wiki.blast.hk/moonloader/lua/setHelpMessageBoxSize)(int width) |   |

[098A](https://wiki.blast.hk/gta-sa/opcodes/098A) |  [setGunshotSenseRangeForRiot2](https://wiki.blast.hk/moonloader/lua/setGunshotSenseRangeForRiot2)(float range) |   |

[098B](https://wiki.blast.hk/gta-sa/opcodes/098B) |   |  [3:56] |

[098C](https://wiki.blast.hk/gta-sa/opcodes/098C) |   |  [3:57] |

[098D](https://wiki.blast.hk/gta-sa/opcodes/098D) |  float angle = [getCarMovingComponentOffset](https://wiki.blast.hk/moonloader/lua/getCarMovingComponentOffset)(Vehicle car) |   |

[098E](https://wiki.blast.hk/gta-sa/opcodes/098E) |  [setNamedEntryExitFlag](https://wiki.blast.hk/moonloader/lua/setNamedEntryExitFlag)(GxtString interior, int bitmask, bool flag) |   |

[098F](https://wiki.blast.hk/gta-sa/opcodes/098F) |   |  [1:276] |

[0990](https://wiki.blast.hk/gta-sa/opcodes/0990) |   |  [1:277] |

[0991](https://wiki.blast.hk/gta-sa/opcodes/0991) |  [pauseCurrentBeatTrack](https://wiki.blast.hk/moonloader/lua/pauseCurrentBeatTrack)(bool paused) |   |

[0992](https://wiki.blast.hk/gta-sa/opcodes/0992) |  [setPlayerWeaponsScrollable](https://wiki.blast.hk/moonloader/lua/setPlayerWeaponsScrollable)(Player player, bool scrollable) |   |

[0993](https://wiki.blast.hk/gta-sa/opcodes/0993) |   |  [1:278] |

[0994](https://wiki.blast.hk/gta-sa/opcodes/0994) |  [markRoadNodeAsDontWander](https://wiki.blast.hk/moonloader/lua/markRoadNodeAsDontWander)(float atX, float atY, float atZ) |   |

[0995](https://wiki.blast.hk/gta-sa/opcodes/0995) |  [unmarkAllRoadNodesAsDontWander](https://wiki.blast.hk/moonloader/lua/unmarkAllRoadNodesAsDontWander)() |   |

[0996](https://wiki.blast.hk/gta-sa/opcodes/0996) |  [setCheckpointHeading](https://wiki.blast.hk/moonloader/lua/setCheckpointHeading)(Checkpoint checkpoint, float angle) |   |

[0997](https://wiki.blast.hk/gta-sa/opcodes/0997) |  [setMissionRespectTotal](https://wiki.blast.hk/moonloader/lua/setMissionRespectTotal)(int respect) |   |

[0998](https://wiki.blast.hk/gta-sa/opcodes/0998) |  [awardPlayerMissionRespect](https://wiki.blast.hk/moonloader/lua/awardPlayerMissionRespect)(int respect) |   |

[0999](https://wiki.blast.hk/gta-sa/opcodes/0999) |   |  [1:279] |

[099A](https://wiki.blast.hk/gta-sa/opcodes/099A) |  [setCarCollision](https://wiki.blast.hk/moonloader/lua/setCarCollision)(Vehicle car, bool collision) |   |

[099B](https://wiki.blast.hk/gta-sa/opcodes/099B) |  [changePlaybackToUseAi](https://wiki.blast.hk/moonloader/lua/changePlaybackToUseAi)(Vehicle car) |   |

[099C](https://wiki.blast.hk/gta-sa/opcodes/099C) |  [cameraSetShakeSimulationSimple](https://wiki.blast.hk/moonloader/lua/cameraSetShakeSimulationSimple)(int type, float timelimit, float intensity) |   |

[099D](https://wiki.blast.hk/gta-sa/opcodes/099D) |  bool result = [isNightVisionActive](https://wiki.blast.hk/moonloader/lua/isNightVisionActive)() |   |

[099E](https://wiki.blast.hk/gta-sa/opcodes/099E) |  [setCreateRandomCops](https://wiki.blast.hk/moonloader/lua/setCreateRandomCops)(bool enable) |   |

[099F](https://wiki.blast.hk/gta-sa/opcodes/099F) |  [taskSetIgnoreWeaponRangeFlag](https://wiki.blast.hk/moonloader/lua/taskSetIgnoreWeaponRangeFlag)(Ped ped, bool ignore) |   |

[09A0](https://wiki.blast.hk/gta-sa/opcodes/09A0) |  [taskPickUpSecondObject](https://wiki.blast.hk/moonloader/lua/taskPickUpSecondObject)(Ped ped, Object object, float offsetX, float offsetY, float offsetZ, int bone, int int7, string animation, string file, int time) |   |

[09A1](https://wiki.blast.hk/gta-sa/opcodes/09A1) |  [dropSecondObject](https://wiki.blast.hk/moonloader/lua/dropSecondObject)(Ped ped, bool to) |   |

[09A2](https://wiki.blast.hk/gta-sa/opcodes/09A2) |  [removeObjectElegantly](https://wiki.blast.hk/moonloader/lua/removeObjectElegantly)(Object object) |   |

[09A3](https://wiki.blast.hk/gta-sa/opcodes/09A3) |  [drawCrosshair](https://wiki.blast.hk/moonloader/lua/drawCrosshair)(bool draw) |   |

[09A4](https://wiki.blast.hk/gta-sa/opcodes/09A4) |  [setUpConversationNodeWithSpeech](https://wiki.blast.hk/moonloader/lua/setUpConversationNodeWithSpeech)(GxtString question, GxtString answerY, GxtString answerN, int questionWav, int answerYWav, int answerNWav) |   |

[09A5](https://wiki.blast.hk/gta-sa/opcodes/09A5) |   |  [1:280] |

[09A6](https://wiki.blast.hk/gta-sa/opcodes/09A6) |  [showBlipsOnAllLevels](https://wiki.blast.hk/moonloader/lua/showBlipsOnAllLevels)(bool enable) |   |

[09A7](https://wiki.blast.hk/gta-sa/opcodes/09A7) |  [setCharDruggedUp](https://wiki.blast.hk/moonloader/lua/setCharDruggedUp)(Ped ped, bool druggedUp) |   |

[09A8](https://wiki.blast.hk/gta-sa/opcodes/09A8) |  bool result = [isCharHeadMissing](https://wiki.blast.hk/moonloader/lua/isCharHeadMissing)(Ped ped) |   |

[09A9](https://wiki.blast.hk/gta-sa/opcodes/09A9) |  int CRC32 = [getHashKey](https://wiki.blast.hk/moonloader/lua/getHashKey)(string string) |   |

[09AA](https://wiki.blast.hk/gta-sa/opcodes/09AA) |  [setUpConversationEndNodeWithSpeech](https://wiki.blast.hk/moonloader/lua/setUpConversationEndNodeWithSpeech)(GxtString gxtString, int speech) |   |

[09AB](https://wiki.blast.hk/gta-sa/opcodes/09AB) |  [randomPassengerSay](https://wiki.blast.hk/moonloader/lua/randomPassengerSay)(int passengers, int audioTable) |   |

[09AC](https://wiki.blast.hk/gta-sa/opcodes/09AC) |  [hideAllFrontendBlips](https://wiki.blast.hk/moonloader/lua/hideAllFrontendBlips)(bool hide) |   |

[09AD](https://wiki.blast.hk/gta-sa/opcodes/09AD) |  [setPlayerInCarCameraMode](https://wiki.blast.hk/moonloader/lua/setPlayerInCarCameraMode)(int mode) |   |

[09AE](https://wiki.blast.hk/gta-sa/opcodes/09AE) |  bool result = [isCharInAnyTrain](https://wiki.blast.hk/moonloader/lua/isCharInAnyTrain)(Ped ped) |   |

[09AF](https://wiki.blast.hk/gta-sa/opcodes/09AF) |  [setUpSkipAfterMission](https://wiki.blast.hk/moonloader/lua/setUpSkipAfterMission)(float posX, float posY, float posZ, float angle) |   |

[09B0](https://wiki.blast.hk/gta-sa/opcodes/09B0) |  [setVehicleIsConsideredByPlayer](https://wiki.blast.hk/moonloader/lua/setVehicleIsConsideredByPlayer)(Vehicle car, bool accessible) |   |

[09B1](https://wiki.blast.hk/gta-sa/opcodes/09B1) |   |  [1:281] |

[09B2](https://wiki.blast.hk/gta-sa/opcodes/09B2) |  Model modelId, int class = [getRandomCarModelInMemory](https://wiki.blast.hk/moonloader/lua/getRandomCarModelInMemory)(bool unk) |   |

[09B3](https://wiki.blast.hk/gta-sa/opcodes/09B3) |  int doorStatus = [getCarDoorLockStatus](https://wiki.blast.hk/moonloader/lua/getCarDoorLockStatus)(Vehicle car) |   |

[09B4](https://wiki.blast.hk/gta-sa/opcodes/09B4) |  [setClosestEntryExitFlag](https://wiki.blast.hk/moonloader/lua/setClosestEntryExitFlag)(float atX, float atY, float radius, int bitmask, bool flag) |   |

[09B5](https://wiki.blast.hk/gta-sa/opcodes/09B5) |  [setCharSignalAfterKill](https://wiki.blast.hk/moonloader/lua/setCharSignalAfterKill)(Ped ped, bool signal) |   |

[09B6](https://wiki.blast.hk/gta-sa/opcodes/09B6) |  [setCharWantedByPolice](https://wiki.blast.hk/moonloader/lua/setCharWantedByPolice)(Ped ped, bool wanted) |   |

[09B7](https://wiki.blast.hk/gta-sa/opcodes/09B7) |  [setZoneNoCops](https://wiki.blast.hk/moonloader/lua/setZoneNoCops)(GxtString zone, bool disableCops) |   |

[09B8](https://wiki.blast.hk/gta-sa/opcodes/09B8) |  [addBlood](https://wiki.blast.hk/moonloader/lua/addBlood)(float atX, float atY, float atZ, float offsetX, float offsetY, float offsetZ, int density, int onActor) |   |

[09B9](https://wiki.blast.hk/gta-sa/opcodes/09B9) |  [displayCarNames](https://wiki.blast.hk/moonloader/lua/displayCarNames)(bool show) |   |

[09BA](https://wiki.blast.hk/gta-sa/opcodes/09BA) |  [displayZoneNames](https://wiki.blast.hk/moonloader/lua/displayZoneNames)(bool show) |   |

[09BB](https://wiki.blast.hk/gta-sa/opcodes/09BB) |  bool result = [isCarDoorDamaged](https://wiki.blast.hk/moonloader/lua/isCarDoorDamaged)(Vehicle car, int door) |   |

[09BC](https://wiki.blast.hk/gta-sa/opcodes/09BC) |  [setCharCoordinatesDontWarpGangNoOffset](https://wiki.blast.hk/moonloader/lua/setCharCoordinatesDontWarpGangNoOffset)(Ped ped, float atX, float atY, float atZ) |   |

[09BD](https://wiki.blast.hk/gta-sa/opcodes/09BD) |  [setMinigameInProgress](https://wiki.blast.hk/moonloader/lua/setMinigameInProgress)(bool enable) |   |

[09BE](https://wiki.blast.hk/gta-sa/opcodes/09BE) |  bool result = [isMinigameInProgress](https://wiki.blast.hk/moonloader/lua/isMinigameInProgress)() |   |

[09BF](https://wiki.blast.hk/gta-sa/opcodes/09BF) |  [setForceRandomCarModel](https://wiki.blast.hk/moonloader/lua/setForceRandomCarModel)(Model modelId) |   |

[09C0](https://wiki.blast.hk/gta-sa/opcodes/09C0) |  Vehicle car = [getRandomCarOfTypeInAngledAreaNoSave](https://wiki.blast.hk/moonloader/lua/getRandomCarOfTypeInAngledAreaNoSave)(float x1, float y1, float x2, float y2, float angle, int int6) |   |

[09C1](https://wiki.blast.hk/gta-sa/opcodes/09C1) |  [addNextMessageToPreviousBriefs](https://wiki.blast.hk/moonloader/lua/addNextMessageToPreviousBriefs)(bool int1) |   |

[09C2](https://wiki.blast.hk/gta-sa/opcodes/09C2) |  [failKillFrenzy](https://wiki.blast.hk/moonloader/lua/failKillFrenzy)() |   |

[09C3](https://wiki.blast.hk/gta-sa/opcodes/09C3) |  bool result = [isCopVehicleInArea3dNoSave](https://wiki.blast.hk/moonloader/lua/isCopVehicleInArea3dNoSave)(float cornerAX, float cornerAY, float cornerAZ, float cornerBX, float cornerBY, float cornerBZ) |   |

[09C4](https://wiki.blast.hk/gta-sa/opcodes/09C4) |  [setPetrolTankWeakpoint](https://wiki.blast.hk/moonloader/lua/setPetrolTankWeakpoint)(Vehicle car, bool enabled) |   |

[09C5](https://wiki.blast.hk/gta-sa/opcodes/09C5) |  bool result = [isCharUsingMapAttractor](https://wiki.blast.hk/moonloader/lua/isCharUsingMapAttractor)(Ped ped) |   |

[09C6](https://wiki.blast.hk/gta-sa/opcodes/09C6) |   |  [1:282] |

[09C7](https://wiki.blast.hk/gta-sa/opcodes/09C7) |  [setPlayerModel](https://wiki.blast.hk/moonloader/lua/setPlayerModel)(Player player, Model modelId) |   |

[09C8](https://wiki.blast.hk/gta-sa/opcodes/09C8) |  bool result = [areSubtitlesSwitchedOn](https://wiki.blast.hk/moonloader/lua/areSubtitlesSwitchedOn)() |   |

[09C9](https://wiki.blast.hk/gta-sa/opcodes/09C9) |  [removeCharFromCarMaintainPosition](https://wiki.blast.hk/moonloader/lua/removeCharFromCarMaintainPosition)(Ped ped, Vehicle car) |   |

[09CA](https://wiki.blast.hk/gta-sa/opcodes/09CA) |  [setObjectProofs](https://wiki.blast.hk/moonloader/lua/setObjectProofs)(Object object, bool BP, bool FP, bool EP, bool CP, bool MP) |   |

[09CB](https://wiki.blast.hk/gta-sa/opcodes/09CB) |  bool result = [isCarTouchingCar](https://wiki.blast.hk/moonloader/lua/isCarTouchingCar)(Vehicle car1, Vehicle car2) |   |

[09CC](https://wiki.blast.hk/gta-sa/opcodes/09CC) |  bool result = [doesObjectHaveThisModel](https://wiki.blast.hk/moonloader/lua/doesObjectHaveThisModel)(Object object, Model modelId) |   |

[09CF](https://wiki.blast.hk/gta-sa/opcodes/09CF) |  [setTrainForcedToSlowDown](https://wiki.blast.hk/moonloader/lua/setTrainForcedToSlowDown)(Vehicle train, bool forced) |   |

[09D0](https://wiki.blast.hk/gta-sa/opcodes/09D0) |  bool result = [isVehicleOnAllWheels](https://wiki.blast.hk/moonloader/lua/isVehicleOnAllWheels)(Vehicle car) |   |

[09D1](https://wiki.blast.hk/gta-sa/opcodes/09D1) |  bool result = [doesPickupExist](https://wiki.blast.hk/moonloader/lua/doesPickupExist)(Pickup pickup) |   |

[09D2](https://wiki.blast.hk/gta-sa/opcodes/09D2) |  [enableAmbientCrime](https://wiki.blast.hk/moonloader/lua/enableAmbientCrime)(bool enable) |   |

[09D3](https://wiki.blast.hk/gta-sa/opcodes/09D3) |   |  [1:283] |

[09D4](https://wiki.blast.hk/gta-sa/opcodes/09D4) |  [clearWantedLevelInGarage](https://wiki.blast.hk/moonloader/lua/clearWantedLevelInGarage)() |   |

[09D5](https://wiki.blast.hk/gta-sa/opcodes/09D5) |  int unk = [setCharSayContextImportant](https://wiki.blast.hk/moonloader/lua/setCharSayContextImportant)(Ped ped, int soundslot, bool flags1, bool flags2, bool flags3) |   |

[09D6](https://wiki.blast.hk/gta-sa/opcodes/09D6) |  [setCharSayScript](https://wiki.blast.hk/moonloader/lua/setCharSayScript)(Ped ped, int sound, bool flags1, bool flags2, bool flags3) |   |

[09D7](https://wiki.blast.hk/gta-sa/opcodes/09D7) |  [forceInteriorLightingForPlayer](https://wiki.blast.hk/moonloader/lua/forceInteriorLightingForPlayer)(Player player, bool force) |   |

[09D8](https://wiki.blast.hk/gta-sa/opcodes/09D8) |   |  [1:284] |

[09D9](https://wiki.blast.hk/gta-sa/opcodes/09D9) |  [useDetonator](https://wiki.blast.hk/moonloader/lua/useDetonator)() |   |

[09DA](https://wiki.blast.hk/gta-sa/opcodes/09DA) |  bool result = [isMoneyPickupAtCoords](https://wiki.blast.hk/moonloader/lua/isMoneyPickupAtCoords)(float atX, float atY, float atZ) |   |

[09DB](https://wiki.blast.hk/gta-sa/opcodes/09DB) |  [setMenuColumnWidth](https://wiki.blast.hk/moonloader/lua/setMenuColumnWidth)(int panel, int column, int width) |   |

[09DC](https://wiki.blast.hk/gta-sa/opcodes/09DC) |   |  [1:285] |

[09DD](https://wiki.blast.hk/gta-sa/opcodes/09DD) |  [makeRoomInPlayerGangForMissionPeds](https://wiki.blast.hk/moonloader/lua/makeRoomInPlayerGangForMissionPeds)(int group) |   |

[09DE](https://wiki.blast.hk/gta-sa/opcodes/09DE) |  bool result = [isCharGettingInToACar](https://wiki.blast.hk/moonloader/lua/isCharGettingInToACar)(Ped ped) |   |

[09E0](https://wiki.blast.hk/gta-sa/opcodes/09E0) |  [setUpSkipForSpecificVehicle](https://wiki.blast.hk/moonloader/lua/setUpSkipForSpecificVehicle)(float posX, float posY, float posZ, float angle, Vehicle car) |   |

[09E1](https://wiki.blast.hk/gta-sa/opcodes/09E1) |  int price = [getCarModelValue](https://wiki.blast.hk/moonloader/lua/getCarModelValue)(Model modelId) |   |

[09E2](https://wiki.blast.hk/gta-sa/opcodes/09E2) |  int generator = [createCarGeneratorWithPlate](https://wiki.blast.hk/moonloader/lua/createCarGeneratorWithPlate)(float atX, float atY, float atZ, float angle, Model modelId, int color1, int color2, bool forceSpawn, int alarm, int doorLock, int minDelay, int maxDelay, string plate) |   |

[09E3](https://wiki.blast.hk/gta-sa/opcodes/09E3) |  bool result = [findTrainDirection](https://wiki.blast.hk/moonloader/lua/findTrainDirection)(Vehicle train) |   |

[09E4](https://wiki.blast.hk/gta-sa/opcodes/09E4) |  [setAircraftCarrierSamSite](https://wiki.blast.hk/moonloader/lua/setAircraftCarrierSamSite)(bool enable) |   |

[09E5](https://wiki.blast.hk/gta-sa/opcodes/09E5) |  [drawLightWithRange](https://wiki.blast.hk/moonloader/lua/drawLightWithRange)(float atX, float atY, float atZ, int r, int g, int b, float radius) |   |

[09E6](https://wiki.blast.hk/gta-sa/opcodes/09E6) |  [enableBurglaryHouses](https://wiki.blast.hk/moonloader/lua/enableBurglaryHouses)(bool enable) |   |

[09E7](https://wiki.blast.hk/gta-sa/opcodes/09E7) |  bool result = [isPlayerControlOn](https://wiki.blast.hk/moonloader/lua/isPlayerControlOn)(Player player) |   |

[09E8](https://wiki.blast.hk/gta-sa/opcodes/09E8) |  int interior = [getCharActiveInterior](https://wiki.blast.hk/moonloader/lua/getCharActiveInterior)(Ped ped) |   |

[09E9](https://wiki.blast.hk/gta-sa/opcodes/09E9) |  [giveNonPlayerCarNitro](https://wiki.blast.hk/moonloader/lua/giveNonPlayerCarNitro)(Vehicle car) |   |

[09EA](https://wiki.blast.hk/gta-sa/opcodes/09EA) |   |  [1:286] |

[09EB](https://wiki.blast.hk/gta-sa/opcodes/09EB) |  [playerTakeOffGoggles](https://wiki.blast.hk/moonloader/lua/playerTakeOffGoggles)(Player player, bool useAnim) |   |

[09EC](https://wiki.blast.hk/gta-sa/opcodes/09EC) |  [allowFixedCameraCollision](https://wiki.blast.hk/moonloader/lua/allowFixedCameraCollision)(bool allow) |   |

[09ED](https://wiki.blast.hk/gta-sa/opcodes/09ED) |  bool result = [hasCharSpottedCharInFront](https://wiki.blast.hk/moonloader/lua/hasCharSpottedCharInFront)(Ped ped, Ped ped2) |   |

[09EE](https://wiki.blast.hk/gta-sa/opcodes/09EE) |  [forceBigMessageAndCounter](https://wiki.blast.hk/moonloader/lua/forceBigMessageAndCounter)(bool stayOnScreen) |   |

[09EF](https://wiki.blast.hk/gta-sa/opcodes/09EF) |  [setVehicleCameraTweak](https://wiki.blast.hk/moonloader/lua/setVehicleCameraTweak)(Model carModel, float distance, float altitudeMultiplier, float angleX) |   |

[09F0](https://wiki.blast.hk/gta-sa/opcodes/09F0) |  [resetVehicleCameraTweak](https://wiki.blast.hk/moonloader/lua/resetVehicleCameraTweak)() |   |

[09F1](https://wiki.blast.hk/gta-sa/opcodes/09F1) |  [reportMissionAudioEventAtChar](https://wiki.blast.hk/moonloader/lua/reportMissionAudioEventAtChar)(Ped ped, int event) |   |

[09F2](https://wiki.blast.hk/gta-sa/opcodes/09F2) |  bool result = [doesDecisionMakerExist](https://wiki.blast.hk/moonloader/lua/doesDecisionMakerExist)(int maker) |   |

[09F3](https://wiki.blast.hk/gta-sa/opcodes/09F3) |   |  [1:287] |

[09F4](https://wiki.blast.hk/gta-sa/opcodes/09F4) |  [ignoreHeightDifferenceFollowingNodes](https://wiki.blast.hk/moonloader/lua/ignoreHeightDifferenceFollowingNodes)(Ped ped, bool ignore) |   |

[09F5](https://wiki.blast.hk/gta-sa/opcodes/09F5) |  [shutAllCharsUp](https://wiki.blast.hk/moonloader/lua/shutAllCharsUp)(bool enable) |   |

[09F6](https://wiki.blast.hk/gta-sa/opcodes/09F6) |  [setCharGetOutUpsideDownCar](https://wiki.blast.hk/moonloader/lua/setCharGetOutUpsideDownCar)(Ped ped, bool canGetOut) |   |

[09F7](https://wiki.blast.hk/gta-sa/opcodes/09F7) |  [reportMissionAudioEventAtCar](https://wiki.blast.hk/moonloader/lua/reportMissionAudioEventAtCar)(Vehicle car, int event) |   |

[09F8](https://wiki.blast.hk/gta-sa/opcodes/09F8) |  [doWeaponStuffAtStartOf2pGame](https://wiki.blast.hk/moonloader/lua/doWeaponStuffAtStartOf2pGame)() |   |

[09F9](https://wiki.blast.hk/gta-sa/opcodes/09F9) |   |  [1:288] |

[09FA](https://wiki.blast.hk/gta-sa/opcodes/09FA) |  bool result = [hasGameJustReturnedFromFrontend](https://wiki.blast.hk/moonloader/lua/hasGameJustReturnedFromFrontend)() |   |

[09FB](https://wiki.blast.hk/gta-sa/opcodes/09FB) |  int language = [getCurrentLanguage](https://wiki.blast.hk/moonloader/lua/getCurrentLanguage)() |   |

[09FC](https://wiki.blast.hk/gta-sa/opcodes/09FC) |  bool result = [isObjectIntersectingWorld](https://wiki.blast.hk/moonloader/lua/isObjectIntersectingWorld)(Object object) |   |

[09FD](https://wiki.blast.hk/gta-sa/opcodes/09FD) |  int width = [getStringWidth](https://wiki.blast.hk/moonloader/lua/getStringWidth)(GxtString gxtString) |   |

[09FE](https://wiki.blast.hk/gta-sa/opcodes/09FE) |  [resetVehicleHydraulics](https://wiki.blast.hk/moonloader/lua/resetVehicleHydraulics)(Vehicle car) |   |

[09FF](https://wiki.blast.hk/gta-sa/opcodes/09FF) |  [setRespawnPointForDurationOfMission](https://wiki.blast.hk/moonloader/lua/setRespawnPointForDurationOfMission)(float posX, float posY, float posZ) |   |

[0A00](https://wiki.blast.hk/gta-sa/opcodes/0A00) |   |  [1:289] |

[0A01](https://wiki.blast.hk/gta-sa/opcodes/0A01) |  bool result = [isThisModelACar](https://wiki.blast.hk/moonloader/lua/isThisModelACar)(Model modelId) |   |

[0A02](https://wiki.blast.hk/gta-sa/opcodes/0A02) |  [switchOnGroundSearchlight](https://wiki.blast.hk/moonloader/lua/switchOnGroundSearchlight)(Searchlight searchlight, bool lightsThroughObstacles) |   |

[0A03](https://wiki.blast.hk/gta-sa/opcodes/0A03) |  bool result = [isGangWarFightingGoingOn](https://wiki.blast.hk/moonloader/lua/isGangWarFightingGoingOn)() |   |

[0A04](https://wiki.blast.hk/gta-sa/opcodes/0A04) |   |  [1:290] |

[0A05](https://wiki.blast.hk/gta-sa/opcodes/0A05) |   |  [1:291] |

[0A06](https://wiki.blast.hk/gta-sa/opcodes/0A06) |  bool result = [isNextStationAllowed](https://wiki.blast.hk/moonloader/lua/isNextStationAllowed)(Vehicle train) |   |

[0A07](https://wiki.blast.hk/gta-sa/opcodes/0A07) |  [skipToNextAllowedStation](https://wiki.blast.hk/moonloader/lua/skipToNextAllowedStation)(Vehicle train) |   |

[0A08](https://wiki.blast.hk/gta-sa/opcodes/0A08) |  int width = [getStringWidthWithNumber](https://wiki.blast.hk/moonloader/lua/getStringWidthWithNumber)(GxtString gxtString, int number) |   |

[0A09](https://wiki.blast.hk/gta-sa/opcodes/0A09) |  [shutCharUpForScriptedSpeech](https://wiki.blast.hk/moonloader/lua/shutCharUpForScriptedSpeech)(Ped ped, bool muted) |   |

[0A0A](https://wiki.blast.hk/gta-sa/opcodes/0A0A) |  [enableDisabledAttractorsOnObject](https://wiki.blast.hk/moonloader/lua/enableDisabledAttractorsOnObject)(Object object, bool enable) |   |

[0A0B](https://wiki.blast.hk/gta-sa/opcodes/0A0B) |  [loadSceneInDirection](https://wiki.blast.hk/moonloader/lua/loadSceneInDirection)(float coordX, float coordY, float coordZ, float angle) |   |

[0A0C](https://wiki.blast.hk/gta-sa/opcodes/0A0C) |  bool result = [isPlayerUsingJetpack](https://wiki.blast.hk/moonloader/lua/isPlayerUsingJetpack)(Player player) |   |

[0A0D](https://wiki.blast.hk/gta-sa/opcodes/0A0D) |   |  [1:292] |

[0A0E](https://wiki.blast.hk/gta-sa/opcodes/0A0E) |  [clearThisPrintBigNow](https://wiki.blast.hk/moonloader/lua/clearThisPrintBigNow)(int style) |   |

[0A0F](https://wiki.blast.hk/gta-sa/opcodes/0A0F) |  bool result = [hasLanguageChanged](https://wiki.blast.hk/moonloader/lua/hasLanguageChanged)() |   |

[0A10](https://wiki.blast.hk/gta-sa/opcodes/0A10) |  [incrementIntStatNoMessage](https://wiki.blast.hk/moonloader/lua/incrementIntStatNoMessage)(int stat, int value) |   |

[0A11](https://wiki.blast.hk/gta-sa/opcodes/0A11) |  [setExtraCarColours](https://wiki.blast.hk/moonloader/lua/setExtraCarColours)(Vehicle car, int tertiaryColor, int quaternaryColor) |   |

[0A12](https://wiki.blast.hk/gta-sa/opcodes/0A12) |  int tertiaryColor, int quaternaryColor = [getExtraCarColours](https://wiki.blast.hk/moonloader/lua/getExtraCarColours)(Vehicle car) |   |

[0A13](https://wiki.blast.hk/gta-sa/opcodes/0A13) |  [manageAllPopulation](https://wiki.blast.hk/moonloader/lua/manageAllPopulation)() |   |

[0A14](https://wiki.blast.hk/gta-sa/opcodes/0A14) |  [setNoResprays](https://wiki.blast.hk/moonloader/lua/setNoResprays)(bool enable) |   |

[0A15](https://wiki.blast.hk/gta-sa/opcodes/0A15) |  bool result = [hasCarBeenResprayed](https://wiki.blast.hk/moonloader/lua/hasCarBeenResprayed)(Vehicle car) |   |

[0A16](https://wiki.blast.hk/gta-sa/opcodes/0A16) |  [attachMissionAudioToCar](https://wiki.blast.hk/moonloader/lua/attachMissionAudioToCar)(int audioId, Vehicle car) |   |

[0A17](https://wiki.blast.hk/gta-sa/opcodes/0A17) |  [setHasBeenOwnedForCarGenerator](https://wiki.blast.hk/moonloader/lua/setHasBeenOwnedForCarGenerator)(int generator, bool owned) |   |

[0A18](https://wiki.blast.hk/gta-sa/opcodes/0A18) |  [setUpConversationNodeWithScriptedSpeech](https://wiki.blast.hk/moonloader/lua/setUpConversationNodeWithScriptedSpeech)(GxtString questionGXT, GxtString answerYesGXT, GxtString answerNoGXT, int questionWAV, int answerYesWAV, int answerNoWAV) |   |

[0A19](https://wiki.blast.hk/gta-sa/opcodes/0A19) |  [setAreaName](https://wiki.blast.hk/moonloader/lua/setAreaName)(GxtString gxtString) |   |

[0A1A](https://wiki.blast.hk/gta-sa/opcodes/0A1A) |  [taskPlayAnimSecondary](https://wiki.blast.hk/moonloader/lua/taskPlayAnimSecondary)(Ped ped, string animation, string IFP, float framedelta, bool loopA, bool lockX, bool lockY, bool lockF, int time) |   |

[0A1B](https://wiki.blast.hk/gta-sa/opcodes/0A1B) |  bool result = [isCharTouchingChar](https://wiki.blast.hk/moonloader/lua/isCharTouchingChar)(Ped ped, Ped ped2) |   |

[0A1C](https://wiki.blast.hk/gta-sa/opcodes/0A1C) |  [disableHeliAudio](https://wiki.blast.hk/moonloader/lua/disableHeliAudio)(Vehicle helicopter, bool disable) |   |

[0A1D](https://wiki.blast.hk/gta-sa/opcodes/0A1D) |  [taskHandGesture](https://wiki.blast.hk/moonloader/lua/taskHandGesture)(Ped ped, Ped ped2) |   |

[0A1E](https://wiki.blast.hk/gta-sa/opcodes/0A1E) |  [takePhoto](https://wiki.blast.hk/moonloader/lua/takePhoto)(bool unk) |   |

[0A1F](https://wiki.blast.hk/gta-sa/opcodes/0A1F) |  [incrementFloatStatNoMessage](https://wiki.blast.hk/moonloader/lua/incrementFloatStatNoMessage)(int stat, float value) |   |

[0A20](https://wiki.blast.hk/gta-sa/opcodes/0A20) |  [setPlayerGroupToFollowAlways](https://wiki.blast.hk/moonloader/lua/setPlayerGroupToFollowAlways)(Player player, bool followAlways) |   |

[0A21](https://wiki.blast.hk/gta-sa/opcodes/0A21) |  [improveCarByCheating](https://wiki.blast.hk/moonloader/lua/improveCarByCheating)(Vehicle car, bool affectedByCheats) |   |

[0A22](https://wiki.blast.hk/gta-sa/opcodes/0A22) |  [changeCarColourFromMenu](https://wiki.blast.hk/moonloader/lua/changeCarColourFromMenu)(int panelID, Vehicle car, int colorslot, int activeRow) |   |

[0A23](https://wiki.blast.hk/gta-sa/opcodes/0A23) |  [highlightMenuItem](https://wiki.blast.hk/moonloader/lua/highlightMenuItem)(int panel, int row, bool highlight) |   |

[0A24](https://wiki.blast.hk/gta-sa/opcodes/0A24) |  [setDisableMilitaryZones](https://wiki.blast.hk/moonloader/lua/setDisableMilitaryZones)(bool disable) |   |

[0A25](https://wiki.blast.hk/gta-sa/opcodes/0A25) |  [setCameraPositionUnfixed](https://wiki.blast.hk/moonloader/lua/setCameraPositionUnfixed)(float xAngle, float zAngle) |   |

[0A26](https://wiki.blast.hk/gta-sa/opcodes/0A26) |  [setRadioToPlayersFavouriteStation](https://wiki.blast.hk/moonloader/lua/setRadioToPlayersFavouriteStation)() |   |

[0A27](https://wiki.blast.hk/gta-sa/opcodes/0A27) |  [setDeathWeaponsPersist](https://wiki.blast.hk/moonloader/lua/setDeathWeaponsPersist)(Ped ped, bool persist) |   |

[0A28](https://wiki.blast.hk/gta-sa/opcodes/0A28) |  [setCharSwimSpeed](https://wiki.blast.hk/moonloader/lua/setCharSwimSpeed)(Ped ped, float speed) |   |

[0A29](https://wiki.blast.hk/gta-sa/opcodes/0A29) |  bool result = [isPlayerClimbing](https://wiki.blast.hk/moonloader/lua/isPlayerClimbing)(Player player) |   |

[0A2A](https://wiki.blast.hk/gta-sa/opcodes/0A2A) |  bool result = [isThisHelpMessageBeingDisplayed](https://wiki.blast.hk/moonloader/lua/isThisHelpMessageBeingDisplayed)(GxtString gxtString) |   |

[0A2B](https://wiki.blast.hk/gta-sa/opcodes/0A2B) |  bool result = [isWidescreenOnInOptions](https://wiki.blast.hk/moonloader/lua/isWidescreenOnInOptions)() |   |

[0A2C](https://wiki.blast.hk/gta-sa/opcodes/0A2C) |  [drawSubtitlesBeforeFade](https://wiki.blast.hk/moonloader/lua/drawSubtitlesBeforeFade)(bool flag) |   |

[0A2D](https://wiki.blast.hk/gta-sa/opcodes/0A2D) |  [drawOddjobTitleBeforeFade](https://wiki.blast.hk/moonloader/lua/drawOddjobTitleBeforeFade)(bool flag) |   |

[0A2E](https://wiki.blast.hk/gta-sa/opcodes/0A2E) |  [taskFollowPathNodesToCoordWithRadius](https://wiki.blast.hk/moonloader/lua/taskFollowPathNodesToCoordWithRadius)(Ped ped, float toX, float toY, float toZ, int mode, int time, float stopRadius) |   |

[0A2F](https://wiki.blast.hk/gta-sa/opcodes/0A2F) |  [setPhotoCameraEffect](https://wiki.blast.hk/moonloader/lua/setPhotoCameraEffect)(bool firstPersonView) |   |

[0A30](https://wiki.blast.hk/gta-sa/opcodes/0A30) |  [fixCar](https://wiki.blast.hk/moonloader/lua/fixCar)(Vehicle car) |   |

[0A31](https://wiki.blast.hk/gta-sa/opcodes/0A31) |  [setPlayerGroupToFollowNever](https://wiki.blast.hk/moonloader/lua/setPlayerGroupToFollowNever)(Player player, bool neverFollow) |   |

[0A32](https://wiki.blast.hk/gta-sa/opcodes/0A32) |  bool result = [isCharAttachedToAnyCar](https://wiki.blast.hk/moonloader/lua/isCharAttachedToAnyCar)(Ped ped) |   |

[0A33](https://wiki.blast.hk/gta-sa/opcodes/0A33) |  Ped ped = [storeCarCharIsAttachedToNoSave](https://wiki.blast.hk/moonloader/lua/storeCarCharIsAttachedToNoSave)(Vehicle car) |   |

[0A34](https://wiki.blast.hk/gta-sa/opcodes/0A34) |   |  [1:293] |

[0A35](https://wiki.blast.hk/gta-sa/opcodes/0A35) |  [setUpSkipForVehicleFinishedByScript](https://wiki.blast.hk/moonloader/lua/setUpSkipForVehicleFinishedByScript)(float posX, float posY, float posZ, float angle, Vehicle car) |   |

[0A36](https://wiki.blast.hk/gta-sa/opcodes/0A36) |  bool result = [isSkipWaitingForScriptToFadeIn](https://wiki.blast.hk/moonloader/lua/isSkipWaitingForScriptToFadeIn)() |   |

[0A37](https://wiki.blast.hk/gta-sa/opcodes/0A37) |  [forceAllVehicleLightsOff](https://wiki.blast.hk/moonloader/lua/forceAllVehicleLightsOff)(bool off) |   |

[0A38](https://wiki.blast.hk/gta-sa/opcodes/0A38) |   |  [1:294] |

[0A39](https://wiki.blast.hk/gta-sa/opcodes/0A39) |  int mode = [getPlayerInCarCameraMode](https://wiki.blast.hk/moonloader/lua/getPlayerInCarCameraMode)() |   |

[0A3A](https://wiki.blast.hk/gta-sa/opcodes/0A3A) |  bool result = [isLastBuildingModelShotByPlayer](https://wiki.blast.hk/moonloader/lua/isLastBuildingModelShotByPlayer)(Player player, Model modelId) |   |

[0A3B](https://wiki.blast.hk/gta-sa/opcodes/0A3B) |  [clearLastBuildingModelShotByPlayer](https://wiki.blast.hk/moonloader/lua/clearLastBuildingModelShotByPlayer)(Player player) |   |

[0A3C](https://wiki.blast.hk/gta-sa/opcodes/0A3C) |  [setUpConversationEndNodeWithScriptedSpeech](https://wiki.blast.hk/moonloader/lua/setUpConversationEndNodeWithScriptedSpeech)(GxtString dialogueGxt, int wav) |   |

[0A3D](https://wiki.blast.hk/gta-sa/opcodes/0A3D) |  [activatePimpCheat](https://wiki.blast.hk/moonloader/lua/activatePimpCheat)(bool enable) |   |

[0A3E](https://wiki.blast.hk/gta-sa/opcodes/0A3E) |  Ped ped = [getRandomCharInAreaOffsetNoSave](https://wiki.blast.hk/moonloader/lua/getRandomCharInAreaOffsetNoSave)(float sphereX, float sphereY, float sphereZ, float radiusX, float radiusY, float radiusZ) |   |

[0A3F](https://wiki.blast.hk/gta-sa/opcodes/0A3F) |  [setScriptCoopGame](https://wiki.blast.hk/moonloader/lua/setScriptCoopGame)(bool enable) |   |

[0A40](https://wiki.blast.hk/gta-sa/opcodes/0A40) |  Marker marker = [createUser3dMarker](https://wiki.blast.hk/moonloader/lua/createUser3dMarker)(float atX, float atY, float atZ, int color) |   |

[0A41](https://wiki.blast.hk/gta-sa/opcodes/0A41) |  [removeUser3dMarker](https://wiki.blast.hk/moonloader/lua/removeUser3dMarker)(Marker marker) |   |

[0A42](https://wiki.blast.hk/gta-sa/opcodes/0A42) |   |  [1:295] |

[0A43](https://wiki.blast.hk/gta-sa/opcodes/0A43) |  [getRidOfPlayerProstitute](https://wiki.blast.hk/moonloader/lua/getRidOfPlayerProstitute)() |   |

[0A44](https://wiki.blast.hk/gta-sa/opcodes/0A44) |  [displayNonMinigameHelpMessages](https://wiki.blast.hk/moonloader/lua/displayNonMinigameHelpMessages)(bool display) |   |

[0A45](https://wiki.blast.hk/gta-sa/opcodes/0A45) |  [setRailtrackResistanceMult](https://wiki.blast.hk/moonloader/lua/setRailtrackResistanceMult)(float tracksFriction) |   |

[0A46](https://wiki.blast.hk/gta-sa/opcodes/0A46) |  [switchObjectBrains](https://wiki.blast.hk/moonloader/lua/switchObjectBrains)(int externalScript, bool canBeStreamedIn) |   |

[0A47](https://wiki.blast.hk/gta-sa/opcodes/0A47) |  [finishSettingUpConversationNoSubtitles](https://wiki.blast.hk/moonloader/lua/finishSettingUpConversationNoSubtitles)() |   |

[0A48](https://wiki.blast.hk/gta-sa/opcodes/0A48) |  [allowPauseInWidescreen](https://wiki.blast.hk/moonloader/lua/allowPauseInWidescreen)(bool enable) |   |

[0A49](https://wiki.blast.hk/gta-sa/opcodes/0A49) |   |  [1:296] |

[0A4A](https://wiki.blast.hk/gta-sa/opcodes/0A4A) |  float x, float y = [getPcMouseMovement](https://wiki.blast.hk/moonloader/lua/getPcMouseMovement)() |   |

[0A4B](https://wiki.blast.hk/gta-sa/opcodes/0A4B) |  bool result = [isPcUsingJoypad](https://wiki.blast.hk/moonloader/lua/isPcUsingJoypad)() |   |

[0A4C](https://wiki.blast.hk/gta-sa/opcodes/0A4C) |  bool result = [isMouseUsingVerticalInversion](https://wiki.blast.hk/moonloader/lua/isMouseUsingVerticalInversion)() |   |

[0A4D](https://wiki.blast.hk/gta-sa/opcodes/0A4D) |   |  [1:297] |

[0A4E](https://wiki.blast.hk/gta-sa/opcodes/0A4E) |   |  [1:298] |

[0A8C](https://wiki.blast.hk/gta-sa/opcodes/0A8C) |  [writeMemory](https://wiki.blast.hk/moonloader/lua/writeMemory)(uint address, uint size, int value, bool virtualProtect) |  [4:5] |

[0A8D](https://wiki.blast.hk/gta-sa/opcodes/0A8D) |  int value = [readMemory](https://wiki.blast.hk/moonloader/lua/readMemory)(uint address, uint size, bool virtualProtect) |  [4:6] |

[0A8E](https://wiki.blast.hk/gta-sa/opcodes/0A8E) |   |  [3:58] |

[0A8F](https://wiki.blast.hk/gta-sa/opcodes/0A8F) |   |  [3:59] |

[0A90](https://wiki.blast.hk/gta-sa/opcodes/0A90) |   |  [3:60] |

[0A91](https://wiki.blast.hk/gta-sa/opcodes/0A91) |   |  [3:61] |

[0A92](https://wiki.blast.hk/gta-sa/opcodes/0A92) |  bool result = [startNewCustomScript](https://wiki.blast.hk/moonloader/lua/startNewCustomScript)(zstring filepath, table args) |   |

[0A93](https://wiki.blast.hk/gta-sa/opcodes/0A93) |   |  [3:62] |

[0A94](https://wiki.blast.hk/gta-sa/opcodes/0A94) |  [launchCustomMission](https://wiki.blast.hk/moonloader/lua/launchCustomMission)(zstring filepath, table args) |   |

[0A95](https://wiki.blast.hk/gta-sa/opcodes/0A95) |   |  [3:63] |

[0A96](https://wiki.blast.hk/gta-sa/opcodes/0A96) |  uint ptr = [getCharPointer](https://wiki.blast.hk/moonloader/lua/getCharPointer)(Ped ped) |  [4:7] |

[0A97](https://wiki.blast.hk/gta-sa/opcodes/0A97) |  uint ptr = [getCarPointer](https://wiki.blast.hk/moonloader/lua/getCarPointer)(Vehicle car) |  [4:8] |

[0A98](https://wiki.blast.hk/gta-sa/opcodes/0A98) |  uint struct = [getObjectPointer](https://wiki.blast.hk/moonloader/lua/getObjectPointer)(Object object) |  [4:9] |

[0A9A](https://wiki.blast.hk/gta-sa/opcodes/0A9A) |  `io.open` |  [2:13] |

[0A9B](https://wiki.blast.hk/gta-sa/opcodes/0A9B) |  `io.close` |  [2:14] |

[0A9C](https://wiki.blast.hk/gta-sa/opcodes/0A9C) |  `file:seek("end")` |  [2:15] |

[0A9D](https://wiki.blast.hk/gta-sa/opcodes/0A9D) |  `file:read` |  [2:16] |

[0A9E](https://wiki.blast.hk/gta-sa/opcodes/0A9E) |  `file:write` |  [2:17] |

[0A9F](https://wiki.blast.hk/gta-sa/opcodes/0A9F) |   |  [3:64] |

[0AA0](https://wiki.blast.hk/gta-sa/opcodes/0AA0) |   |  [3:65] |

[0AA1](https://wiki.blast.hk/gta-sa/opcodes/0AA1) |   |  [3:66] |

[0AA2](https://wiki.blast.hk/gta-sa/opcodes/0AA2) |  bool result, uint handle = [loadDynamicLibrary](https://wiki.blast.hk/moonloader/lua/loadDynamicLibrary)(string library) |  [4:10] |

[0AA3](https://wiki.blast.hk/gta-sa/opcodes/0AA3) |  [freeDynamicLibrary](https://wiki.blast.hk/moonloader/lua/freeDynamicLibrary)(uint handle) |  [4:11] |

[0AA4](https://wiki.blast.hk/gta-sa/opcodes/0AA4) |  bool result, uint proc = [getDynamicLibraryProcedure](https://wiki.blast.hk/moonloader/lua/getDynamicLibraryProcedure)(string proc, uint handle) |  [4:12] |

[0AA7](https://wiki.blast.hk/gta-sa/opcodes/0AA7) |  [callFunction](https://wiki.blast.hk/moonloader/lua/callFunction) |  [2:18] |

[0AA7](https://wiki.blast.hk/gta-sa/opcodes/0AA7) |  int returnValue = [callFunction](https://wiki.blast.hk/moonloader/lua/callFunction)(uint address, int params, int pop, ...) |  [4:13] |

[0AA8](https://wiki.blast.hk/gta-sa/opcodes/0AA8) |  [callMethod](https://wiki.blast.hk/moonloader/lua/callMethod) |  [2:19] |

[0AA8](https://wiki.blast.hk/gta-sa/opcodes/0AA8) |  int returnValue = [callMethod](https://wiki.blast.hk/moonloader/lua/callMethod)(uint address, int struct, int params, int pop, ...) |  [4:14] |

[0AA9](https://wiki.blast.hk/gta-sa/opcodes/0AA9) |  bool result = [isGameVersionOriginal](https://wiki.blast.hk/moonloader/lua/isGameVersionOriginal)() |  [4:15] |

[0AAA](https://wiki.blast.hk/gta-sa/opcodes/0AAA) |  int handle = [getScmThreadStructNamed](https://wiki.blast.hk/moonloader/lua/getScmThreadStructNamed)(GxtString thread) |   |

[0AAB](https://wiki.blast.hk/gta-sa/opcodes/0AAB) |  bool result = [doesFileExist](https://wiki.blast.hk/moonloader/lua/doesFileExist)(string file) |  [4:16] |

[0AAC](https://wiki.blast.hk/gta-sa/opcodes/0AAC) |  AudioStream handle = [loadAudioStream](https://wiki.blast.hk/moonloader/lua/loadAudioStream)(zstring audio) |  [4:17] |

[0AAD](https://wiki.blast.hk/gta-sa/opcodes/0AAD) |  [setAudioStreamState](https://wiki.blast.hk/moonloader/lua/setAudioStreamState)(AudioStream handle, int state) |  [4:18] |

[0AAE](https://wiki.blast.hk/gta-sa/opcodes/0AAE) |  [releaseAudioStream](https://wiki.blast.hk/moonloader/lua/releaseAudioStream)(AudioStream handle) |  [4:19] |

[0AAF](https://wiki.blast.hk/gta-sa/opcodes/0AAF) |  double length = [getAudioStreamLength](https://wiki.blast.hk/moonloader/lua/getAudioStreamLength)(AudioStream handle) |  [4:20] |

[0AB0](https://wiki.blast.hk/gta-sa/opcodes/0AB0) |  [isKeyDown](https://wiki.blast.hk/moonloader/lua/isKeyDown) |  [2:20] |

[0AB0](https://wiki.blast.hk/gta-sa/opcodes/0AB0) |  bool state = [isKeyDown](https://wiki.blast.hk/moonloader/lua/isKeyDown)(int keyId) |  [4:21] |

[0AB1](https://wiki.blast.hk/gta-sa/opcodes/0AB1) |   |  [3:67] |

[0AB2](https://wiki.blast.hk/gta-sa/opcodes/0AB2) |   |  [3:68] |

[0AB3](https://wiki.blast.hk/gta-sa/opcodes/0AB3) |  [setCleoSharedVar](https://wiki.blast.hk/moonloader/lua/setCleoSharedVar)(int var, int value) |   |

[0AB4](https://wiki.blast.hk/gta-sa/opcodes/0AB4) |  int value = [getCleoSharedVar](https://wiki.blast.hk/moonloader/lua/getCleoSharedVar)(int var) |   |

[0AB5](https://wiki.blast.hk/gta-sa/opcodes/0AB5) |  Vehicle car, Ped ped = [storeClosestEntities](https://wiki.blast.hk/moonloader/lua/storeClosestEntities)(Ped ped) |  [4:22] |

[0AB6](https://wiki.blast.hk/gta-sa/opcodes/0AB6) |  bool result, float posX, float posY, float posZ = [getTargetBlipCoordinates](https://wiki.blast.hk/moonloader/lua/getTargetBlipCoordinates)() |  [4:23] |

[0AB7](https://wiki.blast.hk/gta-sa/opcodes/0AB7) |  int gears = [getCarNumberOfGears](https://wiki.blast.hk/moonloader/lua/getCarNumberOfGears)(Vehicle car) |  [4:24] |

[0AB8](https://wiki.blast.hk/gta-sa/opcodes/0AB8) |  int gear = [getCarCurrentGear](https://wiki.blast.hk/moonloader/lua/getCarCurrentGear)(Vehicle car) |  [4:25] |

[0AB9](https://wiki.blast.hk/gta-sa/opcodes/0AB9) |  int state = [getAudioStreamState](https://wiki.blast.hk/moonloader/lua/getAudioStreamState)(AudioStream handle) |  [4:26] |

[0ABA](https://wiki.blast.hk/gta-sa/opcodes/0ABA) |   |  [3:69] |

[0ABB](https://wiki.blast.hk/gta-sa/opcodes/0ABB) |  float volume = [getAudioStreamVolume](https://wiki.blast.hk/moonloader/lua/getAudioStreamVolume)(AudioStream audio) |  [4:27] |

[0ABC](https://wiki.blast.hk/gta-sa/opcodes/0ABC) |  [setAudioStreamVolume](https://wiki.blast.hk/moonloader/lua/setAudioStreamVolume)(AudioStream audio, float volume) |  [4:28] |

[0ABD](https://wiki.blast.hk/gta-sa/opcodes/0ABD) |  bool state = [isCarSirenOn](https://wiki.blast.hk/moonloader/lua/isCarSirenOn)(Vehicle car) |  [4:29] |

[0ABE](https://wiki.blast.hk/gta-sa/opcodes/0ABE) |  bool state = [isCarEngineOn](https://wiki.blast.hk/moonloader/lua/isCarEngineOn)(Vehicle car) |  [4:30] |

[0ABF](https://wiki.blast.hk/gta-sa/opcodes/0ABF) |  [switchCarEngine](https://wiki.blast.hk/moonloader/lua/switchCarEngine)(Vehicle car, bool state) |  [4:31] |

[0AC0](https://wiki.blast.hk/gta-sa/opcodes/0AC0) |  [setAudioStreamLooped](https://wiki.blast.hk/moonloader/lua/setAudioStreamLooped)(AudioStream audio, bool loop) |  [4:32] |

[0AC1](https://wiki.blast.hk/gta-sa/opcodes/0AC1) |  AudioStream handle = [load3dAudioStream](https://wiki.blast.hk/moonloader/lua/load3dAudioStream)(zstring audio) |  [4:33] |

[0AC2](https://wiki.blast.hk/gta-sa/opcodes/0AC2) |  [setPlay3dAudioStreamAtCoordinates](https://wiki.blast.hk/moonloader/lua/setPlay3dAudioStreamAtCoordinates)(AudioStream handle, float posX, float posY, float posZ) |  [4:34] |

[0AC3](https://wiki.blast.hk/gta-sa/opcodes/0AC3) |  [setPlay3dAudioStreamAtObject](https://wiki.blast.hk/moonloader/lua/setPlay3dAudioStreamAtObject)(AudioStream audio, Object object) |  [4:35] |

[0AC4](https://wiki.blast.hk/gta-sa/opcodes/0AC4) |  [setPlay3dAudioStreamAtChar](https://wiki.blast.hk/moonloader/lua/setPlay3dAudioStreamAtChar)(AudioStream audio, Ped ped) |  [4:36] |

[0AC5](https://wiki.blast.hk/gta-sa/opcodes/0AC5) |  [setPlay3dAudioStreamAtCar](https://wiki.blast.hk/moonloader/lua/setPlay3dAudioStreamAtCar)(AudioStream audio, Vehicle car) |  [4:37] |

[0AC6](https://wiki.blast.hk/gta-sa/opcodes/0AC6) |   |  [3:70] |

[0AC7](https://wiki.blast.hk/gta-sa/opcodes/0AC7) |   |  [3:71] |

[0AC8](https://wiki.blast.hk/gta-sa/opcodes/0AC8) |  uint memory = [allocateMemory](https://wiki.blast.hk/moonloader/lua/allocateMemory)(uint size) |  [4:38] |

[0AC9](https://wiki.blast.hk/gta-sa/opcodes/0AC9) |  [freeMemory](https://wiki.blast.hk/moonloader/lua/freeMemory)(uint memory) |  [4:39] |

[0ACA](https://wiki.blast.hk/gta-sa/opcodes/0ACA) |  [printHelpString](https://wiki.blast.hk/moonloader/lua/printHelpString)(string text) |  [4:40] |

[0ACB](https://wiki.blast.hk/gta-sa/opcodes/0ACB) |  [printStyledString](https://wiki.blast.hk/moonloader/lua/printStyledString)(string text, int time, int style) |  [4:41] |

[0ACC](https://wiki.blast.hk/gta-sa/opcodes/0ACC) |  [printString](https://wiki.blast.hk/moonloader/lua/printString)(string text, int time) |  [4:42] |

[0ACD](https://wiki.blast.hk/gta-sa/opcodes/0ACD) |  [printStringNow](https://wiki.blast.hk/moonloader/lua/printStringNow)(string text, int time) |  [4:43] |

[0ACE](https://wiki.blast.hk/gta-sa/opcodes/0ACE) |   |  [5] |

[0ACF](https://wiki.blast.hk/gta-sa/opcodes/0ACF) |   |  [5:1] |

[0AD0](https://wiki.blast.hk/gta-sa/opcodes/0AD0) |   |  [5:2] |

[0AD1](https://wiki.blast.hk/gta-sa/opcodes/0AD1) |   |  [5:3] |

[0AD2](https://wiki.blast.hk/gta-sa/opcodes/0AD2) |  bool result, Ped ped = [getCharPlayerIsTargeting](https://wiki.blast.hk/moonloader/lua/getCharPlayerIsTargeting)(Player player) |  [4:44] |

[0AD3](https://wiki.blast.hk/gta-sa/opcodes/0AD3) |  `string.format` |  [2:21] |

[0AD4](https://wiki.blast.hk/gta-sa/opcodes/0AD4) |  `string.match` |  [2:22] |

[0AD5](https://wiki.blast.hk/gta-sa/opcodes/0AD5) |  `file:seek` |  [2:23] |

[0AD6](https://wiki.blast.hk/gta-sa/opcodes/0AD6) |  `file:read(0)` |  [2:24] |

[0AD7](https://wiki.blast.hk/gta-sa/opcodes/0AD7) |  `file:read` |  [2:25] |

[0AD8](https://wiki.blast.hk/gta-sa/opcodes/0AD8) |  `file:write` |  [2:26] |

[0AD9](https://wiki.blast.hk/gta-sa/opcodes/0AD9) |   |  [5:4] |

[0ADA](https://wiki.blast.hk/gta-sa/opcodes/0ADA) |   |  [6] |

[0ADB](https://wiki.blast.hk/gta-sa/opcodes/0ADB) |  GxtString name = [getNameOfVehicleModel](https://wiki.blast.hk/moonloader/lua/getNameOfVehicleModel)(Model modelId) |  [4:45] |

[0ADC](https://wiki.blast.hk/gta-sa/opcodes/0ADC) |  bool result = [testCheat](https://wiki.blast.hk/moonloader/lua/testCheat)(string text) |  [4:46] |

[0ADD](https://wiki.blast.hk/gta-sa/opcodes/0ADD) |  bool result = [spawnVehicleByCheating](https://wiki.blast.hk/moonloader/lua/spawnVehicleByCheating)(Model modelId) |  [4:47] |

[0ADE](https://wiki.blast.hk/gta-sa/opcodes/0ADE) |  [getGxtText](https://wiki.blast.hk/moonloader/lua/getGxtText) |  [2:27] |

[0ADE](https://wiki.blast.hk/gta-sa/opcodes/0ADE) |  string text = [getGxtText](https://wiki.blast.hk/moonloader/lua/getGxtText)(string key) |  [4:48] |

[0ADF](https://wiki.blast.hk/gta-sa/opcodes/0ADF) |  [setGxtEntry](https://wiki.blast.hk/moonloader/lua/setGxtEntry) |  [2:28] |

[0ADF](https://wiki.blast.hk/gta-sa/opcodes/0ADF) |  [setGxtEntry](https://wiki.blast.hk/moonloader/lua/setGxtEntry)(string key, string text) |  [4:49] |

[0AE0](https://wiki.blast.hk/gta-sa/opcodes/0AE0) |  [clearGxtEntry](https://wiki.blast.hk/moonloader/lua/clearGxtEntry) |  [2:29] |

[0AE0](https://wiki.blast.hk/gta-sa/opcodes/0AE0) |  [clearGxtEntry](https://wiki.blast.hk/moonloader/lua/clearGxtEntry)(string key) |  [4:50] |

[0AE1](https://wiki.blast.hk/gta-sa/opcodes/0AE1) |  bool result, Ped ped = [findAllRandomCharsInSphere](https://wiki.blast.hk/moonloader/lua/findAllRandomCharsInSphere)(float posX, float posY, float posZ, float radius, bool findNext, bool skipDead) |  [4:51] |

[0AE2](https://wiki.blast.hk/gta-sa/opcodes/0AE2) |  bool result, Vehicle car = [findAllRandomVehiclesInSphere](https://wiki.blast.hk/moonloader/lua/findAllRandomVehiclesInSphere)(float posX, float posY, float posZ, float radius, bool findNext, bool skipWrecked) |  [4:52] |

[0AE3](https://wiki.blast.hk/gta-sa/opcodes/0AE3) |  bool result, Object object = [findAllRandomObjectsInSphere](https://wiki.blast.hk/moonloader/lua/findAllRandomObjectsInSphere)(float posX, float posY, float posZ, float radius, bool findNext) |  [4:53] |

[0AE4](https://wiki.blast.hk/gta-sa/opcodes/0AE4) |  bool result = [doesDirectoryExist](https://wiki.blast.hk/moonloader/lua/doesDirectoryExist)(string directory) |  [4:54] |

[0AE5](https://wiki.blast.hk/gta-sa/opcodes/0AE5) |  bool result = [createDirectory](https://wiki.blast.hk/moonloader/lua/createDirectory)(string directory) |  [4:55] |

[0AE6](https://wiki.blast.hk/gta-sa/opcodes/0AE6) |  Filesearch handle, string name = [findFirstFile](https://wiki.blast.hk/moonloader/lua/findFirstFile)(string mask) |  [4:56] |

[0AE7](https://wiki.blast.hk/gta-sa/opcodes/0AE7) |  string file = [findNextFile](https://wiki.blast.hk/moonloader/lua/findNextFile)(Filesearch handle) |  [4:57] |

[0AE8](https://wiki.blast.hk/gta-sa/opcodes/0AE8) |  [findClose](https://wiki.blast.hk/moonloader/lua/findClose)(Filesearch handle) |  [4:58] |

[0AE9](https://wiki.blast.hk/gta-sa/opcodes/0AE9) |  float val = [popFloat](https://wiki.blast.hk/moonloader/lua/popFloat)() |  [4:59] |

[0AEA](https://wiki.blast.hk/gta-sa/opcodes/0AEA) |  Ped handle = [getCharPointerHandle](https://wiki.blast.hk/moonloader/lua/getCharPointerHandle)(uint ptr) |  [4:60] |

[0AEB](https://wiki.blast.hk/gta-sa/opcodes/0AEB) |  Vehicle handle = [getVehiclePointerHandle](https://wiki.blast.hk/moonloader/lua/getVehiclePointerHandle)(uint ptr) |  [4:61] |

[0AEC](https://wiki.blast.hk/gta-sa/opcodes/0AEC) |  Object handle = [getObjectPointerHandle](https://wiki.blast.hk/moonloader/lua/getObjectPointerHandle)(uint ptr) |  [4:62] |

[0AED](https://wiki.blast.hk/gta-sa/opcodes/0AED) |  `string.format` |  [2:30] |

[0AEE](https://wiki.blast.hk/gta-sa/opcodes/0AEE) |  `math.exp` |  [2:31] |

[0AEF](https://wiki.blast.hk/gta-sa/opcodes/0AEF) |  `math.log` |  [2:32] |

[0AF0](https://wiki.blast.hk/gta-sa/opcodes/0AF0) |   |  [7] |

[0AF1](https://wiki.blast.hk/gta-sa/opcodes/0AF1) |   |  [7:1] |

[0AF2](https://wiki.blast.hk/gta-sa/opcodes/0AF2) |   |  [7:2] |

[0AF3](https://wiki.blast.hk/gta-sa/opcodes/0AF3) |   |  [7:3] |

[0AF4](https://wiki.blast.hk/gta-sa/opcodes/0AF4) |   |  [7:4] |

[0AF5](https://wiki.blast.hk/gta-sa/opcodes/0AF5) |   |  [7:5] |

[0AF6](https://wiki.blast.hk/gta-sa/opcodes/0AF6) |  [sampSpawnPlayer](https://wiki.blast.hk/moonloader/lua/sampSpawnPlayer)() |   |

[0AF7](https://wiki.blast.hk/gta-sa/opcodes/0AF7) |  uint handle = [sampGetBase](https://wiki.blast.hk/moonloader/lua/sampGetBase)() |   |

[0AF8](https://wiki.blast.hk/gta-sa/opcodes/0AF8) |  [sampAddChatMessage](https://wiki.blast.hk/moonloader/lua/sampAddChatMessage)(zstring text, uint color) |   |

[0AF9](https://wiki.blast.hk/gta-sa/opcodes/0AF9) |  [sampSendChat](https://wiki.blast.hk/moonloader/lua/sampSendChat)(zstring text) |   |

[0AFA](https://wiki.blast.hk/gta-sa/opcodes/0AFA) |  bool result = [isSampAvailable](https://wiki.blast.hk/moonloader/lua/isSampAvailable)() |   |

[0AFB](https://wiki.blast.hk/gta-sa/opcodes/0AFB) |  [sampRequestClass](https://wiki.blast.hk/moonloader/lua/sampRequestClass)(int class) |   |

[0AFC](https://wiki.blast.hk/gta-sa/opcodes/0AFC) |  [sampSendScmEvent](https://wiki.blast.hk/moonloader/lua/sampSendScmEvent)(int event, int id, int param1, int param2) |   |

[0AFD](https://wiki.blast.hk/gta-sa/opcodes/0AFD) |  [sampSetSpecialAction](https://wiki.blast.hk/moonloader/lua/sampSetSpecialAction)(int action) |   |

[0AFE](https://wiki.blast.hk/gta-sa/opcodes/0AFE) |  [sampSendDeathByPlayer](https://wiki.blast.hk/moonloader/lua/sampSendDeathByPlayer)(int playerId, int reason) |   |

[0AFF](https://wiki.blast.hk/gta-sa/opcodes/0AFF) |  bool result, Vehicle car = [sampGetCarHandleBySampVehicleId](https://wiki.blast.hk/moonloader/lua/sampGetCarHandleBySampVehicleId)(int id) |   |

[0B00](https://wiki.blast.hk/gta-sa/opcodes/0B00) |  `os.remove` |  [2:33] |

[0B01](https://wiki.blast.hk/gta-sa/opcodes/0B01) |  `os.remove` |  [2:34] может удалять только пустые директории |

[0B02](https://wiki.blast.hk/gta-sa/opcodes/0B02) |   |  [8] |

[0B03](https://wiki.blast.hk/gta-sa/opcodes/0B03) |   |  [8:1] |

[0B04](https://wiki.blast.hk/gta-sa/opcodes/0B04) |   |  [8:2] |

[0B05](https://wiki.blast.hk/gta-sa/opcodes/0B05) |   |  [8:3] |

[0B10](https://wiki.blast.hk/gta-sa/opcodes/0B10) |  `bit.band` |  [2:35] |

[0B11](https://wiki.blast.hk/gta-sa/opcodes/0B11) |  `bit.bor` |  [2:36] |

[0B12](https://wiki.blast.hk/gta-sa/opcodes/0B12) |  `bit.bxor` |  [2:37] |

[0B13](https://wiki.blast.hk/gta-sa/opcodes/0B13) |  `bit.bnot` |  [2:38] |

[0B14](https://wiki.blast.hk/gta-sa/opcodes/0B14) |  `math.fmod` |  [2:39] |

[0B15](https://wiki.blast.hk/gta-sa/opcodes/0B15) |  `bit.rshift` |  [2:40] |

[0B16](https://wiki.blast.hk/gta-sa/opcodes/0B16) |  `bit.lshift` |  [2:41] |

[0B20](https://wiki.blast.hk/gta-sa/opcodes/0B20) |  bool result, Ped ped = [sampGetCharHandleBySampPlayerId](https://wiki.blast.hk/moonloader/lua/sampGetCharHandleBySampPlayerId)(int id) |   |

[0B21](https://wiki.blast.hk/gta-sa/opcodes/0B21) |  bool result = [sampIsChatInputActive](https://wiki.blast.hk/moonloader/lua/sampIsChatInputActive)() |   |

[0B22](https://wiki.blast.hk/gta-sa/opcodes/0B22) |  [sampSetSendrate](https://wiki.blast.hk/moonloader/lua/sampSetSendrate)(int type, int rate) |   |

[0B23](https://wiki.blast.hk/gta-sa/opcodes/0B23) |  bool result = [sampIsPlayerConnected](https://wiki.blast.hk/moonloader/lua/sampIsPlayerConnected)(int id) |   |

[0B24](https://wiki.blast.hk/gta-sa/opcodes/0B24) |  uint structPtr = [sampGetPlayerStructPtr](https://wiki.blast.hk/moonloader/lua/sampGetPlayerStructPtr)(int id) |   |

[0B25](https://wiki.blast.hk/gta-sa/opcodes/0B25) |  int health = [sampGetPlayerHealth](https://wiki.blast.hk/moonloader/lua/sampGetPlayerHealth)(int id) |   |

[0B26](https://wiki.blast.hk/gta-sa/opcodes/0B26) |  int armor = [sampGetPlayerArmor](https://wiki.blast.hk/moonloader/lua/sampGetPlayerArmor)(int id) |   |

[0B27](https://wiki.blast.hk/gta-sa/opcodes/0B27) |  [sampSetGamestate](https://wiki.blast.hk/moonloader/lua/sampSetGamestate)(int gamestate) |   |

[0B28](https://wiki.blast.hk/gta-sa/opcodes/0B28) |  [sampDisconnectWithReason](https://wiki.blast.hk/moonloader/lua/sampDisconnectWithReason)(bool timeout) |   |

[0B29](https://wiki.blast.hk/gta-sa/opcodes/0B29) |  [sampSetLocalPlayerName](https://wiki.blast.hk/moonloader/lua/sampSetLocalPlayerName)(zstring name) |   |

[0B2A](https://wiki.blast.hk/gta-sa/opcodes/0B2A) |  int ping = [sampGetPlayerPing](https://wiki.blast.hk/moonloader/lua/sampGetPlayerPing)(int id) |   |

[0B2B](https://wiki.blast.hk/gta-sa/opcodes/0B2B) |  bool result, int id = [sampGetPlayerIdByCharHandle](https://wiki.blast.hk/moonloader/lua/sampGetPlayerIdByCharHandle)(Ped ped) |   |

[0B2C](https://wiki.blast.hk/gta-sa/opcodes/0B2C) |  bool result, int id = [sampGetVehicleIdByCarHandle](https://wiki.blast.hk/moonloader/lua/sampGetVehicleIdByCarHandle)(Vehicle car) |   |

[0B2D](https://wiki.blast.hk/gta-sa/opcodes/0B2D) |   |  [9] |

[0B2E](https://wiki.blast.hk/gta-sa/opcodes/0B2E) |   |  [9:1] |

[0B2F](https://wiki.blast.hk/gta-sa/opcodes/0B2F) |  bool result, float posX, float posY, float posZ = [sampGetStreamedOutPlayerPos](https://wiki.blast.hk/moonloader/lua/sampGetStreamedOutPlayerPos)(int id) |   |

[0B30](https://wiki.blast.hk/gta-sa/opcodes/0B30) |  [sampSendEnterVehicle](https://wiki.blast.hk/moonloader/lua/sampSendEnterVehicle)(int id, bool passenger) |   |

[0B31](https://wiki.blast.hk/gta-sa/opcodes/0B31) |  [sampSendExitVehicle](https://wiki.blast.hk/moonloader/lua/sampSendExitVehicle)(int id) |   |

[0B32](https://wiki.blast.hk/gta-sa/opcodes/0B32) |  [sampSendSpawn](https://wiki.blast.hk/moonloader/lua/sampSendSpawn)() |   |

[0B33](https://wiki.blast.hk/gta-sa/opcodes/0B33) |  [sampSendDamageVehicle](https://wiki.blast.hk/moonloader/lua/sampSendDamageVehicle)(Vehicle car, int panel, int doors, int lights, int tires) |   |

[0B34](https://wiki.blast.hk/gta-sa/opcodes/0B34) |  bool result = [sampRegisterChatCommand](https://wiki.blast.hk/moonloader/lua/sampRegisterChatCommand)(zstring cmd, function func) |   |

[0B35](https://wiki.blast.hk/gta-sa/opcodes/0B35) |   |  [10] |

[0B36](https://wiki.blast.hk/gta-sa/opcodes/0B36) |  zstring name = [sampGetPlayerNickname](https://wiki.blast.hk/moonloader/lua/sampGetPlayerNickname)(int id) |   |

[0B37](https://wiki.blast.hk/gta-sa/opcodes/0B37) |  uint color = [sampGetPlayerColor](https://wiki.blast.hk/moonloader/lua/sampGetPlayerColor)(int id) |   |

[0B38](https://wiki.blast.hk/gta-sa/opcodes/0B38) |  [sampConnectToServer](https://wiki.blast.hk/moonloader/lua/sampConnectToServer)(zstring ip, uint port) |   |

[0B39](https://wiki.blast.hk/gta-sa/opcodes/0B39) |  zstring ip, uint port = [sampGetCurrentServerAddress](https://wiki.blast.hk/moonloader/lua/sampGetCurrentServerAddress)() |   |

[0B3A](https://wiki.blast.hk/gta-sa/opcodes/0B3A) |  zstring name = [sampGetCurrentServerName](https://wiki.blast.hk/moonloader/lua/sampGetCurrentServerName)() |   |

[0B3B](https://wiki.blast.hk/gta-sa/opcodes/0B3B) |  [sampShowDialog](https://wiki.blast.hk/moonloader/lua/sampShowDialog)(int id, zstring caption, zstring text, zstring button1, zstring button2, int style) |   |

[0B3C](https://wiki.blast.hk/gta-sa/opcodes/0B3C) |  bool result, int button, int list, zstring input = [sampHasDialogRespond](https://wiki.blast.hk/moonloader/lua/sampHasDialogRespond)(int id) |   |

[0B3D](https://wiki.blast.hk/gta-sa/opcodes/0B3D) |  Bitstream bs = [raknetNewBitStream](https://wiki.blast.hk/moonloader/lua/raknetNewBitStream)() |   |

[0B3E](https://wiki.blast.hk/gta-sa/opcodes/0B3E) |  [raknetDeleteBitStream](https://wiki.blast.hk/moonloader/lua/raknetDeleteBitStream)(Bitstream bs) |   |

[0B3F](https://wiki.blast.hk/gta-sa/opcodes/0B3F) |  [raknetResetBitStream](https://wiki.blast.hk/moonloader/lua/raknetResetBitStream)(Bitstream bs) |   |

[0B40](https://wiki.blast.hk/gta-sa/opcodes/0B40) |  [raknetBitStreamWriteBitStream](https://wiki.blast.hk/moonloader/lua/raknetBitStreamWriteBitStream)(Bitstream bs, Bitstream bitStream) |   |

[0B40](https://wiki.blast.hk/gta-sa/opcodes/0B40) |  [raknetBitStreamWriteBool](https://wiki.blast.hk/moonloader/lua/raknetBitStreamWriteBool)(Bitstream bs, bool value) |   |

[0B40](https://wiki.blast.hk/gta-sa/opcodes/0B40) |  [raknetBitStreamWriteBuffer](https://wiki.blast.hk/moonloader/lua/raknetBitStreamWriteBuffer)(Bitstream bs, uint dest, uint size) |   |

[0B40](https://wiki.blast.hk/gta-sa/opcodes/0B40) |  [raknetBitStreamWriteFloat](https://wiki.blast.hk/moonloader/lua/raknetBitStreamWriteFloat)(Bitstream bs, float value) |   |

[0B40](https://wiki.blast.hk/gta-sa/opcodes/0B40) |  [raknetBitStreamWriteInt16](https://wiki.blast.hk/moonloader/lua/raknetBitStreamWriteInt16)(Bitstream bs, int value) |   |

[0B40](https://wiki.blast.hk/gta-sa/opcodes/0B40) |  [raknetBitStreamWriteInt32](https://wiki.blast.hk/moonloader/lua/raknetBitStreamWriteInt32)(Bitstream bs, int value) |   |

[0B40](https://wiki.blast.hk/gta-sa/opcodes/0B40) |  [raknetBitStreamWriteInt8](https://wiki.blast.hk/moonloader/lua/raknetBitStreamWriteInt8)(Bitstream bs, int value) |   |

[0B40](https://wiki.blast.hk/gta-sa/opcodes/0B40) |  [raknetBitStreamWriteString](https://wiki.blast.hk/moonloader/lua/raknetBitStreamWriteString)(Bitstream bs, string str) |   |

[0B41](https://wiki.blast.hk/gta-sa/opcodes/0B41) |  [raknetSendRpcEx](https://wiki.blast.hk/moonloader/lua/raknetSendRpcEx)(int rpc, Bitstream bs, int priority, int reliability, int channel, bool timestamp) |   |

[0B42](https://wiki.blast.hk/gta-sa/opcodes/0B42) |  [raknetSendBitStreamEx](https://wiki.blast.hk/moonloader/lua/raknetSendBitStreamEx)(Bitstream bs, int priority, int reliability, int channel) |   |

[0B43](https://wiki.blast.hk/gta-sa/opcodes/0B43) |   |  [3:72] |

[0B44](https://wiki.blast.hk/gta-sa/opcodes/0B44) |  int textlabel = [sampCreate3dText](https://wiki.blast.hk/moonloader/lua/sampCreate3dText)(zstring text, uint color, float posX, float posY, float posZ, float distance, bool ignoreWalls, int playerId, int vehicleId) |   |

[0B45](https://wiki.blast.hk/gta-sa/opcodes/0B45) |  [sampDestroy3dText](https://wiki.blast.hk/moonloader/lua/sampDestroy3dText)(int textlabel) |   |

[0B46](https://wiki.blast.hk/gta-sa/opcodes/0B46) |  bool result = [sampIs3dTextDefined](https://wiki.blast.hk/moonloader/lua/sampIs3dTextDefined)(int 3dText) |   |

[0B47](https://wiki.blast.hk/gta-sa/opcodes/0B47) |  [sampCloseCurrentDialogWithButton](https://wiki.blast.hk/moonloader/lua/sampCloseCurrentDialogWithButton)(int button) |   |

[0B48](https://wiki.blast.hk/gta-sa/opcodes/0B48) |  int list = [sampGetCurrentDialogListItem](https://wiki.blast.hk/moonloader/lua/sampGetCurrentDialogListItem)() |   |

[0B49](https://wiki.blast.hk/gta-sa/opcodes/0B49) |  [sampSetCurrentDialogListItem](https://wiki.blast.hk/moonloader/lua/sampSetCurrentDialogListItem)(int list) |   |

[0B4A](https://wiki.blast.hk/gta-sa/opcodes/0B4A) |  zstring text = [sampGetCurrentDialogEditboxText](https://wiki.blast.hk/moonloader/lua/sampGetCurrentDialogEditboxText)() |   |

[0B4B](https://wiki.blast.hk/gta-sa/opcodes/0B4B) |  [sampSetCurrentDialogEditboxText](https://wiki.blast.hk/moonloader/lua/sampSetCurrentDialogEditboxText)(zstring text) |   |

[0B4C](https://wiki.blast.hk/gta-sa/opcodes/0B4C) |  bool result = [sampIsDialogActive](https://wiki.blast.hk/moonloader/lua/sampIsDialogActive)() |   |

[0B4D](https://wiki.blast.hk/gta-sa/opcodes/0B4D) |  int type = [sampGetCurrentDialogType](https://wiki.blast.hk/moonloader/lua/sampGetCurrentDialogType)() |   |

[0B4E](https://wiki.blast.hk/gta-sa/opcodes/0B4E) |  int id = [sampGetCurrentDialogId](https://wiki.blast.hk/moonloader/lua/sampGetCurrentDialogId)() |   |

[0B4F](https://wiki.blast.hk/gta-sa/opcodes/0B4F) |  int gamestate = [sampGetGamestate](https://wiki.blast.hk/moonloader/lua/sampGetGamestate)() |   |

[0B50](https://wiki.blast.hk/gta-sa/opcodes/0B50) |  Object object = [sampGetObjectHandleBySampId](https://wiki.blast.hk/moonloader/lua/sampGetObjectHandleBySampId)(int id) |   |

[0B51](https://wiki.blast.hk/gta-sa/opcodes/0B51) |  Pickup pickup = [sampGetPickupHandleBySampId](https://wiki.blast.hk/moonloader/lua/sampGetPickupHandleBySampId)(int id) |   |

[0B52](https://wiki.blast.hk/gta-sa/opcodes/0B52) |  int objectId = [sampGetObjectSampIdByHandle](https://wiki.blast.hk/moonloader/lua/sampGetObjectSampIdByHandle)(Object object) |   |

[0B53](https://wiki.blast.hk/gta-sa/opcodes/0B53) |  int pickupId = [sampGetPickupSampIdByHandle](https://wiki.blast.hk/moonloader/lua/sampGetPickupSampIdByHandle)(Pickup pickup) |   |

[0B54](https://wiki.blast.hk/gta-sa/opcodes/0B54) |  int count = [sampGetListboxItemsCount](https://wiki.blast.hk/moonloader/lua/sampGetListboxItemsCount)() |   |

[0B55](https://wiki.blast.hk/gta-sa/opcodes/0B55) |  float wposX, float wposY = [convert3DCoordsToScreen](https://wiki.blast.hk/moonloader/lua/convert3DCoordsToScreen)(float posX, float posY, float posZ) |  [4:63] |

[0B56](https://wiki.blast.hk/gta-sa/opcodes/0B56) |  [setGameKeyState](https://wiki.blast.hk/moonloader/lua/setGameKeyState)(int key, int state) |  [4:64] |

[0B57](https://wiki.blast.hk/gta-sa/opcodes/0B57) |  int animid = [sampGetPlayerAnimationId](https://wiki.blast.hk/moonloader/lua/sampGetPlayerAnimationId)(int playerId) |   |

[0B58](https://wiki.blast.hk/gta-sa/opcodes/0B58) |  zstring file, zstring name = [sampGetAnimationNameAndFile](https://wiki.blast.hk/moonloader/lua/sampGetAnimationNameAndFile)(int animid) |   |

[0B59](https://wiki.blast.hk/gta-sa/opcodes/0B59) |  int id = [sampFindAnimationIdByNameAndFile](https://wiki.blast.hk/moonloader/lua/sampFindAnimationIdByNameAndFile)(zstring name, zstring file) |   |

[0B5A](https://wiki.blast.hk/gta-sa/opcodes/0B5A) |  int resX, int resY = [getScreenResolution](https://wiki.blast.hk/moonloader/lua/getScreenResolution)() |   |

[0B5B](https://wiki.blast.hk/gta-sa/opcodes/0B5B) |  zstring text = [sampGetListboxItemText](https://wiki.blast.hk/moonloader/lua/sampGetListboxItemText)(int item) |   |

[0B5C](https://wiki.blast.hk/gta-sa/opcodes/0B5C) |  bool result = [sampIsPlayerPaused](https://wiki.blast.hk/moonloader/lua/sampIsPlayerPaused)(int id) |   |

[0B5D](https://wiki.blast.hk/gta-sa/opcodes/0B5D) |  [sampToggleCursor](https://wiki.blast.hk/moonloader/lua/sampToggleCursor)(bool show) |   |

[0B5E](https://wiki.blast.hk/gta-sa/opcodes/0B5E) |  int posX, int posY = [getCursorPos](https://wiki.blast.hk/moonloader/lua/getCursorPos)() |  [4:65] |

[0B5F](https://wiki.blast.hk/gta-sa/opcodes/0B5F) |  float gposX, float gposY = [convertWindowScreenCoordsToGameScreenCoords](https://wiki.blast.hk/moonloader/lua/convertWindowScreenCoordsToGameScreenCoords)(float wposX, float wposY) |  [4:66] |

[0B60](https://wiki.blast.hk/gta-sa/opcodes/0B60) |  float wposX, float wposY = [convertGameScreenCoordsToWindowScreenCoords](https://wiki.blast.hk/moonloader/lua/convertGameScreenCoordsToWindowScreenCoords)(float gposX, float gposY) |  [4:67] |

[0B61](https://wiki.blast.hk/gta-sa/opcodes/0B61) |  bool result = [sampIsLocalPlayerSpawned](https://wiki.blast.hk/moonloader/lua/sampIsLocalPlayerSpawned)() |   |

[0B62](https://wiki.blast.hk/gta-sa/opcodes/0B62) |  int action = [sampGetPlayerSpecialAction](https://wiki.blast.hk/moonloader/lua/sampGetPlayerSpecialAction)(int id) |   |

[0B63](https://wiki.blast.hk/gta-sa/opcodes/0B63) |  bool result = [sampUnregisterChatCommand](https://wiki.blast.hk/moonloader/lua/sampUnregisterChatCommand)(zstring cmd) |   |

[0B64](https://wiki.blast.hk/gta-sa/opcodes/0B64) |  bool result = [sampIsPlayerNpc](https://wiki.blast.hk/moonloader/lua/sampIsPlayerNpc)(int id) |   |

[0B65](https://wiki.blast.hk/gta-sa/opcodes/0B65) |  int score = [sampGetPlayerScore](https://wiki.blast.hk/moonloader/lua/sampGetPlayerScore)(int id) |   |

[0B66](https://wiki.blast.hk/gta-sa/opcodes/0B66) |   |  [11] |

[0B67](https://wiki.blast.hk/gta-sa/opcodes/0B67) |   |  [11:1] |

[0B68](https://wiki.blast.hk/gta-sa/opcodes/0B68) |  [renderDrawLine](https://wiki.blast.hk/moonloader/lua/DrawLine)(float pos1X, float pos1Y, float pos2X, float pos2Y, float width, uint color) |  [4:68] |

[0B69](https://wiki.blast.hk/gta-sa/opcodes/0B69) |  [renderDrawBox](https://wiki.blast.hk/moonloader/lua/DrawBox)(float posX, float posY, float sizeX, float sizeY, uint color) |  [4:69] |

[0B6A](https://wiki.blast.hk/gta-sa/opcodes/0B6A) |  [renderDrawBoxWithBorder](https://wiki.blast.hk/moonloader/lua/DrawBoxWithBorder)(float posX, float posY, float sizeX, float sizeY, uint color, float bsize, uint bcolor) |  [4:70] |

[0B6B](https://wiki.blast.hk/gta-sa/opcodes/0B6B) |  float length = [renderGetFontDrawTextLength](https://wiki.blast.hk/moonloader/lua/GetFontDrawTextLength)(DxFont font, zstring text, [bool ignoreColorTags=false]) |  [4:71] |

[0B6C](https://wiki.blast.hk/gta-sa/opcodes/0B6C) |  float height = [renderGetFontDrawHeight](https://wiki.blast.hk/moonloader/lua/GetFontDrawHeight)(DxFont font) |  [4:72] |

[0B6D](https://wiki.blast.hk/gta-sa/opcodes/0B6D) |  DxFont font = [renderCreateFont](https://wiki.blast.hk/moonloader/lua/CreateFont)(zstring font, int height, uint flags, [uint charset]) |  [4:73] |

[0B6E](https://wiki.blast.hk/gta-sa/opcodes/0B6E) |  [renderReleaseFont](https://wiki.blast.hk/moonloader/lua/ReleaseFont)(DxFont font) |  [4:74] |

[0B6F](https://wiki.blast.hk/gta-sa/opcodes/0B6F) |  [renderFontDrawText](https://wiki.blast.hk/moonloader/lua/FontDrawText)(DxFont font, zstring text, float posX, float posY, uint color, [bool ignoreColorTags=false]) |  [4:75] |

[0B70](https://wiki.blast.hk/gta-sa/opcodes/0B70) |  [renderDrawPolygon](https://wiki.blast.hk/moonloader/lua/DrawPolygon)(float posX, float posY, float sizeX, float sizeY, int corners, float rotation, uint color) |  [4:76] |

[0B71](https://wiki.blast.hk/gta-sa/opcodes/0B71) |  DxTexture texture = [renderLoadTextureFromFile](https://wiki.blast.hk/moonloader/lua/LoadTextureFromFile)(zstring file) |  [4:77] |

[0B72](https://wiki.blast.hk/gta-sa/opcodes/0B72) |  [renderReleaseTexture](https://wiki.blast.hk/moonloader/lua/ReleaseTexture)(DxTexture texture) |  [4:78] |

[0B73](https://wiki.blast.hk/gta-sa/opcodes/0B73) |  [renderDrawTexture](https://wiki.blast.hk/moonloader/lua/DrawTexture)(DxTexture texture, float posX, float posY, float sizeX, float sizeY, float rotation, uint color) |  [4:79] |

[0B74](https://wiki.blast.hk/gta-sa/opcodes/0B74) |  [sampSetChatString](https://wiki.blast.hk/moonloader/lua/sampSetChatString)(int id, zstring text, zstring prefix, uint color, uint pcolor) |   |

[0B75](https://wiki.blast.hk/gta-sa/opcodes/0B75) |  zstring text, zstring prefix, uint color, uint pcolor = [sampGetChatString](https://wiki.blast.hk/moonloader/lua/sampGetChatString)(int id) |   |

[0B76](https://wiki.blast.hk/gta-sa/opcodes/0B76) |  [sampSetChatInputText](https://wiki.blast.hk/moonloader/lua/sampSetChatInputText)(zstring text) |   |

[0B77](https://wiki.blast.hk/gta-sa/opcodes/0B77) |  zstring text = [sampGetChatInputText](https://wiki.blast.hk/moonloader/lua/sampGetChatInputText)() |   |

[0B78](https://wiki.blast.hk/gta-sa/opcodes/0B78) |  [sampfuncsLog](https://wiki.blast.hk/moonloader/lua/sampfuncsLog)(zstring msg) |   |

[0B79](https://wiki.blast.hk/gta-sa/opcodes/0B79) |  [sampSetChatInputEnabled](https://wiki.blast.hk/moonloader/lua/sampSetChatInputEnabled)(bool enabled) |   |

[0B7A](https://wiki.blast.hk/gta-sa/opcodes/0B7A) |  uint rakclientPtr = [sampGetRakclientInterface](https://wiki.blast.hk/moonloader/lua/sampGetRakclientInterface)() |   |

[0B7B](https://wiki.blast.hk/gta-sa/opcodes/0B7B) |  uint rakpeer = [sampGetRakpeer](https://wiki.blast.hk/moonloader/lua/sampGetRakpeer)() |   |

[0B7C](https://wiki.blast.hk/gta-sa/opcodes/0B7C) |  uint address = [sampGetRakclientFuncAddressByIndex](https://wiki.blast.hk/moonloader/lua/sampGetRakclientFuncAddressByIndex)(int index) |   |

[0B7D](https://wiki.blast.hk/gta-sa/opcodes/0B7D) |  uint callbackAddress = [sampGetRpcCallbackByRpcId](https://wiki.blast.hk/moonloader/lua/sampGetRpcCallbackByRpcId)(int index) |   |

[0B7E](https://wiki.blast.hk/gta-sa/opcodes/0B7E) |  uint node = [sampGetRpcNodeByRpcId](https://wiki.blast.hk/moonloader/lua/sampGetRpcNodeByRpcId)(int index) |   |

[0B7F](https://wiki.blast.hk/gta-sa/opcodes/0B7F) |  uint sampPtr = [sampGetSampInfoPtr](https://wiki.blast.hk/moonloader/lua/sampGetSampInfoPtr)() |   |

[0B80](https://wiki.blast.hk/gta-sa/opcodes/0B80) |  DxutDialog dialog = [dxutCreateDialog](https://wiki.blast.hk/moonloader/lua/dxutCreateDialog)(zstring name) |   |

[0B81](https://wiki.blast.hk/gta-sa/opcodes/0B81) |  bool result, int event, int id = [dxutPopEvent](https://wiki.blast.hk/moonloader/lua/dxutPopEvent)(DxutDialog dialog) |   |

[0B82](https://wiki.blast.hk/gta-sa/opcodes/0B82) |  [dxutAddButton](https://wiki.blast.hk/moonloader/lua/dxutAddButton)(DxutDialog dialog, int id, zstring text, int posX, int posY, int sizeX, int sizeY) |   |

[0B83](https://wiki.blast.hk/gta-sa/opcodes/0B83) |  [dxutAddCheckbox](https://wiki.blast.hk/moonloader/lua/dxutAddCheckbox)(DxutDialog dialog, int id, zstring text, int posX, int posY, int sizeX, int sizeY) |   |

[0B84](https://wiki.blast.hk/gta-sa/opcodes/0B84) |  [dxutSetDialogPos](https://wiki.blast.hk/moonloader/lua/dxutSetDialogPos)(DxutDialog dialog, int posX, int posY, int sizeX, int sizeY) |   |

[0B85](https://wiki.blast.hk/gta-sa/opcodes/0B85) |  int posX, int posY, int sizeX, int sizeY = [dxutGetDialogPosAndSize](https://wiki.blast.hk/moonloader/lua/dxutGetDialogPosAndSize)(DxutDialog dialog) |   |

[0B86](https://wiki.blast.hk/gta-sa/opcodes/0B86) |  [dxutSetDialogVisible](https://wiki.blast.hk/moonloader/lua/dxutSetDialogVisible)(DxutDialog dialog, bool visible) |   |

[0B87](https://wiki.blast.hk/gta-sa/opcodes/0B87) |  bool result = [dxutIsDialogVisible](https://wiki.blast.hk/moonloader/lua/dxutIsDialogVisible)(DxutDialog dialog) |   |

[0B88](https://wiki.blast.hk/gta-sa/opcodes/0B88) |  [dxutAddEditbox](https://wiki.blast.hk/moonloader/lua/dxutAddEditbox)(DxutDialog dialog, int id, zstring text, int posX, int posY, int sizeX, int sizeY) |   |

[0B89](https://wiki.blast.hk/gta-sa/opcodes/0B89) |  zstring text = [dxutGetControlText](https://wiki.blast.hk/moonloader/lua/dxutGetControlText)(DxutDialog dialog, int id) |   |

[0B8A](https://wiki.blast.hk/gta-sa/opcodes/0B8A) |  [raknetSendRpc](https://wiki.blast.hk/moonloader/lua/raknetSendRpc)(int rpc, Bitstream bs) |   |

[0B8B](https://wiki.blast.hk/gta-sa/opcodes/0B8B) |  [raknetSendBitStream](https://wiki.blast.hk/moonloader/lua/raknetSendBitStream)(Bitstream bs) |   |

[0B8C](https://wiki.blast.hk/gta-sa/opcodes/0B8C) |  bool result = [sampIsCursorActive](https://wiki.blast.hk/moonloader/lua/sampIsCursorActive)() |   |

[0B8D](https://wiki.blast.hk/gta-sa/opcodes/0B8D) |  [sampSetCursorMode](https://wiki.blast.hk/moonloader/lua/sampSetCursorMode)(int mode) |   |

[0B8E](https://wiki.blast.hk/gta-sa/opcodes/0B8E) |  int mode = [sampGetCursorMode](https://wiki.blast.hk/moonloader/lua/sampGetCursorMode)() |   |

[0B8F](https://wiki.blast.hk/gta-sa/opcodes/0B8F) |  float posX, float posY, float posZ = [convertScreenCoordsToWorld3D](https://wiki.blast.hk/moonloader/lua/convertScreenCoordsToWorld3D)(float posX, float posY, float depth) |  [4:80] |

[0B90](https://wiki.blast.hk/gta-sa/opcodes/0B90) |  [dxutSetControlVisible](https://wiki.blast.hk/moonloader/lua/dxutSetControlVisible)(DxutDialog dialog, int id, bool visible) |   |

[0B91](https://wiki.blast.hk/gta-sa/opcodes/0B91) |  [dxutAddStatic](https://wiki.blast.hk/moonloader/lua/dxutAddStatic)(DxutDialog dialog, int id, zstring text, int posX, int posY, int sizeX, int sizeY) |   |

[0B92](https://wiki.blast.hk/gta-sa/opcodes/0B92) |  bool result = [dxutIsCheckboxChecked](https://wiki.blast.hk/moonloader/lua/dxutIsCheckboxChecked)(DxutDialog dialog, int id) |   |

[0B93](https://wiki.blast.hk/gta-sa/opcodes/0B93) |  [dxutSetDialogBackgroundColor](https://wiki.blast.hk/moonloader/lua/dxutSetDialogBackgroundColor)(DxutDialog dialog, uint color) |   |

[0B94](https://wiki.blast.hk/gta-sa/opcodes/0B94) |  [dxutSetControlText](https://wiki.blast.hk/moonloader/lua/dxutSetControlText)(DxutDialog dialog, int id, zstring text) |   |

[0B95](https://wiki.blast.hk/gta-sa/opcodes/0B95) |  bool result = [dxutControlIsVisible](https://wiki.blast.hk/moonloader/lua/dxutControlIsVisible)(DxutDialog dialog, int id) |   |

[0B96](https://wiki.blast.hk/gta-sa/opcodes/0B96) |  [dxutAddSlider](https://wiki.blast.hk/moonloader/lua/dxutAddSlider)(DxutDialog dialog, int id, int posX, int posY, int sizeX, int sizeY, int max) |   |

[0B97](https://wiki.blast.hk/gta-sa/opcodes/0B97) |  int value = [dxutGetSliderValue](https://wiki.blast.hk/moonloader/lua/dxutGetSliderValue)(DxutDialog dialog, int id) |   |

[0B98](https://wiki.blast.hk/gta-sa/opcodes/0B98) |  [dxutSetSliderValue](https://wiki.blast.hk/moonloader/lua/dxutSetSliderValue)(DxutDialog dialog, int id, int value) |   |

[0B99](https://wiki.blast.hk/gta-sa/opcodes/0B99) |  [dxutAddListbox](https://wiki.blast.hk/moonloader/lua/dxutAddListbox)(DxutDialog dialog, int id, int posX, int posY, int sizeX, int sizeY) |   |

[0B9A](https://wiki.blast.hk/gta-sa/opcodes/0B9A) |  [dxutListboxInsertItem](https://wiki.blast.hk/moonloader/lua/dxutListboxInsertItem)(DxutDialog dialog, int id, zstring element, uint data, int after) |   |

[0B9B](https://wiki.blast.hk/gta-sa/opcodes/0B9B) |  int element, int count = [dxutGetListboxSelectedItemAndCount](https://wiki.blast.hk/moonloader/lua/dxutGetListboxSelectedItemAndCount)(DxutDialog dialog, int id) |   |

[0B9C](https://wiki.blast.hk/gta-sa/opcodes/0B9C) |  [dxutListboxDeleteItem](https://wiki.blast.hk/moonloader/lua/dxutListboxDeleteItem)(DxutDialog dialog, int id, int element) |   |

[0B9D](https://wiki.blast.hk/gta-sa/opcodes/0B9D) |  zstring text, uint data = [dxutGetListboxItemTextAndData](https://wiki.blast.hk/moonloader/lua/dxutGetListboxItemTextAndData)(DxutDialog dialog, int id, int element) |   |

[0B9E](https://wiki.blast.hk/gta-sa/opcodes/0B9E) |  [dxutCheckboxSetChecked](https://wiki.blast.hk/moonloader/lua/dxutCheckboxSetChecked)(DxutDialog dialog, int id, bool checked) |   |

[0B9F](https://wiki.blast.hk/gta-sa/opcodes/0B9F) |  [dxutEnableDialogCaption](https://wiki.blast.hk/moonloader/lua/dxutEnableDialogCaption)(DxutDialog dialog, bool enable) |   |

[0BA0](https://wiki.blast.hk/gta-sa/opcodes/0BA0) |  bool result = [dxutIsDialogCaptionEnabled](https://wiki.blast.hk/moonloader/lua/dxutIsDialogCaptionEnabled)(DxutDialog dialog) |   |

[0BA1](https://wiki.blast.hk/gta-sa/opcodes/0BA1) |  [dxutSetDialogMinimized](https://wiki.blast.hk/moonloader/lua/dxutSetDialogMinimized)(DxutDialog dialog, bool minimized) |   |

[0BA2](https://wiki.blast.hk/gta-sa/opcodes/0BA2) |  bool result = [dxutIsDialogMinimized](https://wiki.blast.hk/moonloader/lua/dxutIsDialogMinimized)(DxutDialog dialog) |   |

[0BA3](https://wiki.blast.hk/gta-sa/opcodes/0BA3) |  [dxutDeleteControl](https://wiki.blast.hk/moonloader/lua/dxutDeleteControl)(DxutDialog dialog, int id) |   |

[0BA4](https://wiki.blast.hk/gta-sa/opcodes/0BA4) |  [dxutDeleteDialog](https://wiki.blast.hk/moonloader/lua/dxutDeleteDialog)(DxutDialog dialog) |   |

[0BA5](https://wiki.blast.hk/gta-sa/opcodes/0BA5) |  [dxutSetFocusOnControl](https://wiki.blast.hk/moonloader/lua/dxutSetFocusOnControl)(DxutDialog dialog, int id) |   |

[0BA6](https://wiki.blast.hk/gta-sa/opcodes/0BA6) |  [dxutSetControlSize](https://wiki.blast.hk/moonloader/lua/dxutSetControlSize)(DxutDialog dialog, int id, int sizeX, int sizeY) |   |

[0BA7](https://wiki.blast.hk/gta-sa/opcodes/0BA7) |  int sizeX, int sizeY = [dxutGetControlSize](https://wiki.blast.hk/moonloader/lua/dxutGetControlSize)(DxutDialog dialog, int id) |   |

[0BA8](https://wiki.blast.hk/gta-sa/opcodes/0BA8) |  [dxutSetControlPos](https://wiki.blast.hk/moonloader/lua/dxutSetControlPos)(DxutDialog dialog, int id, int posX, int posY) |   |

[0BA9](https://wiki.blast.hk/gta-sa/opcodes/0BA9) |  int posX, int posY = [dxutGetControlPos](https://wiki.blast.hk/moonloader/lua/dxutGetControlPos)(DxutDialog dialog, int id) |   |

[0BAA](https://wiki.blast.hk/gta-sa/opcodes/0BAA) |  [dxutSetCheckboxColor](https://wiki.blast.hk/moonloader/lua/dxutSetCheckboxColor)(DxutDialog dialog, int id, uint color) |   |

[0BAB](https://wiki.blast.hk/gta-sa/opcodes/0BAB) |  bool result = [dxutIsDialogExists](https://wiki.blast.hk/moonloader/lua/dxutIsDialogExists)(DxutDialog dialog) |   |

[0BAC](https://wiki.blast.hk/gta-sa/opcodes/0BAC) |  uint settingsPtr = [sampGetServerSettingsPtr](https://wiki.blast.hk/moonloader/lua/sampGetServerSettingsPtr)() |   |

[0BAD](https://wiki.blast.hk/gta-sa/opcodes/0BAD) |  uint poolsPtr = [sampGetSampPoolsPtr](https://wiki.blast.hk/moonloader/lua/sampGetSampPoolsPtr)() |   |

[0BAE](https://wiki.blast.hk/gta-sa/opcodes/0BAE) |  uint chatPtr = [sampGetChatInfoPtr](https://wiki.blast.hk/moonloader/lua/sampGetChatInfoPtr)() |   |

[0BAF](https://wiki.blast.hk/gta-sa/opcodes/0BAF) |  uint inputPtr = [sampGetInputInfoPtr](https://wiki.blast.hk/moonloader/lua/sampGetInputInfoPtr)() |   |

[0BB0](https://wiki.blast.hk/gta-sa/opcodes/0BB0) |  uint dialogPtr = [sampGetDialogInfoPtr](https://wiki.blast.hk/moonloader/lua/sampGetDialogInfoPtr)() |   |

[0BB1](https://wiki.blast.hk/gta-sa/opcodes/0BB1) |  uint kill = [sampGetKillInfoPtr](https://wiki.blast.hk/moonloader/lua/sampGetKillInfoPtr)() |   |

[0BB2](https://wiki.blast.hk/gta-sa/opcodes/0BB2) |  uint miscPtr = [sampGetMiscInfoPtr](https://wiki.blast.hk/moonloader/lua/sampGetMiscInfoPtr)() |   |

[0BB3](https://wiki.blast.hk/gta-sa/opcodes/0BB3) |  uint tdpoolPtr = [sampGetTextdrawPoolPtr](https://wiki.blast.hk/moonloader/lua/sampGetTextdrawPoolPtr)() |   |

[0BB4](https://wiki.blast.hk/gta-sa/opcodes/0BB4) |  int objpoolPtr = [sampGetObjectPoolPtr](https://wiki.blast.hk/moonloader/lua/sampGetObjectPoolPtr)() |   |

[0BB5](https://wiki.blast.hk/gta-sa/opcodes/0BB5) |  uint gzpoolPtr = [sampGetGangzonePoolPtr](https://wiki.blast.hk/moonloader/lua/sampGetGangzonePoolPtr)() |   |

[0BB6](https://wiki.blast.hk/gta-sa/opcodes/0BB6) |  uint tlabelpoolPtr = [sampGetTextlabelPoolPtr](https://wiki.blast.hk/moonloader/lua/sampGetTextlabelPoolPtr)() |   |

[0BB7](https://wiki.blast.hk/gta-sa/opcodes/0BB7) |  uint playerpoolPtr = [sampGetPlayerPoolPtr](https://wiki.blast.hk/moonloader/lua/sampGetPlayerPoolPtr)() |   |

[0BB8](https://wiki.blast.hk/gta-sa/opcodes/0BB8) |  uint vehpoolPtr = [sampGetVehiclePoolPtr](https://wiki.blast.hk/moonloader/lua/sampGetVehiclePoolPtr)() |   |

[0BB9](https://wiki.blast.hk/gta-sa/opcodes/0BB9) |  uint pickuppoolPtr = [sampGetPickupPoolPtr](https://wiki.blast.hk/moonloader/lua/sampGetPickupPoolPtr)() |   |

[0BBA](https://wiki.blast.hk/gta-sa/opcodes/0BBA) |  [sampStorePlayerOnfootData](https://wiki.blast.hk/moonloader/lua/sampStorePlayerOnfootData)(int id, uint dstBuffer) |   |

[0BBB](https://wiki.blast.hk/gta-sa/opcodes/0BBB) |  [sampStorePlayerIncarData](https://wiki.blast.hk/moonloader/lua/sampStorePlayerIncarData)(int id, uint dstBuffer) |   |

[0BBC](https://wiki.blast.hk/gta-sa/opcodes/0BBC) |  [sampStorePlayerPassengerData](https://wiki.blast.hk/moonloader/lua/sampStorePlayerPassengerData)(int id, uint dstBuffer) |   |

[0BBD](https://wiki.blast.hk/gta-sa/opcodes/0BBD) |  [sampStorePlayerTrailerData](https://wiki.blast.hk/moonloader/lua/sampStorePlayerTrailerData)(int id, uint dstBuffer) |   |

[0BBE](https://wiki.blast.hk/gta-sa/opcodes/0BBE) |  [sampStorePlayerAimData](https://wiki.blast.hk/moonloader/lua/sampStorePlayerAimData)(int id, uint dstBuffer) |   |

[0BBF](https://wiki.blast.hk/gta-sa/opcodes/0BBF) |  [sampSendRconCommand](https://wiki.blast.hk/moonloader/lua/sampSendRconCommand)(zstring cmd) |   |

[0BC0](https://wiki.blast.hk/gta-sa/opcodes/0BC0) |  [sampSendOnfootData](https://wiki.blast.hk/moonloader/lua/sampSendOnfootData)(uint dataPtr) |   |

[0BC1](https://wiki.blast.hk/gta-sa/opcodes/0BC1) |  [sampSendIncarData](https://wiki.blast.hk/moonloader/lua/sampSendIncarData)(uint dataPtr) |   |

[0BC2](https://wiki.blast.hk/gta-sa/opcodes/0BC2) |  [sampSendPassengerData](https://wiki.blast.hk/moonloader/lua/sampSendPassengerData)(uint dataPtr) |   |

[0BC3](https://wiki.blast.hk/gta-sa/opcodes/0BC3) |  [sampSendAimData](https://wiki.blast.hk/moonloader/lua/sampSendAimData)(uint dataPtr) |   |

[0BC4](https://wiki.blast.hk/gta-sa/opcodes/0BC4) |  [sampSendBulletData](https://wiki.blast.hk/moonloader/lua/sampSendBulletData)(uint dataPtr) |   |

[0BC5](https://wiki.blast.hk/gta-sa/opcodes/0BC5) |  [sampSendTrailerData](https://wiki.blast.hk/moonloader/lua/sampSendTrailerData)(uint dataPtr) |   |

[0BC6](https://wiki.blast.hk/gta-sa/opcodes/0BC6) |  [sampSendUnoccupiedData](https://wiki.blast.hk/moonloader/lua/sampSendUnoccupiedData)(uint dataPtr) |   |

[0BC7](https://wiki.blast.hk/gta-sa/opcodes/0BC7) |  [sampSendSpectatorData](https://wiki.blast.hk/moonloader/lua/sampSendSpectatorData)(uint dataPtr) |   |

[0BC8](https://wiki.blast.hk/gta-sa/opcodes/0BC8) |  [sampSendClickPlayer](https://wiki.blast.hk/moonloader/lua/sampSendClickPlayer)(int id, int source) |   |

[0BC9](https://wiki.blast.hk/gta-sa/opcodes/0BC9) |  [sampSendDialogResponse](https://wiki.blast.hk/moonloader/lua/sampSendDialogResponse)(int id, int button, int listitem, zstring input) |   |

[0BCA](https://wiki.blast.hk/gta-sa/opcodes/0BCA) |  [sampSendClickTextdraw](https://wiki.blast.hk/moonloader/lua/sampSendClickTextdraw)(int id) |   |

[0BCB](https://wiki.blast.hk/gta-sa/opcodes/0BCB) |  [sampSendGiveDamage](https://wiki.blast.hk/moonloader/lua/sampSendGiveDamage)(int id, float damage, int weapon, int bodypart) |   |

[0BCC](https://wiki.blast.hk/gta-sa/opcodes/0BCC) |  [sampSendTakeDamage](https://wiki.blast.hk/moonloader/lua/sampSendTakeDamage)(int id, float damage, int weapon, int bodypart) |   |

[0BCD](https://wiki.blast.hk/gta-sa/opcodes/0BCD) |  [sampSendEditObject](https://wiki.blast.hk/moonloader/lua/sampSendEditObject)(bool playerObject, int objectId, int response, float posX, float posY, float posZ, float rotX, float rotY, float rotZ) |   |

[0BCE](https://wiki.blast.hk/gta-sa/opcodes/0BCE) |  [sampSendEditAttachedObject](https://wiki.blast.hk/moonloader/lua/sampSendEditAttachedObject)(int response, int index, int model, int bone, float offsetX, float offsetY, float offsetZ, float rotX, float rotY, float rotZ, float scaleX, float scaleY, float scaleZ) |   |

[0BCF](https://wiki.blast.hk/gta-sa/opcodes/0BCF) |  [sampSendInteriorChange](https://wiki.blast.hk/moonloader/lua/sampSendInteriorChange)(int id) |   |

[0BD0](https://wiki.blast.hk/gta-sa/opcodes/0BD0) |  [sampSendRequestSpawn](https://wiki.blast.hk/moonloader/lua/sampSendRequestSpawn)() |   |

[0BD1](https://wiki.blast.hk/gta-sa/opcodes/0BD1) |  [sampSendPickedUpPickup](https://wiki.blast.hk/moonloader/lua/sampSendPickedUpPickup)(int id) |   |

[0BD2](https://wiki.blast.hk/gta-sa/opcodes/0BD2) |  [sampSendMenuSelectRow](https://wiki.blast.hk/moonloader/lua/sampSendMenuSelectRow)(int id) |   |

[0BD3](https://wiki.blast.hk/gta-sa/opcodes/0BD3) |  [sampSendMenuQuit](https://wiki.blast.hk/moonloader/lua/sampSendMenuQuit)() |   |

[0BD4](https://wiki.blast.hk/gta-sa/opcodes/0BD4) |  [sampSendVehicleDestroyed](https://wiki.blast.hk/moonloader/lua/sampSendVehicleDestroyed)(int id) |   |

[0BD5](https://wiki.blast.hk/gta-sa/opcodes/0BD5) |  bool result = [sampIsScoreboardOpen](https://wiki.blast.hk/moonloader/lua/sampIsScoreboardOpen)() |   |

[0BD6](https://wiki.blast.hk/gta-sa/opcodes/0BD6) |  [sampToggleScoreboard](https://wiki.blast.hk/moonloader/lua/sampToggleScoreboard)(bool show) |   |

[0BD7](https://wiki.blast.hk/gta-sa/opcodes/0BD7) |  zstring text = [sampGetDialogText](https://wiki.blast.hk/moonloader/lua/sampGetDialogText)() |   |

[0BD8](https://wiki.blast.hk/gta-sa/opcodes/0BD8) |  zstring caption = [sampGetDialogCaption](https://wiki.blast.hk/moonloader/lua/sampGetDialogCaption)() |   |

[0BD9](https://wiki.blast.hk/gta-sa/opcodes/0BD9) |  [sampSetDialogClientside](https://wiki.blast.hk/moonloader/lua/sampSetDialogClientside)(bool clientside) |   |

[0BDA](https://wiki.blast.hk/gta-sa/opcodes/0BDA) |  bool result = [sampIsDialogClientside](https://wiki.blast.hk/moonloader/lua/sampIsDialogClientside)() |   |

[0BDB](https://wiki.blast.hk/gta-sa/opcodes/0BDB) |  bool result = [sampIsChatVisible](https://wiki.blast.hk/moonloader/lua/sampIsChatVisible)() |   |

[0BDC](https://wiki.blast.hk/gta-sa/opcodes/0BDC) |  int mode = [sampGetChatDisplayMode](https://wiki.blast.hk/moonloader/lua/sampGetChatDisplayMode)() |   |

[0BDD](https://wiki.blast.hk/gta-sa/opcodes/0BDD) |  [sampSetChatDisplayMode](https://wiki.blast.hk/moonloader/lua/sampSetChatDisplayMode)(int mode) |   |

[0BDE](https://wiki.blast.hk/gta-sa/opcodes/0BDE) |  [pauseScmThread](https://wiki.blast.hk/moonloader/lua/pauseScmThread)(uint thread) |   |

[0BDF](https://wiki.blast.hk/gta-sa/opcodes/0BDF) |  [resumeScmThread](https://wiki.blast.hk/moonloader/lua/resumeScmThread)(uint thread) |   |

[0BE0](https://wiki.blast.hk/gta-sa/opcodes/0BE0) |   |  [12] |

[0BE1](https://wiki.blast.hk/gta-sa/opcodes/0BE1) |   |  [12:1] |

[0BE2](https://wiki.blast.hk/gta-sa/opcodes/0BE2) |   |  [12:2] |

[0BE3](https://wiki.blast.hk/gta-sa/opcodes/0BE3) |   |  [12:3] |

[0BE4](https://wiki.blast.hk/gta-sa/opcodes/0BE4) |   |  [12:4] |

[0BE5](https://wiki.blast.hk/gta-sa/opcodes/0BE5) |   |  [10:1] |

[0BE6](https://wiki.blast.hk/gta-sa/opcodes/0BE6) |   |  [12:5] |

[0BE7](https://wiki.blast.hk/gta-sa/opcodes/0BE7) |  bool value = [raknetBitStreamReadBool](https://wiki.blast.hk/moonloader/lua/raknetBitStreamReadBool)(Bitstream bs) |   |

[0BE7](https://wiki.blast.hk/gta-sa/opcodes/0BE7) |  float value = [raknetBitStreamReadFloat](https://wiki.blast.hk/moonloader/lua/raknetBitStreamReadFloat)(Bitstream bs) |   |

[0BE7](https://wiki.blast.hk/gta-sa/opcodes/0BE7) |  int value = [raknetBitStreamReadInt16](https://wiki.blast.hk/moonloader/lua/raknetBitStreamReadInt16)(Bitstream bs) |   |

[0BE7](https://wiki.blast.hk/gta-sa/opcodes/0BE7) |  int value = [raknetBitStreamReadInt32](https://wiki.blast.hk/moonloader/lua/raknetBitStreamReadInt32)(Bitstream bs) |   |

[0BE7](https://wiki.blast.hk/gta-sa/opcodes/0BE7) |  int value = [raknetBitStreamReadInt8](https://wiki.blast.hk/moonloader/lua/raknetBitStreamReadInt8)(Bitstream bs) |   |

[0BE8](https://wiki.blast.hk/gta-sa/opcodes/0BE8) |  [raknetBitStreamReadBuffer](https://wiki.blast.hk/moonloader/lua/raknetBitStreamReadBuffer)(Bitstream bs, uint dest, uint size) |   |

[0BE8](https://wiki.blast.hk/gta-sa/opcodes/0BE8) |  string value = [raknetBitStreamReadString](https://wiki.blast.hk/moonloader/lua/raknetBitStreamReadString)(Bitstream bs, uint size) |   |

[0BE9](https://wiki.blast.hk/gta-sa/opcodes/0BE9) |  [raknetBitStreamResetReadPointer](https://wiki.blast.hk/moonloader/lua/raknetBitStreamResetReadPointer)(Bitstream bs) |   |

[0BEA](https://wiki.blast.hk/gta-sa/opcodes/0BEA) |  [raknetBitStreamResetWritePointer](https://wiki.blast.hk/moonloader/lua/raknetBitStreamResetWritePointer)(Bitstream bs) |   |

[0BEB](https://wiki.blast.hk/gta-sa/opcodes/0BEB) |  [raknetBitStreamIgnoreBits](https://wiki.blast.hk/moonloader/lua/raknetBitStreamIgnoreBits)(Bitstream bs, int amount) |   |

[0BEC](https://wiki.blast.hk/gta-sa/opcodes/0BEC) |  [raknetBitStreamSetWriteOffset](https://wiki.blast.hk/moonloader/lua/raknetBitStreamSetWriteOffset)(Bitstream bs, int offset) |   |

[0BED](https://wiki.blast.hk/gta-sa/opcodes/0BED) |  [raknetBitStreamSetReadOffset](https://wiki.blast.hk/moonloader/lua/raknetBitStreamSetReadOffset)(Bitstream bs, int offset) |   |

[0BEE](https://wiki.blast.hk/gta-sa/opcodes/0BEE) |  uint value = [raknetBitStreamGetNumberOfBitsUsed](https://wiki.blast.hk/moonloader/lua/raknetBitStreamGetNumberOfBitsUsed)(Bitstream bs) |   |

[0BEF](https://wiki.blast.hk/gta-sa/opcodes/0BEF) |  uint value = [raknetBitStreamGetNumberOfBytesUsed](https://wiki.blast.hk/moonloader/lua/raknetBitStreamGetNumberOfBytesUsed)(Bitstream bs) |   |

[0BF0](https://wiki.blast.hk/gta-sa/opcodes/0BF0) |  uint value = [raknetBitStreamGetNumberOfUnreadBits](https://wiki.blast.hk/moonloader/lua/raknetBitStreamGetNumberOfUnreadBits)(Bitstream bs) |   |

[0BF1](https://wiki.blast.hk/gta-sa/opcodes/0BF1) |  int value = [raknetBitStreamGetWriteOffset](https://wiki.blast.hk/moonloader/lua/raknetBitStreamGetWriteOffset)(Bitstream bs) |   |

[0BF2](https://wiki.blast.hk/gta-sa/opcodes/0BF2) |  int value = [raknetBitStreamGetReadOffset](https://wiki.blast.hk/moonloader/lua/raknetBitStreamGetReadOffset)(Bitstream bs) |   |

[0BF3](https://wiki.blast.hk/gta-sa/opcodes/0BF3) |  uint value = [raknetBitStreamGetDataPtr](https://wiki.blast.hk/moonloader/lua/raknetBitStreamGetDataPtr)(Bitstream bs) |   |

[0BF4](https://wiki.blast.hk/gta-sa/opcodes/0BF4) |  zstring string = [raknetBitStreamDecodeString](https://wiki.blast.hk/moonloader/lua/raknetBitStreamDecodeString)(Bitstream bs, int size) |   |

[0BF5](https://wiki.blast.hk/gta-sa/opcodes/0BF5) |  [raknetBitStreamEncodeString](https://wiki.blast.hk/moonloader/lua/raknetBitStreamEncodeString)(Bitstream bs, zstring string) |   |

[0BF6](https://wiki.blast.hk/gta-sa/opcodes/0BF6) |  [raknetEmulRpcReceiveBitStream](https://wiki.blast.hk/moonloader/lua/raknetEmulRpcReceiveBitStream)(int rpc, Bitstream bs) |   |

[0BF7](https://wiki.blast.hk/gta-sa/opcodes/0BF7) |  [raknetEmulPacketReceiveBitStream](https://wiki.blast.hk/moonloader/lua/raknetEmulPacketReceiveBitStream)(int packet, Bitstream bs) |   |

[0BF8](https://wiki.blast.hk/gta-sa/opcodes/0BF8) |  zstring name = [raknetGetRpcName](https://wiki.blast.hk/moonloader/lua/raknetGetRpcName)(int rpc) |   |

[0BF9](https://wiki.blast.hk/gta-sa/opcodes/0BF9) |  zstring name = [raknetGetPacketName](https://wiki.blast.hk/moonloader/lua/raknetGetPacketName)(int packet) |   |

[0BFA](https://wiki.blast.hk/gta-sa/opcodes/0BFA) |   |  [3:73] |

[0BFB](https://wiki.blast.hk/gta-sa/opcodes/0BFB) |   |  [3:74] |

[0BFC](https://wiki.blast.hk/gta-sa/opcodes/0BFC) |  bool result = [setSampfuncsGlobalVar](https://wiki.blast.hk/moonloader/lua/setSampfuncsGlobalVar)(zstring var, int value) |   |

[0BFD](https://wiki.blast.hk/gta-sa/opcodes/0BFD) |  bool result, int value = [getSampfuncsGlobalVar](https://wiki.blast.hk/moonloader/lua/getSampfuncsGlobalVar)(zstring var) |   |

[0BFE](https://wiki.blast.hk/gta-sa/opcodes/0BFE) |  `os.clock`/[localClock](https://wiki.blast.hk/moonloader/lua/localClock) |  [2:42] |

[0BFF](https://wiki.blast.hk/gta-sa/opcodes/0BFF) |  bool result, table colPoint = [processLineOfSight](https://wiki.blast.hk/moonloader/lua/processLineOfSight)(float originX, float originY, float originZ, float targetX, float targetY, float targetZ, [bool checkSolid=true], [bool car=false], [bool ped=false], [bool object=false], [bool particle=false], [bool seeThrough=false], [bool ignoreSomeObjects=false], [bool shootThrough=false]) |  [4:81] |

[0C00](https://wiki.blast.hk/gta-sa/opcodes/0C00) |  `math.abs` |  [2:43] |

[0C01](https://wiki.blast.hk/gta-sa/opcodes/0C01) |  `math.deg` |  [2:44] |

[0C02](https://wiki.blast.hk/gta-sa/opcodes/0C02) |  `math.rad` |  [2:45] |

[0C03](https://wiki.blast.hk/gta-sa/opcodes/0C03) |  `math.sin` |  [2:46] |

[0C04](https://wiki.blast.hk/gta-sa/opcodes/0C04) |  `math.asin` |  [2:47] |

[0C05](https://wiki.blast.hk/gta-sa/opcodes/0C05) |  `math.cos` |  [2:48] |

[0C06](https://wiki.blast.hk/gta-sa/opcodes/0C06) |  `math.acos` |  [2:49] |

[0C07](https://wiki.blast.hk/gta-sa/opcodes/0C07) |  `math.tan` |  [2:50] |

[0C08](https://wiki.blast.hk/gta-sa/opcodes/0C08) |  `math.atan` |  [2:51] |

[0C09](https://wiki.blast.hk/gta-sa/opcodes/0C09) |  `math.pow` |  [2:52] |

[0C0A](https://wiki.blast.hk/gta-sa/opcodes/0C0A) |  `math.ceil` |  [2:53] |

[0C0B](https://wiki.blast.hk/gta-sa/opcodes/0C0B) |  `math.floor` |  [2:54] |

[0C0C](https://wiki.blast.hk/gta-sa/opcodes/0C0C) |  int value = [getStructElement](https://wiki.blast.hk/moonloader/lua/getStructElement)(uint struct, int offset, uint size, [bool unprotect=false]) |  [4:82] |

[0C0D](https://wiki.blast.hk/gta-sa/opcodes/0C0D) |  [setStructElement](https://wiki.blast.hk/moonloader/lua/setStructElement)(uint struct, int offset, uint size, int value, [bool unprotect=false]) |  [4:83] |

[0C0E](https://wiki.blast.hk/gta-sa/opcodes/0C0E) |   |  [13] |

[0C0F](https://wiki.blast.hk/gta-sa/opcodes/0C0F) |   |  [13:1] |

[0C10](https://wiki.blast.hk/gta-sa/opcodes/0C10) |   |  [14] |

[0C10](https://wiki.blast.hk/gta-sa/opcodes/0C10) |  [memory.copy](https://wiki.blast.hk/moonloader/lua/memory#memorycopy)(uint destAddress, uint srcAddress, uint size, [bool unprotect=false]) |  [4:84] |

[0C11](https://wiki.blast.hk/gta-sa/opcodes/0C11) |   |  [14:1] |

[0C11](https://wiki.blast.hk/gta-sa/opcodes/0C11) |  [memory.fill](https://wiki.blast.hk/moonloader/lua/memory#memoryfill)(uint address, int value, uint size, [bool unprotect=false]) |  [4:85] |

[0C12](https://wiki.blast.hk/gta-sa/opcodes/0C12) |   |  [14:2] |

[0C12](https://wiki.blast.hk/gta-sa/opcodes/0C12) |  bool result = [memory.compare](https://wiki.blast.hk/moonloader/lua/memory#memorycompare)(uint address1, uint address2, uint size, [bool unprotect=false]) |  [4:86] |

[0C13](https://wiki.blast.hk/gta-sa/opcodes/0C13) |   |  [15] |

[0C14](https://wiki.blast.hk/gta-sa/opcodes/0C14) |   |  [15:1] |

[0C15](https://wiki.blast.hk/gta-sa/opcodes/0C15) |   |  [15:2] |

[0C16](https://wiki.blast.hk/gta-sa/opcodes/0C16) |  `string.gmatch` |  [2:55] |

[0C17](https://wiki.blast.hk/gta-sa/opcodes/0C17) |   |  [15:3] |

[0C18](https://wiki.blast.hk/gta-sa/opcodes/0C18) |  `string.find` |  [2:56] |

[0C19](https://wiki.blast.hk/gta-sa/opcodes/0C19) |  `string.find` |  [2:57] |

[0C1A](https://wiki.blast.hk/gta-sa/opcodes/0C1A) |  `tonumber` |  [2:58] |

[0C1B](https://wiki.blast.hk/gta-sa/opcodes/0C1B) |  `tonumber` |  [2:59] |

[0C1C](https://wiki.blast.hk/gta-sa/opcodes/0C1C) |  `tostring`/`string.format` |  [2:60] |

[0C1D](https://wiki.blast.hk/gta-sa/opcodes/0C1D) |   |  [13:2] |

[0C1E](https://wiki.blast.hk/gta-sa/opcodes/0C1E) |   |  [13:3] |

[0C1F](https://wiki.blast.hk/gta-sa/opcodes/0C1F) |   |  [13:4] |

[0C20](https://wiki.blast.hk/gta-sa/opcodes/0C20) |   |  [13:5] |

[0C21](https://wiki.blast.hk/gta-sa/opcodes/0C21) |   |  [6:1] |

[0C22](https://wiki.blast.hk/gta-sa/opcodes/0C22) |   |  [14:3] |

[0C22](https://wiki.blast.hk/gta-sa/opcodes/0C22) |  string hexstr = [memory.tohex](https://wiki.blast.hk/moonloader/lua/memory#memorytohex)(uint address, uint size, [bool unprotect=false]) |  [4:87] |

[0C23](https://wiki.blast.hk/gta-sa/opcodes/0C23) |   |  [14:4] |

[0C23](https://wiki.blast.hk/gta-sa/opcodes/0C23) |  bool result = [memory.hex2bin](https://wiki.blast.hk/moonloader/lua/memory#memoryhex2bin)(string hex, uint dstAddress, uint size) |  [4:88] |

[0C24](https://wiki.blast.hk/gta-sa/opcodes/0C24) |   |  [6:2] |

[0C25](https://wiki.blast.hk/gta-sa/opcodes/0C25) |   |  [6:3] |

[0C26](https://wiki.blast.hk/gta-sa/opcodes/0C26) |  `string.upper` |  [2:61] |

[0C27](https://wiki.blast.hk/gta-sa/opcodes/0C27) |   |  [6:4] |

[0C28](https://wiki.blast.hk/gta-sa/opcodes/0C28) |  `string.lower` |  [2:62] |

[0C29](https://wiki.blast.hk/gta-sa/opcodes/0C29) |   |  [6:5] |

[0C2A](https://wiki.blast.hk/gta-sa/opcodes/0C2A) |  `string.find` |  [2:63] |

[0C2B](https://wiki.blast.hk/gta-sa/opcodes/0C2B) |   |  [6:6] |

[0C2C](https://wiki.blast.hk/gta-sa/opcodes/0C2C) |   |  [6:7] |

[0C2D](https://wiki.blast.hk/gta-sa/opcodes/0C2D) |  `string.reverse` |  [2:64] |

[0C2E](https://wiki.blast.hk/gta-sa/opcodes/0C2E) |   |  [6:8] |

[0C2F](https://wiki.blast.hk/gta-sa/opcodes/0C2F) |  `tonumber` |  [2:65] |

[0C30](https://wiki.blast.hk/gta-sa/opcodes/0C30) |   |  [16] |

[0C31](https://wiki.blast.hk/gta-sa/opcodes/0C31) |   |  [16:1] |

[0C32](https://wiki.blast.hk/gta-sa/opcodes/0C32) |  float w, float x, float y, float z = [convertMatrixToQuaternion](https://wiki.blast.hk/moonloader/lua/convertMatrixToQuaternion)(float rightX, float rightY, float rightZ, float frontX, float frontY, float frontZ, float upX, float upY, float upZ) |  [4:89] |

[0C33](https://wiki.blast.hk/gta-sa/opcodes/0C33) |  float rightX, float rightY, float rightZ, float frontX, float frontY, float frontZ, float upX, float upY, float upZ = [convertQuaternionToMatrix](https://wiki.blast.hk/moonloader/lua/convertQuaternionToMatrix)(float w, float x, float y, float z) |  [4:90] |

[0C34](https://wiki.blast.hk/gta-sa/opcodes/0C34) |   |  [17] |

[0C35](https://wiki.blast.hk/gta-sa/opcodes/0C35) |   |  [17:1] |

[0C36](https://wiki.blast.hk/gta-sa/opcodes/0C36) |   |  [17:2] |

[0C37](https://wiki.blast.hk/gta-sa/opcodes/0C37) |   |  [17:3] |

[0C38](https://wiki.blast.hk/gta-sa/opcodes/0C38) |   |  [17:4] |

[0C39](https://wiki.blast.hk/gta-sa/opcodes/0C39) |   |  [17:5] |

[0C3A](https://wiki.blast.hk/gta-sa/opcodes/0C3A) |   |  [3:75] |

[0C3B](https://wiki.blast.hk/gta-sa/opcodes/0C3B) |  [renderBegin](https://wiki.blast.hk/moonloader/lua/Begin)(int type) |  [4:91] |

[0C3C](https://wiki.blast.hk/gta-sa/opcodes/0C3C) |  [renderEnd](https://wiki.blast.hk/moonloader/lua/End)() |  [4:92] |

[0C3D](https://wiki.blast.hk/gta-sa/opcodes/0C3D) |  [renderColor](https://wiki.blast.hk/moonloader/lua/Color)(uint color) |  [4:93] |

[0C3E](https://wiki.blast.hk/gta-sa/opcodes/0C3E) |  [renderVertex](https://wiki.blast.hk/moonloader/lua/Vertex)(float vX, float vY) |  [4:94] |

[0C3F](https://wiki.blast.hk/gta-sa/opcodes/0C3F) |  [renderSetTexCoord](https://wiki.blast.hk/moonloader/lua/SetTexCoord)(float posX, float posY) |  [4:95] |

[0C40](https://wiki.blast.hk/gta-sa/opcodes/0C40) |  [renderBindTexture](https://wiki.blast.hk/moonloader/lua/BindTexture)(DxTexture texture) |  [4:96] |

[0C41](https://wiki.blast.hk/gta-sa/opcodes/0C41) |  uint struct = [renderGetTextureStruct](https://wiki.blast.hk/moonloader/lua/GetTextureStruct)(DxTexture texture) |  [4:97] |

[0C42](https://wiki.blast.hk/gta-sa/opcodes/0C42) |  uint sprite = [renderGetTextureSprite](https://wiki.blast.hk/moonloader/lua/GetTextureSprite)(DxTexture texture) |  [4:98] |

[0C43](https://wiki.blast.hk/gta-sa/opcodes/0C43) |  uint sizeX, uint sizeY = [renderGetTextureSize](https://wiki.blast.hk/moonloader/lua/GetTextureSize)(DxTexture texture) |  [4:99] |

[0C44](https://wiki.blast.hk/gta-sa/opcodes/0C44) |  [renderSetRenderState](https://wiki.blast.hk/moonloader/lua/SetRenderState)(int state, uint value) |  [4:100] |

[0C45](https://wiki.blast.hk/gta-sa/opcodes/0C45) |  [sampCreate3dTextEx](https://wiki.blast.hk/moonloader/lua/sampCreate3dTextEx)(int id, zstring text, uint color, float posX, float posY, float posZ, float distance, bool ignoreWalls, int playerId, int vehicleId) |   |

[0C46](https://wiki.blast.hk/gta-sa/opcodes/0C46) |  zstring string, uint color, float posX, float posY, float posZ, float distance, bool ignoreWalls, int playerId, int vehicleId = [sampGet3dTextInfoById](https://wiki.blast.hk/moonloader/lua/sampGet3dTextInfoById)(int id) |   |

[0C47](https://wiki.blast.hk/gta-sa/opcodes/0C47) |  [sampSet3dTextString](https://wiki.blast.hk/moonloader/lua/sampSet3dTextString)(int id, zstring text) |   |

[0C48](https://wiki.blast.hk/gta-sa/opcodes/0C48) |  [sampTextdrawCreate](https://wiki.blast.hk/moonloader/lua/sampTextdrawCreate)(int id, zstring text, float posX, float posY) |   |

[0C49](https://wiki.blast.hk/gta-sa/opcodes/0C49) |  [sampTextdrawSetBoxColorAndSize](https://wiki.blast.hk/moonloader/lua/sampTextdrawSetBoxColorAndSize)(int id, int box, uint color, float sizeX, float sizeY) |   |

[0C4A](https://wiki.blast.hk/gta-sa/opcodes/0C4A) |  [sampTextdrawSetAlign](https://wiki.blast.hk/moonloader/lua/sampTextdrawSetAlign)(int id, int align) |   |

[0C4B](https://wiki.blast.hk/gta-sa/opcodes/0C4B) |  [sampTextdrawSetProportional](https://wiki.blast.hk/moonloader/lua/sampTextdrawSetProportional)(int id, int proportional) |   |

[0C4C](https://wiki.blast.hk/gta-sa/opcodes/0C4C) |  [sampTextdrawSetStyle](https://wiki.blast.hk/moonloader/lua/sampTextdrawSetStyle)(int id, int style) |   |

[0C4D](https://wiki.blast.hk/gta-sa/opcodes/0C4D) |  [sampTextdrawSetShadow](https://wiki.blast.hk/moonloader/lua/sampTextdrawSetShadow)(int id, int shadow, uint color) |   |

[0C4E](https://wiki.blast.hk/gta-sa/opcodes/0C4E) |  [sampTextdrawSetOutlineColor](https://wiki.blast.hk/moonloader/lua/sampTextdrawSetOutlineColor)(int id, int outline, uint color) |   |

[0C4F](https://wiki.blast.hk/gta-sa/opcodes/0C4F) |  [sampTextdrawSetModelRotationZoomVehColor](https://wiki.blast.hk/moonloader/lua/sampTextdrawSetModelRotationZoomVehColor)(int id, int model, float rotX, float rotY, float rotZ, float zoom, int clr1, int clr2) |   |

[0C50](https://wiki.blast.hk/gta-sa/opcodes/0C50) |  [sampTextdrawSetString](https://wiki.blast.hk/moonloader/lua/sampTextdrawSetString)(int id, zstring text) |   |

[0C51](https://wiki.blast.hk/gta-sa/opcodes/0C51) |  [sampTextdrawSetPos](https://wiki.blast.hk/moonloader/lua/sampTextdrawSetPos)(int id, float posX, float posY) |   |

[0C52](https://wiki.blast.hk/gta-sa/opcodes/0C52) |  [sampTextdrawSetLetterSizeAndColor](https://wiki.blast.hk/moonloader/lua/sampTextdrawSetLetterSizeAndColor)(int id, float letSizeX, float letSizeY, uint color) |   |

[0C53](https://wiki.blast.hk/gta-sa/opcodes/0C53) |  int box, uint color, float sizeX, float sizeY = [sampTextdrawGetBoxEnabledColorAndSize](https://wiki.blast.hk/moonloader/lua/sampTextdrawGetBoxEnabledColorAndSize)(int id) |   |

[0C54](https://wiki.blast.hk/gta-sa/opcodes/0C54) |  int align = [sampTextdrawGetAlign](https://wiki.blast.hk/moonloader/lua/sampTextdrawGetAlign)(int id) |   |

[0C55](https://wiki.blast.hk/gta-sa/opcodes/0C55) |  int prop = [sampTextdrawGetProportional](https://wiki.blast.hk/moonloader/lua/sampTextdrawGetProportional)(int id) |   |

[0C56](https://wiki.blast.hk/gta-sa/opcodes/0C56) |  int style = [sampTextdrawGetStyle](https://wiki.blast.hk/moonloader/lua/sampTextdrawGetStyle)(int id) |   |

[0C57](https://wiki.blast.hk/gta-sa/opcodes/0C57) |  int shadow, uint color = [sampTextdrawGetShadowColor](https://wiki.blast.hk/moonloader/lua/sampTextdrawGetShadowColor)(int id) |   |

[0C58](https://wiki.blast.hk/gta-sa/opcodes/0C58) |  int outline, uint color = [sampTextdrawGetOutlineColor](https://wiki.blast.hk/moonloader/lua/sampTextdrawGetOutlineColor)(int id) |   |

[0C59](https://wiki.blast.hk/gta-sa/opcodes/0C59) |  int model, float rotX, float rotY, float rotZ, float zoom, int clr1, int clr2 = [sampTextdrawGetModelRotationZoomVehColor](https://wiki.blast.hk/moonloader/lua/sampTextdrawGetModelRotationZoomVehColor)(int id) |   |

[0C5A](https://wiki.blast.hk/gta-sa/opcodes/0C5A) |  zstring text = [sampTextdrawGetString](https://wiki.blast.hk/moonloader/lua/sampTextdrawGetString)(int id) |   |

[0C5B](https://wiki.blast.hk/gta-sa/opcodes/0C5B) |  float posX, float posY = [sampTextdrawGetPos](https://wiki.blast.hk/moonloader/lua/sampTextdrawGetPos)(int id) |   |

[0C5C](https://wiki.blast.hk/gta-sa/opcodes/0C5C) |  float letSizeX, float letSizeY, uint color = [sampTextdrawGetLetterSizeAndColor](https://wiki.blast.hk/moonloader/lua/sampTextdrawGetLetterSizeAndColor)(int id) |   |

[0C5D](https://wiki.blast.hk/gta-sa/opcodes/0C5D) |  bool result = [sampTextdrawIsExists](https://wiki.blast.hk/moonloader/lua/sampTextdrawIsExists)(int id) |   |

[0C5E](https://wiki.blast.hk/gta-sa/opcodes/0C5E) |  [sampTextdrawDelete](https://wiki.blast.hk/moonloader/lua/sampTextdrawDelete)(int id) |   |

[0C5F](https://wiki.blast.hk/gta-sa/opcodes/0C5F) |  bool result = [isSampfuncsGlobalVarDefined](https://wiki.blast.hk/moonloader/lua/isSampfuncsGlobalVarDefined)(zstring var) |   |

[0C60](https://wiki.blast.hk/gta-sa/opcodes/0C60) |   |  [3:76] |

[0C61](https://wiki.blast.hk/gta-sa/opcodes/0C61) |  bool read, bool write = [getSampfuncsGlobalVarAccessForThread](https://wiki.blast.hk/moonloader/lua/getSampfuncsGlobalVarAccessForThread)(zstring var, uint thread) |   |

[0C62](https://wiki.blast.hk/gta-sa/opcodes/0C62) |  [runSampfuncsConsoleCommand](https://wiki.blast.hk/moonloader/lua/runSampfuncsConsoleCommand)(zstring cmd) |   |

[0C63](https://wiki.blast.hk/gta-sa/opcodes/0C63) |  bool result = [sampfuncsRegisterConsoleCommand](https://wiki.blast.hk/moonloader/lua/sampfuncsRegisterConsoleCommand)(zstring cmd, function func) |   |

[0C64](https://wiki.blast.hk/gta-sa/opcodes/0C64) |  bool result = [sampfuncsUnregisterConsoleCommand](https://wiki.blast.hk/moonloader/lua/sampfuncsUnregisterConsoleCommand)(zstring cmd) |   |

[0C65](https://wiki.blast.hk/gta-sa/opcodes/0C65) |  int index = [downloadUrlToFile](https://wiki.blast.hk/moonloader/lua/downloadUrlToFile)(string url, string file, function statusCallback) |  [4:101] |

[0C66](https://wiki.blast.hk/gta-sa/opcodes/0C66) |   |  [18] |

[0C67](https://wiki.blast.hk/gta-sa/opcodes/0C67) |  `os.getenv` |  [2:66] |

[0C68](https://wiki.blast.hk/gta-sa/opcodes/0C68) |   |  [19] |

[0C69](https://wiki.blast.hk/gta-sa/opcodes/0C69) |   |  [19:1] |

[0C6A](https://wiki.blast.hk/gta-sa/opcodes/0C6A) |   |  [3:77] |

[0C6B](https://wiki.blast.hk/gta-sa/opcodes/0C6B) |  uint thread = [createScmThreadAtPointer](https://wiki.blast.hk/moonloader/lua/createScmThreadAtPointer)(uint pointer, table args) |   |

[0C6C](https://wiki.blast.hk/gta-sa/opcodes/0C6C) |  [setScmThreadLocalVar](https://wiki.blast.hk/moonloader/lua/setScmThreadLocalVar)(uint thread, int var, any value) |   |

[0C6D](https://wiki.blast.hk/gta-sa/opcodes/0C6D) |  int value = [getScmThreadLocalVar](https://wiki.blast.hk/moonloader/lua/getScmThreadLocalVar)(uint thread, int var) |   |

[0C6E](https://wiki.blast.hk/gta-sa/opcodes/0C6E) |  [destroyScmThread](https://wiki.blast.hk/moonloader/lua/destroyScmThread)(uint thread) |   |

[0C6F](https://wiki.blast.hk/gta-sa/opcodes/0C6F) |  [restartScmThread](https://wiki.blast.hk/moonloader/lua/restartScmThread)(uint thread, table args) |   |

[0C70](https://wiki.blast.hk/gta-sa/opcodes/0C70) |  uint handle = [getModuleHandle](https://wiki.blast.hk/moonloader/lua/getModuleHandle)(string module) |  [4:102] |

[0C71](https://wiki.blast.hk/gta-sa/opcodes/0C71) |  uint address = [getModuleProcAddress](https://wiki.blast.hk/moonloader/lua/getModuleProcAddress)(string module, string proc) |  [4:103] |

[0C72](https://wiki.blast.hk/gta-sa/opcodes/0C72) |  [setVirtualKeyDown](https://wiki.blast.hk/moonloader/lua/setVirtualKeyDown)(int vkey, bool down) |  [4:104] |

[0C73](https://wiki.blast.hk/gta-sa/opcodes/0C73) |  [setCharKeyDown](https://wiki.blast.hk/moonloader/lua/setCharKeyDown)(int ckey, bool down) |  [4:105] |

[0C74](https://wiki.blast.hk/gta-sa/opcodes/0C74) |   |  [20] |

[0C75](https://wiki.blast.hk/gta-sa/opcodes/0C75) |   |  [20:1] |

[0C76](https://wiki.blast.hk/gta-sa/opcodes/0C76) |   |  [20:2] |

[0C77](https://wiki.blast.hk/gta-sa/opcodes/0C77) |   |  [20:3] |

[0C78](https://wiki.blast.hk/gta-sa/opcodes/0C78) |   |  [20:4] |

[0C79](https://wiki.blast.hk/gta-sa/opcodes/0C79) |   |  [20:5] |

[0C7A](https://wiki.blast.hk/gta-sa/opcodes/0C7A) |   |  [20:6] |

[0C7B](https://wiki.blast.hk/gta-sa/opcodes/0C7B) |   |  [20:7] |

[0C7C](https://wiki.blast.hk/gta-sa/opcodes/0C7C) |   |  [20:8] |

[0C7D](https://wiki.blast.hk/gta-sa/opcodes/0C7D) |   |  [18:1] |

[0C7E](https://wiki.blast.hk/gta-sa/opcodes/0C7E) |  bool result = [isSampfuncsConsoleActive](https://wiki.blast.hk/moonloader/lua/isSampfuncsConsoleActive)() |   |

[0C7F](https://wiki.blast.hk/gta-sa/opcodes/0C7F) |  [sampSetClientCommandDescription](https://wiki.blast.hk/moonloader/lua/sampSetClientCommandDescription)(zstring cmd, zstring text) |   |

[0C80](https://wiki.blast.hk/gta-sa/opcodes/0C80) |  [setSampfuncsConsoleCommandDescription](https://wiki.blast.hk/moonloader/lua/setSampfuncsConsoleCommandDescription)(zstring cmd, zstring text) |   |

[0C81](https://wiki.blast.hk/gta-sa/opcodes/0C81) |  [sampForceVehicleSync](https://wiki.blast.hk/moonloader/lua/sampForceVehicleSync)(int id) |   |

[0C82](https://wiki.blast.hk/gta-sa/opcodes/0C82) |  [sampForceUnoccupiedSyncSeatId](https://wiki.blast.hk/moonloader/lua/sampForceUnoccupiedSyncSeatId)(int id, int seatId) |   |

[0C83](https://wiki.blast.hk/gta-sa/opcodes/0C83) |  [sampForceOnfootSync](https://wiki.blast.hk/moonloader/lua/sampForceOnfootSync)() |   |

[0C84](https://wiki.blast.hk/gta-sa/opcodes/0C84) |  [sampForceAimSync](https://wiki.blast.hk/moonloader/lua/sampForceAimSync)() |   |

[0C85](https://wiki.blast.hk/gta-sa/opcodes/0C85) |  [sampForceTrailerSync](https://wiki.blast.hk/moonloader/lua/sampForceTrailerSync)(int id) |   |

[0C86](https://wiki.blast.hk/gta-sa/opcodes/0C86) |  [sampForcePassengerSyncSeatId](https://wiki.blast.hk/moonloader/lua/sampForcePassengerSyncSeatId)(int id, int seatId) |   |

[0C87](https://wiki.blast.hk/gta-sa/opcodes/0C87) |  [sampForceStatsSync](https://wiki.blast.hk/moonloader/lua/sampForceStatsSync)() |   |

[0C88](https://wiki.blast.hk/gta-sa/opcodes/0C88) |  [sampForceWeaponsSync](https://wiki.blast.hk/moonloader/lua/sampForceWeaponsSync)() |   |

[0C89](https://wiki.blast.hk/gta-sa/opcodes/0C89) |  bool state = [isKeyJustPressed](https://wiki.blast.hk/moonloader/lua/isKeyJustPressed)(int key) |  [4:106] |

[0C8A](https://wiki.blast.hk/gta-sa/opcodes/0C8A) |  int id = [sampGetMaxPlayerId](https://wiki.blast.hk/moonloader/lua/sampGetMaxPlayerId)(bool streamed) |   |

[0C8B](https://wiki.blast.hk/gta-sa/opcodes/0C8B) |  int count = [sampGetPlayerCount](https://wiki.blast.hk/moonloader/lua/sampGetPlayerCount)(bool streamed) |   |

[0C8C](https://wiki.blast.hk/gta-sa/opcodes/0C8C) |  DxTexture texture = [renderLoadTextureFromFileInMemory](https://wiki.blast.hk/moonloader/lua/LoadTextureFromFileInMemory)(uint pointer, uint size) |  [4:107] |

[0C8D](https://wiki.blast.hk/gta-sa/opcodes/0C8D) |  bool result = [setClipboardText](https://wiki.blast.hk/moonloader/lua/setClipboardText)(string text) |  [4:108] |

[0C8E](https://wiki.blast.hk/gta-sa/opcodes/0C8E) |  string text = [getClipboardText](https://wiki.blast.hk/moonloader/lua/getClipboardText)() |  [4:109] |

[0C8F](https://wiki.blast.hk/gta-sa/opcodes/0C8F) |  [sampProcessChatInput](https://wiki.blast.hk/moonloader/lua/sampProcessChatInput)(zstring text) |   |

[0C90](https://wiki.blast.hk/gta-sa/opcodes/0C90) |  bool result = [sampIsChatCommandDefined](https://wiki.blast.hk/moonloader/lua/sampIsChatCommandDefined)(zstring cmd) |   |

[0C91](https://wiki.blast.hk/gta-sa/opcodes/0C91) |  bool result = [isSampfuncsConsoleCommandDefined](https://wiki.blast.hk/moonloader/lua/isSampfuncsConsoleCommandDefined)(zstring cmd) |   |

[0C92](https://wiki.blast.hk/gta-sa/opcodes/0C92) |  int version = [getCleoLibraryVersion](https://wiki.blast.hk/moonloader/lua/getCleoLibraryVersion)() |   |

- Не имеют назначения ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎
 
- Не вошло в релиз, поскольку в Lua/MoonLoader есть функции, позволяющие сделать то же, что и опкод ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎
 
- Не нужны в Lua. Арифметические операции, функции управления SCM-переменными, параметрами потока и т.п. ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎
 
- Были заменены встроенными функциями в обновлениях ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎
 
- Для форматирования текста используется функция `string.format` ↩︎ ↩︎ ↩︎ ↩︎ ↩︎
 
- Реализуется средствами Lua ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎
 
- Заменены модулем [inicfg](https://wiki.blast.hk/moonloader/lua/inicfg) (v.018-alpha) ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎
 
- Запланированы в будущих обновлениях (есть существующая реализация в виде модуля `lfs`) ↩︎ ↩︎ ↩︎ ↩︎
 
- Считаются устаревшими ↩︎ ↩︎
 
- Реализовано путём автоматического вызова и передачи в качестве аргумента(ов) в обработчик ↩︎ ↩︎
 
- Легко реализуется встроенными средствами Lua, возможно будет добавлено в обновлениях ↩︎ ↩︎
 
- Встроены в систему событий RakNet ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎
 
- Запланированы в ближайших обновлениях (реализуются средствами FFI) ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎
 
- Заменены модулем [memory](https://wiki.blast.hk/moonloader/lua/memory) (v.018-alpha) ↩︎ ↩︎ ↩︎ ↩︎ ↩︎
 
- Реализовано встроенными средствами Lua ↩︎ ↩︎ ↩︎ ↩︎
 
- Оставлены только аналоги ([0C32](https://wiki.blast.hk/gta-sa/opcodes/0C32) и [0C33](https://wiki.blast.hk/gta-sa/opcodes/0C33)) ↩︎ ↩︎
 
- Внешние функции реализуются посредством модулей, а общие функции можно реализовать с помощью системы [экспорта](https://wiki.blast.hk/moonloader/exports) ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎
 
- Контроль над статусом загрузки осуществляется через [downloadUrlToFile](https://wiki.blast.hk/moonloader/lua/downloadUrlToFile) ↩︎ ↩︎
 
- Заменены модулем `encoding` ↩︎ ↩︎
 
- Были заменены [скриптовыми потоками](https://wiki.blast.hk/moonloader/scripting/threads) ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎ ↩︎
