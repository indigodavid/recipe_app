class FoodsController < ApplicationController
  load_and_authorize_resource
  before_action :set_food, only: %i[show edit update destroy]

  # GET /foods or /foods.json
  def index
    @foods = current_user.foods
  end

  # GET /foods/1 or /foods/1.json
  def show; end

  # GET /foods/new
  def new
    @food = Food.new
    @user = current_user
  end

  # GET /foods/1/edit
  def edit; end

  # POST /foods or /foods.json
  def create
    @user = current_user
    @food = Food.new(food_params)
    @food.user = @user

    respond_to do |format|
      if @food.save
        format.html { redirect_to food_url(@food), notice: 'Food was successfully created.' }
        format.json { render :show, status: :created, location: @food }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /foods/1 or /foods/1.json
  def update
    respond_to do |format|
      if @food.update(food_params)
        format.html { redirect_to food_url(@food), notice: 'Food was successfully updated.' }
        format.json { render :show, status: :ok, location: @food }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  def general_shopping_list
    @total_value = 0
    @items_to_buy = 0
    @foods = current_user.foods
    @foods.each do |food|
      recipe_food = RecipeFood.find_by(food:)
      next if recipe_food.nil?

      @items_to_buy += 1 if recipe_food.process_quantity(food).positive?
      @total_value += recipe_food.process_cost(food)
    end
  end

  # DELETE /foods/1 or /foods/1.json
  def destroy
    @food.destroy

    respond_to do |format|
      format.html { redirect_to foods_url, notice: 'Food was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_food
    @food = Food.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity, :user_id)
  end
end
