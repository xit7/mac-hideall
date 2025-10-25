# mac-hideall
Upon systemstart after login MacOS tends to open lots of windows - not only windows that were open before, but basically windows will popup for any application that you have setup to automatically start after login.
In MacOS versions prior Tahoe there was a LoginItems setting that should have prevented windows from showing up after start ("start hidden"). But that never really worked.
This tiny tool hides all currently unhidden apps once executed. I used it with Alfred App and it works great. Just fire up Alfred after system start and launch "hideall" and the pain is gone :)

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
