# 🧹 MacCachePurge

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![macOS](https://img.shields.io/badge/platform-macOS-blue.svg)](https://www.apple.com/macos)
[![Bash](https://img.shields.io/badge/Bash-4.0%2B-green.svg)](https://www.gnu.org/software/bash/)

> A powerful and user-friendly command-line tool to efficiently clean cache and free up space on your Mac.

## ⚠️ Important Prerequisites

Before using MacCachePurge, you must grant Full Disk Access to Terminal.app:

1. Open System Settings (or System Preferences)
2. Go to Privacy & Security → Full Disk Access
3. Click the lock icon 🔒 to make changes (requires admin password)
4. Click the '+' button
5. Navigate to Applications → Utilities
6. Select Terminal.app
7. Ensure the checkbox next to Terminal.app is checked
8. Click the lock icon again to save changes

Without Full Disk Access, the script won't be able to access Trash and certain cache directories.

![Full Disk Access Setup](full-disk-access.gif)

## ✨ Features

- 🚀 Quick and efficient cache cleaning
- 💻 Cleans both user and system caches
- 🗑️ Complete trash cleanup (User, System, and External Drives)
- 📊 Shows space to be freed before cleaning
- 🎨 Colorful and interactive interface
- 🛡️ Secure operation with sudo handling

## 📋 System Requirements

- macOS operating system
- Terminal access
- Administrator (sudo) privileges
- **Full Disk Access** for Terminal.app (see prerequisites above)

## 🔧 Installation

1. Download the script:
```bash
curl -O https://raw.githubusercontent.com/phostilite/maccachepurge/main/clean_mac_cache.sh
```

2. Make it executable:
```bash
chmod +x clean_mac_cache.sh
```

3. Move to system bin for easy access from anywhere:
```bash
sudo mv clean_mac_cache.sh /usr/local/bin/clean_mac_cache
```

After installation, you can run the script from any directory by simply typing:
```bash
clean_mac_cache
```

💡 **Tip:** If `/usr/local/bin` doesn't exist, create it first:
```bash
sudo mkdir -p /usr/local/bin
```

### Alternative Installation Method
If you prefer to keep the script in a specific location, you can also:
1. Save it in your preferred directory
2. Create a symbolic link:
```bash
sudo ln -s /path/to/your/clean_mac_cache.sh /usr/local/bin/clean_mac_cache
```

### Uninstalling
To remove the script from your system:
```bash
sudo rm /usr/local/bin/clean_mac_cache
```

## 🚀 Usage

1. Ensure Terminal.app has Full Disk Access (see prerequisites)
2. Run the script in your terminal:
```bash
clean_mac_cache
```

### 📺 Demo

![Demo](demo.gif)

### 🖼️ Sample Output
```
Cache Cleaning Tool
================================================
Analyzing directories...

The following will be cleaned:
------------------------------------------------
User Cache (~Library/Caches): 2.1GB
System Cache (/Library/Caches): 1.3GB
Trash (All locations): 500MB
------------------------------------------------
Total space to be freed: 3.9GB

Do you want to proceed with cleaning? (y/n):
```

## ⚠️ Security Considerations

- The script requires sudo privileges for cleaning system caches
- Full Disk Access is required to access all cleaning locations
- All operations are performed on standard cache directories only
- Confirmation is required before any deletion
- No sensitive system files are touched
- Sudo session is managed securely

## 🔍 Troubleshooting

### Common Issues:

1. **"No items found in Trash" when you know there are items:**
   - Check if Terminal.app has Full Disk Access (see prerequisites)
   - Restart Terminal.app after granting access
   - Verify that there are actually items in the Trash

2. **"Permission denied" errors:**
   - Verify sudo privileges
   - Check Full Disk Access settings
   - Ensure Terminal.app is properly selected in Privacy settings
   - Try restarting Terminal after granting permissions

3. **Command not found after installation:**
   - Verify that `/usr/local/bin` is in your PATH
   - Check if the script was moved correctly
   - Try running `which clean_mac_cache` to locate the script

4. **Script not executing:**
   - Verify executable permissions: `ls -l /usr/local/bin/clean_mac_cache`
   - Re-run chmod if needed: `sudo chmod +x /usr/local/bin/clean_mac_cache`

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📜 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👤 Author

**Priyanshu Sharma**

- GitHub: [@phostilite](https://github.com/phostilite)

## 🙏 Acknowledgments

- Inspired by the need for a simple, efficient cache cleaning solution
- Thanks to the macOS community for testing and feedback
- Special thanks to contributors and bug reporters

## 📝 Note

Always review the directories that will be cleaned before proceeding. While this script is designed to be safe, it's good practice to understand what you're cleaning.

## 📮 Support

If you encounter any issues or have suggestions:
1. Check the Troubleshooting section above
2. Open an issue on GitHub
3. Consider contributing a fix or improvement

---
Made with ❤️ for the macOS community