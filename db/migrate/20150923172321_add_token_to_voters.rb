class AddTokenToVoters < ActiveRecord::Migration
  def change
    add_column :voters, :token, :string
  end
end
