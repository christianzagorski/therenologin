//
//  ToolbarMultiple.swift
//  ToolBar_Testing
//
//  Created by Christian Zagorski on 4/22/21.
//

import SwiftUI

struct ToolbarMultiple: View {
    var body: some View {
        NavigationView {
            Text("Hello, World!").padding()
                .navigationTitle("SwiftUI")
                .toolbar {
                    ToolbarItemGroup(placement: .bottomBar) {
                        Button("First") {
                            print("Pressed")
                        }

                        Button("Second") {
                            print("Pressed")
                        }
                    }
                }
        }
    }
}

struct ToolbarMultiple_Previews: PreviewProvider {
    static var previews: some View {
        ToolbarMultiple()
    }
}
