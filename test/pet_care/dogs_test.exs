defmodule PetCare.DogsTest do
  use PetCare.DataCase, async: true

  alias PetCare.Dogs
  alias PetCare.Tutors

  defp insert_tutor do
    tutor_params = %{
      name: "Joseph",
      cpf: "12345678901",
      birth_date: ~D[1990-01-01],
      email: "joseph@example.com",
      password: "123456"
    }

    {:ok, tutor} = Tutors.create_tutor(tutor_params)
    tutor
  end

  defp dog_params do
    %{
      name: "Bobby",
      breed: "Golden Retriever",
      weight: 30.5,
      tutor_id: insert_tutor().id
    }
  end

  describe "CREATE - dog" do
    test "successfully creates a dog with valid date" do
      params = dog_params()
      {:ok, dog} = Dogs.create_dog(params)

      expected_response = %{
        name: params.name,
        breed: params.breed,
        weight: params.weight,
        tutor_id: params.tutor_id
      }

      assert %{
               name: dog.name,
               breed: dog.breed,
               weight: dog.weight,
               tutor_id: dog.tutor_id
             } == expected_response
    end
  end
end
