class StudyItemsController <ApplicationController
   
   def show
      set_study_item
      #category = params[:id]
      #@study_item = StudyItem.where(category: category)
   end

   def new
      @study_item = StudyItem.new
   end

   def create
      @study_item = StudyItem.new(study_item_params)
      
      #ou faz isso
      #@study_item = StudyItem.new
      #@study_item.title = params[:study_item][:title]
      #@study_item.category = params[:study_item][:category]
      @study_item.done = 0
   
      if @study_item.save
         flash[:notice] = 'Novo item adicionado'
         redirect_to root_path
      else
         #uts '\n\n\n =================='
         #puts @study_item.errors.messages #--> mostra no terminal as mensagens de erro do processo
         flash[:alert] =  'Não foi possivel adcionar o item de estudo'
         render 'new'
      end
   end

   def edit
      set_study_item
   end

   def update
      set_study_item
      if @study_item.update(study_item_params)
         redirect_to  @study_item  #-> vai pro show do objeto, study_item_path(@study_item)
      else
         render :edit
      end

   end

   def mark_as_done
      set_study_item
      if @study_item.done == false
         @study_item.done!
      else
         @study_item.not_done!
      end
      redirect_to @study_item
   end



   private

      def set_study_item
         @study_item = StudyItem.find(params[:id])
      end

      def study_item_params
         params.require(:study_item).permit(:title,:category_id,:done)
      end



end