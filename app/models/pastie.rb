class Pastie
  include Mongoid::Document

  before_create :timestamp
  field :text, type: String
  field :image, type: BSON::Binary
  field :created_at, type: Time

  def timestamp
    self[:created_at] = Time.now
  end
end
