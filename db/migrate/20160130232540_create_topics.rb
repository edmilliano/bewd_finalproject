class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
	t.timestamps null: false
	t.string :name
    end

    create_table :questions_topics do |t|
      t.belongs_to :question, index: true
      t.belongs_to :topic, index: true
    end
  end
end
