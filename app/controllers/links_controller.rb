class LinksController < ApplicationController
  before_action :require_login

  def new
    @link = link_from_params
  end

  def index
    @links = Link.where(user: current_user)
  end

  def create
    @link = link_from_params

    if current_user.store_id != @link.parsed_store
      @link.errors.add(:base, "The parsed store id #{@link.parsed_store} does not match your store id #{current_user.store_id}")
    end

    if @link.save
      redirect_to links_path
    else
      if @link.errors[:user]
        # happens when the ASIN already exists for the user
        @link.errors.add(:url, "A link to this product already exists")
      end
      render "new"
    end
  end

  private

  def link_params
    params.require(:link).permit(:url, :name)
  end

  def link_from_params
    if params[:link]
      link = Link.from_url(link_params[:url])
      link.assign_attributes(user_id: current_user.id, name: link_params[:name])
      link
    else
      Link.new
    end
  end
end
