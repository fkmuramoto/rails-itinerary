class CreateActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :activities do |t|
      t.string :name
      t.date :date
      t.string :ampm
      t.string :description
      t.string :commments

      t.timestamps
    end
  end
end
