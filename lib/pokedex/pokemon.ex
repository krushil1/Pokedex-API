defmodule Pokedex.PokeAPI do
  @api_url "https://pokeapi.co/api/v2/pokemon/"

  def get_pokemon(name) do
    HTTPoison.get!("#{@api_url}#{name}")
    |> handle_response()
  end

  defp handle_response(response) do
    case response.status_code do
      200 ->
        {:ok, parse_pokemon(Jason.decode!(response.body))}
      _ ->
        {:error, "Failed to fetch data"}
    end
  end

  defp parse_pokemon(data) do
    %{
      name: data["name"],
      types: Enum.map(data["types"], fn type -> %{name: type["type"]["name"]} end),
      abilities: Enum.map(data["abilities"], fn ability -> %{name: ability["ability"]["name"]} end),
      height: data["height"],
      weight: data["weight"],
      base_experience: data["base_experience"],

      image: data["sprites"]["front_default"]
    }
  end
end
