//
//  File.swift
//  
//
//  Created by Cy Wang on 2022/4/13.
//

import Foundation
import Vapor

struct UserController : RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        let users = routes.grouped("user")
        users.get("info", use: userInfo)
    }
    
    func userInfo(req: Request) async throws -> ResData<Empty> {
        return success(d: Empty())
    }
}
