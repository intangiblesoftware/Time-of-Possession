//
//  ConfigurationView.swift
//  Time of Possession
//
//  Created by Jim Dabrowski on 11/11/21.
//

import SwiftUI

struct ConfigurationView: View {
    @Binding var teamName: String
    @Binding var colorName: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color("background"))
            VStack {
                HStack {
                    Text("Settings")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding([.top, .leading])
                    Button {
                        
                    } label: {
                        Text("Done")
                    }
                    .padding([.top, .trailing])

                }
                Form {
                    Section {
                        TextField("Team name: ", text: $teamName, prompt: Text("Team name"))
                    } header: {
                        Text("Team name")
                    }
                }
            }.onAppear {
                UITableView.appearance().backgroundColor = .clear
            }
        }
    }
}

struct ConfigurationView_Previews: PreviewProvider {
    static var previews: some View {
        ConfigurationView(teamName: .constant("Janesville"), colorName: .constant("red"))
            .previewLayout(.sizeThatFits)
    }
}
