//
//  XXXModulePlugin.swift
//  XXX
//
//  Created by BOARDY on 6/1/21.
//
//

import XXXIO
import Boardy
import Foundation

public struct XXXModulePlugin: ModulePlugin {
    public let service: XXXModulePlugin.ServiceType

    public init(service: XXXModulePlugin.ServiceType) {
        self.service = service
    }

    public func apply(for main: MainComponent) {
        let mainProducer = main.producer

        let continuousProducer = BoardProducer(externalProducer: mainProducer, registrationsBuilder: { producer in
            // BoardRegistration
        })

        switch service {
        case .default:
            mainProducer.registerBoard(identifier) { identifier in
                XXXBoardFactory.make(identifier: identifier, producer: continuousProducer)
            }
        }
    }

    public var identifier: BoardID {
        switch service {
        case let .default(identifier):
            return identifier
        }
    }

    /// Each service is equivalent to one entry point
    public enum ServiceType {
        case `default`(BoardID)
    }
}

extension XXXModulePlugin {
    public static var bundledPlugins: [ModulePlugin] {
        return [
            XXXModulePlugin(service: .default(.pubXXX)),
        ]
    }
}
