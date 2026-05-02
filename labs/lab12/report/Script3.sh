#!/bin/bash

# Проверка, что передан аргумент (каталог)
if [ "$#" -ne 1 ]; then
  echo "Использование: $0 <каталог>"
  exit 1
fi

directory=$1

# Проверка, что каталог существует
if [ ! -d "$directory" ]; then
  echo "Каталог не найден: $directory"
  exit 1
fi

echo "Содержимое каталога: $directory"
echo "------------------------------"

# Перебор файлов и папок в каталоге
for item in "$directory"/*
do
  # Проверка, что файл существует
  if [ -e "$item" ]; then
    # Получение прав доступа
    permissions=$(stat -c %A "$item")
    # Получение имени файла или папки
    name=$(basename "$item")
    echo "$permissions $name"
  fi
done