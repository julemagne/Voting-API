
class Voter < ActiveRecord::Base
  #before_create: token: ApiKey.create.token

  has_many :votes
  validates :name, presence: true
  validates :party, presence: true

  # private def generate_token
  #   begin
  #     self.token = SecureRandom.hex
  #   end while self.class.exists?(token: token)
  # end
  #
end
