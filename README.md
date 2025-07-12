# 🪻 error-client

A dependency client that handles error handling in apps using the Swift Composable Architecture (TCA).
It is part of the [Indigo Stack](https://indigostack.org).

## Usage

To use the `error-client`, you need to add it to your TCA app. Here’s a basic example of how to integrate it:

```swift
@Dependency(\.errorClient) var errorClient

// Subscribe to error events
Task {
  for await error in try await errorClient.subscribe() {
    // Handle errors as they occur
    print("Received error: \(error)")
  }
}

// Send an error to subscribers
try await errorClient.handle(someError)
```

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details
