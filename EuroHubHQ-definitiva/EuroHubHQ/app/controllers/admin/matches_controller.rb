class Admin::MatchesController < AdminController
  before_action :set_admin_match, only: [:show, :edit, :update, :destroy]
  def index
    @admin_matches = Match.all
  end

  # GET /matches/1 or /matches/1.json
  def show
  end

 # GET /matches/new
 def new
  @admin_match = Match.new
 end

 # GET /matches/1/edit
 def edit
  @admin_match = Match.find(params[:id])
 end

# POST /matches or /matches.json
  def create
    @admin_match = Match.new(admin_match_params)

  respond_to do |format|
    if @admin_match.save
      format.html { redirect_to admin_matches_path, notice: "Match was successfully created." }
      format.json { render :show, status: :created, location: @admin_match }
    else
      format.html { render :new, status: :unprocessable_entity }
      format.json { render json: @admin_match.errors, status: :unprocessable_entity }
    end
  end
end

# PATCH/PUT /matches/1 or /matches/1.json
def update
  respond_to do |format|
    @admin_match = Match.find(params[:id])
    if @admin_match.update(admin_match_params)
      format.html { redirect_to admin_matches_path, notice: "Match was successfully updated." }
      format.json { render :show, status: :ok, location: @admin_match }
    else
      render :edit
    end
  end
end

# DELETE /matches/1 or /matches/1.json
def destroy
  @admin_match.destroy!

  respond_to do |format|
    format.html { redirect_to admin_matches_path, notice: "Match was successfully destroyed." }
    format.json { head :no_content }
  end
end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_admin_match
    @admin_match = Match.find(params[:id])
    rescue ActiveRecord::RecordNotFound
    redirect_to admin_matches_path, alert: "Match not found."
  end

  # Only allow a list of trusted parameters through.
  def admin_match_params
    params.require(:match).permit(:team1, :team2, :score1, :score2, :marker1, :marker2, :details, :caution1, :caution2,:homeflag,:awayflag)
  end
end