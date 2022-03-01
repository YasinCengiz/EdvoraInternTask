//
//  Network.swift
//  Edvora
//
//  Created by Yasin on 1.03.2022.
//

import Foundation

protocol NetworkType {
    func request<Data: Codable>(url: URL, completionHandler: (Data) -> Void) async
}

class Network: NetworkType {
    
    func request<Data: Codable>(url: URL, completionHandler: (Data) -> Void) async {
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let decodedResponse = try? JSONDecoder().decode(Data.self, from: data) {
                completionHandler(decodedResponse)
            }
        } catch {
            print("DATA ERROR: \(error)")
        }
    }
}
