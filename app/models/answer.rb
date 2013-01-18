class Answer < ActiveRecord::Base
  belongs_to :question
  attr_accessible :text, :question_id
  validates_presence_of :text
end
