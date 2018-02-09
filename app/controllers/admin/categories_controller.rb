class Admin::CategoriesController < ApplicationController
  before_action :set_category, only: [:edit, :update, :destroy]

  # GET /categories
  # GET /categories.json
  def index
    @page_title = "Toutes les catégories"
    @categories = Category.all
    render layout: "admin"
  end

  # GET /categories/new
  def new
    @page_title = "Ajouter une catégorie"
    @category = Category.new
    render layout: "admin"
  end

  # GET /categories/1/edit
  def edit
    @page_title = "Modifier une catégorie"
    render layout: "admin"
  end

  # POST /categories
  # POST /categories.json
  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to admin_categories_path,success: t(:admin_create_category_sucess_message) }
        format.json { render :index, status: :created, location: @category }
      else
        format.html { render :new, layout: "admin", danger: t(:admin_create_category_fail_message) }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to admin_categories_path, success: t(:admin_update_category_sucess_message) }
        format.json { render :categories, status: :ok, location: @categories }
      else
        format.html { render :edit, layout: "admin", danger: t(:admin_update_category_fail_message) }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    if @category.destroy
      respond_to do |format|
        format.html { redirect_to admin_categories_path, success: t(:admin_destroy_category_success_message) }
        format.json { head :no_content }
      end
    else
      redirect_to admin_categories_path, danger: t(:admin_destroy_category_fail_message)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:title)
    end
end
