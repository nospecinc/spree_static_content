class AddBlogFieldsToPages < ActiveRecord::Migration
  class Page < ActiveRecord::Base
  end

  def self.up
    change_table :spree_pages do |t|
      t.string :featured_image
      t.date :date_published
    end
  end

  def self.down
    change_table :spree_pages do |t|
      t.remove :featured_image
      t.remove :date
    end
  end
end
