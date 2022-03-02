//
//  UserModelTest.swift
//  EdvoraTests
//
//  Created by Yasin on 2.03.2022.
//

import XCTest
@testable import Edvora

class UserModelTest: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testLoadData() async throws {
        //            let userModel = UserModel()
        //            await userModel.loadData()
        //            XCTAssert(viewModel.rideModel.count == 3)
    }
}

private class MockNetwork: NetworkType {
    func request<Data>(url: URL, completionHandler: (Data) -> Void) async where Data : Decodable, Data : Encodable {
        let data = userJSON.data(using: .utf8)!
        if let decodedResponse = try? JSONDecoder().decode(Data.self, from: data) {
            completionHandler(decodedResponse)
        }
    }
}

private let userJSON = """
{
"station_code":11,
"name":"Aladdin Jennings",
"url":"https://picsum.photos/200"
}
"""
