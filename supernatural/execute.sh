docker run --name=seraphina -d alpine:3.14 sleep infinity

docker exec seraphina /bin/sh -c "echo \"$(cat /proc/sys/kernel/random/uuid)\" >> /home/potions.txt"

# Write your code here
#!/bin/bash

while true; do
    rsync -a --delete /twilight/ /twilight_mirror/
    sleep 1
done
