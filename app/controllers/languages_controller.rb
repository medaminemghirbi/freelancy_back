class LanguagesController < ApplicationController
    include CurrentUserConcern
  
    def index
        @languages = Language.all
        render json: @languages
    end
  
    def create 
        @language = Language.new(post_params)
        if @language.save 
            render json: @language ,statut: :created, location: @language 
       
        else
            render json: @language.errors, statut: :unprocessable_entity
        end    
    end   
  
    def show
        @language = Language.find(params[:id])
        render json: @language
        
    end
  
    def update
        @language = Language.find(params[:id])
        if @language.update(post_params2)
        render json: @language
  
        else
        render json: @language.errors, statut: :unprocessable_entity
        end
    end
  
    def destroy
        @language = Language.find(params[:id])
        @language.destroy
    end
  
  
  
    private
  
  
    def post_params
        params.require(:language).permit! 
    end
  
    def post_params2
        # lazm tbaath kol shy fl update 
        params.permit(:name )
    end
  
    def set_post
        @language = Language.find(params[:id])
    end
  
  
  end