defmodule PetCare.Addresses do
  @moduledoc """
  Manage the create operation for the `Addresses` resource
  """

  alias PetCare.Addresses.Address
  alias PetCare.Repo
  alias PetCare.ViaCep.Client, as: ViaCepClient

  @doc """
  Creates a new address using the provided postal code (CEP).

  This function receives a map containing a "cep" key, validates the postal code
  via an external API, and, if valid, saves the address information in the database.
  """
  def create_address(%{"cep" => cep} = params) do
    with {:ok, _result} <- client().validate_cep(cep) do
      params
      |> Address.changeset()
      |> Repo.insert()
    end
  end

  defp client() do
    Application.get_env(:pet_care, :via_cep_client, ViaCepClient)
  end
end
