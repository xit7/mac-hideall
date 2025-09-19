# mac-hideall
Hides all currently unhidden apps

# Compile
swiftc -O -framework AppKit hideall.swift -o hideall

# Usage
./hideall -h
./hideall --help

# Install
* Place into: /usr/local/bin/
* Then add to your shell profile if not already in $PATH:

```
echo 'export PATH="$HOME/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc
```
