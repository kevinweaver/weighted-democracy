class Answer < ActiveRecord::Base
  attr_accessible :text, :question_id
  validates_presence_of :text
end
