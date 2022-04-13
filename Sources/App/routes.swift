import Vapor

func routes(_ app: Application) throws {
    app.get { req in
        return "It works!"
    }

    app.get("hello") { req -> String in
        return "Hello, world!"
    }
    
    app.get("sayHi", ":name") {
        req -> String in
        var str = "Hello"
        if let name = req.parameters.get("name") {
            str = "Hello, \(name)"
        }
        return str
    }
    
    let testRoutes = app.grouped("test").grouped(TestMiddleware())
    testRoutes.get("hi") {req -> String in
        return "test, hi"
    }
}
