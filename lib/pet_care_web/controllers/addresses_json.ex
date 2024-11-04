defmodule PetCareWeb.AddressesJSON do
  alias PetCare.Addresses.Address

  def create(%{address: address}) do
    %{
      message: "Created address sucessfully",
      data: data(address)
    }
  end

  defp data(%Address{} = address) do
    %{
      id: address.id,
      cep: address.cep,
      rua: address.rua,
      number: address.number,
      bairro: address.bairro,
      city: address.city,
      state: address.state
    }
  end
end
