//
//  MainView.swift
//  LockScreen
//
//  Created by Jorge Giannotta on 19/05/21.
//

import SwiftUI
import AVKit

struct MainView: View {
    var body: some View {
        VStack(alignment: .center, spacing: nil, content: {
            Text("App Unlocked!")
                .font(.title2)
                .fontWeight(.heavy)
            ScrollView(.vertical, showsIndicators: false, content: {
                player().frame(height: UIScreen.main.bounds.height / 2.3)
                player().frame(height: UIScreen.main.bounds.height / 2.3)
            })
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

struct player : UIViewControllerRepresentable {
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<player>) -> AVPlayerViewController {
        let videos =  ["https://d14pr3cu5atb0x.cloudfront.net/cms/1920x1080_Final_2020_Homepage%20Video-36f138a5ab.mp4","https://www.moovly.com/wp-content/uploads/2020/10/Moovlyhomepage2020-compressed.mp4"]
        let controller = AVPlayerViewController()
        let url = videos.randomElement()!
        let player1 = AVPlayer(url: URL(string: url)!)
        controller.player = player1
        return controller
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: UIViewControllerRepresentableContext<player>) {
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

extension AVPlayerViewController {
    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.player?.pause()
        print("*** Video paused.")
    }
}
