# PhDelay

```
Проект для проверки эффекта, когда феникс задерживал ответ на два одинаковых запроса на 20 секунд

mix deps.get
MIX_ENV=dev mix compile
MIX_ENV=dev PORT=4000 iex -S mix phoenix.server

и открыть две странички в браузере
http://127.0.0.1:4000/delay_test?id=12345&sid=67890
http://127.0.0.1:4000/delay_test?id=12345&sid=67890

в логе второй ввход в index будет спустя 20с

Причина была в браузере Google Chrome, который, видимо, не делает такой же запрос с других своих закладок.

Если же запустить запрос из консоли или из двух браузеров, то такой проблемы нет

curl -Ov "http://127.0.0.1:4000/delay_test?id=12345&sid=67890" & sleep 5; curl -Ov "http://127.0.0.1:4000/delay_test?id=12345&sid=67890" &
