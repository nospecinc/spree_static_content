class AddBlogFieldsToPages < ActiveRecord::Migration
  class Page < ActiveRecord::Base
  end

  def self.up
    change_table :spree_pages do |t|
      t.string :featured_image
      t.date :date_published
      t.string :tags
      t.boolean :blog
      t.index :blog
    end
  end

  def self.down
    change_table :spree_pages do |t|
      t.remove :featured_image
      t.remove :date
      t.remove :tags
      t.remove :blog
    end
  end
end