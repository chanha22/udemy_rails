class PortfoliosController < ApplicationController
  layout 'portfolio'
  access all: [:show, :index, :angular], user: {except: [:destroy, :create, :new, :update]}, message: "You shall not pass", site_admin: :all

  def sort
    params[:order].each do |key, value|
      Portfolio.find(value[:id]).update(position: value[:position])
    end

    render nothing: true
  end

  def index
    @portfolio_items = Portfolio.by_position
  end

  def angular
    @angular_portfolio_items = Portfolio.angular
  end

  def show
    @portfolio_item = Portfolio.find(params[:id])
  end

  def new
    @portfolio_item = Portfolio.new
  end

  def create
    @portfolio_item = Portfolio.new(portfolio_params)

    respond_to do |format|
      if @portfolio_item.save
        format.html{ redirect_to portfolios_path, notice: "Your portfolio item is now live." }
      else
        format.html{ render :new}
      end
    end
  end

  def edit
    @portfolio_item = Portfolio.find(params[:id])

  end

  def update
    @portfolio_item = Portfolio.find(params[:id])
    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html{ redirect_to portfolios_path, notice: "Your portfolio item is now live." }
      else
        format.html{ render :edit}
      end
    end
  end

  def destroy
    # Perform the lookup
    @portfolio_item = Portfolio.find(params[:id])

    # Destroy/delete the record
    @portfolio_item.destroy

    # Redirect
    respond_to do |format|
      format.html{ redirect_to portfolios_url, notice: 'Record was removed.'}
    end

  end

  private # 이 아래의 메소드들은 이 class 안에서만 사용 가능
  def portfolio_params
    params.require(:portfolio).permit(:title, :subtitle, :body,
                                  :thumb_image, :main_image,
                                  technologies_attributes: [:id, :name, :_destroy])
  end

end
