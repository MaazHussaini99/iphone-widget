//
//  ContentView.swift
//  MarriageWidget
//
//  Main app view with instructions
//

import SwiftUI
import Combine

struct ContentView: View {
    // Marriage Date: August 18, 2025 at 00:00:00 UTC
    // To change: Go to https://www.unixtimestamp.com/ and get your timestamp
    let marriageDate = Date(timeIntervalSince1970: 1755561600) // August 18, 2025

    @State private var currentDate = Date()
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "heart.circle.fill")
                .font(.system(size: 80))
                .foregroundColor(.pink)

            Text("Marriage Anniversary")
                .font(.title)
                .fontWeight(.bold)

            Text("Time Together")
                .font(.headline)
                .foregroundColor(.secondary)

            VStack(spacing: 15) {
                TimeComponentView(
                    value: timeComponents.days,
                    label: "Days"
                )

                TimeComponentView(
                    value: timeComponents.hours,
                    label: "Hours"
                )

                TimeComponentView(
                    value: timeComponents.minutes,
                    label: "Minutes"
                )

                TimeComponentView(
                    value: timeComponents.seconds,
                    label: "Seconds"
                )
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color(uiColor: .systemGray6))
            )
            .padding(.horizontal)

            Spacer()

            VStack(spacing: 10) {
                Text("To add the widget to your Lock Screen:")
                    .font(.headline)

                VStack(alignment: .leading, spacing: 5) {
                    Text("1. Lock your iPhone")
                    Text("2. Long press on the Lock Screen")
                    Text("3. Tap 'Customize'")
                    Text("4. Tap the widget area below the time")
                    Text("5. Add 'Marriage Anniversary' widget")
                }
                .font(.caption)
                .foregroundColor(.secondary)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.pink, lineWidth: 1)
            )
            .padding(.horizontal)

            Spacer()
        }
        .padding()
        .onReceive(timer) { _ in
            currentDate = Date()
        }
    }

    var timeComponents: (days: Int, hours: Int, minutes: Int, seconds: Int) {
        let calendar = Calendar.current
        let components = calendar.dateComponents(
            [.day, .hour, .minute, .second],
            from: marriageDate,
            to: currentDate
        )

        return (
            days: components.day ?? 0,
            hours: components.hour ?? 0,
            minutes: components.minute ?? 0,
            seconds: components.second ?? 0
        )
    }
}

struct TimeComponentView: View {
    let value: Int
    let label: String

    var body: some View {
        HStack {
            Text(label)
                .font(.headline)
                .foregroundColor(.secondary)
                .frame(width: 100, alignment: .leading)

            Spacer()

            Text("\(value)")
                .font(.system(size: 36, weight: .bold, design: .rounded))
                .foregroundColor(.pink)
                .frame(minWidth: 80, alignment: .trailing)
        }
    }
}

#Preview {
    ContentView()
}
