class ChangeContentTypeInPosts < ActiveRecord::Migration
   def self.up
      change_column :posts, :content, :text, limit: nil
   end

   def self.down
      change_column :posts, :content, :string
   end
end
