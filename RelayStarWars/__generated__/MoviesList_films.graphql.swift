// Auto-generated by relay-compiler. Do not edit.

import Relay

struct MoviesList_films {
    var fragmentPointer: FragmentPointer

    init(key: MoviesList_films_Key) {
        fragmentPointer = key.fragment_MoviesList_films
    }

    static var node: ReaderFragment {
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
                        ))
                    ]
                ))
            ])
    }
}


extension MoviesList_films {
    struct Data: Decodable {
        var allFilms: FilmsConnection_allFilms?

        struct FilmsConnection_allFilms: Decodable {
            var edges: [FilmsEdge_edges?]?

            struct FilmsEdge_edges: Decodable {
                var node: Film_node?

                struct Film_node: Decodable, MoviesListRow_film_Key {
                    var id: String
                    var fragment_MoviesListRow_film: FragmentPointer
                }
            }
        }
    }
}

protocol MoviesList_films_Key {
    var fragment_MoviesList_films: FragmentPointer { get }
}

extension MoviesList_films: Relay.Fragment {}

extension MoviesList_films: Relay.PaginationFragment {
    typealias Operation = MoviesListPaginationQuery

    static var metadata: Metadata {
        RefetchMetadata(
            path: [],
            operation: Operation.self,
            connection: ConnectionMetadata(
                path: ["allFilms"],
                forward: ConnectionVariableConfig(count: "count", cursor: "cursor")))
    }
}

#if canImport(RelaySwiftUI)

import RelaySwiftUI

extension MoviesList_films_Key {
    @available(iOS 14.0, macOS 10.16, tvOS 14.0, watchOS 7.0, *)
    func asFragment() -> RelaySwiftUI.FragmentNext<MoviesList_films> {
        RelaySwiftUI.FragmentNext<MoviesList_films>(self)
    }

    @available(iOS 14.0, macOS 10.16, tvOS 14.0, watchOS 7.0, *)
    func asFragment() -> RelaySwiftUI.PaginationFragmentNext<MoviesList_films> {
        RelaySwiftUI.PaginationFragmentNext<MoviesList_films>(self)
    }
}

#endif
