//
//  Network.swift
//  Edvora
//
//  Created by Yasin on 1.03.2022.
//

import Foundation

struct RideModel: Codable {
    
    let id: UUID
    let originStationCode: Int
    let stationPath: [Int]
    let date: Date
    let mapURL: URL
    let state: String
    let city: String
    
}

struct Response: Codable {
    
    var response: [RideModel]
    
}
