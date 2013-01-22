class DisciplinesIssues < ActiveRecord::Migration
  def change
    create_table :disciplines_issues, :id => false do |t|
      t.integer :discipline_id
      t.integer :issue_id
    end
  end
end
