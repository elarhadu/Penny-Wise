class GroupsController < ApplicationController
  before_action :set_group, only: %i[edit update destroy]
  before_action :set_user, only: %i[index edit create update destroy]

  # GET /groups or /groups.json
  def index
    @groups = Group.all
  end

  # GET /groups/new
  def new
    @group = Group.new
  end

  # GET /groups/1/edit
  def edit; end

  def show
    @group = Group.find(params[:id])
    @groups = current_user.groups
  end

  # POST /groups or /groups.json
  def create
    @group = Group.new(group_params)

    if @group.save
      redirect_to groups_path, notice: 'Group was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /groups/1 or /groups/1.json
  def update
    if @group.update(group_params)
      redirect_to groups_url, notice: 'Group was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /groups/1 or /groups/1.json
  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_path, notice: 'Group was successfully destroyed.' }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @author = current_user
  end

  def set_group
    @group = set_user.groups.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def group_params
    params.require(:group).permit(:name, :icon, :user_id)
  end
end
