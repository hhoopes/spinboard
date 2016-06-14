class LinksController < ApplicationController
  def create
    link = current_user.links.build(link_params)
    if link.save
      flash[:info] = "#{link.title} has been created"
    else
      flash[:error] = "Please provide a valid URL"
    end
    redirect_to user_path(current_user)
  end

  private

  def link_params
    params.require(:link).permit(:url, :title, :status)
  end
end
