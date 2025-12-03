# Marriage Date Timestamp Helper

## How to Get Your Timestamp

### Method 1: Online Calculator (Easiest)
1. Visit https://www.unixtimestamp.com/
2. Enter your marriage date and time
3. Copy the timestamp value
4. Use it in the code

### Method 2: Use Swift Playground
```swift
import Foundation

let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
dateFormatter.timeZone = TimeZone(identifier: "GMT")

if let date = dateFormatter.date(from: "2020-01-01 00:00:00") {
    print(date.timeIntervalSince1970)
}
```

### Method 3: Use Terminal
```bash
# For macOS/Linux
date -j -f "%Y-%m-%d %H:%M:%S" "2020-01-01 00:00:00" +%s
```

## Example Timestamps

Here are some example timestamps for common dates (all at midnight GMT):

### 2024
- January 1, 2024: `1704067200`
- June 15, 2024: `1718409600`
- December 31, 2024: `1735603200`

### 2023
- January 1, 2023: `1672531200`
- June 15, 2023: `1686787200`
- December 31, 2023: `1704067199`

### 2022
- January 1, 2022: `1640995200`
- June 15, 2022: `1655251200`
- December 31, 2022: `1672531199`

### 2021
- January 1, 2021: `1609459200`
- June 15, 2021: `1623715200`
- December 31, 2021: `1640995199`

### 2020
- January 1, 2020: `1577836800`
- June 15, 2020: `1592179200`
- December 31, 2020: `1609459199`

### 2019
- January 1, 2019: `1546300800`
- June 15, 2019: `1560556800`
- December 31, 2019: `1577836799`

### 2018
- January 1, 2018: `1514764800`
- June 15, 2018: `1529020800`
- December 31, 2018: `1546300799`

## Time Zones

The timestamps above are for midnight GMT/UTC. If you want to use your local time:

1. Use the online calculator (Method 1) - it handles timezones automatically
2. Or adjust the timestamp manually:
   - EST/EDT (US East): subtract 5 hours = 18000 seconds
   - CST/CDT (US Central): subtract 6 hours = 21600 seconds
   - MST/MDT (US Mountain): subtract 7 hours = 25200 seconds
   - PST/PDT (US Pacific): subtract 8 hours = 28800 seconds

Example: For January 1, 2020 at midnight PST:
```
1577836800 - 28800 = 1577808000
```

## Quick Reference

To change the marriage date in your widget:

1. Open `Widget/MarriageWidgetExtension.swift`
2. Find line ~23:
   ```swift
   let marriageDate = Date(timeIntervalSince1970: 1577836800)
   ```
3. Replace `1577836800` with your timestamp
4. Save and rebuild the widget

## Note on Precision

The timestamp should be in **seconds** since January 1, 1970 (Unix epoch time).
- ✅ Correct: `1577836800` (seconds)
- ❌ Wrong: `1577836800000` (milliseconds - too many zeros!)
