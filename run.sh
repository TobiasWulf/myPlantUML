#!/bin/bash

# get logging functions
source ./logger.sh

SCRIPTENTRY

export GRAPHVIZ_DOT=/usr/bin/dot
INFO "Graphviz location: $GRAPHVIZ_DOT"

export UML_SRC=charts
INFO "UML root source directory: $UML_SRC"

export UML_RUNNER=jar/plantuml.jar
INFO "PlantUML location: $UML_SRC"

PARAMS=""
while (( "$#" )); do
  case "$1" in
    -r|--recursive) # not used yet
      R_FLAG=1
      shift
      ;;
    -s|--sub-path) # subfolder in src dir
      if [ -n "$2" ] && [ ${2:0:1} != "-" ]; then
        export UML_SRC=$UML_SRC/$2
	INFO "Set UML soruce: $UML_SRC"
	shift 2
      else
        echo "Error: Argument for $1 is missing" >&2
        exit 1
      fi
      ;;
    -*|--*=) # unsupported flags
      echo "Error: Unsupported flag $1" >&2
      exit 1
      ;;
    *) # preserve positional arguments
      PARAMS="$PARAMS $1"
      shift
      ;;
  esac
done

INFO "Execute PlantUML on source folder and process in destination folder"
java -jar $UML_RUNNER -verbose "$UML_SRC"

SCRIPTEXIT
