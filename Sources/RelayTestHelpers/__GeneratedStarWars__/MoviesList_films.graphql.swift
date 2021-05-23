// Auto-generated by relay-compiler. Do not edit.

import Relay

public struct MoviesList_films {
    public var fragmentPointer: FragmentPointer

    public init(key: MoviesList_films_Key) {
        fragmentPointer = key.fragment_MoviesList_films
    }

    public static var node: ReaderFragment {
        ReaderFragment(
            name: "MoviesList_films",
            type: "Root",
            selections: [
                .field(ReaderLinkedField(
                    name: "__MoviesList_allFilms_connection",
                    alias: "allFilms",
                    concreteType: "FilmsConnection",
                    plural: false,
                    selections: [
                        .field(ReaderLinkedField(
                            name: "edges",
                            concreteType: "FilmsEdge",
                            plural: true,
                            selections: [
                                .field(ReaderLinkedField(
                                    name: "node",
                                    concreteType: "Film",
                                    plural: false,
                                    selections: [
                                        .field(ReaderScalarField(
                                            name: "id"
                                        )),
                                        .field(ReaderScalarField(
                                            name: "__typename"
                                        )),
                                        .fragmentSpread(ReaderFragmentSpread(
                                            name: "MoviesListRow_film"
                                        ))
                                    ]
                                )),
                                .field(ReaderScalarField(
                                    name: "cursor"
                                ))
                            ]
                        )),
                        .field(ReaderLinkedField(
                            name: "pageInfo",
                            concreteType: "PageInfo",
                            plural: false,
                            selections: [
                                .field(ReaderScalarField(
                                    name: "endCursor"
                                )),
                                .field(ReaderScalarField(
                                    name: "hasNextPage"
                                ))
                            ]
                        )),
                        .clientExtension(ReaderClientExtension(
                            selections: [
                                .field(ReaderScalarField(
                                    name: "__id"
                                ))
                            ]
                        ))
                    ]
                ))
            ]
        )
    }
}

extension MoviesList_films {
    public struct Data: Decodable {
        public var allFilms: FilmsConnection_allFilms?

        public struct FilmsConnection_allFilms: Decodable, ConnectionCollection {
            public var __id: String
            public var edges: [FilmsEdge_edges?]?

            public struct FilmsEdge_edges: Decodable, ConnectionEdge {
                public var node: Film_node?

                public struct Film_node: Decodable, Identifiable, MoviesListRow_film_Key, ConnectionNode {
                    public var id: String
                    public var fragment_MoviesListRow_film: FragmentPointer
                }
            }
        }
    }
}

public protocol MoviesList_films_Key {
    var fragment_MoviesList_films: FragmentPointer { get }
}

extension MoviesList_films: Relay.Fragment {}

extension MoviesList_films: Relay.PaginationFragment {
    public typealias Operation = MoviesListPaginationQuery
    public static var metadata: Metadata {
        RefetchMetadata(
            path: [],
            operation: Operation.self,
            connection: ConnectionMetadata(
                path: ["allFilms"],
                forward: ConnectionVariableConfig(count: "count", cursor: "cursor")
            )
        )
    }
}

#if canImport(RelaySwiftUI)
import RelaySwiftUI

extension MoviesList_films_Key {
    public func asFragment() -> RelaySwiftUI.Fragment<MoviesList_films> {
        RelaySwiftUI.Fragment<MoviesList_films>(self)
    }

    public func asFragment() -> RelaySwiftUI.RefetchableFragment<MoviesList_films> {
        RelaySwiftUI.RefetchableFragment<MoviesList_films>(self)
    }

    public func asFragment() -> RelaySwiftUI.PaginationFragment<MoviesList_films> {
        RelaySwiftUI.PaginationFragment<MoviesList_films>(self)
    }
}
#endif