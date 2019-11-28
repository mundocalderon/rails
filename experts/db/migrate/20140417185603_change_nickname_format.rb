class ChangeNicknameFormat < ActiveRecord::Migration
  def up
    change_column :people, :nickname, :string
  end

  def down
    change_column :people, :nickname, :integer
  end
end
