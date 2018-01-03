class AddUrlPictureToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :article, :url_picture, :string
  end
end
