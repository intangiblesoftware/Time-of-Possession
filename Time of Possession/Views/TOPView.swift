//
//  TOPView.swift
//  Time of Possession
//
//  Created by Jim Dabrowski on 11/10/21.
//

import SwiftUI

struct TOPView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color("background"))
                .edgesIgnoringSafeArea(.all)
            VStack{
                TOPButtonView(color: Color.yellow, team: "Home Team")
                TOPButtonView(color: Color.blue, team: "Visiting Team")
            }
        }
    }
}

struct TOPView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TOPView()
            TOPView()
                .previewInterfaceOrientation(.landscapeLeft)
        }
    }
}
