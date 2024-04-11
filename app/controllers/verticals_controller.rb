class VerticalsController < ApplicationController
  before_action :set_vertical, only: [:show, :update, :destroy]

  # GET /verticals
  def index
    debugger
    @verticals = Vertical.includes(categories: :courses).all
    render json: @verticals.as_json(include: { categories: { include: :courses } })
  end

  # GET /verticals/1
  def show
    render json: @vertical.as_json(include: { categories: { include: :courses } })
  end

  # POST /verticals
  def create
    @vertical = Vertical.new(vertical_params)
    if @vertical.save
      render json: @vertical, status: :created, location: @vertical
    else
      render json: @vertical.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /verticals/1
  def update
    if @vertical.update(vertical_params)
      render json: @vertical
    else
      render json: @vertical.errors, status: :unprocessable_entity
    end
  end

  # DELETE /verticals/1
  def destroy
    @vertical.destroy
  end

  private
  # Use callbacks to share common setup or constraints between actions
  def set_vertical
    @vertical = Vertical.find(params[:id])
  end

  # Only allow a list of trusted parameters through
  def vertical_params
    params.require(:vertical).permit(:name, categories_attributes: [:id, :name, :state, :_destroy, courses_attributes: [:id, :name, :author, :state, :_destroy]])
  end

end