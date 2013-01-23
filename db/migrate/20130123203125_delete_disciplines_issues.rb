class DeleteDisciplinesIssues < ActiveRecord::Migration
  def up
    drop_table :disciplines_issues
  end

  def down
  end
end
