defmodule PetCare.Enderecos.CreateEndereco do
  alias PetCare.Enderecos.Schema.Endereco
  alias PetCare.Repo
  alias PetCare.ViaCep.Client, as: ViaCepClient

  def call(%{"cep" => cep} = params) do
    with {:ok, _result} <- client().validate_cep(cep) do
      params
      |> Endereco.changeset()
      |> Repo.insert()
    end
  end

  defp client() do
    Application.get_env(:pet_care, :via_cep_client, ViaCepClient)
  end
end
