class CreatePlans < ActiveRecord::Migration[5.0]
  def change
    create_table :plans do |t|
      t.string :topic
      t.text :goal
      t.text :materials
      t.text :listening
      t.text :speaking
      t.text :reading
      t.text :writing
      t.text :assessment

      t.timestamps
    end
  end
end
