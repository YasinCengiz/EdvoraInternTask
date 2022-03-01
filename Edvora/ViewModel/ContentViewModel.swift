//
//  LoadData.swift
//  Edvora
//
//  Created by Yasin on 1.03.2022.
//

import Foundation


class ContentViewModel: ObservableObject {
    
    @Published var rideModel = [RideModel]()
    
    private let network: NetworkType
    
    init(network: NetworkType = Network()) {
        self.network = network
    }
    
    func loadData() async {
        guard let url = URL(string: "https://assessment.api.vweb.app/rides") else {
            print("URL ERROR: INVALID URL")
            return
        }
        await network.request(url: url) { (model: [RideModel]) in
            rideModel = model
        }
    }
}
