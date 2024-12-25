# **IDM Activator**

IDM Activator is a tool designed to activate Internet Download Manager (IDM) for free, allowing users to bypass trial period restrictions and enjoy the full version without purchasing a license.

## 💪 **Features**

- ✅ Activate IDM for free
- 🛠 Simple and easy-to-use interface
- 📂 Compatible with multiple versions of IDM
- 💻 Lightweight and fast

## 🛠️ **Installation**

### **Method 1**
1. **Download**: Obtain the latest version of the tool from the [releases page](https://github.com/oop7/IDM-Activator/releases).
2. **Extract**: Unzip the downloaded file to a directory of your choice.

### **Method 2**
1. **Open PowerShell**:
   - Right-click the Start menu and select **Windows PowerShell** or **Windows Terminal**.
   - If prompted by User Account Control (UAC), click **Yes** to allow PowerShell to run with administrative privileges.

2. **Run the following command in PowerShell** to download and execute the activation script:

   ```powershell
    irm https://github.com/oop7/IDM-Activator/releases/download/v1.7/v1.7.zip -OutFile v1.7.zip; Expand-Archive v1.7.zip -DestinationPath . -Force; cmd.exe /c .\v1.7\script.bat
   ```

## 💻 **Usage**

### 1. Run the Script:
- Double-click on `script.bat` to execute it. The script will automatically request administrative privileges if needed, so you no longer need to manually select "Run as Administrator."
- If prompted by User Account Control (UAC), click **Yes** to grant the necessary permissions.
- Once elevated, the script will continue running with the appropriate permissions for file operations.

### 2. Follow the On-Screen Instructions:
- Choose an option from the menu:
  - `1` to activate Internet Download Manager.
  - `2` to activate Extra-FileType_Extensions.
  - `3` to exit.
- If you select `1`, the script will copy the necessary files to the appropriate directory and provide feedback on the operation status.

## ✅ **Troubleshooting**

- **Administrative Privileges**: If the script does not prompt for administrative rights, ensure you are running it with the required permissions by right-clicking and selecting "Run as Administrator."
- **File Paths**: Verify that the `data.bin`, `Registry.bin`, `extensions.bin`, and `ASCII_art.txt` files are correctly placed in the `src` directory.
- **Warning**: The default installation path for the software is:
  `C:\Program Files (x86)\Internet Download Manager`
  If the software is not installed in this directory, please ensure the path is correct before continuing.
- **Registered with a Fake Serial**: Use a trusted third-party uninstaller like IObit Uninstaller, and then use this script [IObit.Uninstaller-Activator](https://github.com/oop7/IObit.Uninstaller-Activator) to activate it and ensure all files, including registry entries, are removed.

## 📄 **BIN Files**

### These files are not encrypted; you can rename them to view the source file:

- `data.bin` — Contains a cracked version of IDM.exe.
- `Registry.bin` — Registry values to activate IDM.
- `extensions.bin` — Registry entries for extra IDM file extensions.

## 📜 **License**

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## ℹ️ **Acknowledgments**

- Special thanks to Ali.Dbg, who was instrumental in this script's functionality.

## ❓ **Contact**

For questions or support, please open an issue on the GitHub repository.
