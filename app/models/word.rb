class Word < ActiveRecord::Base
  before_create { generate_token(:token) }
  has_many :votes, dependent: :destroy
  belongs_to :author
  accepts_nested_attributes_for :author

  validates :name, :definition, :example, presence: true

  extend FriendlyId 
  friendly_id :name

  def up_votes
    self.votes.where(value: 1).count
  end

  def down_votes
    self.votes.where(value: -1).count
  end


  def generate_token(column)
      self[column] = SecureRandom.urlsafe_base64
  end
end
