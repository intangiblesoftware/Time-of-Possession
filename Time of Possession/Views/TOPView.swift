//
//  TOPView.swift
//  Time of Possession
//
//  Created by Jim Dabrowski on 11/10/21.
//

import SwiftUI

struct TOPView: View {
    @Environment(\.verticalSizeClass) var verticalSizeClass: UserInterfaceSizeClass?
    @Environment(\.horizontalSizeClass) var horizontalSizeClass: UserInterfaceSizeClass?
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color("background"))
                .edgesIgnoringSafeArea(.all)
            VStack {
                // title label
                Text("Time of Possession")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top)
                // Buttons
                if verticalSizeClass == .regular {
                    // iPhone portrait
                    VStack {
                        Spacer()
                        TOPButtonView(teamName: "Home Team")
                        Spacer()
                        TOPButtonView(teamName: "Visiting Team")
                        Spacer()
                    }
                } else if verticalSizeClass == .compact {
                    // iPhone landscape
                    HStack {
                        Spacer()
                        TOPButtonView(teamName: "Home Team")
                        Spacer()
                        TOPButtonView(teamName: "Visiting Team")
                        Spacer()
                    }
                } else {
                    // Who knows what else could appear here.
                }
                
                // Footer buttons
                HStack {
                    // reset on left,
                    Button {
                        
                    } label: {
                        Text("Reset")
                    }
                    .padding(.leading)
                    Spacer()
                    // settings on right
                    Button {
                        
                    } label: {
                        Image(systemName: "gear")
                    }
                    .padding(.trailing)
                }
            }
        }
    }
    
    func whoIsListener() {

    }
}


struct TOPView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TOPView()
                .environmentObject(TOPTimer())
                .previewInterfaceOrientation(.portrait)
            TOPView()
                .environmentObject(TOPTimer())
                .previewInterfaceOrientation(.landscapeLeft)
        }
    }
}


