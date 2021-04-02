# state_list = ['Alabama', 'Alaska', 'Arizona', 'Arkansas', 'California', 'Colorado', 'Connecticut', 'Delaware', 'Florida', 'Georgia', 'Hawaii', 'Idaho', 'Illinois', 'Indiana', 'Iowa', 'Kansas', 'Kentucky', 'Louisiana', 'Maine', 'Maryland', 'Massachusetts', 'Michigan', 'Minnesota', 'Mississippi', 'Missouri', 'Montana', 'Nebraska', 'Nevada', 'New Hampshire', 'New Jersey', 'New Mexico',' New York', 'North Carolina', 'North Dakota', 'Ohio', 'Oklahoma', 'Oregon', 'Pennsylvania', 'Rhode Island', 'South Carolina', 'South Dakota', 'Tennessee', 'Texas', 'Utah', 'Vermont', 'Virginia', 'Washington', 'West Virginia', 'Wisconsin', 'Wyoming']

class Seed

  def self.begin
    seed = Seed.new
    seed.generate_states
  end

  def generate_states
    50.times do |i|
      state = State.create!({
        name: Faker::Address.state}
      )
      3.times do |i|
        Park.create!(name: Faker::Mountain.name, park_type: "State Park", state_id: state.id)
      end
      Park.create!(name: Faker::Mountain.name, park_type: "National Park", state_id: state.id)
    end
  end
end

Seed.begin

