//
//  ContentView.swift
//  LockScreen
//
//  Created by Jorge Giannotta on 19/05/21.
//

import SwiftUI

struct ContentView: View {
    @State var unLocked = false
    @State var help = false
    var body: some View {
        NavigationView {
            ZStack {
                //LockScreenView
                if unLocked{
                    MainView()
                }else if help {
                    HelpView()
                }else{
                    LockScreenView(unLocked: $unLocked, help: $help)
                }
            }
//            .preferredColorScheme(unLocked ? .light : .dark)
            .preferredColorScheme(.dark)
        }
        .navigationBarHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
