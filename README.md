# iPhone Multimedia Converter

A lightweight, zero-dependency Windows batch script (`.bat`) designed to quickly convert iPhone photos and videos (`.heic` and `.mov`) into universally compatible formats (`.png` and `.mp4`). 

Powered by **FFmpeg**, the script handles downloading its own dependencies via high-speed CDN and runs entirely locally, protecting your privacy.

## ✨ Features

* **Zero-Click Dependency Setup:** Automatically downloads, extracts, and deploys the latest local `ffmpeg.exe` binary at blazing speed using GitHub CDN mirrors on its first run.
* **Smart Progress Counter:** Displays a clean, real-time counter (e.g., `[4/900] Processing IMG_6164.heic`) so you always know exactly how much work is left.
* **Smart Skipping (Resumable):** Instantly detects and skips previously converted files. If the process is interrupted, just run it again and it will pick up right where it left off.
* **Clean & Silent Terminal:** Suppresses all of FFmpeg's verbose technical banners and logs, showing you only essential processing information.
* **100% Private & Local:** No cloud uploads. Your media is processed strictly on your machine.

## 🛠️ How to Use

1. **Download** this repository &rarr; [DOWNLOAD HERE](https://github.com/0ern/iPhone_Multimedia_Converter/archive/refs/heads/main.zip)
2. **Move** the script `.bat` into the folder containing your iPhone `.heic` and `.mov` files.
3. **Double-click** the script to run it.
4. All converted files will be safely organized in a newly created **`Converted`** folder inside the same directory.

## 📋 System Requirements

* **OS:** Windows 10 or Windows 11 (uses native `curl` and `tar` commands).
* **Internet Connection:** Required **only during the very first run** to automatically fetch the local FFmpeg binary.

## 🤝 Credits

- [iPhone_Multimedia_Converter](https://github.com/0ern/iPhone_Multimedia_Converter)
This project relies on the following amazing open-source resources:
* [FFmpeg](https://ffmpeg.org/) — The ultimate multimedia framework.
* [yt-dlp FFmpeg Builds](https://github.com/yt-dlp/FFmpeg-Builds) — For providing high-speed, reliable CDN release mirrors for the FFmpeg Windows binaries.

## 📄 License

This project is licensed under the **MIT License**.
