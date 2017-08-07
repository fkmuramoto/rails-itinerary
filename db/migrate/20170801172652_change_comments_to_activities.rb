class ChangeCommentsToActivities < ActiveRecord::Migration[5.0]
  def change
    remove_column :activities, :commments, :string
    add_column :activities, :comments, :string
  end
end
