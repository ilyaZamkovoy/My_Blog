class MakePostsNotNull < ActiveRecord::Migration

	change_column :posts, :title, :string, :null => false
	change_column :posts, :text, :string, :null => false

end
