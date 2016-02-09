class RemoveUidFromAnswers < ActiveRecord::Migration
  def change
    remove_column :answers, :uid, :string
  end
end
