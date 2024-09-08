class AddOmniAuthToHandlers < ActiveRecord::Migration[7.1]
  def change
    add_column :handlers, :provider, :string
    add_column :handlers, :uid, :string
  end
end
