class FavorisController < ApplicationController
  include CurrentUserConcern
  
  def index
      @favoris = Favori.all
      render json: @favoris 
  end

  def create 
      @favori = Favori.new(post_params)
      if @favori.save 
          render json: @favori ,statut: :created, location: @favori 
     
      else
          render json: @favori.errors, statut: :unprocessable_entity
      end    
  end   
 
  def show
      @favori = Favori.where(user_id:  params[:user_id] )
      render json: @favori  , include: [:mission , :user ]  
      
  end
  def destroy
      @favori = Favori.find(params[:id])
      @favori.destroy
  end

  private


  def post_params
      params.permit(:mission_id , :user_id)
  end
  
  def set_post
      @favori = Favori.find(params[:id])
  end


end