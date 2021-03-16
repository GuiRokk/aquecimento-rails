class CategoriesController < ApplicationController

    def new
        @category = Category.new
    end



    def create
        
        @category = Category.new(category_params)
        
        if @category.save
            flash[:notice] = 'Nova categoria adicionada!'
            redirect_to root_path
         else
            #uts '\n\n\n =================='
            #puts @study_item.errors.messages #--> mostra no terminal as mensagens de erro do processo
            flash[:alert] =  'Não foi possivel adcionar a nova categoria'
            render 'new'
         end
    
    
    end


    private
    def category_params
        params.require(:category).permit(:title)
    end
end