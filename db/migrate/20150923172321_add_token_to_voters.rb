class AddTokenToVoters < ActiveRecord::Migration
  def change
    add_column :voters, :token, :string

    Voter.all.each do |v|
      v.update!(token: ApiKey.create.token) if v.token.blank?
    end
  end
end
