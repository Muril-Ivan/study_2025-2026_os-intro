#!/bin/bash


# Определяем путь к текущему скрипту
SCRIPT_PATH="$(realpath "$0")"

# Создаем директорию backup в домашнем каталоге, если не существует
BACKUP_DIR="$HOME/backup"
mkdir -p "$BACKUP_DIR"

# Спрашиваем пользователя о выборе архивации
echo "Выберите способ архивации:"
echo "1. zip"
echo "2. bzip2"
echo "3. tar"
read -p "Введите номер выбранного варианта (1-3): " choice

# Имя файла резервной копии (без расширения)
BASENAME="$(basename "$SCRIPT_PATH")"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_FILE="$BACKUP_DIR/${BASENAME%.sh}_$TIMESTAMP"

case "$choice" in
  1)
    # Архивация zip
    cp "$SCRIPT_PATH" "$BACKUP_FILE.sh"
    zip "$BACKUP_FILE.zip" "$BACKUP_FILE.sh"
    rm "$BACKUP_FILE.sh"
    echo "Резервная копия создана: $BACKUP_FILE.zip"
    ;;
  2)
    # Архивация bzip2
    cp "$SCRIPT_PATH" "$BACKUP_FILE.bak"
    bzip2 "$BACKUP_FILE.bak"
    mv "$BACKUP_FILE.bak.bz2" "$BACKUP_FILE.bz2"
    echo "Резервная копия создана: $BACKUP_FILE.bz2"
    ;;
  3)
    # Архивация tar
    cp "$SCRIPT_PATH" "$BACKUP_FILE.sh"
    tar -cf "$BACKUP_FILE.tar" "$BACKUP_FILE.sh"
    rm "$BACKUP_FILE.sh"
    echo "Резервная копия создана: $BACKUP_FILE.tar"
    ;;
  *)
    echo "Некорректный выбор. Скрипт завершен."
    exit 1
    ;;
esac
