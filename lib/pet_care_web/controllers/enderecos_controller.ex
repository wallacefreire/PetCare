defmodule PetCareWeb.EnderecosController do
  use PetCareWeb, :controller

  alias PetCare.Enderecos.Schema.Endereco
  alias PetCare.Enderecos.CreateEndereco

  action_fallback PetCareWeb.FallbackController

  def create(conn, params) do
    with {:ok, %Endereco{} = endereco} <- CreateEndereco.call(params) do
      conn
      |> put_status(:created)
      |> render(:create, endereco: endereco)
    end
  end
end
