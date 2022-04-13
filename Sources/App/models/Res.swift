//
//  Response.swift
//  
//
//  Created by Cy Wang on 2022/4/13.
//

import Foundation
import Vapor


struct ResData<T: Content>: Content {
    var code : Int
    var msg : String
    var data : T
}

struct Empty: Content {}

func success<T: Content>(d: T) -> ResData<T> {
    return ResData(code: 0, msg: "success", data: d)
}

func error<T: Content>(c: Int, m: String,d: T) -> ResData<T> {
    return ResData(code: c, msg: m, data: d)
}

