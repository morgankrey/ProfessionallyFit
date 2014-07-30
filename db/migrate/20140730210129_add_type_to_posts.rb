class AddTypeToPosts < ActiveRecord::Migration
   def change
      add_column :posts, :news, :boolean, default: false
      add_column :posts, :blog, :boolean, default: false
      add_column :posts, :nutrition, :boolean, default: false
      add_column :posts, :training, :boolean, default: false
      add_column :posts, :supplements, :boolean, default: false
   end
end
