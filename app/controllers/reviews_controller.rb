class ReviewsController < ApplicationController
    include CurrentUserConcern
    def index
        @reviews = Review.all
        render json: @reviews ,  include: [:mission , :user ]
    end

    def create 
        @review = Review.new(post_params)
        if @review.save 
            render json: @review ,statut: :created, location: @review 
       
        else
            render json: @review.errors, statut: :unprocessable_entity
        end    
    end   

    def show
        @review = Review.find(params[:id])
        render json: @review
        
    end

    def update
        
        @review = Review.find(params[:id])
        if @review.update(post_params2)
        render json: @review

        else
        render json: @review.errors, statut: :unprocessable_entity
        end
    end

    def destroy
        @review = Review.find(params[:id])
        @review.destroy
    end

    def ratingclient 
        @review = Review.where(user_id: params[:user_id]).count
        render json: @review
    end

    def ratingfreelancer 
        @review = Review.where(user_id: params[:user_id]).count
        render json: @review
    end

    private


    def post_params
        params.permit(:mission_id , :user_id)
    end
    def post_params2
        # lazm tbaath kol shy fl update 
        params.permit(:commentClient , :commentFreelancer , :mission_id , :user_id)
    end

    def set_post
        @review = Review.find(params[:id])
    end

end