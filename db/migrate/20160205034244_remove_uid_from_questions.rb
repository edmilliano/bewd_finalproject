class RemoveUidFromQuestions < ActiveRecord::Migration
  def change
    remove_column :questions, :uid, :string
  end
end
