#!/bin/bash

# Проверка наличия 
if [ "$#" -eq 0 ]; then
  echo "Передано не было аргументов."
  exit 0
fi

echo "Обработка:"
for arg in "$@"
do
  echo "$arg"
done