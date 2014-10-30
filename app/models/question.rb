class Question < ActiveRecord::Base
  belongs_to :user
  belongs_to :cateogry

  has_many :answers
  has_many :comments, :through => :answers
end

