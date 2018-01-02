class AddOnlineToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :online, :boolean, default: false
  end
end
