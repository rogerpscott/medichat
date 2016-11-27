class Conversation < ApplicationRecord
  has_secure_token :access_token
  belongs_to :doctor
  belongs_to :patient
  has_many :messages

  def to_param
    self.access_token
  end
end
