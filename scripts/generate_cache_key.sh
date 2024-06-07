#!/bin/sh
echo "composer-$(md5sum composer.json | cut -d ' ' -f 1)"
