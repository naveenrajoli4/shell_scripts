#!/bin/bash

DISK_USAGE=$(df -hT | grep xfs)

echo "$DISK_USAGE"