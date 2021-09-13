//
//  NetworkHeader.swift
//
//
//  Created by Trevor Whittingham on 9/13/21.
//  Copyright © 2021 Retro LLC. All rights reserved.
//

import Foundation

public struct NetworkHeader {
    internal let key: String
    internal let value: String
    
    public init(key: String, value: String) {
        self.key = key
        self.value = value
    }
}
