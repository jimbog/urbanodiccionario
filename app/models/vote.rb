class Vote < ActiveRecord::Base
  #attr_accessible :value, :word
  belongs_to :word
  belongs_to :user

  validates :value, inclusion: { in: [-1, 1], message:"%{value} is not a valid vote." } 

end
