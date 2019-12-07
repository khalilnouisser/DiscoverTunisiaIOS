//
//  BackendError.swift
//  Discover Tunisia
//
//  Created by Khalil nouisser on 12/5/19.
//  Copyright © 2019 Streamerz. All rights reserved.
//

import Foundation
enum BackendError: Error {
    case parameters(reason: String)
    case connection
    case technicalProblem
    case timeOut
    case internalError(reason: String)
    case objectSerialization(reason: String)
}
