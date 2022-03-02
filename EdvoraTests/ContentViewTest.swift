//
//  EdvoraTests.swift
//  EdvoraTests
//
//  Created by Yasin on 1.03.2022.
//

import XCTest
import SwiftUI
@testable import Edvora

class EdvoraTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLoadData() async throws {
        let viewModel = ContentViewModel(network: MockNetwork(json))
        await viewModel.loadData()
        XCTAssert(viewModel.rideModel.count == 3)
    }
    
    func testUserData() async throws {
        let viewModel = ContentViewModel(network: MockNetwork(userJSON))
        await viewModel.loadUser()
        XCTAssertNotNil(viewModel.userModel)
    }
    
}

private class MockNetwork: NetworkType {
    
    private let json: String
    func request<Data>(url: URL, completionHandler: (Data) -> Void) async where Data : Decodable, Data : Encodable {
        let data = json.data(using: .utf8)!
        if let decodedResponse = try? JSONDecoder().decode(Data.self, from: data) {
            completionHandler(decodedResponse)
        }
    }
    
    init(_ json: String) {
        self.json = json
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

private let userJSON = """
{
"station_code":11,
"name":"Aladdin Jennings",
"url":"https://picsum.photos/200"
}
"""

