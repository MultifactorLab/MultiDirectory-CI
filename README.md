# MultiDirectory-CI
Ready to deploy ldap and http server.

Configuration repository for
1. [MultiDirecory](https://github.com/MultifactorLab/MultiDirectory) - ldap and JSON web API server

2. [MultiDirectory-Web-Admin](https://github.com/MultifactorLab/MultiDirectory-Web-Admin) - web interface for API

All services are running through [traefik](https://doc.traefik.io/traefik/providers/docker/), using [postgres](https://www.postgresql.org/) as database, other DBMS are incompatible.

## Installation

1. Install [docker](https://docs.docker.com/engine/install/) and [docker compose](https://docs.docker.com/compose/install/)

2. Register and assosiate domain with your server IP, for e.g. `multidirectory.example.com` -> `255.255.255.255`

3. Download and unzip latest repository:
```sh
curl -L https://github.com/MultifactorLab/MultiDirectory-CI/archive/refs/heads/main.zip -o md.zip
mkdir MultiDirectory
unzip md.zip -d MultiDirectory
cd MultiDirectory
```

or using `git`:

```sh
git clone https://github.com/MultifactorLab/MultiDirectory-CI.git
cd MultiDirecory-CI
```

4. Generate config `.env` file with:

    Run `./setup.sh` for Unix systems or `./setup.bat` for Windows, then follow instructions.
    After generating `.env` file, services are ready to deploy

5. Start services with command:

Compose v2:
```sh
docker compose pull; docker compose up -d
```

## Update services:

Run following command:

Compose v2:
```sh
docker compose down; docker compose pull; docker compose up -d
```

To update config files (docker-compose.yml and setup.*), please, redownload repository, using step 3.


## Development

To access docs and redoc of API, request `/api/redoc` and `/api/docs` url from your API domain.

## Custom database

To deploy MultiDirectory with custom postgres database, you can setup following variables in `.env` file:

    POSTGRES_HOST
    POSTGRES_USER
    POSTGRES_PASSWORD
    POSTGRES_DB

Please, note, other DBMS, rather than PostgreSQL, are incompatiple with MultiDirectory app.

In that case you may need to remove `postgres` service from `docker-compose.yml` file.
