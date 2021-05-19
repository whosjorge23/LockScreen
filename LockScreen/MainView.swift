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
            
            player().frame(height: UIScreen.main.bounds.height / 2.3)
            player().frame(height: UIScreen.main.bounds.height / 2.3)
        })
        
        
    }
}

struct player : UIViewControllerRepresentable {
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<player>) -> AVPlayerViewController {
        var videos =  ["https://d14pr3cu5atb0x.cloudfront.net/cms/1920x1080_Final_2020_Homepage%20Video-36f138a5ab.mp4","https://www.moovly.com/wp-content/uploads/2020/10/Moovlyhomepage2020-compressed.mp4"]
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
