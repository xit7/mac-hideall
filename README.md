# mac-hideall
Hides all currently unhidden apps

# Compile
(Outdated: swiftc -O -framework AppKit hideall.swift -o hideall)

Run
```
build_app.sh
```

# Usage

```
./hideall -h
./hideall --help
```

# Install
* Place into: /usr/local/bin/
* Then add to your shell profile if not already in $PATH:

```
echo 'export PATH=/opt/local/bin/:$PATH' >> ~/.zshrc
source ~/.zshrc
```
