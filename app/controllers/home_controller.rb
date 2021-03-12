class HomeController < ApplicationController

    def index
        @study_items = StudyItem.all()      
                         #model   
        #@study_items = StudyItem.select(:category).group(:category)                 
    end
end