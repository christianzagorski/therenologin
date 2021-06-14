//
//  EncodableExtension.swift
//  ThereNoLogin
//
//  Created by Christian Zagorski on 6/10/21.
//

import Foundation

extension Encodable {
    var dictionary1: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
    }
}

extension Decodable {
  /// Initialize from JSON Dictionary. Return nil on failure
    
      init?(dictionary2 value: [String:Any]) {

        guard JSONSerialization.isValidJSONObject(value) else { return nil }
        guard let jsonData = try? JSONSerialization.data(withJSONObject: value, options: []) else { return nil }

        guard let newValue = try? JSONDecoder().decode(Self.self, from: jsonData) else { return nil }
        self = newValue
      }
}

//extension Data {
//    func decodedObject<D: Decodable>(using decoder: JSONDecoder = .init()) throws -> D {
//        try decoder.decode(D.self, from: self)
//    }
//}
