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
    struct Data: Readable {
        var allFilms: FilmsConnection_allFilms?

        init(from data: SelectorData) {
            allFilms = data.get(FilmsConnection_allFilms?.self, "allFilms")
        }

        struct FilmsConnection_allFilms: Readable {
            var edges: [FilmsEdge_edges?]?

            init(from data: SelectorData) {
                edges = data.get([FilmsEdge_edges?]?.self, "edges")
            }

            struct FilmsEdge_edges: Readable {
                var node: Film_node?

                init(from data: SelectorData) {
                    node = data.get(Film_node?.self, "node")
                }

                struct Film_node: Readable, MoviesListRow_film_Key {
                    var id: String
                    var fragment_MoviesListRow_film: FragmentPointer

                    init(from data: SelectorData) {
                        id = data.get(String.self, "id")
                        fragment_MoviesListRow_film = data.get(fragment: "MoviesListRow_film")
                    }
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
