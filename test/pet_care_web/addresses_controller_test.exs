defmodule PetCareWeb.AddressesControllerTest do
  use PetCareWeb.ConnCase

  import Mox

  alias PetCare.Tutors
  alias PetCare.Tutors.Tutor
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
    {:ok, %Tutor{id: id}} = Tutors.create_tutor(tutor_params())
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
        |> post(~p"/api/addresses", params)
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

    test "does not validate other fields when cep fails validation", %{conn: conn} do
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

      expect(ClientMock, :validate_cep, fn "123456789" ->
        {:error, %Ecto.Changeset{errors: [cep: {"is invalid", []}]}}
      end)

      response =
        conn
        |> post(~p"/api/addresses", params)
        |> json_response(:bad_request)

      # Due to the validation error in the cep field, the validation process stops, and subsequent field validations are not executed
      expected_response = %{
        "errors" => %{"cep" => ["is invalid"]}
      }

      assert response == expected_response
    end
  end
end
