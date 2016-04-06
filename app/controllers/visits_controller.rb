class VisitsController < ApplicationController
  before_action :set_visit, only: [:show, :edit, :update, :destroy]

  # GET /visits
  # GET /visits.json
  def index
    @visits = Visit.all
  end

  # GET /visits/1
  # GET /visits/1.json
  def show
  end

  # GET /visits/new
  def new
    @visit = Visit.new
  end

  # GET /visits/1/edit
  def edit
  end

  # POST /visits
  # POST /visits.json
  def create
    @visit = Visit.new(visit_params)

    respond_to do |format|
      if @visit.save
        format.html do
          redirect_to @visit,
                      notice: 'Visit was successfully created.'
        end
        format.json { render :show, status: :created, location: @visit }
      else
        format.html { render :new }
        format.json do
          render json: @visit.errors,
                 status: :unprocessable_entity
        end
      end
    end
  end

  # PATCH/PUT /visits/1
  # PATCH/PUT /visits/1.json
  def update
    respond_to do |format|
      if @visit.update(visit_params)
        format.html do
          redirect_to @visit, notice:
                     'Visit was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @visit }
      else
        format.html { render :edit }
        format.json do
          render json: @visit.errors,
                 status: :unprocessable_entity
        end
      end
    end
  end

  # DELETE /visits/1
  # DELETE /visits/1.json
  def destroy
    @visit.destroy
    respond_to do |format|
      format.html do
        redirect_to visits_url,
                    notice: 'Visit was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_visit
    @visit = Visit.find(params[:id])
  end

  def visit_params
    params.require(:visit).permit(:link_id, :ip,
                                  :browser, :browser_version, :os)
  end
end
