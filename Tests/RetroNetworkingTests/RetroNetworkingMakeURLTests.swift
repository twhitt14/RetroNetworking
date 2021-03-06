//
//  RetroNetworkingMakeURLTests.swift
//
//
//  Created by Trevor Whittingham on 9/13/21.
//  Copyright © 2021 Retro LLC. All rights reserved.
//

import XCTest
import RetroNetworking

@available(iOS 15.0.0, *)
@available(macOS 12.0.0, *)
@available(watchOS 8.0.0, *)
@available(tvOS 15.0.0, *)
final class RetroNetworkingMakeURLTests: XCTestCase {
    
    func testMakeURL1() {
        let urlString = "https://www.google.com"
        let parameters = [URLQueryItem]()
        
        guard let url = NetworkRequestService.makeURLWith(baseURLString: urlString, parameters: parameters) else {
            XCTFail("URL could not be created")
            return
        }
        
        XCTAssertEqual("https://www.google.com?", url.absoluteString)
    }
    
    func testMakeURL2() {
        let urlString = "https://www.google.com"
        let parameters = [
            URLQueryItem(name: "key1", value: "value1"),
        ]
        
        guard let url = NetworkRequestService.makeURLWith(baseURLString: urlString, parameters: parameters) else {
            XCTFail("URL could not be created")
            return
        }
        
        XCTAssertEqual("https://www.google.com?key1=value1", url.absoluteString)
    }
    
    func testMakeURL3() {
        let urlString = "https://www.google.com"
        let parameters = [
            URLQueryItem(name: "key1", value: "value1"),
            URLQueryItem(name: "key2", value: "value2"),
        ]
        
        guard let url = NetworkRequestService.makeURLWith(baseURLString: urlString, parameters: parameters) else {
            XCTFail("URL could not be created")
            return
        }
        
        XCTAssertEqual("https://www.google.com?key1=value1&key2=value2", url.absoluteString)
    }
}
