class AddEnableToRegisteredApp < ActiveRecord::Migration
  def change
    add_column :registered_apps, :enable, :boolean, default: true
  end
end
