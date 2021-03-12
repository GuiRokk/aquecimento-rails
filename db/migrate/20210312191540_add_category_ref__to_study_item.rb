class AddCategoryRefToStudyItem < ActiveRecord::Migration[6.1]
  def change
    add_reference :study_items, :category, null: false,foreign_key: true
  end
end
