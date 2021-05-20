//
//  HelpView.swift
//  LockScreen
//
//  Created by Jorge Giannotta on 20/05/21.
//

import SwiftUI

struct HelpView: View {
    var body: some View {
        VStack(alignment: .center, spacing: nil, content: {
            Text("Help")
                .font(.title2)
                .fontWeight(.heavy)
                .padding(.bottom, 100)
            Text("If you want to change pin type your pin and press Reset Password on the menu button")
                .padding()
            Spacer()
            NavigationLink(
                destination: ContentView(),
                label: {
                    RoundedRectangle(cornerRadius: 25.0)
                        .frame(width: 100, height: 50, alignment: .center)
                        .foregroundColor(.purple).opacity(0.8)
                        .overlay(
                            Text("Go Back")
                                .foregroundColor(.white)
                        )
                })
        })
        .navigationBarHidden(true)
    }
}

struct HelpView_Previews: PreviewProvider {
    static var previews: some View {
        HelpView()
    }
}
