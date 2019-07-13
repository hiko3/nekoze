class AddCatnameToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :catname, :string
  end
end
