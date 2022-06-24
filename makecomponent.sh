#!/usr/bin/env bash
SCRIPTPATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

# name provided in camelcase
camelName=$1

pascalName="$(tr '[:lower:]' '[:upper:]' <<< ${camelName:0:1})${camelName:1}"

kebabName=$(echo $camelName        \
     | sed 's/\(.\)\([A-Z]\)/\1-\2/g' \
     | tr '[:upper:]' '[:lower:]')

echo $kebabName

tsxpath="$SCRIPTPATH/component.tsx"
scsspath="$SCRIPTPATH/component.scss"

tsx=$(cat $tsxpath)
scss=$(cat $scsspath)

tsxOutput=${tsx//COMPONENTCAMEL/$camelName}
tsxOutput=${tsxOutput//COMPONENTPASCAL/$pascalName}
tsxOutput=${tsxOutput//COMPONENTKEBAB/$kebabName}

scssOutput=${scss//COMPONENTKEBAB/$kebabName}

echo "$tsxOutput" > $camelName.tsx
echo "$scssOutput" > $camelName.scss