//
//  SignIn.swift
//  SignUpPage
//
//  Created by Joel Joseph on 12/15/19.
//  Copyright © 2019 Joel Joseph. All rights reserved.
//

import SwiftUI

struct SignIn: View {
    
    @State var email:String = ""
    @State var password:String = ""
    @State var error = false
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var core:Core
    
    func signIn () {
        error = false
        core.signIn(email: email, password: password) { (result, error) in
            if error != nil {
                print("\(String(describing: error))")
                self.error = true
            } else {
                self.email = ""
                self.password = ""
                self.presentationMode.wrappedValue.dismiss()
            }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack{
                Form{
                    TextField("Email", text: $email)
                    SecureField("Password", text: $password)
                }
                Button(action: {
                    self.signIn()
                    self.core.profile?.email = self.email
                    self.core.isSetUp = true
                    self.presentationMode.wrappedValue.dismiss()
                    
                }) {
                    Text("Sign In")
                    
                }
            }.navigationBarTitle("Sign In")
            
            
        }
    }
}

struct SignIn_Previews: PreviewProvider {
    static var previews: some View {
        SignIn()
    }
}
