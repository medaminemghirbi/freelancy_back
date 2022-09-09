class SessionsController < ApplicationController
  # include CurrentUserConcern
 
   def create
     user = User
            .find_by(email: params['email'])
            .try(:authenticate, params['password'])
     if user
       session[:user_id] = user.id
       render json: {
         status: :created,
         logged_in: true,
         user_id: user.id ,
         role: user.role,
         user: user
       }, methods: [:user_image_url] 
     else
       render json: { status: 401 }
     end
   end
 
   def logout
     reset_session
     render json: { status: 200, logged_out: true }
   end
 end