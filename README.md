# Cryptotool CLI

An interactive, user-friendly terminal utility designed for Kali Linux to handle common encoding, decoding, and basic obfuscation ciphers on the fly. Instead of messing with complex terminal syntax, just boot the tool, paste your string, and instantly get the results.

## Features
* **ROT13**: Symmetrical substitution cipher commonly found in beginner CTF puzzles.
* **Base64**: Quick encoding and decoding for web tokens, parameters, and payloads.
* **Hexadecimal**: Converts raw text to hex strings or parses hex dumps back into cleartext.
* **Binary**: Smooth conversion between standard ASCII text and binary (`01000001`) streams.
* **Infinite Loop Mode**: Keep pasting and processing text without needing to restart the tool.

##  How to Install (Local Setup)

To use this tool on your own Kali Linux machine, run the following steps in your terminal:

1. **Download the script** from this repository (or copy the raw code into a file named `cryptotool.sh`).
2. **Make the script executable**:
   ```bash
   chmod +x cryptotool.sh
