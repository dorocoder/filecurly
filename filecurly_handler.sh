
#!/bin/bash

# Set payload fields with as you want
# You are allowed to add custom fields in the same way as LOGCOLLECTOR_VER
export LOGCOLLECTOR_ENDPOINT="http://***"
export LOGCOLLECTOR_KEY="***"
export LOGCOLLECTOR_VER="1.0"

export loglevel_part="__ProJEcT_loglevel__"

while read body; do
        sed 's'$'\001''__ProJEcT_key__'$'\001'"$LOGCOLLECTOR_KEY"$'\001' payload.json |
        sed 's'$'\001''__ProJEcT_ver__'$'\001'"$LOGCOLLECTOR_VER"$'\001' |
        sed 's'$'\001''__ProJEcT_body__'$'\001'"$body"$'\001' |
        if [[ $body == *"[WARN]"* ]]; then
                sed "s/${loglevel_part}/WARN/g"
        elif [[ $body == *"[WARNING]"* ]]; then
                sed "s/${loglevel_part}/WARN/g"
        elif [[ $body == *"[ERROR]"* ]]; then
                sed "s/${loglevel_part}/ERROR/g"
        elif [[ $body == *"[CRITICAL]"* ]]; then
                sed "s/${loglevel_part}/CRITICAL/g"
        elif [[ $body == *"[INFO]"* ]]; then
                sed "s/${loglevel_part}/INFO/g"
        elif [[ $body == *"[DEBUG]"* ]]; then
                sed "s/${loglevel_part}/DEBUG/g"
        else
                sed "s/${loglevel_part}/ETC/g"
        fi |
        curl -s -X POST ${LOGCOLLECTOR_ENDPOINT} -d @- | cat;
done