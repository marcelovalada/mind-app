class ContentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_content, only: [:edit, :update, :show, :destroy]

    def index
      @contents = current_user.contents
    end

    def new
      @content = Content.new
    end

    def create
      # @content = Content.new(content_params)
      # @content.user = current_user
      @content = current_user.contents.build(content_params)

      if @content.save
        redirect_to contents_path, notice: 'Content successfully created'
      else
        render :new
      end
    end

    def edit
      # @content = Content.find(params[:id])
    end

    def update
      # @content = Content.find(params[:id])

      if @content.update(content_params)
        redirect_to contents_path, notice: 'Content successfully updated'
      else
        render :edit
      end
    end

    def show
      # @content = Content.find(params[:id])
    end

    def destroy
      # @content = Content.find(params[:id])
      @content.destroy
      redirect_to contents_path, notice: 'Content successfully destroyed'
    end

    private

    def set_content
      @content = Content.find(params[:id])
    end

    def content_params
      params.require(:content).permit(:title, :description)
    end
end
