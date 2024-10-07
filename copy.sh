#!/usr/bin/env bash

PACKAGES_DIR="packages"

usage() {
    echo "Usage: $0 [-t <type>] <name>"
}

while getopts ":t:h" opt; do
  case $opt in
    t)
      type=$OPTARG
      ;;
    h)
      usage
      exit 0
      ;;
    \?)
      echo "Invalid option: -$OPTARG"
      usage
      exit 1
      ;;
  esac
done

shift $(($OPTIND - 1))

if [ $# -eq 0 ]; then
  echo "Error: Required argument missing. Please provide a package name."
  usage
  exit 1
fi

if [ -z "$type" ]; then
  echo "Error: Required argument missing. Please provide a template type."
  usage
  exit 1
fi

name=$1

template="templates/template-$type"
if [ ! -d "$template" ]; then
    echo "Error: No template found for $type."
    exit 2
fi

package="$PACKAGES_DIR/$name"
if [ -d "$package" ]; then
    echo "Package '$name' already exists. Aborting..."
    exit 3
fi

mkdir -p "$package"
cp -R "$template/"* "$package"
find "$package" -type f -exec sed -i "s/template-$type/$name/g" {} \;
