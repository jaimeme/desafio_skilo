defmodule SkiloTeste.Repo do
  use Ecto.Repo,
    otp_app: :skilo_teste,
    adapter: Ecto.Adapters.Postgres
end
