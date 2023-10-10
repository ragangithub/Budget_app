class CategoriesController < ApplicationController
  def index
    @categories = current_user.categories.includes(:payments).order(created_at: :desc)
  end

  def new
    @category = Category.new
  end

  def create
    @categorie = Category.new(categorie_params)
    @categorie.user = current_user
    if @categorie.save
      redirect_to categories_path, notice: 'Category was successfully created.'
    else
      render :new, status: 422
    end
  end

  def destroy
    category = Category.find(params[:id])
    category.destroy
    redirect_to categories_path, notice: "Deleted group: #{category.name}"
  end

  private

  def categorie_params
    params.require(:category).permit(:name, :icon)
  end
end
