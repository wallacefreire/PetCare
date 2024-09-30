defmodule PetCareWeb.DogsControllerTest do
  use PetCareWeb.ConnCase

  alias PetCare.Dogs
  alias PetCare.Dogs.Schema.Dog

  describe "CREATE - dog" do
    test "sucessfully creates an dog", %{conn: conn} do
      params = %{
        name: "Pitico",
        breed: "Não conhecida",
        weight: 3.87
      }

      response =
        conn
        |> post(~p"/api/dogs", params)
        |> json_response(:created)

      assert %{
               "data" => %{
                 "breed" => "Não conhecida",
                 "id" => _id,
                 "name" => "Pitico",
                 "weight" => 3.87
               },
               "message" => "Created Dog sucessfully"
             } = response
    end

    test "invalid params = error", %{conn: conn} do
      params = %{
        name: "Pitico",
        breed: "",
        weight: -5.39
      }

      response =
        conn
        |> post(~p"/api/dogs", params)
        |> json_response(:bad_request)

      expected_response = %{
        "errors" => %{"breed" => ["can't be blank"], "weight" => ["must be greater than 0"]}
      }

      assert response == expected_response
    end
  end

  describe "DELETE - dog" do
    test "AUAU deleted Sucessfully", %{conn: conn} do
      params = %{
        name: "Pitocão",
        breed: "Superior",
        weight: 98.78
      }

      {:ok, %Dog{id: id}} = Dogs.create(params)

      response =
        conn
        |> delete(~p"/api/dogs/#{id}", params)
        |> json_response(:ok)

      expected_response = %{
        "data" => %{
          "breed" => "Superior",
          "id" => id,
          "name" => "Pitocão",
          "weight" => 98.78
        },
        "message" => "Dog deleted sucessfully"
      }

      assert response == expected_response
    end

    test "ID invalid = error", %{conn: conn} do
      invalid_id = 777

      response =
        conn
        |> delete(~p"/api/tutors/#{invalid_id}")
        |> json_response(:not_found)

      assert %{"message" => "Não encontrado", "status" => "not_found"} = response
    end
  end

  describe "GET - dog" do
    test "SHOW - returns 200 and show user by params", %{conn: conn} do
      params = %{
        name: "Pingolin",
        breed: "Morta",
        weight: 0.01
      }

      {:ok, %Dog{id: id}} = Dogs.create(params)

      response =
        conn
        |> get(~p"/api/dogs/#{id}")
        |> json_response(:ok)

      expected_response = %{
        "data" => %{
          "breed" => "Morta",
          "id" => id,
          "name" => "Pingolin",
          "weight" => 0.01
        }
      }

      assert response == expected_response
    end

    test "returns an error when ID is invalid", %{conn: conn} do
      invalid_id = 777

      response =
        conn
        |> get(~p"/api/dogs/#{invalid_id}")
        |> json_response(:not_found)

      assert %{"message" => "Não encontrado", "status" => "not_found"} = response
    end
  end

  describe "POST - dog" do
    test "when update dog successfully", %{conn: conn} do
      params = %{
        name: "Negão",
        breed: "Rottweiler",
        weight: 52.5
      }

      {:ok, %Dog{id: id}} = Dogs.create(params)

      update_params = %{name: "Negão Freire", breed: "Rottweiler Premium", weight: 60.0}

      response =
        conn
        |> put(~p"/api/dogs/#{id}", update_params)
        |> json_response(:ok)

      expected_response = %{
        "data" => %{
          "breed" => "Rottweiler Premium",
          "id" => id,
          "name" => "Negão Freire",
          "weight" => 60.0
        },
        "message" => "Dog updated sucessfully"
      }

      assert response == expected_response
    end

    test "returns an error when trying to update a dog with invalid id", %{conn: conn} do
      invalid_id = 777

      update_params = %{
        name: "Wallace Heleno",
        email: "wallacefreire@tchubiraudaumn"
      }

      response =
        conn
        |> put(~p"/api/tutors/#{invalid_id}", update_params)
        |> json_response(:not_found)

      expected_response = %{"message" => "Não encontrado", "status" => "not_found"}

      assert response == expected_response
    end

    test "error entering invalid data", %{conn: conn} do
      params = %{
        name: "Cachorrin",
        breed: "Vira-Lata",
        weight: 4.93
      }

      {:ok, %Dog{id: id}} = Dogs.create(params)

      update_params = %{name: "", breed: "", weight: 0}

      response =
        conn
        |> put(~p"/api/dogs/#{id}", update_params)
        |> json_response(:bad_request)

      expected_response = %{
        "errors" => %{
          "breed" => ["can't be blank"],
          "name" => ["can't be blank"],
          "weight" => ["must be greater than 0"]
        }
      }

      assert response == expected_response
    end
  end
end
