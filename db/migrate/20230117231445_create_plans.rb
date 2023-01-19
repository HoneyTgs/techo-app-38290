class CreatePlans < ActiveRecord::Migration[6.0]
  def change
    create_table :plans do |t|
      t.references :user,        null: false, foreign_key: true
      t.string     :title,       null: false
      t.string     :text,        null: false
      t.integer    :category_id, null: false
      t.timestamps
    end
  end
end
