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
                Text("ID: \(item.id)")
                Text("Origin Station Code: \(item.origin_station_code)")
                ForEach(item.station_path, id:\.self) {i in
                    Text("Station Path: \(i)")
                }
                Text("Destination Station Code: \(item.destination_station_code)")
                Text("Date: \(item.date)")
                Text("Map URL: \(item.map_url)")
                Text("State: \(item.state)")
                Text("City: \(item.city)")
            }
        }
        .task {
            await loadData()
        }
    }
    
    func loadData() async {
        guard let url = URL(string: "https://assessment.api.vweb.app/rides") else {
            print("URL ERROR: INVALID URL")
            return
        }
        do {
            // ignoring metadata for now
            let (data, _) = try await URLSession.shared.data(from: url)
            if let decodedResponse = try? JSONDecoder().decode([RideModel].self, from: data) {
                rideModel = decodedResponse
            }
        } catch {
            print("DATA ERROR: \(error)")
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
