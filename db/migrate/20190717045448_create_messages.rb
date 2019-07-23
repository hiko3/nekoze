class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.text :content
      t.references :to_user, foreign_key:{to_table: :users}
      t.references :from_user, foreign_key:{to_table: :users}

      t.timestamps
    end
  end
end
