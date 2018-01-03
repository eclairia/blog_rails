class AddOnlineToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :article, :online, :boolean, default: false
  end
end
