class CreateIssueDisciplines < ActiveRecord::Migration
  def change
    create_table :issue_disciplines do |t|
      t.integer :issue_id
      t.integer :discipline_id

      t.timestamps
    end
  end
end
