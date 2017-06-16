class AddPostStatusToBlogs < ActiveRecord::Migration[5.0]
  def change
    
    # sets default value by inserting default: 0
    add_column :blogs, :status, :integer, default: 0
  end
end
