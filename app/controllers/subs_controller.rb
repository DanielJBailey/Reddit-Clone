class SubsController < ApplicationController
  # # Both do the same thing
  before_action :set_sub, except: [:index, :new, :create]
  # # before_action :set_sub, only: [:show, :edit, :update, :destroy]
  # skip_before_action :verify_paid, only: :index
  # after_action :more_cowbell

  def index
    @subs = Sub.all
  end

  def show
  end

  def new
    @sub = Sub.new
    render partial: "form"
  end

  def create
    @sub = Sub.new(sub_params)
    if @sub.save
      redirect_to subs_path
    else
      render :new
    end
  end

  def edit
    render partial: "form"
  end

  def update
    if @sub.update
      redirect_to subs_path
    else
      render :edit
    end
  end

  def destroy
    @sub.destroy
  end

  private

    def more_cowbell
      puts "DING DING DING!"
    end

    def set_sub
      @sub = Sub.find(params[:id])
    end

    def sub_params
      params.require(:sub).permit(:name)
    end
end
