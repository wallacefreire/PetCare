defmodule PetCareWeb.EnderecosControllerTest do
  use PetCareWeb.ConnCase

  import Mox

  alias PetCare.Tutors
  alias PetCare.Tutors.Schema.Tutor
  alias PetCare.ViaCep.ClientMock

  setup :verify_on_exit!

  defp tutor_params do
    %{
      name: "Heleno Sr Júnior",
      cpf: "155.996.643-25",
      birth_date: ~D[1955-04-07],
      password: "helenosr1234",
      email: "helenosr@okay.com"
    }
  end

  defp create_tutor do
    {:ok, %Tutor{id: id}} = Tutors.create(tutor_params())
    id
  end

  describe "CREATE - endereco" do
    test "successfully creates an address", %{conn: conn} do
      tutor_id = create_tutor()

      params = %{
        "cep" => "76907668",
        "rua" => "Rua dos Estudantes",
        "number" => 123,
        "bairro" => "Bela Vista",
        "city" => "Ji-Paraná",
        "state" => "RO",
        "tutor_id" => tutor_id
      }

      body = %{
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
      }

      expect(ClientMock, :validate_cep, fn "76907668" ->
        {:ok, body}
      end)

      response =
        conn
        |> post(~p"/api/enderecos", params)
        |> json_response(:created)

      assert %{
               "data" => %{
                 "bairro" => "Bela Vista",
                 "cep" => "76907668",
                 "city" => "Ji-Paraná",
                 "id" => _id,
                 "number" => 123,
                 "rua" => "Rua dos Estudantes",
                 "state" => "RO"
               },
               "message" => "Created address sucessfully"
             } = response
    end

    test "when the address contains invalid parameters", %{conn: conn} do
      tutor_id = create_tutor()

      params = %{
        "cep" => "123456789",
        "rua" => "",
        "number" => 123.3,
        "bairro" => "Bela Vista",
        "city" => "Ji-Paraná",
        "state" => "RO",
        "tutor_id" => tutor_id
      }

       response =
        conn
        |> post(~p"/api/enderecos", params)
        |> json_response(:bad_request)

        assert response == "okay"
    end
  end
end
