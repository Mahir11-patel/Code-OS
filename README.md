# Code-OS
This OS that have all normal Application that we need generally  terminal and all apps.

# 💻 CodeOS

### A Developer WebOS that runs directly in your browser.

CodeOS is a browser-based operating system interface designed for developers. It provides a desktop-like environment where you can write code, manage files, use a terminal, browse the web, work with Git, and configure the system — all inside a single HTML application.

> **CodeOS v1.0.0**

![CodeOS Preview](./assets/codeos-preview.png)

---

## ✨ Features

- 🖥️ **Desktop Environment**
  - Desktop icons
  - Taskbar
  - Start menu
  - Window management
  - Minimize / maximize / close windows
  - Resizable windows

- 📝 **Code Editor**
  - Monaco Editor integration
  - Syntax highlighting
  - Multiple editor tabs
  - Programming-language support

- 📁 **File Explorer**
  - Browse the virtual filesystem
  - Create files and folders
  - Rename, move and delete files
  - File type icons
  - Directory navigation

- 💻 **Terminal**
  - Built-in terminal interface
  - Virtual filesystem commands
  - Developer-style command environment

- 🌐 **Browser**
  - Built-in browser application
  - Address bar
  - Browser window inside CodeOS

- 🌲 **Git**
  - Git-style repository interface
  - Branch/status display
  - Commit history interface

- 🧮 **Calculator**
  - Built-in calculator application

- ⚙️ **Settings**
  - Dark/light theme
  - Editor preferences
  - System information
  - Accent configuration

- 🔎 **Command Palette**
  - Quickly search and launch applications
  - Keyboard navigation
  - Developer-friendly shortcuts

- 🔔 **Notifications**
  - System notifications
  - Temporary notification messages

- 🌓 **Dark & Light Mode**
  - Modern dark interface
  - Light theme
  - Theme preference saved locally

The project defines eight built-in applications: Explorer, Editor, Terminal, Browser, Calculator, Settings, Git and About.

---

## 🚀 Getting Started

### 1. Clone the repository

```bash
git clone https://github.com/YOUR-USERNAME/codeos.git
```

### 2. Enter the project

```bash
cd codeos
```

### 3. Run CodeOS

Because CodeOS is a browser-based HTML application, you can open:

```text
codeos.html
```

directly in a modern web browser.

You can also use a local web server:

```bash
python -m http.server 8000
```

Then open:

```text
http://localhost:8000
```

---

## ⌨️ Keyboard Shortcuts

| Shortcut | Action |
|---|---|
| `Ctrl + Shift + P` | Open Command Palette |
| `Ctrl + Alt + T` | Open Terminal |
| `Ctrl + Alt + E` | Open Explorer |
| `Ctrl + Alt + N` | Open Editor |
| `Ctrl + W` | Close active window |
| `Ctrl + M` | Maximize / restore active window |
| `Alt + Tab` | Switch between windows |
| `Esc` | Close menus / command palette |

These shortcuts are implemented directly in the CodeOS JavaScript event system.

---

## 🗂️ Virtual Filesystem

CodeOS contains an in-browser virtual filesystem.

The default environment includes directories such as:

```text
/
├── home/
│   └── developer/
│       ├── projects/
│       │   └── web-app/
│       │       ├── index.html
│       │       ├── style.css
│       │       ├── app.js
│       │       └── README.md
│       │
│       ├── python-tools/
│       │   ├── utils.py
│       │   └── main.py
│       │
│       ├── documents/
│       └── downloads/
│
├── usr/
│   ├── bin/
│   └── lib/
│
├── etc/
├── tmp/
└── ...
```

The filesystem is stored using browser `localStorage`, allowing CodeOS to preserve its virtual filesystem between sessions.

---

## 🧰 Technology Stack

CodeOS is built primarily with:

- **HTML5**
- **CSS3**
- **JavaScript**
- **Monaco Editor**
- **Browser LocalStorage**
- **CSS Variables**
- **DOM APIs**

The HTML application loads the Monaco Editor and uses JetBrains Mono / Inter fonts for its developer-focused interface.

---

## 🎨 Interface

CodeOS uses a modern developer-oriented interface with:

- Glass-style windows
- Dark developer theme
- Light theme
- Grid desktop
- Taskbar
- Start menu
- Window animations
- Notifications
- Context menus
- Command palette

The desktop and window system are implemented entirely in the HTML/CSS/JavaScript application.

---

## 🖼️ Screenshots

### Desktop

![CodeOS Desktop](./assets/codeos-preview.png)

### Boot Screen

CodeOS includes a startup sequence that displays loading stages such as:

```text
Loading kernel modules...
Mounting file system...
Initializing window manager...
Loading applications...
Starting user interface...
Welcome to CodeOS
```

The boot sequence is implemented in the CodeOS startup logic.

---

## 📦 Project Structure

A simple repository structure can look like:

```text
codeos/
│
├── codeos.html
├── README.md
│
└── assets/
    └── codeos-preview.png
```

The current project can remain a single HTML application, making it very easy to test and share.

---

## 🌐 Run Anywhere

Because CodeOS runs inside a web browser, it can be used on systems with a modern browser without installing a traditional operating system.

You can run it on:

- Windows
- Linux
- macOS
- ChromeOS
- Other modern browser environments

---

## 🔐 Local-First Design

CodeOS maintains its virtual filesystem and theme settings in browser storage.

This means the project can provide a local development environment without requiring a traditional backend for its core desktop functionality.

---

## 📌 Current Version

**CodeOS 1.0.0**

The built-in About application identifies the project as a web-based operating system for developers and reports version `1.0.0`.

---

## 🛠️ Development

CodeOS is designed to be extended.

Possible future improvements include:

- Real GitHub integration
- Real Git repositories
- Package manager
- More terminal commands
- AI coding assistant
- Cloud storage
- User accounts
- Multiplayer collaboration
- Plugin system
- More applications
- Custom wallpapers
- Themes
- System notifications
- Mobile optimization

## ⭐ Contributing
Contributions are welcome!
1. Fork the repository.
2. Create a new branch.
```bash
git checkout -b feature/my-feature
```
3. Make your changes.
4. Test CodeOS in your browser.
5. Commit your changes.
```bash
git commit -m "Add my feature"
```
6. Push your branch.
   
```bash
git push origin feature/my-feature
```
7. Open a Pull Request.

## 📜 License

Add your preferred license to the repository.
For example:
MIT License
## 💙 CodeOS
**Code. Build. Create.**

CodeOS brings a developer-style operating system experience to the browser.

If you like the project, consider giving the repository a ⭐ star!
