module Api 
 class SearchController < ApiController
    def search
      if params[:query].present?
        @results = Elasticsearch::Model.search(params[:query], [Vertical, Category, Course]).records
        render json: @results
      else
        render json: { error: "No query provided" }, status: :unprocessable_entity
      end
    end
  end
end