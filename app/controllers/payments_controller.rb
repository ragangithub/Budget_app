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
    payment = Payment.create(name: params[:transaction][:name], amount: params[:transaction][:amount],
                             author: current_user)

    category_ids = params[:transaction][:category_ids] || [] # Handle the case when no categories are selected

    category_ids.each do |category_id|
      category = Category.find_by(id: category_id) # Use find_by to avoid raising an exception if category is not found
      next unless category

      CategoryPayment.create(payment:, category:)
    end

    if payment.valid?
      redirect_to category_payments_path(params[:category_id]), notice: 'Transaction was successfully created.'
    else
      @categories = current_user.categories.all
      @transaction = payment # Assign the payment to @transaction for rendering the form with errors

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
