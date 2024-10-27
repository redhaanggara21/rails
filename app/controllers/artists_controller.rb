class ArtistsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    
    def index
        # @artistsartis = Artist.all
        # render json: @artists
        render json: Artist.all
    end

    def show
        render json: Artist.find(params[:id])
    end

    def create

        # @user = User.new(user_params)

        #     if @user.save

        #         render json: @user, status: :created

        #     else

        #         render json: @user.errors, status: :unprocessable_entity

        # end

        artist = Artist.create!(artist_params)
        render json: artist, status: :created
    end
      
    private
      
    def artist_params
        params.permit(:first_name, :last_name, :genre)
    end
    

    def update
        artist = Artist.find(params[:id])
        artist.update!(artist_params)
        render json: artist
    end
    
    def destroy
        Artist.find(params[:id]).destroy
        head :no_content
    end

    def render_not_found_response
      render json: { error: "Artist Not Found" }, status: :not_found
    end
  
    def render_unprocessable_entity_response(invalid)
      render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end
end
