class StudyItem < ApplicationRecord
    belongs_to :category
    
    validates :title, presence: true
    
    def full_title
        "#{title} - #{category.title}"
    end

    def done!
        update(done:true)
    end

    def not_done!
        update(done:false)
    end
end
