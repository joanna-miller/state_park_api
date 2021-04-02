class State < ApplicationRecord
  has_many :parks
  validates :name, presence: true, uniqueness: { case_sensitive: false }
end