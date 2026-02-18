# Cyberpunk Dev Dotfiles

A **Cyberpunk 2077–inspired terminal setup**, focused on performance, productivity, and a strong neon visual identity for developers.

Includes:

-   🎨 Custom WezTerm theme
    
-   🧠 Optimized configuration for Zsh and Bash
    
-   🚀 Styled Starship prompt
    
-   ☕ SDKMAN compatible
    
-   🔥 Automated installer

## 🖼 Environment Preview

-   Deep dark background
    
-   Neon yellow for primary text
    
-   Cyan cursor and active elements
    
-   Visual highlighting for directories, executables, and symlinks
    
-   Custom tab bar

## 📂 Project Structure
``` 
cyberpunk_theme/
├── wezterm/
│   └── wezterm.lua
├── shell/
│   ├── .zshrc
│   ├── .bashrc
├── starship/
│   └── starship.toml
├── scripts/
│   └── install.sh
└── README.md
``` 

## 🚀 Installation

Clone the repository:
```
git clone https://github.com/YOUR_USERNAME/dotfiles-cyberpunk.git
cd dotfiles-cyberpunk
```

Run the installer:
```
chmod +x scripts/install.sh
./scripts/install.sh
```

The script:

-   Verifies required directories
    
-   Creates missing folders
    
-   Copies configuration files properly
    
-   Adjusts permissions
    
-   Requests sudo when necessary


## 🎨 Technologies Used

-   WezTerm
    
-   Starship
    
-   Zsh
    
-   Bash
    
-   SDKMAN!

## 🧠 The Idea

Visual minimalism.  
Maximum performance.  
Strong identity.

No bloated configurations.  
Fully modular.  
Fully versioned.

## 🔥 Roadmap

-   Symlink-based installation mode
    
-   Automatic backup before overwriting configs
    
-   Multi-environment profiles (desktop / laptop / minimal)
    
-   Dependency installation script
    
-   Android (Termux) support

## 🤝 Contributions

Pull requests are welcome.  
Improvement suggestions are always appreciated.

## 📜 License

MIT — Use it, modify it, evolve it, have fun.
