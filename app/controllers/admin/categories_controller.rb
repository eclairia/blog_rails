class Admin::CategoriesController < ApplicationController
  before_action :set_category, only: [:edit, :update, :destroy]

  # GET /categories
  # GET /categories.json
  def index
    @categories = Category.all
    render layout: "admin"
  end

  # GET /categories/new
  def new
    @category = Category.new
    render layout: "admin"
  end

  # GET /categories/1/edit
  def edit
    render layout: "admin"
  end

  # POST /categories
  # POST /categories.json
  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to admin_categories_path, notice: 'Category was successfully created.' }
        format.json { render :index, status: :created, location: @category }
      else
        flash[:fail] = "The category could not be created"
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to admin_categories_path, notice: 'Category was successfully updated.' }
        format.json { render :categories, status: :ok, location: @categories }
      else
        flash[:fail] = "The category could not be updated"
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    if @category.destroy
      respond_to do |format|
        format.html { redirect_to admin_categories_path, notice: 'Category was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      flash[:fail] = "The article could not be deleted"
      redirect_to admin_categories_path
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
