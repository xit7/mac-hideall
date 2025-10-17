# mac-hideall
Upon systemstart after login MacOS tends to open lots of windows. In prior Tahoe versions there was a LoginItems setting that should have prevented windows from showing up after start ("start hidde"), but that never really worked.
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
