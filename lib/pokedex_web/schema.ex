defmodule PokedexWeb.Schema do
  use Absinthe.Schema

  query do
    field :pokemon, type: :pokemon do
      arg :name, non_null(:string)
      resolve &PokedexWeb.Resolvers.Pokemon.get_pokemon/3  # Update the resolver reference here
    end
  end

  object :pokemon do
    field :name, :string
    field :types, list_of(:type)
    field :abilities, list_of(:ability)
    field :height, :integer
    field :weight, :integer
    field :base_experience, :integer
  end

  object :type do
    field :name, :string
  end

  object :ability do
    field :name, :string
  end

  object :height do
    field :height, :integer
  end

  object :weight do
    field :weight, :integer
  end

  object :base_experience do
    field :base_experience, :integer
  end
end
