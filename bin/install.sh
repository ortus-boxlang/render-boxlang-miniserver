#!/bin/bash

# Define the build directory
BUILD_DIR="/app"

# Download Adoptium JDK 21 (OpenJDK 21) and extract it
echo "-----> Installing Adoptium JDK 21"
curl -L -o "$BUILD_DIR/jdk.tar.gz" https://github.com/adoptium/temurin21-binaries/releases/download/jdk-21%2B35/OpenJDK21U-jdk_x64_linux_hotspot_21_35.tar.gz
if [ $? -ne 0 ]; then
    echo "Failed to download JDK"
    exit 1
fi

# Extract the JDK
tar -xzf "$BUILD_DIR/jdk.tar.gz" -C "$BUILD_DIR"
if [ $? -ne 0 ]; then
    echo "Failed to extract JDK"
    exit 1
fi
rm "$BUILD_DIR/jdk.tar.gz"

# Check Java version
echo "-----> Checking Java version"
"$BUILD_DIR/jdk-21+35/bin/java" -version

# Download BoxLang miniserver JAR
echo "-----> Downloading BoxLang miniserver JAR"
curl -L -o "$BUILD_DIR/boxlang.jar" https://downloads.ortussolutions.com/ortussolutions/boxlang-runtimes/boxlang-miniserver/boxlang-miniserver-snapshot-all.jar
if [ $? -ne 0 ]; then
    echo "Failed to download BoxLang JAR"
    exit 1
fi

echo "-----> Build completed successfully."
