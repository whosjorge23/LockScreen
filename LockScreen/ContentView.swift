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
                    Text("App Unlocked!")
                        .font(.title2)
                        .fontWeight(.heavy)
                    
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
