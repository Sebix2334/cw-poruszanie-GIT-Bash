#!/bin/bash

# Domyślna wartość liczby plików
DEFAULT_COUNT=100

function show_help() {
  echo "Dostępne opcje:"
  echo "--date lub -d         : Wyświetl dzisiejszą datę"
  echo "--logs [n] lub -l [n] : Utwórz n plików logów (domyślnie 100)"
  echo "--error [n]           : Utwórz n plików błędów (domyślnie 100)"
  echo "--init                : Sklonuj repozytorium i dodaj ścieżkę do PATH"
  echo "--help lub -h         : Wyświetl pomoc"
}

case "$1" in
  --date|-d)
    date
    ;;
  
  --logs|-l)
    count=${2:-$DEFAULT_COUNT}
    mkdir -p logs
    for i in $(seq 1 $count); do
      echo "Log $i - $(date)" > "logs/log$i.txt"
    done
    ;;

  --error)
    count=${2:-$DEFAULT_COUNT}
    mkdir -p error
    for i in $(seq 1 $count); do
      echo "Error $i - $(date)" > "error/error$i.txt"
    done
    ;;

  --init)
    target_dir="repo_klonowany"
    git clone . "$target_dir"
    echo "export PATH=\$PATH:$(pwd)" >> ~/.bashrc
    source ~/.bashrc
    echo "Repozytorium sklonowane i PATH zaktualizowany. Uruchom ponownie terminal, jeśli coś nie działa."
    ;;

  --help|-h)
    show_help
    ;;

  *)
    echo "Nieznana opcja: $1"
    show_help
    ;;
esac
