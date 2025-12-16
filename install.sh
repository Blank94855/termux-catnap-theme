#!/data/data/com.termux/files/usr/bin/bash

pkg install -y fastfetch git wget

mkdir -p ~/.termux
cd ~/.termux

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/JetBrainsMono.zip
unzip -o JetBrainsMono.zip
rm JetBrainsMono.zip

cat > font.ttf << 'EOF'
JetBrainsMonoNerdFont-Regular.ttf
EOF

cp JetBrainsMonoNerdFont-Regular.ttf font.ttf

termux-reload-settings

mkdir -p ~/.config/fastfetch

cat > ~/.config/fastfetch/logo.json << 'EOF'
{
    "$schema": "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json",
    "logo": {
        "type": "small",
        "padding": {
            "left": 5,
            "right": 6,
            "top": 1
        }
    },
    "display": {
        "separator": "",
        "key": {
            "paddingLeft": 5,
            "width": 10
        }
    },
    "modules": [
        "break",
        "break",
        "colors",
        "break",
        {
            "key": " ",
            "type": "version",
            "format": " {project-name} {version}"
        },
        {
            "key": " ",
            "type": "colors",
            "symbol": "circle"
        }
    ]
}
EOF

cat > ~/.config/fastfetch/config.json << 'EOF'
{
    "$schema": "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json",
    "logo": {
        "type": "none"
    },
    "display": {
        "separator": "  ",
        "key": {
            "width": 22,
            "paddingLeft": 4
        },
        "size": {
          "binaryPrefix": "jedec"
        },
        "percent": {
            "type": 11
        },
        "bar": {
            "border": {
                "left": "\uee00",
                "leftElapsed": "\uee03",
                "right": "\uee02",
                "rightElapsed": "\uee05"
            },
            "char": {
                "total": "\uee01",
                "elapsed": "\uee04"
            },
            "width": 49
        }
    },
    "modules": [
        "break",
        {
            "type": "custom",
            "format": "  ┏━━━━━━━━━━━━━━━━━━━━ System Info ━━━━━━━━━━━━━━━━━━━━┓"
        },
        "break",
        {
            "key": "  User      ",
            "type": "title",
            "format": "{user-name}",
            "keyColor": "31"
        },
        {
            "key": " ⏱ Uptime    ",
            "type": "uptime",
            "keyColor": "31"
        },
        {
            "key": "  OS        ",
            "type": "os",
            "format": "{name} {version}",
            "keyColor": "32"
        },
        {
            "key": "  Kernel    ",
            "type": "kernel",
            "format": "{release}",
            "keyColor": "32"
        },
        {
            "key": " 󰻠 Arch      ",
            "type": "os",
            "format": "{arch}",
            "keyColor": "32"
        },
        {
            "key": "  Terminal  ",
            "type": "terminal",
            "keyColor": "33"
        },
        {
            "key": "  Shell     ",
            "type": "shell",
            "keyColor": "33"
        },
        {
            "type": "host",
            "key": "  Device    ",
            "keyColor": "34"
        },
        {
            "type": "cpu",
            "key": "  CPU       ",
            "format": "{vendor} {name} ({cores-logical}) @ {freq-max}",
            "keyColor": "34"
        },
        {
            "type": "gpu",
            "key": " 󰢮 GPU       ",
            "keyColor": "34"
        },
        {
            "key": "  RAM       ",
            "type": "memory",
            "keyColor": "34",
            "format": "{used} / {total} ({percentage})"
        },
        "break",
        {
             "type": "custom",
             "format": "   -----------------------------------------------------"
        },
        "break",
        {
            "key": " 󰋊 Storage   ",
            "type": "disk",
            "keyColor": "35",
            "folders": "/storage/emulated",
            "format": "{size-used} / {size-total} ({size-percentage})"
        },
        {
            "key": " ",
            "type": "disk",
            "keyColor": "35",
            "folders": "/storage/emulated",
            "format": "     {size-percentage-bar}"
        },
        "break",
        {
            "key": "  SD Card   ",
            "type": "disk",
            "keyColor": "35",
            "folders": "/mnt/media_rw/F590-80EE",
            "format": "{size-used} / {size-total} ({size-percentage})"
        },
        {
            "key": " ",
            "type": "disk",
            "keyColor": "35",
            "folders": "/mnt/media_rw/F590-80EE",
            "format": "     {size-percentage-bar}"
        },
        "break",
        { 
             "type": "custom", 
             "format": "  ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛"
        },
        "break",
        {
            "type": "title",
            "format": "   -----------------------------------------------------\u001b[37D {#yellow}{user-name}{#} @ {#blue}{host-name}{#} "
        },
        "break"
    ]
}
EOF

touch ~/.hushlogin

sed -i '/fastfetch/d' ~/.bashrc
echo 'fastfetch --config ~/.config/fastfetch/logo.json' >> ~/.bashrc
echo 'fastfetch --config ~/.config/fastfetch/config.json' >> ~/.bashrc

echo "Installation complete. Close and reopen Termux to see the new theme with icons."
