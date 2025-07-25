Restore Windows Photo Viewer in Windows 10/11
=============================================

This PowerShell script enables the classic Windows Photo Viewer on modern versions of Windows (10 and 11) and sets it as the default image viewer for formats like JPG, PNG, BMP, and GIF.

How to Use:
-----------

1. **Open the Script:**
   - Open the `.ps1` PowerShell script file using Notepad or any text editor.
   - Select all the content (Ctrl + A), then copy it (Ctrl + C).

2. **Run PowerShell as Administrator:**
   - Click Start and type "PowerShell".
   - Right-click on "Windows PowerShell" and select "Run as Administrator".

3. **Paste and Execute the Script:**
   - In the PowerShell window, right-click or press Ctrl + V to paste the copied script.
   - Press **Enter** to run the script.

4. **Wait for Completion:**
   - The script will automatically:
     - Uninstall Microsoft Photos app (optional cleanup).
     - Add registry entries to re-enable Windows Photo Viewer.
     - Set it as the default image viewer for common formats.

Notes:
------

- Administrator rights are required.
- It is recommended to create a system restore point before applying registry changes.
- No restart is required after running the script.

Author:
-------
Mohammad Arif
