FactoryBot.define do
  factory(:state) do
    name {Faker::Address.unique.state}
  end
end