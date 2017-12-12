#!/bin/bash

# Input Params 
fname=$1
key=$2

# Define variables
#Replace _ with . in filename e.g: lms.env.json to lms_env_json
parent_key=${fname//./_}
input_key=$parent_key.$key
default_key="default.$key"

#echo "$fname $key $input_key $default_key "

# Get value for key
val=$(cat my_config.json | jq -r .$input_key)
default_val=$(cat my_config.json | jq -r .$default_key) 
existing_val=$(cat $fname | jq .$key)

#echo "Existing Value: $existing_val , Default Value : $default_val , Value = $val "

updateKey()
{
fname=$1
key=$2
val=$3
jq -r --arg key $key --arg val $val --arg fname $fname  '.[$key] |= $val' $1 > $1.tmp && mv $1.tmp $1
echo "Updating $fname ::  $key : $val"
}

if [ "$existing_val" == "null" ]; then
#  echo "Key $key not found in $fname"
  exit 1;
fi
if [ "$default_val" != "null" ]; then
updateKey $fname $key $default_val
elif [ "$val" != "null" ]; then
updateKey $fname $key $val
else
echo "Value is null... Skipping Update"
fi
