class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|

      t.string   :title
      t.string   :body
      t.integer  :user_id
      t.text   	 :image_id
      t.string   :catname


      t.timestamps
    end
  end
end
