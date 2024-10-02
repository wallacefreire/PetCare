defmodule PetCareWeb.EnderecosJSON do
  alias PetCare.Enderecos.Schema.Endereco

  def create(%{endereco: endereco}) do
    %{
      message: "Created address sucessfully",
      data: data(endereco)
    }
  end

  defp data(%Endereco{} = endereco) do
    %{
      id: endereco.id,
      cep: endereco.cep,
      rua: endereco.rua,
      number: endereco.number,
      bairro: endereco.bairro,
      city: endereco.city,
      state: endereco.state
    }
  end
end
