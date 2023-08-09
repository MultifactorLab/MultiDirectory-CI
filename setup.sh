#!/bin/bash
touch .env
> .env
read -p "Enter postgres user [default: pg-user]: " postgres_user
postgres_user=${postgres_user:-pg-user}
echo "POSTGRES_USER="$postgres_user >> .env

read -p "Enter postgres host (leave it default if you are using default database) [default: postgres]: " postgres_host
postgres_host=${postgres_host:-postgres}
echo "POSTGRES_HOST="$postgres_host >> .env

read -p "Enter postgres password [default: autogenerate]: " postgres_password
postgres_password=${postgres_password:-$(openssl rand -hex 16)}
echo "POSTGRES_PASSWORD="$postgres_password >> .env

read -p "Enter api domain [required]: " api_domain
echo "API_DOMAIN="$api_domain >> .env

if [ -z "$api_domain" ]; then echo "api domain required" && > .env && exit 1; fi

read -p "Enter interface domain [required]: " int_domain
echo "DOMAIN="$int_domain >> .env

if [ -z "$int_domain" ]; then echo "interface domain required" && exit 1; fi
if [[ "$int_domain" == "$api_domain" ]]; then echo "cannot host api and interface on one domain" && > .env && exit 1; fi

secret_key=$(openssl rand -hex 32)
echo "SECRET_KEY="$secret_key >> .env
