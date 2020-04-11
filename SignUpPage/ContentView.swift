//
//  ContentView.swift
//  SignUpPage
//
//  Created by Joel Joseph on 12/15/19.
//  Copyright © 2019 Joel Joseph. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var core:Core
    @State var setUp = false
    var body: some View {
        VStack{
            
            if (core.isSetUp ?? false){
                
                VStack {
                    Text("App Home Page")
                    Text("Welcome")
                    Text("Email: \(core.profile?.email ?? "")")
                    
                }
            }else{
                VStack {
                    FirstPage()
                    
                }
            }
        }.onAppear{self.core.listen()}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
