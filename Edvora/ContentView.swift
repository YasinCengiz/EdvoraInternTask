//
//  ContentView.swift
//  Edvora
//
//  Created by Yasin on 1.03.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var rideModel = [RideModel]()
    
    var body: some View {
        List(rideModel, id: \.id) { item in
            VStack {
//                Text(item.id)
//                Text(String(item.originStationCode))
//                Text(String(item.stationPath))
//                Text(String(item.date))
            }
        }
        .task {
//            await loadData()
        }
    }
    
//    func loadData() async {
//        guard let url = URL(string: "https://assessment.api.vweb.app/rides") else {
//            print("URL ERROR: INVALID URL")
//            return
//        }
//        do {
//            // ignoring metadata for now
//            let (data, _) = try await URLSession.shared.data(from: url)
//            if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
//                rideModel = decodedResponse.results
//            }
//        } catch {
//            print("DATA ERROR: \(error)")
//        }
//    }
//
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
