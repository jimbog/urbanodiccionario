class AddAuthorIdToWords < ActiveRecord::Migration
  def change
    add_column :words, :author_id, :integer
  end
end
