//
//  PasswordView.swift
//  LockScreen
//
//  Created by Jorge Giannotta on 19/05/21.
//

import SwiftUI

struct PasswordView: View {
    var index : Int
    @Binding var password : String
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.white, lineWidth: 2)
                .frame(width: 30, height: 30)
            
            //Checking whether it is typed...
            
            if password.count > index {
                Circle()
                    .fill(Color.green)
                    .frame(width: 30, height: 30)
            }
        }
    }
}

//struct PasswordView_Previews: PreviewProvider {
//    static var previews: some View {
//        PasswordView()
//    }
//}
