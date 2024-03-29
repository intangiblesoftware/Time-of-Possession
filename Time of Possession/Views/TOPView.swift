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
    @Environment(\.scenePhase) var scenePhase

    @StateObject var homeConfiguration = Configuration(for: .home)
    @StateObject var visitorConfiguration = Configuration(for: .visitor)
    
    @State private var configurationIsShowing: Bool = false
    @State private var resetAlertIsShowing: Bool = false
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
                LargeTitleText(title: "Time of Possession")
                    .padding(.top)
                InstructionText(instruction: "Tap a button to start a timer. Tap again to stop.")
                // Buttons
                if verticalSizeClass == .compact {
                    HStack {
                        Spacer()
                        homeButton
                            .padding(8.0)
                            .onTapGesture {
                                tappedHome()
                            }
                        Spacer()
                        visitorButton
                            .padding(8.0)
                            .onTapGesture {
                                tappedVisitor()
                            }
                        Spacer()
                    }
                } else {
                    VStack {
                        Spacer()
                        homeButton
                            .padding(8.0)
                            .onTapGesture {
                                tappedHome()
                            }
                        Spacer()
                        visitorButton
                            .padding(8.0)
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
                        resetAlertIsShowing = true
                    } label: {
                        Image(systemName: "clock.arrow.circlepath")
                        Text("Reset Clock")
                    }
                    .padding()
                    .disabled(clockStatus != .stopped)
                    .alert("Reset Clock?", isPresented: $resetAlertIsShowing) {
                        Button(role: .none) {
                            // Just dismiss
                            resetClock()
                        } label: {
                            Text("OK")
                        }
                        Button(role: .cancel) {
                            // Just dismiss
                        } label: {
                            Text("Cancel")
                        }
                    }

                    Spacer()
                    // settings on right
                    Button {
                        configurationIsShowing.toggle()
                    } label: {
                        Image(systemName: "gear")
                        Text("Settings")
                    }
                    .padding(.trailing)
                    .disabled(clockStatus != .stopped)
                    .sheet(isPresented: $configurationIsShowing) {
                        ConfigurationView(homeConfig: homeConfiguration, visitorConfig: visitorConfiguration, isPresented: $configurationIsShowing)
                    }
                }
            }
        }.onChange(of: scenePhase) { newPhase in
            if newPhase == .background {
                stopClock(for: .home)
                stopClock(for: .visitor)
                homeConfiguration.save()
                visitorConfiguration.save()
            }
        }
    }
    
    func tappedHome() {
        switch clockStatus {
        case .homeIsRunning:
            stopClock(for: .home)
        case .visitorIsRunning:
            switchClock(to: .home)
        case .stopped:
            startClock(for: .home)
        }
    }
    
    func tappedVisitor() {
        switch clockStatus {
        case .homeIsRunning:
            switchClock(to: .visitor)
        case .visitorIsRunning:
            stopClock(for: .visitor)
        case .stopped:
            startClock(for: .visitor)
        }
    }
    
    func startClock(for team: Team) {
        if team == .home {
            clock = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { _ in
                homeConfiguration.elapsedTime += 1.0
            })
            homeConfiguration.clockIsRunning = true
            clockStatus = .homeIsRunning
        } else {
            clock = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { _ in
                visitorConfiguration.elapsedTime += 1.0
            })
            visitorConfiguration.clockIsRunning = true
            clockStatus = .visitorIsRunning
        }
    }
    
    func stopClock(for team: Team) {
        if team == .home {
            clock?.invalidate()
            clock = nil
            homeConfiguration.clockIsRunning = false
            clockStatus = .stopped
        } else {
            clock?.invalidate()
            clock = nil
            visitorConfiguration.clockIsRunning = false
            clockStatus = .stopped
        }
    }
    
    func switchClock(to team: Team) {
        if team == .home {
            visitorConfiguration.clockIsRunning = false
            clock?.invalidate()
            clock = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { _ in
                homeConfiguration.elapsedTime += 1.0
            })
            homeConfiguration.clockIsRunning = true
            clockStatus = .homeIsRunning
        } else {
            homeConfiguration.clockIsRunning = false
            clock?.invalidate()
            clock = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { _ in
                visitorConfiguration.elapsedTime += 1.0
            })
            visitorConfiguration.clockIsRunning = true
            clockStatus = .visitorIsRunning
        }
    }
    
    func resetClock() {
        homeConfiguration.clockIsRunning = false
        visitorConfiguration.clockIsRunning = false
        stopClock(for: .home)
        stopClock(for: .visitor)
        homeConfiguration.elapsedTime = 0.0
        visitorConfiguration.elapsedTime = 0.0
    }
}

struct LargeTitleText: View {
    var title: String
    
    var body: some View {
        Text(title)
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundColor(Color("instructionText"))
    }
}

struct InstructionText: View {
    var instruction: String
    
    var body: some View {
        Text(instruction)
            .font(.subheadline)
            .foregroundColor(Color("instructionText"))
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
