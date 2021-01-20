# frozen_string_literal: true

module Website
  class PriceTipsController < WebsiteController
    before_action :load_spaces, only: %i[index show]

    def create
      items = "#{params[:type]}-#{params[:hours]}-#{params[:reach]}"

      redirect_to website_price_tip_path(Base64.encode64(items))
    end

    def destroy
      items = Base64.decode64(params[:id]).split(';')
      items.delete_at(params[:index].to_i)
      items = items.join(';')

      if items.empty?
        redirect_to website_price_tips_path
      else
        redirect_to website_price_tip_path(Base64.encode64(items))
      end
    end

    def index; end

    def show
      items = Base64.decode64(params[:id]).split(';')

      @items = items.map do |item|
        space_type, hours, reach = item.split('-')
        {
          type: space_type,
          hours: hours,
          reach: reach,
          price: PricingService.suggested_price_tip_in_dollars(reach, hours, space_type)
        }
      end
    end

    def update
      items = Base64.decode64(params[:id]).split(';')
      items << "#{params[:type]}-#{params[:hours]}-#{params[:reach]}"
      items = items.join(';')

      redirect_to website_price_tip_path(Base64.encode64(items))
    end

    private

    def load_spaces
      @spaces = PricingService.available_spaces
    end
  end
end
