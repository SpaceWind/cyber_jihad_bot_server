class UserXHerosController < ApplicationController
  before_action :set_user_x_hero, only: [:show, :edit, :update, :destroy]

  # GET /user_x_heros
  # GET /user_x_heros.json
  def index
    @user_x_heros = UserXHero.all
  end

  # GET /user_x_heros/1
  # GET /user_x_heros/1.json
  def show
  end

  # GET /user_x_heros/new
  def new
    @user_x_hero = UserXHero.new
  end

  # GET /user_x_heros/1/edit
  def edit
  end

  # POST /user_x_heros
  # POST /user_x_heros.json
  def create
    @user_x_hero = UserXHero.new(user_x_hero_params)

    respond_to do |format|
      if @user_x_hero.save
        format.html { redirect_to @user_x_hero, notice: 'User x hero was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user_x_hero }
      else
        format.html { render action: 'new' }
        format.json { render json: @user_x_hero.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_x_heros/1
  # PATCH/PUT /user_x_heros/1.json
  def update
    respond_to do |format|
      if @user_x_hero.update(user_x_hero_params)
        format.html { redirect_to @user_x_hero, notice: 'User x hero was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user_x_hero.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_x_heros/1
  # DELETE /user_x_heros/1.json
  def destroy
    @user_x_hero.destroy
    respond_to do |format|
      format.html { redirect_to user_x_heros_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_x_hero
      @user_x_hero = UserXHero.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_x_hero_params
      params.require(:user_x_hero).permit(:login, :heroid)
    end
end
