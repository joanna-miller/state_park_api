require 'rails_helper'

describe State do
  it { should have_many(:parks) }
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name).case_insensitive }
end