class Api::V1::PedidosController < Api::V1::ApiController
	before_action :set_pedido, only: [:show, :update, :destroy]

	# GET /api/v1/pedido
	def index
		if params[:cod] == 0
			@pedidos = Pedido.where(status: "aberto")
		elsif params[:cod] == 1
			mesa = Mesa.find(:id)
			@pedidos = Pedido.where(mesa: mesa).order(status: "aberto")
		end

	  if @pedidos.nil?
	  	render json: {}, status: :forbidden
	  else
	  	render json: @pedidos
	  end
	end

	# GET /api/v1/pedido/1
	def show
		render json: @pedido
	end

	# POST /api/v1/pedido
	def create
		@pedido = Pedido.new(pedido_params.merge(user: current_user))

		if @pedido.save
			render json: @pedido, status: :created
		else
			render json: @pedido.errors, status: :unprocessable_entity
		end
	end
 
	# PATCH/PUT /api/v1/pedido/1
	def update
		if @pedido.update(pedido_params)
			render json: @pedido
		else
			render json: @pedido.errors, status: :unprocessable_entity
		end
	end

	# DELETE /api/v1/pedido/1
	def destroy
		@pedido.destroy
	end

	private

		# Use callbacks to share common setup or constraints between actions.
		def set_pedido
			@pedido = Pedido.find(params[:id])
		end

		# Only allow a trusted parameter "white list" through.
		def pedido_params
			params.require(:pedido).permit(:quantidade, :status, :produto, :mesa)
		end
end
