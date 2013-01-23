class Discipline < ActiveRecord::Base
  #has_and_belongs_to_many :issues
  attr_accessible :description, :name, :issue_id
  validates_presence_of :name
  validates_presence_of :description

  belongs_to :issue
  has_many :questions
  #has_many :issue_disciplines
  #has_many :issues, :through => :issue_disciplines
end
