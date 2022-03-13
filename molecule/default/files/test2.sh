#!/bin/bash
#/usr/local/bin/dfree_Drive.sh
df | awk '{total+=$2; avail+=$4; print $0} END{print total, avail}'
