#!/usr/bin/env bash
# Mengembalikan struktur folder dari file datar (nama pakai "__" sebagai pemisah folder)
set -e
for f in *__*; do
  [ -f "$f" ] || continue
  d="$(echo "$f" | sed 's|__|/|g')"
  mkdir -p "$(dirname "$d")"
  mv "$f" "$d"
done
test -f pubspec.yaml
test -f lib/main.dart
echo "struktur project dipulihkan"
