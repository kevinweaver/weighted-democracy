class Question < ActiveRecord::Base
  attr_accessible :name, :text, :discipline_id
  validates_presence_of :name
  validates_presence_of :text
  
end
