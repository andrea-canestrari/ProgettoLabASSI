class ShopController < ApplicationController
    def index
        @main_categories = Category.take(4)
      end
end