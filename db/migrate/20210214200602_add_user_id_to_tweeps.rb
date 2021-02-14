class AddUserIdToTweeps < ActiveRecord::Migration[6.0]
  def change
    add_column :tweeps, :user_id, :integer
  end
end
