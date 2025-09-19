import AppKit

func printHelp() {
    let helpText = """
    Usage: hideall [options]

    Hides all currently visible applications (equivalent to pressing ⌘H for each).
    Leaves Finder visible by default so the desktop is shown.

    Options:
      --hide-finder   Also hides Finder (desktop icons will disappear).
      -h, --help      Show this help message.

    Examples:
      hideall           # hides all apps, leaves Finder visible
      hideall --hide-finder   # hides all apps including Finder
    """
    print(helpText)
}

let args = CommandLine.arguments

if args.contains("-h") || args.contains("--help") {
    printHelp()
    exit(0)
}

let hideFinder = args.contains("--hide-finder")

let apps = NSWorkspace.shared.runningApplications
for app in apps {
    if app.activationPolicy == .regular && !app.isHidden {
        if app.bundleIdentifier != "com.apple.finder" || hideFinder {
            _ = app.hide()
        }
    }
}

// If Finder not hidden, bring desktop forward
if !hideFinder, let finder = apps.first(where: { $0.bundleIdentifier == "com.apple.finder" }) {
    finder.activate(options: [])
}