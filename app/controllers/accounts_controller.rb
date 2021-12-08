class AccountsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_account, only: [:show, :edit, :update, :destroy]
  def index
    # not doing this way
    # @accounts = Account.all 
    @accounts = current_user.accounts 
    # User.find(params[:id])
    render component: 'Accounts', props: { user: current_user, accounts: @accounts }
  end

  def show
    render component: 'Account', props: { user: current_user, account: @account }
  end

  def new
    @account = current_user.accounts.new
    render component: 'AccountNew', props: { user: current_user, account: @account }
  end

  def create 
    @account = current_user.accounts.new(account_params)
    if @account.save 
      flash[:success] = "Account: #{@account.name} created"
      redirect_to root_path
    else
      flash[:error] = "Error #{@account.errors.full_messages.join("\n")}"
      render component: 'AccountNew', props: { user: current_user, account: @account }
    end
  end

  def edit
    render component: 'AccountEdit', props: {user: current_user, account: @account}
  end

  def update 
    if @account.update(account_params)
      flash[:success] = Account: #{account.name} update"
      redirect_to root_path
    else
      flash[:error] = "Error #{account.errors.full_messages.join("/n")} update"
      render component 'AccountEdit', props: {user: current_user, account: @account }
    end
  end

  def destroy
    @account.destroy
    redirect_to root_path
    flash[:succes]= "Account Deleted"

  end

  private 
    def set_account
      @account = current_user.accounts.find(params[:id])
    end

    def account_params
      params.require(:account).permit(:name, :balance)
    end

end