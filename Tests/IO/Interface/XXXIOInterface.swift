//
//  XXXIOInterface.swift
//  XXX
//
//  Created by Boardy on 6/1/21.
//  
//

import Boardy
import Foundation

// MARK: - ID

extension BoardID {
    static let pubXXX: BoardID = "pub.mod.XXX"   
}

// MARK: - Interface

public struct XXXDestination {
    public let activation: BoardActivation<XXXParameter>
    public let interaction: BoardInteraction<XXXCommand>
    public let completer: BoardCompleter

    public static let defaultIdentifier: BoardID = .pubXXX
}

extension ActivatableBoard {
    public func ioXXX(_ identifier: BoardID = XXXDestination.defaultIdentifier) -> XXXDestination {
        XXXDestination(
            activation: activation(identifier, with: XXXParameter.self),
            interaction: interaction(identifier, with: XXXCommand.self),
            completer: completer(identifier)
        )
    }
}

public struct XXXMainDestination {
    public let activation: MainboardActivation<XXXParameter>
    public let interaction: MainboardInteraction<XXXCommand>
    public let completer: MainboardCompleter
    public let flow: FlowHandler<XXXOutput>
    public let action: ActionFlowHandler<XXXAction>
    public let completion: CompletionFlowHandler

    public static let defaultIdentifier: BoardID = .pubXXX
}

extension MotherboardType where Self: FlowManageable {
    public func ioXXX(_ identifier: BoardID = XXXMainDestination.defaultIdentifier) -> XXXMainDestination {
        XXXMainDestination(
            activation: activation(identifier, with: XXXParameter.self),
            interaction: interaction(identifier, with: XXXCommand.self),
            completer: completer(identifier),
            flow: matchedFlow(identifier, with: XXXOutput.self),
            action: actionFlow(identifier, with: XXXAction.self),
            completion: completionFlow(identifier)
        )
    }
}
