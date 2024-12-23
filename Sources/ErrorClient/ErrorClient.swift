import AsyncExtensions
import Dependencies
import DependenciesMacros
import Foundation

@DependencyClient
public struct ErrorClient: Sendable {
  public var subscribe: @Sendable () async throws -> AsyncStream<Error>
  public var handle: @Sendable (Error) async throws -> Void
}

extension DependencyValues {
  public var errorClient: ErrorClient {
    get { self[ErrorClient.self] }
    set { self[ErrorClient.self] = newValue }
  }
}

extension ErrorClient: DependencyKey {
  public static let liveValue = {
    let events = AsyncPassthroughSubject<Error>()

    return Self(
      subscribe: { events.eraseToStream() },
      handle: { events.send($0) }
    )
  }()
}
