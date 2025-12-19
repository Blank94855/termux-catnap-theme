A clean and informative Termux theme that displays system information with a modern aesthetic every time you open your terminal.

![Screenshot_20251219_083427_Termux](https://github.com/user-attachments/assets/862c097f-9f47-4461-a740-905dbbd391ee)

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


## Why Icons Show as Chinese Characters or Blank Squares

If you see Chinese characters, question marks, or blank squares instead of icons, it means your terminal doesn't have a **Nerd Font** installed.

### What's Happening?

The theme uses special Unicode characters called **Nerd Font icons** (like , , 󰻠, 󰢮, 󰋊). These are custom glyphs that only exist in Nerd Fonts - they're not part of standard fonts.

When your terminal tries to display these icons but doesn't have a Nerd Font installed:
- **Chinese characters appear** because the Unicode ranges overlap with Chinese character sets, so your system falls back to a Chinese font
- **Blank squares or boxes** appear when there's no fallback font at all for those Unicode positions
- **Question marks** appear when the system can't render the character

### Why This Happens in Different Terminals

**Termux (without Nerd Font):** Shows blank boxes or Chinese characters because it uses the default Android system fonts which don't include Nerd Font glyphs.

**XFCE Terminal, GNOME Terminal, etc.:** These desktop terminals will also show Chinese characters or blank boxes unless you manually configure them to use a Nerd Font (like JetBrains Mono Nerd Font, Hack Nerd Font, or FiraCode Nerd Font) in their font settings.

**Why it works in some terminals:** Some terminals like Kitty or Alacritty come pre-configured with Nerd Fonts or have better font fallback systems.

### The Solution

**For Termux:** The install script automatically downloads and installs JetBrains Mono Nerd Font to `~/.termux/font.ttf`.

**For other terminals:** You need to manually install a Nerd Font on your system and configure your terminal to use it in its settings/preferences.

**Important:** In Termux, you must completely close and reopen the app after installing the font - just opening a new session won't work. The font is only loaded when Termux starts.
