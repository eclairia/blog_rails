class RemoveUserIdToArticles < ActiveRecord::Migration[5.1]
  def change
    remove_column :articles, :user_id, :integer
  end
end
