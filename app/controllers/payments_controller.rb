class PaymentsController < ApplicationController
    def index
        @category = Category.includes(:payments).find(params[:category_id])
        @payments = @category.payments.order(created_at: :desc)
      end


      def new
        @categories = current_user.categories.all
        @transaction = Payment.new
      end 
    
      def create
        payment = Payment.create(name: params[:transaction][:name], amount: params[:transaction][:amount], author: current_user)
        category = Category.find(params[:transaction][:category])
    
        @transaction = CategoryPayment.new(payment:, category:)
    
        if @transaction.save
          redirect_to category_payments_path(params[:category_id]), notice: 'Transaction was successfully created.'
        else
          @categories = current_user.categories.all
    
          render :new, status: 422
        end
      end
    
      private
    
      def set_author
        @author = current_user
      end
    
      def categorie_params
        params.require(:transaction).permit(:id)
      end
    
      def transaction_params
        params.require(:transaction).permit(:name, :amount)
      end
       
end
