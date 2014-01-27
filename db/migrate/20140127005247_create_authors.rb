class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :pseudonym
      t.string :email

      t.timestamps
    end
  end
end
