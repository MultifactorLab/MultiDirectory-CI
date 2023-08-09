#!/bin/bash
touch .env
> .env

read -p "Enter postgres user [default: user]: " postgres_user
postgres_user=${postgres_user:-user}


read -p "Enter postgres host (leave it default if you are using default database) [default: postgres]: " postgres_host
postgres_host=${postgres_host:-postgres}


read -p "Enter postgres password [default: autogenerate]: " postgres_password
postgres_password=${postgres_password:-$(openssl rand -hex 16)}


read -p "Enter api domain [required]: " api_domain
if [ -z "$api_domain" ]; then echo "api domain required" && > .env && exit 1; fi


read -p "Enter interface domain [required]: " int_domain
if [ -z "$int_domain" ]; then echo "interface domain required" && exit 1; fi
if [[ "$int_domain" == "$api_domain" ]]; then echo "cannot host api and interface on one domain" && > .env && exit 1; fi

secret_key=$(openssl rand -hex 32)

echo "POSTGRES_HOST="$postgres_host >> .env
echo "POSTGRES_USER="$postgres_user >> .env
echo "POSTGRES_PASSWORD="$postgres_password >> .env
echo "API_DOMAIN="$api_domain >> .env
echo "DOMAIN="$int_domain >> .env
echo "SECRET_KEY="$secret_key >> .env
