//
//  FirstPage.swift
//  SignUpPage
//
//  Created by Joel Joseph on 12/16/19.
//  Copyright © 2019 Joel Joseph. All rights reserved.
//

import SwiftUI

struct FirstPage: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView {
            VStack{
                Text("Welcome to My App")
                    .font(.largeTitle)
                    .bold()
                    .padding(.top,100)
                
                Spacer()
                
                NavigationLink(destination: SignIn().navigationBarTitle("")
                .navigationBarBackButtonHidden(true)
                    .navigationBarHidden(true)) {
                    
                    Text("Sign In")
                    
                }.frame(width: 300, height: 50)
                .background(Color.black)
                .cornerRadius(10)
                .foregroundColor(.white)
                .animation(.easeIn(duration: 10))
                    .onTapGesture {
                        self.presentationMode.wrappedValue.dismiss()
                }
                    
                
                NavigationLink(destination: SignUp().navigationBarTitle("")
                    .navigationBarBackButtonHidden(true)
                    .navigationBarHidden(true)) {
                    Text("Sign Up")
                }.frame(width: 300, height: 50)
                    .background(Color.blue)
                    .foregroundColor(.white)
                .cornerRadius(10)
                    .padding(.top,10)
            }.navigationBarTitle("")
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
        }
    }
}

struct FirstPage_Previews: PreviewProvider {
    static var previews: some View {
        FirstPage()
    }
}
