//
//  ContentView.swift
//  Edvora
//
//  Created by Yasin on 1.03.2022.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    @StateObject var contentViewModel: ContentViewModel
    @State private var region = MKCoordinateRegion()
    
    var body: some View {
        NavigationView {
            
            Map(coordinateRegion: $region, showsUserLocation: true, userTrackingMode: .constant(.follow))
                        .frame(width: 400, height: 300)

            
            List(contentViewModel.rideModel, id: \.id) { item in
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
            .navigationBarTitleDisplayMode(.large)
            .navigationTitle("Edvora")
            .task {
                await contentViewModel.loadData()
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(contentViewModel: ContentViewModel(network: MockNetwork()))
    }
}



private class MockNetwork: NetworkType {
    func request<Data>(url: URL, completionHandler: (Data) -> Void) async where Data : Decodable, Data : Encodable {
        let data = json.data(using: .utf8)!
        if let decodedResponse = try? JSONDecoder().decode(Data.self, from: data) {
            completionHandler(decodedResponse)
        }
    }
}

// HARDCODED MOCK SHORTCUT

private let json = """
[
  {
    "id": 163,
    "origin_station_code": 17,
    "station_path": [
      51,
      63,
      72,
      89
    ],
    "destination_station_code": 93,
    "date": "12/19/2021 05:44 PM",
    "map_url": "https://picsum.photos/200",
    "state": "Assam",
    "city": "Lanka"
  },
  {
    "id": 390,
    "origin_station_code": 15,
    "station_path": [
      61,
      72,
      84
    ],
    "destination_station_code": 97,
    "date": "01/25/2022 04:41 AM",
    "map_url": "https://picsum.photos/200",
    "state": "Himachal Pradesh",
    "city": "Mandi"
  },
  {
    "id": 555,
    "origin_station_code": 12,
    "station_path": [
      59,
      67,
      76,
      80
    ],
    "destination_station_code": 96,
    "date": "02/07/2022 08:45 AM",
    "map_url": "https://picsum.photos/200",
    "state": "Tamil Nadu",
    "city": "Karur"
  }
]
"""
