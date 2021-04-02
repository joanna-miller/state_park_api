FactoryBot.define do
  factory(:state) do
    name {Faker::Address.unique.state}
  end
  factory(:park) do
    name {Faker::Mountain.name}
  end
end