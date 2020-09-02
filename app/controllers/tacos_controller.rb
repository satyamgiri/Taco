class TacosController < ApplicationController
  protect_from_forgery with: :null_session
  def index
    @tacos = Taco.all
    render status: :ok, json: @tacos
  end

  def create
    @taco = Taco.new(taco_params)
    if @taco.save
      render status: :ok, json: @taco
    else
      render status: :unprocessable_entity, json: { message: @taco.errors.full_messages }
    end
  end

  def destroy
    @taco = Taco.find_by(id: params[:id])
    if @taco.present?
      @taco.destroy
      render status: :ok, json: { message: 'Taco removed successfully', tacos: Taco.all }
    else
      render status: :unprocessable_entity, json: { message: 'Taco not found' }
    end
  end

  private

  def taco_params
    params.require(:taco).permit(:meat, :rice, :salsa, :guacamole, :notes)
  end
end
