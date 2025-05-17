#!/bin/bash

case "$1" in
  --date) date ;;
  --logs)
    count=${2:-100}
    mkdir -p logs
    for i in $(seq 1 $count); do
      echo "Log file $i" > logs/log$i.txt
    done
    ;;
  --init)
    git clone . ../repo_klonowany
    echo "export PATH=\$PATH:$(pwd)" >> ~/.bashrc
    source ~/.bashrc
    ;;
  --error)
    count=${2:-100}
    mkdir -p error
    for i in $(seq 1 $count); do
      echo "Error file $i" > error/error$i.txt
    done
    ;;
  --help|-h)
    echo "--date: pokaż datę"
    echo "--logs [n]: utwórz pliki logów"
    echo "--init: sklonuj repo + dodaj PATH"
    echo "--error [n]: utwórz pliki błędów"
    echo "--help: pokaż pomoc"
    ;;
  *)
    echo "Nieznana flaga, użyj --help"
    ;;
esac
