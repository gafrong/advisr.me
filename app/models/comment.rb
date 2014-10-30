class Comment < ActiveRecord::Base
  belongs_to :answer
  belongs_to :user

  has_one :question, :through => :answer
end
