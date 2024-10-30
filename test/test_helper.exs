Mox.defmock(PetCare.ViaCep.ClientMock, for: PetCare.ViaCep.ClientBehaviour)
Application.put_env(:pet_care, :via_cep_client, PetCare.ViaCep.ClientMock)

ExUnit.start()
Ecto.Adapters.SQL.Sandbox.mode(PetCare.Repo, :manual)
