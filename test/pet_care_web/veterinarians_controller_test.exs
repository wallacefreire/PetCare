defmodule PetCareWeb.VeterinariansControllerTest do
  use PetCareWeb.ConnCase

  alias PetCare.Veterinarians
  alias PetCare.Veterinarians.Veterinarian

  describe "CREATE - veterinarian" do
    test "success in creating a veterinarian", %{conn: conn} do
      param = %{name: "Maria José"}

      response =
        conn
        |> post(~p"/api/veterinarians", param)
        |> json_response(:created)

      assert %{
               "data" => %{"id" => _id, "name" => "Maria José"},
               "message" => "Created Veterinarian sucessfully"
             } = response
    end

    test "invalid params = error", %{conn: conn} do
      param = %{
        name:
          "Isadora Gabrielle Luz da Rosa Almeida Luminara Veríssimo da Silva e Oliveira Francisco"
      }

      response =
        conn
        |> post(~p"/api/veterinarians", param)
        |> json_response(:bad_request)

      expected_response = %{"errors" => %{"name" => ["should be at most 80 character(s)"]}}

      assert response == expected_response
    end
  end

  describe "DELETE - veterinarian" do
    test "veterinarian sucessfully deleted", %{conn: conn} do
      param = %{name: "Pitocão"}

      {:ok, %Veterinarian{id: id}} = Veterinarians.create_veterinarian(param)

      response =
        conn
        |> delete(~p"/api/veterinarians/#{id}", param)
        |> json_response(:ok)

      expected_response = %{
        "data" => %{"id" => id, "name" => "Pitocão"},
        "message" => "veterinarian deleted sucessfully"
      }

      assert response == expected_response
    end
  end

  describe "GET - veterinarian" do
    test "SHOW - returns 200 and show user by params", %{conn: conn} do
      param = %{name: "José Mario da Silva"}

      {:ok, %Veterinarian{id: id}} = Veterinarians.create_veterinarian(param)

      response =
        conn
        |> get(~p"/api/veterinarians/#{id}")
        |> json_response(:ok)

      expected_response = %{"data" => %{"id" => id, "name" => "José Mario da Silva"}}

      assert response == expected_response
    end
  end

  describe "POST - veterinarian" do
    test "when update veterinarian successfully", %{conn: conn} do
      param = %{name: "Dr. Fernandão"}

      {:ok, %Veterinarian{id: id}} = Veterinarians.create_veterinarian(param)

      update_param = %{name: "Dra. Fernandinha"}

      response =
        conn
        |> put(~p"/api/veterinarians/#{id}", update_param)
        |> json_response(:ok)

      expected_response = %{
        "data" => %{"id" => id, "name" => "Dra. Fernandinha"},
        "message" => "Veterinarian updated sucessfully"
      }

      assert response == expected_response
    end

    test "error entering invalid data", %{conn: conn} do
      param = %{name: "Sr Acir Gurgacz"}

      {:ok, %Veterinarian{id: id}} = Veterinarians.create_veterinarian(param)

      update_param = %{name: ""}

      response =
        conn
        |> put(~p"/api/veterinarians/#{id}", update_param)
        |> json_response(:bad_request)

      expected_response = %{"errors" => %{"name" => ["can't be blank"]}}

      assert response == expected_response
    end
  end
end
