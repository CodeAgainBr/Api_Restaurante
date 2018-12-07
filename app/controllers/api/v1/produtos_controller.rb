class Api::V1::ProdutosController < Api::V1::ApiController
	before_action :set_produto, only: [:show, :update, :destroy]

	# GET /api/v1/produto
	def index
	  @produtos = Produto.all
	 
	  render json: @produtos
	end

	# GET /api/v1/produto/1
	def show
		render json: @produto
	end

	# POST /api/v1/produto
	def create
		@produto = Produto.new(produto_params)

		if @produto.save
			render json: @produto, status: :created
		else
			render json: @produto.errors, status: :unprocessable_entity
		end
	end
 
	# PATCH/PUT /api/v1/produto/1
	def update
		if @produto.update(produto_params)
			render json: @produto
		else
			render json: @produto.errors, status: :unprocessable_entity
		end
	end

	# DELETE /api/v1/produto/1
	def destroy
		@produto.destroy
	end

	private

		# Use callbacks to share common setup or constraints between actions.
		def set_produto
			@Produto = Produto.find(params[:id])
		end

		# Only allow a trusted parameter "white list" through.
		def produto_params
			params.require(:produto).permit(:nome, :valor)
		end
end
