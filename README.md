# Marriage Anniversary Widget

An iPhone Lock Screen widget that displays the time elapsed since your marriage date in days, hours, and minutes.

## Features

- Lock Screen widget showing days, hours, and minutes since marriage
- Real-time updates
- Compact design optimized for iPhone Lock Screen (iOS 16+)

## Setup Instructions

### Prerequisites

- macOS with Xcode 14.0 or later
- iPhone running iOS 16.0 or later
- Apple Developer account (for device testing)

### Xcode Project Setup

1. **Create a new Xcode project:**
   - Open Xcode
   - File → New → Project
   - Select "App" under iOS
   - Product Name: `MarriageWidget`
   - Interface: SwiftUI
   - Language: Swift
   - Click Next and save

2. **Add Widget Extension:**
   - File → New → Target
   - Select "Widget Extension" under iOS
   - Product Name: `MarriageWidgetExtension`
   - Include Configuration Intent: No
   - Click Finish
   - When prompted, click "Activate" to activate the scheme

3. **Replace the generated files:**
   - Replace `MarriageWidget/MarriageWidgetApp.swift` with `App/MarriageWidgetApp.swift`
   - Replace `MarriageWidget/ContentView.swift` with `App/ContentView.swift`
   - Replace the widget extension files with the contents of `Widget/MarriageWidgetExtension.swift`

4. **Set your marriage date:**
   - Open `Widget/MarriageWidgetExtension.swift`
   - Find the line: `let marriageDate = Date(timeIntervalSince1970: 1609459200)`
   - Replace with your actual marriage date (see instructions in file)

5. **Build and Run:**
   - Select your iPhone as the destination
   - Run the widget extension scheme
   - Add the widget to your Lock Screen:
     - Lock your iPhone
     - Long press on Lock Screen
     - Tap "Customize"
     - Tap on the widgets area below the time
     - Find "Marriage Anniversary" and add it

## Customization

### Change Marriage Date

Edit the `marriageDate` constant in `Widget/MarriageWidgetExtension.swift`:

```swift
// Example: January 1, 2020 at 00:00:00 GMT
let marriageDate = Date(timeIntervalSince1970: 1577836800)
```

To get your date's timestamp:
1. Go to https://www.unixtimestamp.com/
2. Enter your marriage date and time
3. Copy the timestamp
4. Use it in the code

### Customize Appearance

You can modify colors, fonts, and layout in the `MarriageWidgetEntryView` struct.

## File Structure

```
MarriageWidget/
├── App/
│   ├── MarriageWidgetApp.swift    # Main app entry point
│   └── ContentView.swift           # Main app view
└── Widget/
    └── MarriageWidgetExtension.swift  # Widget implementation
```

## Requirements

- iOS 16.0+
- Xcode 14.0+
- Swift 5.7+

## License

MIT License
