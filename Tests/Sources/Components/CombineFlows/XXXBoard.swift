//
//  RootBoard.swift
//  XXX
//
//  Created by BOARDY on 10/22/21.
//  
//

import Boardy
import Foundation
import XXXIO

enum XXXBoardFactory {
    static func make(identifier: BoardID, producer: ActivatableBoardProducer) -> ActivatableBoard {
        FlowBoard<XXXInput, XXXOutput, XXXCommand, XXXAction>(identifier: identifier, producer: producer) { it in
            // <#register flows#>
        } flowActivation: { it, input in
            // <#activate#>
        }
    }
}
