defmodule PetCare.ViaCep.ClientTest do
  use ExUnit.Case, async: true

  alias PetCare.ViaCep.Client

  setup do
    bypass = Bypass.open()
    {:ok, bypass: bypass}
  end

  describe "validate_cep/1" do
    test "successfully returns cep info", %{bypass: bypass} do
      cep = "76907668"

      body = ~s({
            "bairro": "Bela Vista",
            "cep": "76907-668",
            "complemento": "de 240/241 a 800/801",
            "ddd": "69",
            "estado": "Rondônia",
            "gia": "",
            "ibge": "1100122",
            "localidade": "Ji-Paraná",
            "logradouro": "Rua dos Estudantes",
            "regiao": "Norte",
            "siafi": "0005",
            "uf": "RO",
            "unidade": ""
          })

      expected_response =
        {:ok,
         %{
           "bairro" => "Bela Vista",
           "cep" => "76907-668",
           "complemento" => "de 240/241 a 800/801",
           "ddd" => "69",
           "estado" => "Rondônia",
           "gia" => "",
           "ibge" => "1100122",
           "localidade" => "Ji-Paraná",
           "logradouro" => "Rua dos Estudantes",
           "regiao" => "Norte",
           "siafi" => "0005",
           "uf" => "RO",
           "unidade" => ""
         }}

      Bypass.expect(bypass, "GET", "/76907668/json", fn conn ->
        conn
        |> Plug.Conn.put_resp_content_type("application/json")
        |> Plug.Conn.resp(200, body)
      end)

      response =
        bypass.port
        |> endpoint_url()
        |> Client.validate_cep(cep)

      assert response == expected_response
    end
  end

  defp endpoint_url(port), do: "http://localhost:#{port}"
end
