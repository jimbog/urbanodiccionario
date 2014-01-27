class Author < ActiveRecord::Base
  has_many :words
  validates :pseudonym, :email, presence: true
end
