import SwiftUI
import RelaySwiftUI

private let pokemonFragment = graphql("""
fragment PokemonListRow_pokemon on Pokemon {
    name
    number
    classification
}
""")

struct PokemonListRow: View {
    let pokemon: PokemonListRow_pokemon_Key

    var body: some View {
        RelayFragment(
            fragment: PokemonListRow_pokemon(),
            key: pokemon,
            content: contentView)
    }

    func contentView(_ data: PokemonListRow_pokemon.Data) -> some View {
        HStack {
            Text(data.name ?? "(unknown)")
                .font(.body)
            Spacer()
            Text(data.number ?? "")
                .font(.body)
                .foregroundColor(.secondary)
        }
    }
}