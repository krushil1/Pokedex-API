# lib/pokedex_web/resolvers/pokemon_resolver.ex
defmodule PokedexWeb.Resolvers.Pokemon do
  alias Pokedex.PokeAPI

  def get_pokemon(_parent, args, _context) do
    IO.inspect(args)  # Add this line to check if the resolver is being called
    case PokeAPI.get_pokemon(args[:name]) do
      {:ok, pokemon} ->
        {:ok, pokemon}
      {:error, reason} ->
        {:error, reason}
    end
  end
end
