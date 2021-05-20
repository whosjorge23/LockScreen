//
//  PasswordButton.swift
//  LockScreen
//
//  Created by Jorge Giannotta on 19/05/21.
//

import SwiftUI

struct PasswordButton: View {
    var value : String
    @Binding var password : String
    @Binding var key : String
    @Binding var unlocked : Bool
    @Binding var wrongPass : Bool
    
    var body: some View {
        Button(action: setPassword, label: {
            
            VStack(alignment: .center, spacing: nil, content: {
                if value.count > 1 {
                    
                    //Image...
                    Image(systemName: "delete.left")
                        .font(.system(size: 24))
                        .foregroundColor(.white)
                }else {
                    Text(value)
                        .font(.title)
                        .foregroundColor(.white)
                }
            })
            .padding()
        })
    }
    
    func setPassword(){
        
        //Checking if backspace pressed...
        
        withAnimation{
            if value.count > 1 {
                if password.count != 0 {
                    password.removeLast()
                }
            }else {
                if password.count != 4 {
                    password.append(value)
                    
                    //Delay Animation
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        withAnimation{
                            if password.count == 4 {
                                if password == key {
                                    unlocked = true
                                }else {
                                    wrongPass = true
                                    //password.removeAll()
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

//struct PasswordButton_Previews: PreviewProvider {
//    static var previews: some View {
//        PasswordButton()
//    }
//}
