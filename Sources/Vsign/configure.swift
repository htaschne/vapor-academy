import Fluent
import FluentPostgresDriver
import Leaf
import NIOSSL
import Vapor

public func configure(_ app: Application) async throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    let databaseHostname = Environment.get("DATABASE_HOST") ?? "localhost"
    let databasePort = Environment.get("DATABASE_PORT").flatMap(Int.init(_:)) ?? 5432
    let databaseUsername = Environment.get("DATABASE_USERNAME") ?? "htaschne"
    let databasePassword = Environment.get("DATABASE_PASSWORD") ?? "admin"
    let databaseName = Environment.get("DATABASE_NAME") ?? "vapor"

    let requireTLS = Environment.get("DATABASE_REQUIRE_TLS")?.lowercased() == "true"
    let tlsConfig: NIOSSLContext? =
        requireTLS ? try! NIOSSLContext(configuration: .forClient()) : nil

    app.databases.use(
        .postgres(
            configuration: .init(
                hostname: databaseHostname,
                port: databasePort,
                username: databaseUsername,
                password: databasePassword,
                database: databaseName,
                tls: tlsConfig.map { .require($0) } ?? .disable
            )
        ),
        as: .psql
    )

    app.migrations.add(CreateTodo())
    app.views.use(.leaf)

    // register routes
    try routes(app)
}
