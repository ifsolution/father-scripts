//
//  XXXServiceMap.swift
//  XXX
//
//  Created by Boardy on 6/1/21.
//  
//

import Boardy
import Foundation

public struct XXXServiceMap {
    let base: FlowMotherboard

    public var `default`: DefaultMap {
        DefaultMap(base: base)
    }

    public struct DefaultMap {
        let base: FlowMotherboard

        /// List of provided services here
    }
}

// MARK: - Extensions

public extension MotherboardType where Self: FlowManageable {
    var xXX: XXXServiceMap {
        XXXServiceMap(base: self)
    }
}
