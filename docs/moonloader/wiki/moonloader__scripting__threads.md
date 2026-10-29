# Скриптовые потоки | Modding Wiki

Fonte: https://wiki.blast.hk/moonloader/scripting/threads

Скриптовые потоки, как и функция [main](https://wiki.blast.hk/moonloader/lua/main), могут быть приостановлены на определённый период времени с помощью функции [wait](https://wiki.blast.hk/moonloader/lua/wait) не препятствуя работе игры. В отличие от события [main](https://wiki.blast.hk/moonloader/lua/main), поток не может быть приостановлен на бесконечный период времени (wait(-1)), но может быть запущен в состоянии паузы, чтобы привести его в действие позднее.
 Поток создаётся с помощью функции [lua_thread.create](https://wiki.blast.hk/moonloader/lua/lua_thread/create) или [lua_thread.create_suspended](https://wiki.blast.hk/moonloader/lua/lua_thread/create_suspended). Первым параметром передаётся функция потока, которая начнёт исполнение после запуска потока. Эта функция выполнится сразу же после создания потока, если он запущен без отсрочки запуска. Исполнение функции может быть
 приостановленно на определенное время вызовом [wait](https://wiki.blast.hk/moonloader/lua/wait) изнутри неё, тогда управление будет передано другим потокам в порядке очереди либо игре. Поток прекращает существование после выхода из функции, но может быть перезапущен с помощью [lua_thread:run](https://wiki.blast.hk/moonloader/lua/lua_thread#run).
 Все создаваемые потоки наследуют свойство [work-in-pause](https://wiki.blast.hk/moonloader/lua/script_properties#work-in-pause) у скрипта, для каждого потока это свойство может быть индивидуально изменено при помощи параметра [lua_thread.work_in_pause](https://wiki.blast.hk/moonloader/lua/lua_thread#work_in_pause).
 Возвращаемый функциями [lua_thread.create](https://wiki.blast.hk/moonloader/lua/lua_thread/create) и [lua_thread.create_suspended](https://wiki.blast.hk/moonloader/lua/lua_thread/create_suspended) объект является экземпляром класса [LuaThread](https://wiki.blast.hk/moonloader/lua/lua_thread) и имеет несколько методов и свойств для управления потоком.

## Пример создания потоков

```lua
-- этот поток выведет 'Hi!' при запуске, подождёт 5 секунд, затем выведет 'Bye.' и завершится
function firstThread()
  print("Hi!")
  wait(5000)
  print("Bye.")
end

function secondThread()
  -- бесконечные циклы внутри потоков - не проблема
  while true do
    wait(1000)
    print("secondThread() prints this message every second.")
  end
end

function thirdThread(id, delay)
  if id == 5 then
    -- поток можно завершить изнутри с помощью return
    return
  end
  wait(delay)
  print("id: " .. id .. ", delay: " .. delay)
end

function main()
  -- просто создаём поток. он запустится сразу же
  lua_thread.create(firstThread)
  -- создаём другой поток замороженным
  local thread1 = lua_thread.create_suspended(secondThread)
  -- зачем-то ждём 3 секунды
  wait(3000)
  -- и запускаем этот поток
  thread1:run()
  
  -- можно запускать сразу несколько потоков для одной и той же функции
  for i = 1, 10 do
    -- запускаем поток с передачей параметров: индекс и случайная задержка
    local del = math.random(100, 1500)
    lua_thread.create(thirdThread, i, del)
  end
  
   -- сопрограмму main всё равно нужно ставить на бесконечное ожидание, даже если есть другие потоки
  wait(-1)
end
```
