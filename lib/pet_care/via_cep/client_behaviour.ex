defmodule PetCare.ViaCep.ClientBehaviour do
  @callback validate_cep(String.t()) :: {:ok, map()} | {:error, :atom}
end
