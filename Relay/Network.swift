import Combine

public protocol Network {
    func execute(
        request: RequestParameters,
        variables: AnyVariables,
        cacheConfig: CacheConfig
    ) -> AnyPublisher<Data, Error>
}

// TODO replace with a real type
public typealias CacheConfig = Any

public struct AnyEncodable: Encodable {
    private let encode: (Encoder) throws -> Void
    public init<T: Encodable>(_ wrapped: T) {
        self.encode = wrapped.encode
    }

    public func encode(to encoder: Encoder) throws {
        try encode(encoder)
    }
}

public struct GraphQLError: LocalizedError, Decodable {
    public var message: String

    public init(message: String) {
        self.message = message
    }

    public var errorDescription: String? {
        return message
    }
}