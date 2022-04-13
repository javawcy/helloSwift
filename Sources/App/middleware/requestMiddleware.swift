//
//  File.swift
//  
//
//  Created by Cy Wang on 2022/4/13.
//

import Foundation
import Vapor

public final class RequestMiddleware: Middleware {
    
    public func respond(to request: Request, chainingTo next: Responder) -> EventLoopFuture<Response> {
        let uri = request.url
        request.logger.log(level: Logger.Level.info, "[req]: request uri is \(uri)")
        
        let resFuture = next.respond(to: request)
        return resFuture.flatMap { res in
            request.logger.log(level: Logger.Level.info, "[res]: handle response")
            res.headers.add(name: "test", value: "testHeader")
            return request.eventLoop.makeSucceededFuture(res)
        }
    }
}
