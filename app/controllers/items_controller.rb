class ItemsController < ApplicationController
  before_action :set_account
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = @account.items 
    render component: 'Items', props: {
      account: @account, 
      items: @items,
      user: current_user
    }
  end

  def show
    render component: 'Item', props: { account: @account, item: @item }
  end

  def new
    @item = @account.items.new()
    render component: 'ItemNew', props: { account: @account, item: @item }
  end

  def create
    @item = @account.items.new(item_params)
    if @item.save 
      flash[:success] = "Item Created"
      redirect_to account_items(@account)
    else
      flash[:error] = "Error #{@item.errors.full_messages.join("\n")}"
      render component: 'ItemNew', props: { account: @account, item: @item }
    end
  end

  def edit
    render component: 'ItemEdit', props: { account: @account, item: @item }
  end

  def update
    if @item.update(item_params)
      flash[:success] = "Item updated"
      redirect_to account_items(@account)
    else
      flash[:error] = "Error #{@item.errors.full_messages.join("\n")}"
      render component: 'ItemEdit', props: { account: @account, item: @item }
    end
  end

  def destroy
    @item.destroy
    redirect_to account_items(@account)
  end

  private 
    def item_params
      params.require(:item).permit(:title, :amt, :deposit)
    end

    def set_account
      @account = Account.find(params[:account_id])
    end

    def set_item
      @item = @account.items.find(params[:id])
    end
end