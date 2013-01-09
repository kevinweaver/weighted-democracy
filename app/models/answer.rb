class Answer < ActiveRecord::Base
  attr_accessible :question_id, :text
  validates_presence_of :text
end
