module Api
  class SearchController < ApiController
    def search
      if params[:query].present?
        @results = []
        @results << Vertical.search(params[:query])
        @results << Category.search(params[:query])
        @results << Course.search(params[:query])
        render json: @results.flatten
      else
        render json: { error: "No query provided" }, status: :unprocessable_entity
      end
    end
  end
end
