#!/bin/bash

# Initialize variables to check for the presence of arguments
has_build=false
has_run=false

# Iterate over all script arguments
for arg in "$@"; do
    case $arg in
        build)
            has_build=true
            ;;
        run)
            has_run=true
            ;;
    esac
done

# Print the current working directory and path to CMakeLists.txt
echo "$(pwd)/CMakeLists.txt"
dir=$(pwd)

# Extract the target name from CMakeLists.txt
project_name=$(grep -E 'project([^()]*)' "$dir/CMakeLists.txt")

target_name=$(echo "$project_name" | sed -e 's/.*(\(.*\)).*/\1/' -e 's/"//g')
# Print the extracted target name
echo "$target_name"

# Check if a target name was found
if [ -z "$target_name" ]; then
  echo "Error: Target name not found in CMakeLists.txt"
  exit 1
fi

if $has_build; then
rm -rf $dir/build && mkdir $dir/build && cd $dir/build && cmake $dir && cmake --build $dir/build
fi


# Check if the target executable exists and is runnable
if [ -x "./$target_name" ]; then
  # Run the target executable
  if $has_run; then
    $dir/build/"$target_name"
  else
    echo "Success!"
  fi
else
  echo "Error: Target executable not found or not executable"
  exit 1
fi
