# Getting Started with PricingApp

## Quick Start

This repository contains a complete Win32 application skeleton written in C. Here's how to get started:

### Step 1: Install Prerequisites

You'll need MinGW (Minimalist GNU for Windows) to compile this application:

1. Download MinGW-w64 from: https://www.mingw-w64.org/downloads/
2. Install it (recommended location: C:\mingw-w64)
3. Add MinGW's bin folder to your system PATH:
   - Right-click "This PC" → Properties → Advanced system settings
   - Click "Environment Variables"
   - Edit "Path" under System variables
   - Add: `C:\mingw-w64\mingw64\bin` (or your installation path)
4. Open a new Command Prompt and verify:
   ```cmd
   gcc --version
   mingw32-make --version
   ```

### Step 2: Build the Application

#### Option A: Using the Build Script (Recommended)
Simply double-click `build.bat` or run:
```cmd
build.bat
```

#### Option B: Using Make Directly
```cmd
mingw32-make
```

#### Option C: Using Git Bash/WSL
```bash
./build.sh
```

### Step 3: Run the Application

After successful build, run:
```cmd
PricingApp.exe
```

You should see a window with:
- Title: "Pricing Application"
- Menu bar with "File" and "Help" menus
- Welcome message in the center

## What's Included

### Core Files
- **main.c** - Main application code with Win32 API calls
- **resource.h** - Resource constants and IDs
- **app.rc** - Resource definitions (menus, version info)

### Build System
- **Makefile** - Build configuration for make
- **build.bat** - Windows batch script for easy building
- **build.sh** - Unix shell script for Git Bash/WSL

### Documentation
- **README.md** - Main documentation
- **ARCHITECTURE.md** - Technical architecture details
- **GETTING_STARTED.md** - This file

### Resources
- **icon.ico** - Main application icon (placeholder)
- **icon_small.ico** - Small icon (placeholder)

## Next Steps

1. **Replace Icon Files**: Create proper .ico files to replace the placeholders
2. **Customize the UI**: Modify main.c to add your pricing logic
3. **Add More Features**: Follow the examples in ARCHITECTURE.md
4. **Test Thoroughly**: Run the application and test all menu items

## Troubleshooting

### "gcc is not recognized"
- MinGW is not installed or not in PATH
- Solution: Follow Step 1 above carefully

### "windows.h: No such file or directory"
- MinGW installation is incomplete
- Solution: Reinstall MinGW ensuring all components are selected

### Build succeeds but EXE doesn't run
- Missing DLL files
- Solution: Ensure MinGW's bin folder is in PATH

### Icon doesn't appear
- The placeholder icon files are not real .ico files
- Solution: Create proper .ico files (16x16, 32x32, 48x48 sizes recommended)

## Development Workflow

1. Make changes to main.c, resource.h, or app.rc
2. Run `mingw32-make clean` to remove old build files
3. Run `mingw32-make` to rebuild
4. Test PricingApp.exe
5. Repeat as needed

## Learn More

- **Win32 API Documentation**: https://docs.microsoft.com/en-us/windows/win32/
- **C Programming**: https://en.cppreference.com/w/c
- **MinGW Project**: https://www.mingw-w64.org/

## Support

For issues or questions:
1. Check ARCHITECTURE.md for technical details
2. Review the Win32 API documentation
3. Search for similar Win32 examples online

## License

See LICENSE file for details.
