class ChildrenController < ApplicationController
  before_action :set_child, only: [ :show, :edit, :update, :destroy ]

  def index
    @children = current_user.children
  end

  def show
    @words = @child.words.order(created_at: :desc)
  end

  def new
    @child = current_user.children.new
  end

  def create
    @child = current_user.children.new(child_params)
    if @child.save
      redirect_to @child, notice: "#{@child.first_name} a été ajouté(e)."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @child.update(child_params)
      redirect_to @child, notice: "Profil mis à jour."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @child.destroy
    redirect_to children_path, notice: "#{@child.first_name} a été supprimé(e)."
  end

  private

  def set_child
    @child = current_user.children.find(params[:id])
  end

  def child_params
    params.require(:child).permit(:first_name, :birthdate)
  end
end
