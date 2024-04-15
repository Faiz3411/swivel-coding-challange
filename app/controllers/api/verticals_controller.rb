module Api
  class VerticalsController < ApiController
    before_action :set_vertical, only: [:show, :update, :destroy]

    # GET /api/verticals
    def index
      @verticals = Vertical.includes(categories: :courses).all
      render json: @verticals.as_json(include: { categories: { include: :courses } })
    end

    # GET /api/verticals/1
    def show
      render json: @vertical.as_json(include: { categories: { include: :courses } })
    end

    # POST /api/verticals
    def create
      @vertical = Vertical.new(vertical_params)
      if @vertical.save
        render json: @vertical, status: :created, location: api_vertical_url(@vertical)
      else
        render json: @vertical.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /api/verticals/1
    def update
      if @vertical.update(vertical_params)
        render json: @vertical
      else
        render json: @vertical.errors, status: :unprocessable_entity
      end
    end

    # DELETE /api/verticals/1
    def destroy
      if @vertical.destroy
        render json: { Success: "Vertical had been deleted successfully" }
      else
        render json: @vertical.errors, status: :unprocessable_entity
      end
    end

    private
    def set_vertical
      @vertical = Vertical.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { error: "Vertical not found" }, status: :not_found
    end

    def vertical_params
      params.require(:vertical).permit(:name, categories_attributes: [:id, :name, :state, :_destroy, courses_attributes: [:id, :name, :author, :state, :_destroy]])
    end
  end
end
