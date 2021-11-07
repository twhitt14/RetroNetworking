//
//  RetroNetworkingRetrieveDataTests.swift
//
//
//  Created by Trevor Whittingham on 11/7/21.
//  Copyright © 2021 Retro LLC. All rights reserved.
//

import XCTest
import RetroNetworking

@available(iOS 15.0.0, *)
@available(macOS 12.0.0, *)
@available(watchOS 8.0.0, *)
@available(tvOS 15.0.0, *)
final class RetroNetworkingRetrieveDataTests: XCTestCase {
    
    func testRetrieveDataUsingURLString() async throws {
        let urlString = "https://www.google.com"
        
        let data = try await NetworkRequestService.makeRequestWith(baseURLString: urlString)
        
        XCTAssertNotNil(data)
    }
    
    func testRetrieveDataUsingURL() async throws {
        let url = URL(string: "https://www.google.com")!
        
        let data = try await NetworkRequestService.makeRequestWith(url: url)
        
        XCTAssertNotNil(data)
    }
}
