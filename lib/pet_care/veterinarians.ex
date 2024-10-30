defmodule PetCare.Veterinarians do
  alias PetCare.Veterinarians.CreateVeterinarian
  alias PetCare.Veterinarians.DeleteVeterinarian
  alias PetCare.Veterinarians.GetVeterinarian
  alias PetCare.Veterinarians.UpdateVeterinarian

  defdelegate create(params), to: CreateVeterinarian, as: :call
  defdelegate delete(id), to: DeleteVeterinarian, as: :call
  defdelegate get(id), to: GetVeterinarian, as: :call
  defdelegate update(params), to: UpdateVeterinarian, as: :call
end
