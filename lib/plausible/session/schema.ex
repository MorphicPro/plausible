defmodule Plausible.Session do
  use Ecto.Schema
  import Ecto.Changeset

  schema "sessions" do
    field :hostname, :string
    field :domain, :string
    field :new_visitor, :boolean
    field :user_id, :binary_id

    field :start, :naive_datetime, null: false
    field :length, :integer
    field :is_bounce, :boolean
    field :entry_page, :string
    field :exit_page, :string

    field :referrer, :string
    field :referrer_source, :string
    field :country_code, :string
    field :screen_size, :string
    field :operating_system, :string
    field :browser, :string

    timestamps(inserted_at: :timestamp, updated_at: false)
  end

  def changeset(session, attrs) do
    session
    |> cast(attrs, [:hostname, :domain, :entry_page, :exit_page, :referrer, :new_visitor, :user_id, :start, :length, :is_bounce, :operating_system, :browser, :referrer_source, :country_code, :screen_size])
    |> validate_required([:hostname, :domain, :new_visitor, :user_id, :is_bounce, :start])
  end
end
