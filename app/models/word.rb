class Word < ActiveRecord::Base
  has_many :votes, dependent: :destroy

  extend FriendlyId 
  friendly_id :name

  def up_votes
   self.votes.where(value: 1).count
  end

  def down_votes
   self.votes.where(value: -1).count
  end
  
  def points
   self.votes.sum(:value).to_i
  end
end
