class AddUidToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :uid, :string
  end
end
