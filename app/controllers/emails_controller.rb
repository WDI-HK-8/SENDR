class EmailsController < ApplicationController
  def index
    @emails = Email.all
  end

  def create
    @email = Email.new(post_params)

    if @email.save
      # render success in Jbuilder
    else
      render json: { message: "400 Bad Request" }, status: :bad_request
    end
  end

  def update
    @email = Email.find_by_id(params[:id])

    if @email.nil?
      render json: { message: "Cannot find email" }, status: :not_found
    else
      @email.update(post_params)
    end
  end

  def show
    @email = Email.find_by_id(params[:id])

    if @email.nil?
      render json: { message: "Cannot find email" }, status: :not_found
    end
  end

  def destroy
    @email = Email.find_by_id(params[:id])

    if @email.nil?
      render json: { message: "Cannot find email" }, status: :not_found
    else
      if @email.destroy
        render json: { message: "Successfully deleted" }, status: :no_content
      else
        render json: { message: "Unsuccessfully deleted" }, status: :bad_request
      end
    end
  end

  private

  def post_params
    params.require(:email).permit(:title, :from, :to, :schedule, :content, :is_sent, :visible)
  end
end
