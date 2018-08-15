class AddAttachmentMovieToArticles < ActiveRecord::Migration[5.2]
  def self.up
    change_table :articles do |t|
      t.attachment :movie
    end
  end

  def self.down
    remove_attachment :articles, :movie
  end
end
