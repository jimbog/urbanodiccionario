class AddTokenAndVerifiedToWords < ActiveRecord::Migration
  def change
    add_column :words, :token, :string
    add_column :words, :verified, :boolean, default: false
  end
end
