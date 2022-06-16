class Membership < ApplicationRecord
  belongs_to :gym
  belongs_to :client

  validates :gym_id, presence: true
  validates :client_id, presence: true
  validates :charge, presence: true
  validate :client_gym

  def client_gym
    Membership.all.each do |m|
      if client_id == m.client_id && gym_id == m.gym_id
        errors.add(
          :client_id,
          'Can not have another membership with the same gym.',
        )
      end
    end
  end
end
