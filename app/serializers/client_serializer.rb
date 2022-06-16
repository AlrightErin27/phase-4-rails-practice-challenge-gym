class ClientSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :total_price

  def total_price
    object.memberships.sum(:charge)
  end
end
