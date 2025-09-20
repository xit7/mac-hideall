#!/usr/bin/env bash
set -euo pipefail

APP_NAME="HideAll"
BUNDLE_ID="com.3y.hideall"
VERSION="1.1.0"

SRC_SWIFT="hideall.swift"
BUILD_DIR="$(pwd)/build"
DIST_DIR="$(pwd)/dist"
APP_DIR="$DIST_DIR/${APP_NAME}.app"
MACOS_DIR="$APP_DIR/Contents/MacOS"
CONTENTS_DIR="$APP_DIR/Contents"

# Clean & prep
rm -rf "$BUILD_DIR" "$DIST_DIR"
mkdir -p "$BUILD_DIR" "$MACOS_DIR"

echo "Compiling CLI binary…"
swiftc -O -framework AppKit "$SRC_SWIFT" -o "$BUILD_DIR/hideall"

echo "Creating app bundle…"
mkdir -p "$CONTENTS_DIR"

cat > "$CONTENTS_DIR/Info.plist" <<PLIST
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
  <key>CFBundleName</key><string>${APP_NAME}</string>
  <key>CFBundleDisplayName</key><string>${APP_NAME}</string>
  <key>CFBundleExecutable</key><string>hideall</string>
  <key>CFBundleIdentifier</key><string>${BUNDLE_ID}</string>
  <key>CFBundlePackageType</key><string>APPL</string>
  <key>CFBundleVersion</key><string>${VERSION}</string>
  <key>CFBundleShortVersionString</key><string>${VERSION}</string>
  <key>LSMinimumSystemVersion</key><string>11.0</string>
  <key>LSUIElement</key><true/> <!-- No Dock icon / menu bar when launching the .app -->
</dict>
</plist>
PLIST

cp "$BUILD_DIR/hideall" "$MACOS_DIR/hideall"
chmod +x "$MACOS_DIR/hideall"

# Optional: ad-hoc sign (helps avoid some Gatekeeper nags locally)
if command -v codesign >/dev/null 2>&1; then
  codesign --force --deep --sign - "$APP_DIR" || true
fi

echo
echo "Built CLI:   $BUILD_DIR/hideall"
echo "Built .app:  $APP_DIR"
open -R "$APP_DIR"