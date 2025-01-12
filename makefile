#Run all tests
test: 
	go test ./calculations

# Generate mocks
gen: 
	mockery --all