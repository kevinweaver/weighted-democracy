class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :name
      t.text :text
      t.integer :discipline_id

      t.timestamps
    end
  end
end
