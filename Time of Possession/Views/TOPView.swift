//
//  TOPView.swift
//  Time of Possession
//
//  Created by Jim Dabrowski on 11/10/21.
//

import SwiftUI

enum ClockStatus {
    case homeIsRunning
    case visitorIsRunning
    case stopped
}

struct TOPView: View {
    @Environment(\.verticalSizeClass) var verticalSizeClass: UserInterfaceSizeClass?
    @Environment(\.horizontalSizeClass) var horizontalSizeClass: UserInterfaceSizeClass?

    @StateObject var homeConfiguration = Configuration(for: .home)
    @StateObject var visitorConfiguration = Configuration(for: .visitor)
    
    @State private var configurationIsShowing: Bool = false
    @State private var clock: Timer? = nil
    @State private var clockStatus: ClockStatus = .stopped
    
    var body: some View {
        let homeButton = TOPButtonView(configuration: homeConfiguration)
        let visitorButton = TOPButtonView(configuration: visitorConfiguration)
        
        ZStack {
            Rectangle()
                .foregroundColor(Color("background"))
                .edgesIgnoringSafeArea(.all)
            VStack {
                // title label
                Text("Time of Possession")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color("instructionText"))
                    .padding(.top)
                Text("Tap a button to start a timer. Tap again to stop.")
                    .font(.subheadline)
                    .foregroundColor(Color("instructionText"))
                // Buttons
                if verticalSizeClass == .compact {
                    HStack {
                        Spacer()
                        homeButton
                            .onTapGesture {
                                tappedHome()
                            }
                        Spacer()
                        visitorButton
                            .onTapGesture {
                                tappedVisitor()
                            }
                        Spacer()
                    }
                } else {
                    VStack {
                        Spacer()
                        homeButton
                            .onTapGesture {
                                tappedHome()
                            }
                        Spacer()
                        visitorButton
                            .onTapGesture {
                                tappedVisitor()
                            }
                        Spacer()
                    }
                }
                
                // Footer buttons
                HStack {
                    // reset on left,
                    Button {
                    } label: {
                        Text("Reset")
                    }
                    .padding()
                    Spacer()
                    // settings on right
                    Button {
                        configurationIsShowing.toggle()
                    } label: {
                        Image(systemName: "gear")
                    }
                    .padding(.trailing)
                    .sheet(isPresented: $configurationIsShowing) {
                        ConfigurationView(homeConfig: homeConfiguration, visitorConfig: visitorConfiguration, isPresented: $configurationIsShowing)
                    }
                    
                }
            }
        }
    }
    
    func tappedHome() {
        switch clockStatus {
        case .homeIsRunning:
            clock?.invalidate()
            clock = nil
            homeConfiguration.clockIsRunning = false
            clockStatus = .stopped
        case .visitorIsRunning:
            visitorConfiguration.clockIsRunning = false
            clock?.invalidate()
            clock = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { _ in
                homeConfiguration.elapsedTime += 1.0
            })
            homeConfiguration.clockIsRunning = true
            clockStatus = .homeIsRunning
        case .stopped:
            clock = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { _ in
                homeConfiguration.elapsedTime += 1.0
            })
            homeConfiguration.clockIsRunning = true
            clockStatus = .homeIsRunning
        }
    }
    
    func tappedVisitor() {
        switch clockStatus {
        case .homeIsRunning:
            homeConfiguration.clockIsRunning = false
            clock?.invalidate()
            clock = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { _ in
                visitorConfiguration.elapsedTime += 1.0
            })
            visitorConfiguration.clockIsRunning = true
            clockStatus = .visitorIsRunning
        case .visitorIsRunning:
            clock?.invalidate()
            clock = nil
            visitorConfiguration.clockIsRunning = false
            clockStatus = .stopped
        case .stopped:
            clock = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { _ in
                visitorConfiguration.elapsedTime += 1.0
            })
            visitorConfiguration.clockIsRunning = true
            clockStatus = .visitorIsRunning
        }
    }
}

struct TOPView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TOPView()
                .preferredColorScheme(.dark)
                .previewInterfaceOrientation(.portrait)
            TOPView()
                .previewInterfaceOrientation(.landscapeLeft)
        }
    }
}


