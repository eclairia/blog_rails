class AddUrlPictureToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :url_picture, :string
  end
end
