#!/usr/bin/env swift

import Foundation
import AppKit

// Function to create app icon with red background and white heart
func generateAppIcon(size: CGFloat, filename: String) {
    let image = NSImage(size: NSSize(width: size, height: size))

    image.lockFocus()

    // Red gradient background
    let gradient = NSGradient(colors: [
        NSColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0),  // Bright red
        NSColor(red: 0.8, green: 0.0, blue: 0.0, alpha: 1.0)   // Deep red
    ])
    gradient?.draw(in: NSRect(x: 0, y: 0, width: size, height: size), angle: 135)

    // Create heart shape path
    let heartPath = NSBezierPath()
    let heartSize = size * 0.6  // Heart takes 60% of icon
    let offsetX = (size - heartSize) / 2
    let offsetY = (size - heartSize) / 2 - size * 0.05  // Slightly lower

    // Scale factor for heart coordinates
    let scale = heartSize / 100.0

    // Move to bottom point of heart
    heartPath.move(to: NSPoint(x: offsetX + 50 * scale, y: offsetY + 10 * scale))

    // Left curve of heart
    heartPath.curve(
        to: NSPoint(x: offsetX + 10 * scale, y: offsetY + 50 * scale),
        controlPoint1: NSPoint(x: offsetX + 50 * scale, y: offsetY + 30 * scale),
        controlPoint2: NSPoint(x: offsetX + 10 * scale, y: offsetY + 30 * scale)
    )

    // Left top arc
    heartPath.curve(
        to: NSPoint(x: offsetX + 50 * scale, y: offsetY + 90 * scale),
        controlPoint1: NSPoint(x: offsetX + 10 * scale, y: offsetY + 70 * scale),
        controlPoint2: NSPoint(x: offsetX + 30 * scale, y: offsetY + 90 * scale)
    )

    // Right top arc
    heartPath.curve(
        to: NSPoint(x: offsetX + 90 * scale, y: offsetY + 50 * scale),
        controlPoint1: NSPoint(x: offsetX + 70 * scale, y: offsetY + 90 * scale),
        controlPoint2: NSPoint(x: offsetX + 90 * scale, y: offsetY + 70 * scale)
    )

    // Right curve of heart
    heartPath.curve(
        to: NSPoint(x: offsetX + 50 * scale, y: offsetY + 10 * scale),
        controlPoint1: NSPoint(x: offsetX + 90 * scale, y: offsetY + 30 * scale),
        controlPoint2: NSPoint(x: offsetX + 50 * scale, y: offsetY + 30 * scale)
    )

    heartPath.close()

    // Fill heart with white color
    NSColor.white.setFill()
    heartPath.fill()

    // Add subtle shadow to heart
    let shadow = NSShadow()
    shadow.shadowColor = NSColor.black.withAlphaComponent(0.3)
    shadow.shadowBlurRadius = size * 0.02
    shadow.shadowOffset = NSSize(width: 0, height: -size * 0.01)

    image.unlockFocus()

    // Save as PNG
    guard let tiffData = image.tiffRepresentation,
          let bitmapImage = NSBitmapImageRep(data: tiffData),
          let pngData = bitmapImage.representation(using: .png, properties: [:]) else {
        print("Failed to create image data for \(filename)")
        return
    }

    try? pngData.write(to: URL(fileURLWithPath: filename))
    print("✅ Generated: \(filename) (\(Int(size))x\(Int(size)))")
}

// Create output directory
let outputDir = "AppIcon"
try? FileManager.default.createDirectory(atPath: outputDir, withIntermediateDirectories: true)

print("🎨 Generating Marriage Widget App Icons...\n")

// Generate all required icon sizes for iOS
let iconSizes: [(size: CGFloat, name: String)] = [
    (1024, "AppIcon-1024.png"),      // App Store
    (180, "AppIcon-180.png"),        // iPhone Pro Max @3x
    (167, "AppIcon-167.png"),        // iPad Pro
    (152, "AppIcon-152.png"),        // iPad @2x
    (120, "AppIcon-120.png"),        // iPhone @2x & @3x
    (87, "AppIcon-87.png"),          // iPhone @3x
    (80, "AppIcon-80.png"),          // Spotlight @2x
    (76, "AppIcon-76.png"),          // iPad
    (60, "AppIcon-60.png"),          // iPhone @2x
    (58, "AppIcon-58.png"),          // Settings @2x
    (40, "AppIcon-40.png"),          // Spotlight
    (29, "AppIcon-29.png"),          // Settings
    (20, "AppIcon-20.png"),          // Notification
]

for (size, name) in iconSizes {
    generateAppIcon(size: size, filename: "\(outputDir)/\(name)")
}

print("\n✨ Done! All icons generated in '\(outputDir)/' folder")
print("\n📝 Next steps:")
print("1. Open Xcode")
print("2. Select 'Assets' in the left sidebar")
print("3. Click 'AppIcon' in the asset catalog")
print("4. Drag and drop each icon into its correct slot")
print("5. Build and run!")
