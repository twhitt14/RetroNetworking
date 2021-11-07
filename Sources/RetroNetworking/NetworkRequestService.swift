//
//  NetworkRequestService.swift
//
//
//  Created by Trevor Whittingham on 9/13/21.
//  Copyright © 2021 Retro LLC. All rights reserved.
//

import Foundation

@available(iOS 15.0.0, *)
@available(macOS 12.0.0, *)
@available(watchOS 8.0.0, *)
@available(tvOS 15.0.0, *)
public struct NetworkRequestService {
    static public func makeRequestWith(url: URL, headers: [NetworkHeader] = []) async throws -> Data {
        var request = URLRequest(url: url)
        for header in headers {
            request.setValue(header.value, forHTTPHeaderField: header.key)
        }
        
        return try await URLSession.shared.data(for: request, delegate: nil).0
    }
    
    static public func makeRequestWith(baseURLString: String, headers: [NetworkHeader] = [], parameters: [URLQueryItem] = []) async throws -> Data {
        guard let urlWithParameters = makeURLWith(baseURLString: baseURLString, parameters: parameters) else {
            throw NSError.with(description: "Invalid URL")
        }
        
        return try await makeRequestWith(url: urlWithParameters, headers: headers)
    }
    
    static public func makeURLWith(baseURLString: String, parameters: [URLQueryItem] = []) -> URL? {
        guard var components = URLComponents(string: baseURLString) else { return nil }
        
        components.queryItems = parameters
        
        return components.url
    }
}
