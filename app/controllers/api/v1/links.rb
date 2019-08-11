module API
  module V1
    class Links < Grape::API
      include API::V1::Defaults

      resource :links do
        desc "Return all links for an ASIN"
        params do
          requires :asin, type: String, desc: "ASIN of the product"
        end
        get ":asin", root: "links" do
          Link.where(asin: permitted_params[:asin]).all
        end
      end
    end
  end
end
