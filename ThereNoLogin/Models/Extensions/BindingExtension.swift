//
//  BindingExtension.swift
//  ThereNoLogin
//
//  Created by Christian Zagorski on 4/14/21.
//

import Foundation
import SwiftUI

extension Binding {
    init(_ source: Binding<Value?>, _ defaultValue: Value) {
        // Ensure a non-nil value in `source`.
        if source.wrappedValue == nil {
            source.wrappedValue = defaultValue
        }
        // Unsafe unwrap because *we* know it's non-nil now.
        self.init(source)!
    }
}

//public init?(_ base: Binding<Value?>)


//extension Binding {
//init(_ source: Binding<Value?>, replacingNilWith nilValue: Value) {
//    self.init(
//        get: { source.wrappedValue ?? nilValue },
//        set: { newValue in
//            if newValue == nilValue {
//                source.wrappedValue = nil
//            }
//            else {
//                source.wrappedValue = newValue
//            }
//    })
//}
//}

