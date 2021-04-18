//
//  ContentView.swift
//  TestBindingExtension
//
//  Created by Christian Zagorski on 4/15/21.
//

import SwiftUI

struct ContentView: View {
    @State var title: String? = nil
    @State var notes: String? = nil
    
    var body: some View {
        Form {
            Text("hello")
                .onAppear()
                
            TextField("Title", text: Binding($title, ""))
            TextField("Notes", text: Binding($notes, ""))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
