class Question < ActiveRecord::Base
  belongs_to :discipline
  has_many :answers
  attr_accessible :name, :text, :discipline_id
  validates_presence_of :name
  validates_presence_of :text
  
end
