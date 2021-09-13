//
//  NSError+Extensions.swift
//
//
//  Created by Trevor Whittingham on 9/13/21.
//  Copyright © 2021 Retro LLC. All rights reserved.
//

import Foundation

extension NSError {
    static public func with(description: String, domain: String = "RetroNetworking", code: Int = 0) -> NSError {
        return NSError(domain: domain,
                       code: code,
                       userInfo: [NSLocalizedDescriptionKey : description])
    }
}
