class Discipline < ActiveRecord::Base
  attr_accessible :description, :name
  validates_presence_of :name
  validates_presence_of :description

  has_many :questions
  has_many :issue_disciplines
  has_many :issues, :through => :issue_disciplines
end
