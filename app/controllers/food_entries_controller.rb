class FoodEntriesController < ApplicationController
  before_action :set_food_entry, only: [:show, :edit, :update, :destroy]

  # GET /food_entries
  # GET /food_entries.json
  def index
    @food_entries = FoodEntry.all
  end

  # GET /food_entries/1
  # GET /food_entries/1.json
  def show
  end

  # GET /food_entries/new
  def new
    @food_entry = FoodEntry.new
  end

  # GET /food_entries/1/edit
  def edit
  end

  # POST /food_entries
  # POST /food_entries.json
  def create
    @food_entry = FoodEntry.new(food_entry_params)

    respond_to do |format|
      if @food_entry.save
        format.html { redirect_to @food_entry, notice: 'Food entry was successfully created.' }
        format.json { render :show, status: :created, location: @food_entry }
      else
        format.html { render :new }
        format.json { render json: @food_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /food_entries/1
  # PATCH/PUT /food_entries/1.json
  def update
    respond_to do |format|
      if @food_entry.update(food_entry_params)
        format.html { redirect_to @food_entry, notice: 'Food entry was successfully updated.' }
        format.json { render :show, status: :ok, location: @food_entry }
      else
        format.html { render :edit }
        format.json { render json: @food_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /food_entries/1
  # DELETE /food_entries/1.json
  def destroy
    @food_entry.destroy
    respond_to do |format|
      format.html { redirect_to food_entries_url, notice: 'Food entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_food_entry
      @food_entry = FoodEntry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def food_entry_params
      params.require(:food_entry).permit(:name, :serve_size)
    end
end
