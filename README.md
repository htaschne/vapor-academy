# Everything VAPOR


## Creating the API project

Pre-requisites: Swift and Vapor (`brew install swift` and `brew install vapor`)

1) Create VAPOR project from template (API)

``` sh
vapor new MyBackend --template=api
```
Here you can select what's best for you but if you go for the defaults it will create a pre configured
_TODO_ API

2) Download dependencies
``` sh
swift package update
``` 

3) Run the project
``` sh
swift run
```

## Configuring Postgres SQL Database

Pre-requisite: pgAdmin 4 (or later) installed and a db ready

1) 