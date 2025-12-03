# Quick Setup Guide

## Step 1: Create Xcode Project

1. Open Xcode
2. File → New → Project
3. Select "App" under iOS
4. Fill in:
   - Product Name: `MarriageWidget`
   - Interface: `SwiftUI`
   - Language: `Swift`
5. Save the project

## Step 2: Add Widget Extension

1. In Xcode: File → New → Target
2. Select "Widget Extension"
3. Product Name: `MarriageWidgetExtension`
4. Uncheck "Include Configuration Intent"
5. Click Finish
6. Click "Activate" when prompted

## Step 3: Add Source Files

### Main App Files
1. Delete the default `MarriageWidgetApp.swift` and `ContentView.swift`
2. Add files from the `App/` folder:
   - Right-click on `MarriageWidget` group → Add Files
   - Select `App/MarriageWidgetApp.swift` and `App/ContentView.swift`
   - Ensure "MarriageWidget" target is checked

### Widget Extension Files
1. Delete the default widget files in the `MarriageWidgetExtension` group
2. Add the file from `Widget/` folder:
   - Right-click on `MarriageWidgetExtension` group → Add Files
   - Select `Widget/MarriageWidgetExtension.swift`
   - Ensure "MarriageWidgetExtension" target is checked

## Step 4: Set Your Marriage Date

1. Open `Widget/MarriageWidgetExtension.swift`
2. Find this line near the top:
   ```swift
   let marriageDate = Date(timeIntervalSince1970: 1577836800)
   ```
3. Get your marriage date timestamp:
   - Visit https://www.unixtimestamp.com/
   - Enter your marriage date and time
   - Copy the timestamp
4. Replace `1577836800` with your timestamp

## Step 5: Build and Test

1. Select your iPhone as the destination (or iOS Simulator)
2. Select the scheme: `MarriageWidgetExtension` (not MarriageWidget)
3. Click Run (⌘R)
4. The widget picker should appear on your device

## Step 6: Add to Lock Screen

On your iPhone:
1. Lock your device
2. Long press on the Lock Screen
3. Tap "Customize"
4. Tap "Lock Screen"
5. Tap the widget area below the time
6. Scroll to find "Marriage Anniversary"
7. Choose your preferred style:
   - **Rectangular** (recommended) - shows days, hours, and minutes
   - **Circular** - shows only days
   - **Inline** - shows above the time
8. Tap outside to save

## Customization Tips

### Change Colors
In `MarriageWidgetExtension.swift`, modify the color:
```swift
.foregroundColor(.pink)  // Change to .blue, .red, .green, etc.
```

### Change Icon
Replace `"heart.fill"` with other SF Symbols:
- `"heart.circle.fill"`
- `"star.fill"`
- `"sparkles"`
- `"gift.fill"`

### Widget Families
The widget supports three Lock Screen styles:
- `.accessoryCircular` - Circular widget (shows days only)
- `.accessoryRectangular` - Rectangular widget (shows days, hours, minutes)
- `.accessoryInline` - Inline widget (appears above time)

## Troubleshooting

### Widget not appearing
- Make sure you ran the `MarriageWidgetExtension` scheme (not the main app)
- Check that your device is running iOS 16 or later
- Try restarting your iPhone

### Wrong time showing
- Verify your marriage date timestamp is correct
- Make sure the timestamp is in seconds (not milliseconds)
- Check your device's timezone settings

### Build errors
- Ensure both targets have the correct Swift files assigned
- Clean build folder: Product → Clean Build Folder (⇧⌘K)
- Restart Xcode

## Requirements

- macOS with Xcode 14.0+
- iPhone running iOS 16.0+
- Apple Developer account (free or paid)

## Next Steps

Once you have the widget working:
1. Customize the appearance to your liking
2. Consider adding more widget sizes
3. Add app icon and widget preview images
4. Submit to the App Store (optional)

Enjoy your Marriage Anniversary widget! 💕
