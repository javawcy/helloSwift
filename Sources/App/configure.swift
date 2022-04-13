import Vapor

// configures your application
public func configure(_ app: Application) throws {
    //encode
    let encoder = JSONEncoder()
    encoder.dateEncodingStrategy = .secondsSince1970
    ContentConfiguration.global.use(encoder: encoder, for: .json)
    
    //middlewares
    app.middleware = .init()
    app.middleware.use(RequestMiddleware())
    
    //register routes
    try app.register(collection: UserController())
    try routes(app)
}
