A clean and informative Termux theme that displays system information with a modern aesthetic every time you open your terminal.
![34465](https://github.com/user-attachments/assets/8f1c628f-cfec-4a21-8954-c1b21f295cec)

## What It Does

This theme replaces the default Termux welcome message with a modified fastfetch script. 

It has:

- User and system details
- Uptime tracking
- OS and kernel information
- Device specifications (CPU, GPU, RAM)
- Storage usage with visual progress bars
- SD card information (if available)
- Color scheme preview
- Customized visual layout with borders and formatting


***NOTE:*** for better customization, install termux styling:
https://f-droid.org/en/packages/com.termux.styling/

## Installation

Run this single command in Termux:

```bash
git clone https://github.com/Blank94855/termux-catnap-theme && cd termux-catnap-theme && bash install.sh
```

After installation completes, restart Termux to see your new theme.

## Uninstallation

To remove the theme and restore default Termux behavior:

```bash
rm -rf ~/termux-catnap-theme
sed -i '/fastfetch/d' ~/.bashrc
rm -rf ~/.config/fastfetch
rm ~/.hushlogin
```

Then restart Termux.

## Requirements

- Termux (Android)
- Internet connection for installation

The script will automatically install all necessary dependencies including fastfetch and git.

## Notes

- The SD card path is set to `/mnt/media_rw/F590-80EE` by default. You may need to adjust this in the config if your SD card has a different path.
- The theme displays automatically on every new Termux session.
