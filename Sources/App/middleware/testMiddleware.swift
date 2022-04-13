//
//  File.swift
//  
//
//  Created by Cy Wang on 2022/4/13.
//

import Foundation
import Vapor

public final class TestMiddleware : Middleware {
    
    public func respond(to request: Request, chainingTo next: Responder) -> EventLoopFuture<Response> {
        request.logger.log(level: Logger.Level.info, "[req]: this is test middleware")
        let future = next.respond(to: request)
        return future.flatMap() { res in
            return request.eventLoop.makeSucceededFuture(res)
        }
    }
}
