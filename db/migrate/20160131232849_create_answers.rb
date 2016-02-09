class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :question_id
      t.text :answertext

      t.timestamps null: false
    end
  end
end
