class Api::V1::ItensController < Api::V1::ApiController
	before_action :set_item, only: [:show, :update, :destroy]
	before_action :require_authorization_funcionario!, only: [:update, :destroy]

	# GET /api/v1/item
	def index
		cod = params[:cod].to_i

		if cod == 0
			pedido = Pedido.where(mesa: params[:mesa], status: "aberto")[0]
		  @itens = Item.where(pedido: pedido)
		elsif cod == 1
		  @itens = Item.where(pedido: item_params[:pedido])
		end
	 
	  render json: @itens
	end

	# GET /api/v1/item/1
	def show
		render json: @item
	end

	# POST /api/v1/item
	def create
		pedido = Pedido.find(item_params[:pedido])
		produto = Produto.find(item_params[:produto])
		@item = Item.new(item_params.merge(pedido: pedido, produto: produto))

		if @item.save
			render json: @item, status: :created
		else
			render json: @item.errors, status: :unprocessable_entity
		end
	end
 
	# PATCH/PUT /api/v1/item/1
	def update
		pedido = Pedido.find(item_params[:pedido])
		produto = Produto.find(item_params[:produto])

		if @item.update(item_params.merge(pedido: pedido, produto: produto))
			render json: @item
		else
			render json: @item.errors, status: :unprocessable_entity
		end
	end

	# DELETE /api/v1/item/1
	def destroy
		@item.destroy
	end

	private

		# Use callbacks to share common setup or constraints between actions.
		def set_item
			@item = Item.find(params[:id])
		end

		# Only allow a trusted parameter "white list" through.
		def item_params
			params.require(:item).permit(:produto, :quantidade, :pedido)
		end
end
