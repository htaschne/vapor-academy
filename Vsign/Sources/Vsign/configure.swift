import Fluent
import FluentPostgresDriver
import Leaf
import NIOSSL
import Vapor

public func configure(_ app: Application) async throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    app.databases.use(
        .postgres(
            configuration: .init(
                hostname: "localhost",
                port: 5432,
                username: "htaschne",
                password: "admin",
                database: "vapor",
                tls: .disable
            )
        ),
        as: .psql
    )

    app.migrations.add(CreateTodo())
    app.views.use(.leaf)

    // register routes
    try routes(app)
}
