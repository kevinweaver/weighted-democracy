class IssueDiscipline < ActiveRecord::Base
  attr_accessible :discipline_id, :issue_id
  belongs_to :discipline
  belongs_to :issue
  
end
