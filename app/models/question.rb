class Question < ActiveRecord::Base
  belongs_to :user
  belongs_to :cateogry

end
