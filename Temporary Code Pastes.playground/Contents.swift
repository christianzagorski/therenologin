import UIKit

VStack {
    
    Button(action: NewPlaceView(), label: {
    
        
    })
    
    TabView {
        
        
            // Instance of the Gridview based on 'want' cards only
            CardsGridView(beenOrWant: "want")
            .tabItem {
                Image(systemName: "lock.rectangle.fill")
                Text("Want to go there")
            }
        

            // Instance of the Gridview based on 'been' cards only
            CardsGridView(beenOrWant: "been")
                .tabItem {
                    Image(systemName: "lock.rectangle.fill")
                    Text("Been there")
            }

    } // End TabView
    
}
