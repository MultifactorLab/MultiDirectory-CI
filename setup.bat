@echo off
copy NUL ./.env
type nul > ./.env
setlocal EnableDelayedExpansion

set char=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789
set count=0

set length=16

:Loop
set /a count+=1
set /a rand=%Random%%%61
set password=!password!!char:~%rand%,1!
if !count! leq !length! goto Loop

set postgres_password=%password%

set count=0
set length=128

:Loop
set /a count+=1
set /a rand=%Random%%%61
set secret_key=!secret_key!!char:~%rand%,1!
if !count! leq !length! goto Loop


set "postgres_user=user"
set /p "postgres_user=Enter postgres user or just ENTER for default [%postgres_user%]: "

set "postgres_host=postgres"
set /p "postgres_host=Enter postgres host or just ENTER for default [%postgres_host%]: "

set /p "postgres_password=Enter postgres password or just ENTER for default [autogenerated]: "

:domain
set /p "domain=Enter domain name: "
IF "%domain%"=="" echo domain required && goto domain


echo POSTGRES_HOST=%postgres_host% >> .env
echo POSTGRES_USER=%postgres_user% >> .env
echo POSTGRES_PASSWORD=%postgres_password% >> .env
echo DOMAIN=%domain% >> .env
echo SECRET_KEY=%secret_key% >> .env
