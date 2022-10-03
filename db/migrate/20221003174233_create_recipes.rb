class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.time :preparation_time
      t.time :cooking_time
      t.string :description
      t.boolean :public
      t.references :user, null: false, foreign_key: { to_table: :users}

      t.timestamps
    end
  end
end
