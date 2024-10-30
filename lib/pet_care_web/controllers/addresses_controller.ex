defmodule PetCareWeb.AddressesController do
  use PetCareWeb, :controller

  alias PetCare.Addresses
  alias PetCare.Addresses.Address

  action_fallback PetCareWeb.FallbackController

  def create_address(conn, params) do
    with {:ok, %Address{} = endereco} <- Addresses.create_address(params) do
      conn
      |> put_status(:created)
      |> render(:create, endereco: endereco)
    end
  end
end
