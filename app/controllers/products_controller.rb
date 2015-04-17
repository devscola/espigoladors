class ProductsController

	def index
	end

	def show
	end

	def new
		@chance = Chance.find(params[:id])
		@product = Product.new
	end
end