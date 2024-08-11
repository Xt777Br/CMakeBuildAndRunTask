# CMakeBuildAndRunTask
A Simple bash script to build and run CMake Projects to use on tasks.json

## Usage

Tasks.json on ZED editor
```json
[
  ...
  {
      "label": "Build",
      "command": "sh ~/.local/bash/cmakeuni.sh build",
      "cwd": "$ZED_WORKTREE_ROOT",
      "use_new_terminal": false,
      "allow_concurrent_runs": false,
      "reveal": "always"
  },
  {
      "label": "Run",
      "command": "sh ~/.local/bash/cmakeuni.sh run",
      "cwd": "$ZED_WORKTREE_ROOT",
      "use_new_terminal": false,
      "allow_concurrent_runs": false,
      "reveal": "always"
  },
  {
      "label": "Build & Run",
      "command": "sh ~/.local/bash/cmakeuni.sh build run",
      "cwd": "$ZED_WORKTREE_ROOT",
      "use_new_terminal": false,
      "allow_concurrent_runs": false,
      "reveal": "always"
  }
]
```

## How works
This script use `grep` command to get project name from CMakeLists.txt to run after building, this only works if you are using PROJECT_NAME to name your executable like this:
```CMake
add_executable(
  ${PROJECT_NAME}
  ...
)
```

## Limitations
- Like said previous, your executable **MUST** be named with PROJECT_NAME  
- The script are not using cache for now, so it can be lazy on big projects...

## Installing
Here are script to download and move to `~/.local/bash/`:
```sh
mkdir -p ~/.local/bash && curl -o ~/.local/bash/cmakeuni.sh https://raw.githubusercontent.com/Xt777Br/CMakeBuildAndRunTask/main/cmakeuni.sh && chmod +x ~/.local/bash/cmakeuni.sh
```

You can also move to any directory just make sure to change in tasks.json

## Tested
- Tested on Ubuntu 24.04

## Feel free to clone and change this, i made this in 30 minutes so it can be improved and optimized
