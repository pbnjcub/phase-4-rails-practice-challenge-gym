class Membership < ApplicationRecord
    validates :client_id, :gym_id, :charge, presence: true
    validates :charge, numericality: { greater_than: 0 }
    validates :client_id, uniqueness: { scope: :gym_id }

    belongs_to :client
    belongs_to :gym
end
