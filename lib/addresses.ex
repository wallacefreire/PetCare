defmodule PetCare.Addresses do
  alias PetCare.Addresses.Address
  alias PetCare.Repo
  alias PetCare.ViaCep.Client, as: ViaCepClient

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
