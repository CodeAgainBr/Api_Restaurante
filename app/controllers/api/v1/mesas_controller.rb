class Api::V1::MesasController < Api::V1::ApiController
	before_action :set_mesa, only: [:show, :update, :destroy]

	# GET /api/v1/mesa
	def index
	  @mesas = Mesa.all
	 
	  render json: @mesas
	end

	# GET /api/v1/mesa/1
	def show
		render json: @mesa
	end

	# POST /api/v1/mesa
	def create
		@mesa = Mesa.new(mesa_params)

		if @mesa.save
			render json: @mesa, status: :created
		else
			render json: @mesa.errors, status: :unprocessable_entity
		end
	end
 
	# PATCH/PUT /api/v1/mesa/1
	def update
		if @mesa.update(mesa_params)
			render json: @mesa
		else
			render json: @mesa.errors, status: :unprocessable_entity
		end
	end

	# DELETE /api/v1/mesa/1
	def destroy
		@mesa.destroy
	end

	private

		# Use callbacks to share common setup or constraints between actions.
		def set_mesa
			@mesa = Mesa.find(params[:id])
		end

		# Only allow a trusted parameter "white list" through.
		def mesa_params
			params.require(:mesa).permit(:numero, :status)
		end
end
