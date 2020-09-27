#!/bin/sh

for part_conf in "ae83e173-107f-40c5-8af8-9ee76b2e33d6 int0" "53592491-0f95-41ec-a26e-944af563d11e int1" "2ed5a55e-da21-42ec-a56f-630e778145f0 int2"; do
        set -- $part_conf
        uuid="$1"
        int_name="$2"
        part_dev="/dev/disk/by-partuuid/$uuid"
        int_dev="/dev/mapper/$int_name"
        if [ -e $part_dev ] && ! [ -e $int_dev ]; then
                integritysetup open $part_dev $int_name -I sha1
        fi
done
