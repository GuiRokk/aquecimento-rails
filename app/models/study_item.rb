class StudyItem < ApplicationRecord
    belongs_to :category
    
    validates :title, presence: true
    
    def full_title
        "#{title} - #{category}"
    end
end
