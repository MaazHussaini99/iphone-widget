//
//  MarriageWidgetExtension.swift
//  MarriageWidgetExtension
//
//  Lock Screen widget showing time since marriage
//

import WidgetKit
import SwiftUI

// MARK: - Configuration
// Marriage Date: August 18, 2025 at 2:50 PM IST (Nikah time)
// IST (India Standard Time) = UTC+5:30
// 2:50 PM IST = 9:20 AM UTC
// Unix Timestamp: 1755595200
//
// To change this date:
// 1. Go to https://www.unixtimestamp.com/
// 2. Enter your marriage date and time
// 3. Copy the timestamp value
// 4. Replace the number below

let marriageDate = Date(timeIntervalSince1970: 1755595200) // August 18, 2025, 2:50 PM IST

// MARK: - Timeline Entry
struct MarriageEntry: TimelineEntry {
    let date: Date
    let days: Int
    let hours: Int
    let minutes: Int
}

// MARK: - Timeline Provider
struct MarriageProvider: TimelineProvider {
    func placeholder(in context: Context) -> MarriageEntry {
        MarriageEntry(date: Date(), days: 365, hours: 12, minutes: 30)
    }

    func getSnapshot(in context: Context, completion: @escaping (MarriageEntry) -> Void) {
        let entry = createEntry(for: Date())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<MarriageEntry>) -> Void) {
        let currentDate = Date()
        let entry = createEntry(for: currentDate)

        // Update every minute
        let nextUpdate = Calendar.current.date(byAdding: .minute, value: 1, to: currentDate)!
        let timeline = Timeline(entries: [entry], policy: .after(nextUpdate))

        completion(timeline)
    }

    private func createEntry(for date: Date) -> MarriageEntry {
        let calendar = Calendar.current
        let components = calendar.dateComponents(
            [.day, .hour, .minute],
            from: marriageDate,
            to: date
        )

        return MarriageEntry(
            date: date,
            days: components.day ?? 0,
            hours: components.hour ?? 0,
            minutes: components.minute ?? 0
        )
    }
}

// MARK: - Widget View
struct MarriageWidgetEntryView: View {
    var entry: MarriageEntry
    @Environment(\.widgetFamily) var widgetFamily

    var body: some View {
        switch widgetFamily {
        case .accessoryCircular:
            circularView
        case .accessoryRectangular:
            rectangularView
        case .accessoryInline:
            inlineView
        default:
            rectangularView
        }
    }

    // Circular Lock Screen widget
    var circularView: some View {
        VStack(spacing: 2) {
            Image(systemName: "heart.fill")
                .font(.system(size: 16))
                .foregroundColor(.red)

            Text("\(entry.days)")
                .font(.system(size: 20, weight: .bold, design: .rounded))

            Text("days")
                .font(.system(size: 8))
                .textCase(.uppercase)
        }
        .containerBackground(for: .widget) {
            Color.clear
        }
    }

    // Rectangular Lock Screen widget (RECOMMENDED for showing all three values)
    var rectangularView: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Image(systemName: "heart.fill")
                    .font(.system(size: 12))
                    .foregroundColor(.red)
                Text("Married")
                    .font(.system(size: 12, weight: .semibold))
            }

            HStack(spacing: 12) {
                VStack(alignment: .leading, spacing: 0) {
                    Text("\(entry.days)")
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                    Text("days")
                        .font(.system(size: 8))
                        .textCase(.uppercase)
                        .foregroundColor(.secondary)
                }

                VStack(alignment: .leading, spacing: 0) {
                    Text("\(entry.hours)")
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                    Text("hrs")
                        .font(.system(size: 8))
                        .textCase(.uppercase)
                        .foregroundColor(.secondary)
                }

                VStack(alignment: .leading, spacing: 0) {
                    Text("\(entry.minutes)")
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                    Text("min")
                        .font(.system(size: 8))
                        .textCase(.uppercase)
                        .foregroundColor(.secondary)
                }
            }
        }
        .containerBackground(for: .widget) {
            Color.clear
        }
    }

    // Inline Lock Screen widget (above the time)
    var inlineView: some View {
        HStack(spacing: 4) {
            Image(systemName: "heart.fill")
                .foregroundColor(.red)
            Text("\(entry.days)d \(entry.hours)h \(entry.minutes)m married")
        }
        .containerBackground(for: .widget) {
            Color.clear
        }
    }
}

// MARK: - Widget Configuration
struct MarriageWidget: Widget {
    let kind: String = "MarriageWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: MarriageProvider()) { entry in
            MarriageWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Marriage Anniversary")
        .description("Shows how long you've been married in days, hours, and minutes.")
        .supportedFamilies([
            .accessoryCircular,      // Circular Lock Screen widget
            .accessoryRectangular,   // Rectangular Lock Screen widget (BEST for all values)
            .accessoryInline         // Inline Lock Screen widget (above time)
        ])
    }
}

// MARK: - Widget Bundle
@main
struct MarriageWidgetBundle: WidgetBundle {
    var body: some Widget {
        MarriageWidget()
    }
}

// MARK: - Previews
#Preview("Circular", as: .accessoryCircular) {
    MarriageWidget()
} timeline: {
    MarriageEntry(date: Date(), days: 1825, hours: 14, minutes: 32)
}

#Preview("Rectangular", as: .accessoryRectangular) {
    MarriageWidget()
} timeline: {
    MarriageEntry(date: Date(), days: 1825, hours: 14, minutes: 32)
}

#Preview("Inline", as: .accessoryInline) {
    MarriageWidget()
} timeline: {
    MarriageEntry(date: Date(), days: 1825, hours: 14, minutes: 32)
}
