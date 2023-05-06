class ContentsController < ApplicationController

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
      @content = Content.find(params[:id])
    end

    private

    def content_params
      params.require(:content).permit(:title, :description)
    end

    # def show
    # end

    # def update
    # end

    # def destroy
    # end
end
