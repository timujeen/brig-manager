class RenameTitleColumn < ActiveRecord::Migration
  def change
  	rename_column :jobs, :title, :name
  end
end
