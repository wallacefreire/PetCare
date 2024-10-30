defmodule PetCare.Enderecos.CreateEndereco do
  alias PetCare.Enderecos.Schema.Endereco
  alias PetCare.Repo
  alias PetCare.ViaCep.Client, as: ViaCepClient

  def call(%{"cep" => cep} = params) do
    with {:ok, _result} <- ViaCepClient.validate_cep(cep) do
      params
      |> Endereco.changeset()
      |> Repo.insert()
    end
  end
end
