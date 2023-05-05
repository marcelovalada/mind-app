class ContentsController < ApplicationController

    def index
      @contents = current_user.contents
    end

    # def show
    # end

    # def create
    # end

    # def update
    # end

    # def edit
    # end

    # def destroy
    # end
end
