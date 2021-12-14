class DashboardsController < ActionController::Base
    def index
        @transactions = Transaction.all
    end

    def show
        @transactions = Transaction.where(operation = params[:id])
    end
end