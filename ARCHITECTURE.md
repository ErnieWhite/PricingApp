# Win32 Application Architecture Notes

## Overview
This is a minimal Win32 application skeleton following Microsoft's recommended structure for native Windows desktop applications.

## Key Components

### 1. WinMain (Entry Point)
- Standard Win32 application entry point
- Registers window class
- Initializes the application
- Runs the message loop

### 2. MyRegisterClass
- Registers the window class with Windows
- Defines window properties (icons, cursor, background, menu)
- Uses WNDCLASSEXW for Unicode support

### 3. InitInstance
- Creates the main application window
- Shows and updates the window
- Returns success/failure status

### 4. WndProc (Window Procedure)
- Handles all Windows messages
- Currently implements:
  - WM_COMMAND: Menu command handling
  - WM_PAINT: Window painting
  - WM_DESTROY: Application shutdown

## Resource Files

### resource.h
Defines constants for:
- Application icons (IDI_PRICINGAPP, IDI_SMALL)
- Menu resource (IDC_PRICINGAPP)
- Menu items (IDM_ABOUT, IDM_EXIT)

### app.rc
Contains:
- Icon references (placeholders currently)
- Menu structure (File and Help menus)
- Keyboard accelerators
- Version information

## Build Process

1. Compile main.c to main.o
2. Compile app.rc to app.res (using windres)
3. Link main.o and app.res with Windows libraries

## Customization Guide

### Adding New Menu Items
1. Add constant to resource.h
   ```c
   #define IDM_NEW_FEATURE  110
   ```

2. Add menu item to app.rc
   ```rc
   MENUITEM "&New Feature", IDM_NEW_FEATURE
   ```

3. Handle in WndProc
   ```c
   case IDM_NEW_FEATURE:
       // Your code here
       break;
   ```

### Adding Custom Drawing
Modify the WM_PAINT case in WndProc:
```c
case WM_PAINT:
{
    PAINTSTRUCT ps;
    HDC hdc = BeginPaint(hWnd, &ps);
    // Add your drawing code here
    EndPaint(hWnd, &ps);
}
break;
```

### Adding Dialog Boxes
1. Define dialog resource in app.rc
2. Create dialog procedure
3. Call DialogBox() from menu handler

## Testing on Windows

After building:
1. Run PricingApp.exe
2. Verify the window appears
3. Test menu items (File > Exit, Help > About)
4. Check that the window can be resized, minimized, maximized
5. Verify the window displays "Welcome to Pricing Application"

## Icon Files

The application currently uses default system icons (IDI_APPLICATION). To add custom icons:

1. Create .ico files (16x16 and 32x32 recommended for small, 32x32 and 48x48 for large)
2. Replace the placeholder files (icon.ico and icon_small.ico)
3. Uncomment the icon resource lines in app.rc:
   ```rc
   IDI_PRICINGAPP ICON "icon.ico"
   IDI_SMALL ICON "icon_small.ico"
   ```
4. Update main.c to load the custom icons in MyRegisterClass():
   ```c
   wcex.hIcon = LoadIcon(hInstance, MAKEINTRESOURCE(IDI_PRICINGAPP));
   wcex.hIconSm = LoadIcon(hInstance, MAKEINTRESOURCE(IDI_SMALL));
   ```
5. Rebuild the application

You can create icons using:
- Visual Studio's built-in icon editor
- IcoFX (https://icofx.ro/)
- GIMP with ICO plugin
- Online tools like favicon.io

## Next Steps for Development

1. Add application-specific UI controls (buttons, text boxes, etc.)
2. Implement pricing calculation logic
3. Add database connectivity (if needed)
4. Implement file I/O for saving/loading data
5. Add more sophisticated menus and toolbars
6. Create About dialog with proper version info
7. Add error handling and logging
8. Implement settings/preferences dialog

## Common Win32 API Functions Used

- `CreateWindowW`: Creates a window
- `ShowWindow`: Shows the window
- `UpdateWindow`: Sends WM_PAINT message
- `GetMessage`: Retrieves messages from message queue
- `TranslateMessage`: Translates virtual-key messages
- `DispatchMessage`: Dispatches message to window procedure
- `BeginPaint`/`EndPaint`: Begin/end painting the window
- `DrawText`: Draws text in a rectangle
- `MessageBox`: Shows a message box dialog

## Debugging Tips

1. Use MessageBox() for quick debugging output
2. Enable verbose compiler warnings (-Wall)
3. Use Visual Studio debugger if available
4. Check GetLastError() after Win32 API calls
5. Validate HWND, HDC, and other handles before use

## Performance Considerations

- Minimize work in WM_PAINT handler
- Use InvalidateRect() to redraw specific areas
- Consider double buffering for complex graphics
- Cache resources (fonts, brushes, pens) when possible

## Security Notes

- Input validation for any user input
- Use secure string functions (e.g., StringCchCopy)
- Validate file paths and names
- Be careful with format strings
- Handle exceptions/errors gracefully
