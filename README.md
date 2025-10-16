# TL;DR API with VAPOR

## Creating the API project

> Pre-requisites: Swift and Vapor (`brew install swift` and `brew install vapor`)

1) Create VAPOR project from template (API)

``` sh
$ vapor new MyBackend --template=api
```
Here you can select what's best for you but if you go for the defaults it will create a pre configured
_TODO_ API

2) Download dependencies
``` sh
$ swift package update
``` 

3) Run the project
``` sh
$ swift run # Debug
```
or 

``` sh
$ swift run MyBackend serve # Release
```

## Configuring Postgres SQL Database

> Pre-requisite: pgAdmin 4 (or later) installed and a db ready

1) Create a role and a password
2) Setup the `configure.swift` file to match your database settings

It should look something like this:
``` swift
app.databases.use(
    .postgres(
        configuration: .init(
            hostname: "localhost",
            port: 5432,
            username: "htaschne",
            password: "admin",
            database: "vapor",
            tls: .disable // <-- this is important if you're testing on localhost
        )
    ),
    as: .psql
)
```

3) Run the migration step to create the table for your API
``` sh
$ swift run MyBackend migrate
```
> Note: MyBackend is just a placeholder, use the name of your backend app
> Also, if you'd like to test the API there's a Postman script (`Vsign/Vapor-API-Postman.json`) which you can import.
