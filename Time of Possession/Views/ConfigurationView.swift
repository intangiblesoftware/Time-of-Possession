//
//  ConfigurationView.swift
//  Time of Possession
//
//  Created by Jim Dabrowski on 11/11/21.
//

import SwiftUI

struct ConfigurationView: View {
    @Binding var teamName: String
    var body: some View {
        ZStack{
            Rectangle().foregroundColor(Color("background"))
                .ignoresSafeArea()
            VStack {
                Text("Configure Timer")
                    .foregroundColor(Color("instructionText"))
                Form {
                    TextField("Team name", text: $teamName, prompt: Text("Team name"))
                }
            }
        }
    }
}

struct ConfigurationView_Previews: PreviewProvider {
    static var previews: some View {
        ConfigurationView(teamName: .constant("Janesville"))
    }
}
