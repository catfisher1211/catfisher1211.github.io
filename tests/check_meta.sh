#!/usr/bin/env bash

# Simple check for og:url meta tags.
# Usage: bash tests/check_meta.sh

prefix="https://infiniteevse.com"
errors=0

while IFS= read -r file; do
  while IFS= read -r tag; do
    url=$(echo "$tag" | sed -n 's/.*content="\([^"]*\)".*/\1/p')
    if [[ -n "$url" && $url != $prefix* ]]; then
      echo "Invalid og:url in $file: $url"
      errors=1
    fi
  done < <(grep -o '<meta[^>]*property="og:url"[^>]*>' "$file")
done < <(find . -name '*.html')

if [ $errors -ne 0 ]; then
  echo "Check failed." >&2
  exit 1
fi

echo "All og:url meta tags are valid."

