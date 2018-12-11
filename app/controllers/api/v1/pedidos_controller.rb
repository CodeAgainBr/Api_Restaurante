class Api::V1::PedidosController < Api::V1::ApiController
	before_action :set_pedido, only: [:show, :update, :destroy]
	before_action :require_authorization_funcionario!, only: [:update, :destroy]

	# GET /api/v1/pedido
	def index
		if params[:cod].to_i == 1 									#admin
			@pedidos = Pedido.where(status: "aberto")
		elsif params[:cod].to_i == 0								#user
			mesa = Mesa.find(params[:mesa])
			@pedidos = Pedido.where(mesa: mesa).order(:status)
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
		mesa = Mesa.find(pedido_params[:mesa])
		@pedido = Pedido.new(pedido_params.merge(mesa: mesa))

		if @pedido.save
			render json: @pedido, status: :created
		else
			render json: @pedido.errors, status: :unprocessable_entity
		end
	end
 
	# PATCH/PUT /api/v1/pedido/1
	def update
		mesa = Mesa.find(pedido_params[:mesa])
		if @pedido.update(pedido_params.merge(mesa: mesa))
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
			params.require(:pedido).permit(:status, :mesa)
		end
end
