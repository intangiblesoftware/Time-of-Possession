//
//  ConfigurationView.swift
//  Time of Possession
//
//  Created by Jim Dabrowski on 11/11/21.
//

import SwiftUI

struct ConfigurationView: View {
    @Environment(\.verticalSizeClass) var verticalSizeClass: UserInterfaceSizeClass?
    @Environment(\.horizontalSizeClass) var horizontalSizeClass: UserInterfaceSizeClass?
    
    @ObservedObject var homeConfig: Configuration
    @ObservedObject var visitorConfig: Configuration
    
    @Binding var isPresented: Bool
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color("background"))
            if verticalSizeClass == .compact {
                HStack {
                    Spacer()
                    TeamConfigurationView(configuration: homeConfig)
                    Spacer()
                    TeamConfigurationView(configuration: visitorConfig)
                    Spacer()
                }
            } else {
                VStack {
                    Spacer()
                    TeamConfigurationView(configuration: homeConfig)
                    Spacer()
                    TeamConfigurationView(configuration: visitorConfig)
                    Spacer()
                }
            }
        }
    }
}


struct ConfigurationView_Previews: PreviewProvider {
    static var previews: some View {
        ConfigurationView(homeConfig: Configuration(for: .home), visitorConfig: Configuration(for: .visitor), isPresented: .constant(true))
.previewInterfaceOrientation(.portrait)
        
        ConfigurationView(homeConfig: Configuration(for: .home), visitorConfig: Configuration(for: .visitor), isPresented: .constant(true))
            .previewInterfaceOrientation(.landscapeLeft)
            .preferredColorScheme(.dark)
    }
}
