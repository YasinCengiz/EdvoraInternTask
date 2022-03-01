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
        List {
            
        }
        .task {
            await loadData()
        }
    }
    
    func loadData() async {
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
