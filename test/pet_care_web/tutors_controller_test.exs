defmodule PetCare.TutorsControllerTest do
  use PetCareWeb.ConnCase

  alias PetCare.Tutors
  alias PetCare.Tutors.Schema.Tutor

  describe "create/2" do
    test "sucessfully creates an tutor", %{conn: conn} do
      params = %{
        name: "Wallace",
        cpf: "010.149.493-29",
        age: 28,
        password: "1234567",
        email: "wallace@okay.com"
      }

      response =
        conn
        |> post(~p"/api/tutors", params)
        |> json_response(:created)

      assert %{
               "data" => %{
                 "birth_date" => "2018-11-11",
                 "cpf" => "010.149.493-29",
                 "email" => "wallace@okay.com",
                 "id" => _id,
                 "name" => "Wallace"
               },
               "message" => "Created Tutor sucessfully"
             } = response
    end

    test "when there are invalid params, returns an error", %{conn: conn} do
      params = %{
        name: "AB",
        cpf: nil,
        age: 28,
        password: "1",
        email: "wallaceheleno.com"
      }

      response =
        conn
        |> post(~p"/api/tutors", params)
        |> json_response(:bad_request)

      expected_response = %{
        "errors" => %{
          "cpf" => ["can't be blank"],
          "email" => ["has invalid format"],
          "name" => ["should be at least 3 character(s)"],
          "password" => ["should be at least 4 character(s)"]
        }
      }

      assert response == expected_response
    end
  end

  describe "delete/2" do
    test "sucessfully deletes an tutor", %{conn: conn} do
      params = %{
        name: "Wallace",
        cpf: "010.149.493-29",
        age: 28,
        password: "1234567",
        email: "wallace@okay.com"
      }

      {:ok, %Tutor{id: id}} = Tutors.create(params)

      response =
        conn
        |> delete(~p"/api/tutors/#{id}")
        |> json_response(:ok)

      expected_response = %{
        "data" => %{
          "birth_date" => "2018-11-11",
          "cpf" => "010.149.493-29",
          "email" => "wallace@okay.com",
          "id" => id,
          "name" => "Wallace"
        },
        "message" => "Tutor deleted sucessfully"
      }

      assert response == expected_response
    end

    test "when ID is invalid, returns an error", %{conn: conn} do
      invalid_id = 999

      response =
        conn
        |> delete(~p"/api/tutors/#{invalid_id}")
        |> json_response(:not_found)

      assert %{"message" => "Tutor not found", "status" => "not_found"} = response
    end
  end

  describe "show/2" do
    test "returns the correct tutor details when a valid ID is provided", %{conn: conn} do
      params = %{
        name: "Heleno",
        cpf: "010.149.493-29",
        age: 18,
        password: "1234567",
        email: "wallace@damn.com"
      }

      {:ok, %Tutor{id: id}} = Tutors.create(params)

      response =
        conn
        |> get(~p"/api/tutors/#{id}")
        |> json_response(:ok)

      expected_response =
        %{
          "data" => %{
            "birth_date" => "2018-11-20",
            "cpf" => "010.149.493-29",
            "email" => "wallace@damn.com",
            "id" => id,
            "name" => "Heleno"
          }
        }

      assert response == expected_response
    end

    test "returns an error when ID is invalid", %{conn: conn} do
      invalid_id = 999

      response =
        conn
        |> get(~p"/api/tutors/#{invalid_id}")
        |> json_response(:not_found)

      assert %{"message" => "Tutor not found", "status" => "not_found"} = response
    end
  end

  describe "update/2" do
    test "sucessfully update a tutor", %{conn: conn} do
      params = %{
        name: "Wallace",
        cpf: "010.149.493-29",
        age: 28,
        password: "1234567",
        email: "wallace@okay.com"
      }

      {:ok, %Tutor{id: id}} = Tutors.create(params)

      update_params = %{name: "Wallace Heleno", email: "wallaceheleno@okay.com"}

      response =
        conn
        |> put(~p"/api/tutors/#{id}", update_params)
        |> json_response(:ok)

      assert %{
               "data" => %{
                 "birth_date" => "2018-11-29",
                 "cpf" => "010.149.493-29",
                 "email" => "wallaceheleno@okay.com",
                 "id" => _id,
                 "name" => "Wallace Heleno"
               },
               "message" => "Tutor updated sucessfully"
             } = response
    end

    test "returns an error when trying to update a tutor with invalid data", %{conn: conn} do
      invalid_id = 999

      update_params = %{
        name: "Wallace Heleno",
        age: 29
      }

      response =
        conn
        |> put(~p"/api/tutors/#{invalid_id}", update_params)
        |> json_response(:not_found)

      expected_response = %{"message" => "Tutor not found", "status" => "not_found"}

      assert response == expected_response
    end
  end
end
