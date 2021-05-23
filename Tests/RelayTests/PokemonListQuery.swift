// Auto-generated by relay-compiler. Do not edit.

import Relay

struct PokemonListQuery {
    var variables: Variables

    init(variables: Variables) {
        self.variables = variables
    }

    static var node: ConcreteRequest {
        ConcreteRequest(
            fragment: ReaderFragment(
                name: "PokemonListQuery",
                type: "Query",
                selections: [
                    .field(ReaderLinkedField(
                        name: "pokemons",
                        args: [
                            LiteralArgument(name: "first", value: 50)
                        ],
                        concreteType: "Pokemon",
                        plural: true,
                        selections: [
                            .field(ReaderScalarField(
                                name: "__typename"
                            )),
                            .field(ReaderScalarField(
                                name: "id"
                            )),
                            .field(ReaderScalarField(
                                name: "name"
                            )),
                            .fragmentSpread(ReaderFragmentSpread(
                                name: "PokemonListRow_pokemon"
                            ))
                        ]
                    ))
                ]),
            operation: NormalizationOperation(
                name: "PokemonListQuery",
                selections: [
                    .field(NormalizationLinkedField(
                        name: "pokemons",
                        args: [
                            LiteralArgument(name: "first", value: 50)
                        ],
                        storageKey: "pokemons(first:50)",
                        concreteType: "Pokemon",
                        plural: true,
                        selections: [
                            .field(NormalizationScalarField(
                                name: "__typename"
                            )),
                            .field(NormalizationScalarField(
                                name: "id"
                            )),
                            .field(NormalizationScalarField(
                                name: "name"
                            )),
                            .field(NormalizationScalarField(
                                name: "number"
                            ))
                        ]
                    ))
                ]),
            params: RequestParameters(
                name: "PokemonListQuery",
                operationKind: .query,
                text: """
query PokemonListQuery {
  pokemons(first: 50) {
    __typename
    id
    name
    ...PokemonListRow_pokemon
  }
}

fragment PokemonListRow_pokemon on Pokemon {
  name
  number
}
"""))
    }
}


extension PokemonListQuery {
    typealias Variables = EmptyVariables
}

extension PokemonListQuery {
    struct Data: Decodable {
        var pokemons: [Pokemon_pokemons?]?

        struct Pokemon_pokemons: Decodable, PokemonListRow_pokemon_Key {
            var __typename: String
            var id: String
            var name: String?
            var fragment_PokemonListRow_pokemon: FragmentPointer
        }
    }
}

extension PokemonListQuery: Relay.Operation {}