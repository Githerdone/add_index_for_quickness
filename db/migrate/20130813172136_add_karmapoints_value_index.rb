class AddKarmapointsValueIndex < ActiveRecord::Migration
  def up
    add_index(:karma_points, :value)
  end

  def down
    remove_index(:karma_points, :value)
  end
end
