class OptionController < ApplicationController

  layout 'home_layout'

  def index
    @usr_id = current_user.id
    @option = Option.where(:user_id => @usr_id)
  end

  def new
    @option = Option.new
  end

  def create

    @option = Option.new(option_params)
    @option.user_id = current_user.id
    if(@option.save)
      flash[:notice] = "Option created successfully."
      redirect_to(:action => "index")
    else
      render 'new'
    end

  end

  def show
    @option = Option.find(params[:id])

    @bs_clc = BlackScholes(@option.is_call, @option.stock_price.to_i, @option.strike_price.to_i,
                           @option.time.to_i, @option.risk_free_rate.to_i, @option.volatility.to_i)
    @cnd_clc = cnd(@option.strike_price.to_i)
  end

  def edit
    @option = Option.find(params[:id])
  end

  def update
    @option = Option.find(params[:id])
    @option.user_id = current_user.id
    if @option.update_attributes(option_params)
      flash[:notice] = "Option updated Successfully."
      redirect_to(:action => 'show', :id => @option.id)
    else
      render('edit')
  end

  def delete
    @option = Option.find(params[:id])
  end
  end

  def destroy
    @option = Option.find(params[:id])
    @option.destroy
    flash[:notice] = "Option deleted Successfully."
    redirect_to(:action => 'index')
  end

  private
  def option_params
    params.require(:option).permit(:id, :user_id, :title, :stock_price, :strike_price, :time,
                                   :volatility, :is_call, :risk_free_rate)
  end
end
