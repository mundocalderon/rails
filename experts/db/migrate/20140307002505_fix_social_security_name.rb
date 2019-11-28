class FixSocialSecurityName < ActiveRecord::Migration
  def change
    rename_column :people, :social_security_number, :nickname
  end
end
