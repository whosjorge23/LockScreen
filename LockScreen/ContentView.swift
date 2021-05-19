//
//  ContentView.swift
//  LockScreen
//
//  Created by Jorge Giannotta on 19/05/21.
//

import SwiftUI

struct ContentView: View {
    @State var unLocked = false
    var body: some View {
        NavigationView {
            ZStack {
                //LockScreenView
                if unLocked{
                    MainView()
                }else{
                    LockScreenView(unLocked: $unLocked)
                }
            }
            .preferredColorScheme(unLocked ? .light : .dark)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
