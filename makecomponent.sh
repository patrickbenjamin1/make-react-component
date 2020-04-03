#!/usr/bin/env bash
SCRIPTPATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

name=$1
upperName="$(tr '[:lower:]' '[:upper:]' <<< ${name:0:1})${name:1}"
dashName=$(echo $name        \
     | sed 's/\(.\)\([A-Z]\)/\1-\2/g' \
     | tr '[:upper:]' '[:lower:]')

echo $dashName

tsxpath="$SCRIPTPATH/component.tsx"
scsspath="$SCRIPTPATH/component.scss"

tsx=$(cat $tsxpath)
scss=$(cat $scsspath)

tsxOutput=${tsx//COMPONENTLOWER/$name}
tsxOutput=${tsxOutput//COMPONENTUPPER/$upperName}
tsxOutput=${tsxOutput//COMPONENTDASH/$dashName}

scssOutput=${scss//COMPONENTDASH/$dashName}

echo "$tsxOutput" > $name.tsx
echo "$scssOutput" > $name.scss