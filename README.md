# PricingApp

A Windows desktop application for pricing management, built using Win32 API in C.

## Features

- Native Windows GUI application
- Simple and clean Win32 interface
- Menu-driven user interface
- Minimal dependencies (uses only Windows API)

## Prerequisites

To build this application, you need:

- **MinGW-w64** or **MinGW** (GCC compiler for Windows)
- **Make** utility (typically included with MinGW)

### Installing MinGW on Windows

1. Download MinGW-w64 from: https://www.mingw-w64.org/
2. Add MinGW's `bin` directory to your system PATH
3. Verify installation:
   ```cmd
   gcc --version
   mingw32-make --version
   ```

## Building the Application

### Using Make

From the project directory, run:

```cmd
mingw32-make
```

Or on Unix-like systems (Git Bash, WSL, MSYS2):

```bash
make
```

This will produce `PricingApp.exe` in the current directory.

### Cleaning Build Artifacts

To clean build artifacts:

```cmd
mingw32-make clean
```

Or:

```bash
make clean-unix
```

### Rebuilding from Scratch

```cmd
mingw32-make rebuild
```

## Running the Application

Simply double-click `PricingApp.exe` or run from command line:

```cmd
PricingApp.exe
```

## Project Structure

```
PricingApp/
├── main.c          # Main application source code
├── resource.h      # Resource definitions and constants
├── app.rc          # Resource script (menus, version info)
├── Makefile        # Build configuration
├── icon.ico        # Application icon (placeholder)
├── icon_small.ico  # Small application icon (placeholder)
└── README.md       # This file
```

## Development

### Architecture

The application follows a standard Win32 application structure:

- **WinMain**: Entry point
- **MyRegisterClass**: Registers the window class
- **InitInstance**: Creates the main window
- **WndProc**: Main window procedure (handles messages)

### Adding Features

To extend the application:

1. Add new menu items in `app.rc`
2. Define corresponding resource IDs in `resource.h`
3. Handle menu commands in the `WM_COMMAND` case of `WndProc`

## License

See [LICENSE](LICENSE) file for details.