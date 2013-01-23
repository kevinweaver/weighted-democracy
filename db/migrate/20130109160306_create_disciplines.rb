class CreateDisciplines < ActiveRecord::Migration
  def change
    create_table :disciplines do |t|
      t.string :name
      t.text :description
      t.integer :issue_id

      t.timestamps
    end
  end
end
