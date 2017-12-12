#!/bin/bash
# declare an array called files, that contains 3 values

updateConfig()
{
filename=$1
p_name=$2

keys=( $( jq -r --arg p_name $p_name '.[$p_name] | keys[]' my_config.json) )
for i in "${keys[@]}"
do
key=$i
bash update_config.sh $filename $key
done
}

updateConfig lms.env.json default
updateConfig cms.env.json default
updateConfig lms.auth.json default
updateConfig cms.auth.json default
updateConfig lms.env.json lms_env_json
updateConfig cms.env.json cms_env_json
updateConfig lms.auth.json lms_auth_json
updateConfig cms.auth.json cms_auth_json

