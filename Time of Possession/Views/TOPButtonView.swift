//
//  TOPButtonView.swift
//  Time of Possession
//
//  Created by Jim Dabrowski on 11/10/21.
//

import SwiftUI
import Combine


struct TOPButtonView: View {
    @ObservedObject var configuration: Configuration
    
    var body: some View {
        ZStack {
            if configuration.clockIsRunning {
                LoweredRectangle(color: Color(configuration.colorName))
            } else {
                RaisedRectangle(color: Color(configuration.colorName))
            }
            VStack {
                TeamTextView(team: $configuration.name)
                ClockTextView(elapsedTime: $configuration.elapsedTime)
            }
            .foregroundColor(Color("buttonText"))
        }
    }
}

struct RaisedRectangle: View {
    var color: Color
    
    var body: some View {
        Rectangle()
            .foregroundColor(color)
            .shadow(color: Color.black, radius: 4, x: 2, y: 2)
    }
}

struct LoweredRectangle: View {
    var color: Color
    
    var body: some View {
        Rectangle()
            .foregroundColor(color)
            .padding(4.0)
    }
}

struct ClockTextView: View {
    @Binding var elapsedTime: Double
    
    var body: some View {
        Text(elapsedTimeString(elapsedTime: elapsedTime))
            .font(.system(size: 48, weight: .regular, design: .monospaced))
    }
    
    func elapsedTimeString(elapsedTime: Double) -> String {
        // Display elapsed time in hh:mm:ss padded with 0s
        let timeFormatter = DateComponentsFormatter()
        timeFormatter.allowedUnits = [.hour, .minute, .second]
        timeFormatter.zeroFormattingBehavior = .pad
        return timeFormatter.string(from: elapsedTime) ?? "00:00:00"
    }
}

struct TeamTextView: View {
    @Binding var team: String
    
    var body: some View {
        Text(team)
            .font(.system(size: 36))
            .fontWeight(.bold)
    }
}

struct TOPButtonView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TOPButtonView(configuration: Configuration(for: .home))
                .preferredColorScheme(.dark)
                .previewInterfaceOrientation(.portrait)
                .previewLayout(.sizeThatFits)
            TOPButtonView(configuration: Configuration(for: .visitor))
                .previewInterfaceOrientation(.landscapeLeft)
                .previewLayout(.sizeThatFits)
        }
    }
}
