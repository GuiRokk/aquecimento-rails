class StudyItemsController <ApplicationController
   
   def show
      id = params[:id]
      @study_item = StudyItem.find(id)
      #category = params[:id]
      #@study_item = StudyItem.where(category: category)
   end

   def new
      @study_item = StudyItem.new
   end

   def create
      si_params = study_item_params
      @study_item = StudyItem.new(si_params)
      
      #ou faz isso
      #@study_item = StudyItem.new
      #@study_item.title = params[study_item][:title]
      #@study_item.category = params[study_item][:category]
      #@study_item.done = params[study_item][:done]
      
      if @study_item.save
         redirect_to root_path
      else
         flash[:alert] =  "Não foi possivel adcionar o item de estudo"
         render 'new'
      end
   end

   def edit
      set_study_item
   end

   def update
      set_study_item
      if @study_item.update(study_item_params)
         redirect_to  @study_item # ..to @study_item -> vai pro show   study_item_path(@study_item)
      else
         render :edit
      end

   end 
   private

      def set_study_item
         @study_item = StudyItem.find(params[:id])
      end

      def study_item_params
         params.require(:study_item).permit(:title,:category,:done)
      end



end