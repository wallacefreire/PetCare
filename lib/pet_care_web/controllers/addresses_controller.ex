defmodule PetCareWeb.AddressesController do
  use PetCareWeb, :controller

  alias PetCare.Addresses
  alias PetCare.Addresses.Address

  action_fallback PetCareWeb.FallbackController

  def create(conn, params) do
    with {:ok, %Address{} = address} <- Addresses.create_address(params) do
      conn
      |> put_status(:created)
      |> render(:create, address: address)
    end
  end
end
