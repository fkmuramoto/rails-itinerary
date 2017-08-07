class RenameColumns < ActiveRecord::Migration[5.0]
  def change
    rename_column :activities, :name, :activity
    rename_column :activities, :ampm, :period
  end
end
