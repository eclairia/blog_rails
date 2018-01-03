class AddUserIdToArticlesTable < ActiveRecord::Migration[5.1]
  def change
    add_column :article, :user_id, :integer
  end
end
