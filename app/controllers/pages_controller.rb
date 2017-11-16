class PagesController < ApplicationController
  include Secured
  skip_before_action :current_bo_user, :logged_in_using_omniauth?, :only => [:logout]

  def show
    @categories = Category.all.paginate(page: params[:categories_page], per_page: 5)
    @partners = Partner.all.paginate(page: params[:partners_page], per_page: 5)
    @prizeContents = PrizeContent.all.paginate(page: params[:prize_content_page], per_page: 5)
    @challenges = Challenge.all.paginate(page: params[:challenges_page], per_page: 5)

    if valid_page?
      render template: "pages/#{params[:page]}"
    else
      render file: "public/404.html", status: :not_found
    end
  end

  def logout
    session[:userinfo] = nil
    redirect_to "https://sengaa-app.eu.auth0.com/login?client=npyBD_mrOT4XgQzyK_RHayEAxyHlAVax"
  end


  private def valid_page?
    File.exist?(Pathname.new(Rails.root + "app/views/pages/#{params[:page]}.html.slim"))
  end

end
