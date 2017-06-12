class AddCommentToResources < ActiveRecord::Migration[5.1]
  def change
    add_column :resources, :comment, :text
  end
end
