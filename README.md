# **IDM Activation Script**

This script simplifies the process of activating IDM by automating the activation process with a single click. It includes features for copying necessary files and handling administrative privileges.

## 💪 Features

- Base64 Decoding: Decodes Base64-encoded files required for activation.
- Administrative Privileges: Requests elevation to run the script with administrative privileges.
- Interactive: Provides a simple menu for user interaction and options.

## 🛠️ Installation

1. Download: Obtain the latest version of the tool from the releases page.
2. Extract: Unzip the downloaded file to a directory of your choice.

## 💻 Usage

### 1. Run the Script:
- Right-click on `script.bat` and select Run as Administrator to ensure proper permissions for file operations.
- If prompted for administrative privileges, click Yes to allow the script to run with the necessary permissions.

### 2. Follow the On-Screen Instructions:
- Choose an option from the menu:
- `1` to activate IDM.
- `2` to exit.
- If you select 1, the script will decode the Base64 encoded files, Install them to the appropriate directory, and provide feedback on the operation status.

## ✅ Troubleshooting

- **Administrative Privileges**: If the script does not prompt for administrative rights, ensure you are running it with the required permissions by right-clicking and selecting Run as Administrator.
- **File Paths**: Verify that the encoded.txt,encoded_2.txt and encoded_ascii_art.txt files are correctly placed in the src directory.
- **Warning**: The default installation path for the software is:
``C:\Program Files (x86)\Internet Download Manager``
If the software is not installed in this directory, please ensure the path is correct before continuing.

## 📜 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## ℹ️ Acknowledgments

- Special thanks to Ali.Dbg, which was instrumental in this script's functionality.

## ❓ Contact

For questions or support, please open an issue on the GitHub repository.

