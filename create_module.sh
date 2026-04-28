#!/bin/bash

# If PhpStorm sends the script name as the first arg, skip it
[[ "$1" == *".sh"* ]] && shift

VENDOR=$1
MODULE=$2
PROJECT_DIR="/var/www/html/mage"

# Validation: Ensure names aren't empty
if [ -z "$VENDOR" ] || [ -z "$MODULE" ]; then
    echo "Error: Vendor or Module name is empty."
    exit 1
fi

TARGET="$PROJECT_DIR/app/code/$VENDOR/$MODULE"

# CHECK IF MODULE EXISTS
if [ -d "$TARGET" ]; then
    echo "------------------------------------------"
    echo "STOP: Module $VENDOR_$MODULE already exists!"
    echo "Location: $TARGET"
    echo "------------------------------------------"
    exit 1
fi

# Create directory (mkdir -p handles existing Vendor folders safely)
mkdir -p "$TARGET/etc"

# Create registration.php
cat <<EOF > "$TARGET/registration.php"
<?php
\Magento\Framework\Component\ComponentRegistrar::register(
    \Magento\Framework\Component\ComponentRegistrar::MODULE,
    '${VENDOR}_${MODULE}',
    __DIR__
);
EOF

# Create etc/module.xml
cat <<EOF > "$TARGET/etc/module.xml"
<?xml version="1.0"?>
<config xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="urn:magento:framework:Module/etc/module.xsd">
    <module name="${VENDOR}_${MODULE}"/>
</config>
EOF

echo "------------------------------------------"
echo "SUCCESS!"
echo "Created: app/code/$VENDOR/$MODULE"
echo "------------------------------------------"