//
//  LockScreenView.swift
//  LockScreen
//
//  Created by Jorge Giannotta on 19/05/21.
//

import SwiftUI

struct LockScreenView: View {
    @State var password = ""
    //you can reset it when user tap reset password...
    //AppStorage => UserDefaults...
    @AppStorage("lock_Password") var key = "2020"
    @Binding var unLocked : Bool
    @State var wrongPassword = false
    @Binding var help : Bool
    var body: some View {
        VStack(alignment: .center, spacing: nil, content: {
            HStack(alignment: .center, spacing: nil, content: {
                Spacer(minLength: 0)
                Menu(content: {
//                    Label(
//                        title: { Text("Help") },
//                        icon: { Image(systemName: "info.circle.fill") })
//                        .onTapGesture(perform: {
//                            //perform actions...
//                        })
                    Button(action: {
                        help = true
                        print("button")
                    }, label: {
                        Text("Help")
                        Image(systemName: "info.circle.fill")
                    })
//                    Label(
//                        title: { Text("Reset Password") },
//                        icon: { Image(systemName: "key.fill") })
//                        .onTapGesture(perform: {
//                            //perform actions...
//                            print("Tapped")
//                        })
                    Button(action: {
                        key = password
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                            withAnimation{
                                password.removeAll()
                            }
                        }
                        print("button")
                    }, label: {
                        Text("Reset Password")
                        Image(systemName: "key.fill")
                    })
                }) {
                    Image(systemName: "gear")
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 19, height: 19)
                        .foregroundColor(.white)
                        .padding()
                }
            })
            .padding(.leading)
            
            Image("softbayx-swiftui")
                .resizable()
                .frame(width: 95, height: 95)
                .padding(.top, 20)
            
            Text("Enter Pin To Unlock")
                .font(.title2)
                .fontWeight(.heavy)
                .padding(.top, 20)
            
            HStack(alignment: .center, spacing: 22, content: {
                // Pass Circle View...
                ForEach(0..<4, id: \.self){ index in
                    PasswordView(index: index, password: $password)
                }
            })
            .padding(.top, 30)
            
            //KeyPad...
            Spacer(minLength: 0)
            
            Text(wrongPassword ? "Incorrect Pin" : "")
                .foregroundColor(.red)
                .fontWeight(.heavy)
            
            Spacer(minLength: 0)
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3), spacing: 15){
                
                //Password Button ....
                
                ForEach(1...9, id: \.self){ value in
                    PasswordButton(value: "\(value)", password: $password, key: $key, unlocked: $unLocked, wrongPass: $wrongPassword)
                }
                
                PasswordButton(value: "", password: $password, key: $key, unlocked: $unLocked, wrongPass: $wrongPassword)
                PasswordButton(value: "0", password: $password, key: $key, unlocked: $unLocked, wrongPass: $wrongPassword)
                PasswordButton(value: "delete.fill", password: $password, key: $key, unlocked: $unLocked, wrongPass: $wrongPassword)
            }
            .padding(.bottom)
            
        })
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}

//struct LockScreenView_Previews: PreviewProvider {
//    static var previews: some View {
//        LockScreenView()
//    }
//}
