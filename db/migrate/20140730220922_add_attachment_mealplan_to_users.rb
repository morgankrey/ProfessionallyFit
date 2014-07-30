class AddAttachmentMealplanToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.attachment :mealplan
    end
  end

  def self.down
    drop_attached_file :users, :mealplan
  end
end
