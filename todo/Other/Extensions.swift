//
//  Extensions.swift
//  todo
//
//  Created by Huy Phan on 11/18/23.
//

import Foundation

extension Encodable {
    // function that converts any Codable types into a dictionary
    func asDictionary() -> [String: Any] {
        guard let data = try? JSONEncoder().encode(self) else {
            return [:]
        }
        
        do {
            let json = try JSONSerialization.jsonObject(with: data) as? [String : Any]
            return json ?? [:]
        } catch {
            return [:]
        }
    }
}
