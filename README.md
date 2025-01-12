# testify-tutorial

## Description

The tests are written for the `calculations` package and test the [PriceIncreaseCalculator](./calculations/priceIncrease.go) functionality which depends on [PriceProvider](./stocks/stocks.go) interface. 

# Prepare installing
1. Docker: Install the Docker at https://www.docker.com/products/docker-desktop/
2. Mockery: Install the Mockery at https://vektra.github.io/mockery/latest/installation/#go-install

## Prepare Postgres in Docker
If you want to run integration tests you need to have a running postgres instance. The constants that are being used are the default ones from [dockerhub](https://hub.docker.com/_/postgres)

```go
const (
	dbHost     = "localhost"
	dbPort     = 5432
	dbUser     = "postgres"
	dbPassword = "mysecretpassword"
	dbName     = "postgres"
)
```

All you need to do is execute the following command and you should be good to go

```
docker run --name pg-testify -e POSTGRES_PASSWORD=mysecretpassword -p 5432:5432 postgres
```

If you want to generate one more time with all mocking function, firstly, you should delete the mocks folder and then you run the command:
```
mockery --all
```
After that, you are going see the project makes a new mocks folder and some files generation. They are generated via interface inside of project.


## Running the tests

```go
# run all tests
go test ./calculations

# only run unit tests
go test ./calculations -run UnitTestSuite -v

# only run integration tests
# running postgres instance required
go test ./calculations -run IntTestSuite -v
````

