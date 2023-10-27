# golang_migrate

Пояснения и примеры по работе с пакетом [golang-migrate](https://github.com/golang-migrate/migrate).


## Особенности

1. Важно наличие следующих директорий и файлов:
- `.env.*`     -- файл с переменными окружения
- `scripts`    -- директория со скриптами для запуска в контейнере
- `migrations` -- директория с миграциями
- `Dockerfile.*`

2. Директория [source](/source/) имеет валидную иерархию и готова для переноса в рабочий проект.

3. В приведенных примерах все команды выполняются относительно директории [source](/source/).

## Local usage
Примеры локального использования можете найти в официальном репозитории [golang-migrate](https://github.com/golang-migrate/migrate).


## Dockerfile usage

Пример оформления Dockerfile можно увидеть в файле: [Dockerfile.migrate](/source/Dockerfile.migrate)

В этом файле сборка состоит из двух этапов:

**1. Создание исполнительного файла**

Создание исполнительного файла происходит на основе официальных исходников: 
- Устанавливается пакет `git`
- Клонируется официальный репозиторий
- Выполняется сборка исполнительного файла

**2. Перенос исполнительного файла в отдельный контейнер**

Данный шаг необходим, чтобы конечный образ был легковесным и не содержал ненужные исходники и пакеты.

Также в этом шаге копируются файлы миграций.


### Usefulls

#### На проекте используется определённая СУБД

Чтобы исполнительный файл имел меньший размер и имел драйвер только от определённых технологий необходимо изменить [строку Dockerfile.migrate](/source/Dockerfile.migrate#L12)

Было:
```Dockerfile
RUN make build
```

Стало:
```Dockerfile
RUN make build SOURCE='file go_bindata' DATABASE='postgres'
```

Список разрешенных констант:
- [SOURCE](https://github.com/golang-migrate/migrate/blob/master/Makefile#L1)
- [DATABASE](https://github.com/golang-migrate/migrate/blob/master/Makefile#L2)

#### Накатывание миграций через Dockerfile

Создать образ:
```sh
docker build . -t gomigrate -f Dockerfile.migrate
```

Команда для накатывания миграций:
```sh
docker run --env-file .env.docker --rm gomigrate sh ./scripts/migrations/up.sh
```

#### Осмотреться

Команда, чтобы осмотреться внутри контейнера

```sh
docker run -it --env-file .env.docker --entrypoint sh gomigrate
```
