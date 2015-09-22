class Voter < ActiveRecord::Base
  has_many :votes
  validates :name, presence: true
  validates :party, presence: true
end
