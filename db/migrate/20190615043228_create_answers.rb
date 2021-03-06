class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.references :question, foreign_key: true
      t.string :content
      t.boolean :is_correct,default: false
      t.integer :order

      t.timestamps
    end
  end
end
