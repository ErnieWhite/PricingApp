#!/bin/bash
# Build script for Pricing Application
# For use with Git Bash, WSL, or MSYS2 on Windows

echo "Building Pricing Application..."
echo ""

# Check if make exists
if ! command -v make &> /dev/null; then
    echo "ERROR: make not found in PATH"
    echo "Please install MinGW or build tools"
    exit 1
fi

# Check if gcc exists
if ! command -v gcc &> /dev/null; then
    echo "ERROR: gcc not found in PATH"
    echo "Please install MinGW and add it to your PATH"
    exit 1
fi

# Build the application
make
if [ $? -ne 0 ]; then
    echo ""
    echo "Build failed!"
    exit 1
fi

echo ""
echo "Build successful!"
echo "Executable: PricingApp.exe"
echo ""
