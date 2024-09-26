defmodule PetCareWeb.TutorsJSON do
  alias PetCare.Tutors.Schema.Tutor

  def create(%{tutor: tutor}) do
    %{
      message: "Created Tutor sucessfully",
      data: data(tutor)
    }
  end

  def delete(%{tutor: tutor}) do
    %{message: "Tutor deleted sucessfully", data: data(tutor)}
  end

  def get(%{tutor: tutor}), do: %{data: data(tutor)}

  def update(%{tutor: tutor}) do
    %{message: "Tutor updated sucessfully", data: data(tutor)}
  end

  defp data(%Tutor{} = tutor) do
    %{
      id: tutor.id,
      name: tutor.name,
      cpf: tutor.cpf,
      birth_date: tutor.birth_date,
      email: tutor.email
    }
  end
end
