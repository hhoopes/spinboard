module Api
  module V1
    class LinksController < ApiController
      def update
        link = Link.find(params[:id])
        if link.update(link_params)
          respond_with(link, status: 200, location: user_path(current_user.id))
        else
          render json: link.errors, status: 422
        end
      end

      private
        def link_params
          params.require(:link).permit(:title, :url, :read)
        end
    end
  end
end
