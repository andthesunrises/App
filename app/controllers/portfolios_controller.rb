class PortfoliosController < ApplicationController
  layout "portfolio"
  access all: [:show, :index, :angular], user: {except: [:destroy, :new, :create, :update, :edit]}, site_admin: :all
  
  def index
    @portfolio_item = Portfolio.by_position
  end
  
  #hard-code angular controller
  def angular
    @angular_portfolio_item = Portfolio.angular
  end
  
  def new
    @portfolio_item = Portfolio.new
    3.times { @portfolio_item.technologies.build }
  end

  #now also passes technologies attributes and does strong param
  def create
    @portfolio_item = Portfolio.new(portfolio_params)

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'Your portfolio item is now live.' }
      else
        format.html { render :new }
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
        format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end
  
  def show
    @portfolio_item = Portfolio.find(params[:id])
  end
  
  def destroy
    # Performs the look up for the record
    @portfolio_item = Portfolio.find(params[:id])
    # destroy / delete the record
    @portfolio_item.destroy
    # redirects 
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'Portfolio was removed.' }
    end
  end

  # only to be used inside this class
  # these are repeated codes that gets called often
  private
  
  #good practice to break parameters into different lines if line too long
  def portfolio_params
    params.require(:portfolio).permit(:title, 
                                      :subtitle, 
                                      :body, 
                                      technologies_attributes: [:name]
                                     )
  end
  
end
