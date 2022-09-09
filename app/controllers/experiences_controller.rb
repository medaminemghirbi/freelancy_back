class ExperiencesController < ApplicationController
    include CurrentUserConcern

    def index
        @experiences = Experience.all
        render json: @experiences
    end

    def create 
        @experience = Experience.new(post_params)
        if @experience.save 
            render json: @experience ,statut: :created, location: @experience 
       
        else
            render json: @experience.errors, statut: :unprocessable_entity
        end    
    end   

    def show
        @experience = Experience.find(params[:id])
        render json: @experience
        
    end

    def update
        @experience = Experience.find(params[:id])
        if @experience.update(post_params2)
        render json: @experience

        else
        render json: @experience.errors, statut: :unprocessable_entity
        end
    end

    def destroy
        @experience = Experience.find(params[:id])
        @experience.destroy
    end


    def getuserexperiance
        @experiences = Experience.where(user_id: params[:user_id])
        render json: @experiences ,  include: :user
    end


    private

    def post_params
        params.permit(:dateDebut , :dateFin ,:jobType , :description , :entreprise ,:user_id )
    end

    def post_params2
        # lazm tbaath kol shy fl update 
        params.permit(:dateDebut , :dateFin ,:jobType , :description , :entreprise ,:user_id )
    end

    def set_post
        @experience = Experience.find(params[:id])
    end

end
