class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.references :chapter, foreign_key: true
      t.string :content
      t.integer :category,default: 0

      t.timestamps
    end
  end
end
