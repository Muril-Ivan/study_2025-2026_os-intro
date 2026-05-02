#!/bin/bash


if [ "$#" -ne 2 ]; then
  echo "Использование: $0 <директория> <расширение>"
  exit 1
fi

directory=$1
extension=$2

# Проверка существования директории
if [ ! -d "$directory" ]; then
  echo "Каталог не найден: $directory"
  exit 1
fi


count=$(find "$directory" -type f -name "*$extension" | wc -l)

echo "Количество файлов с расширением '$extension' в каталоге '$directory': $count"