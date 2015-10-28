class Admin::CoreLogicLocationsController < Admin::BaseController
  before_action :load_core_logic_location, only: [:edit, :update, :destroy]

  def index
    @core_logic_locations = CoreLogicLocation.page(params[:page]).per(50).order(id: :desc)
  end

  def new
    @core_logic_location = CoreLogicLocation.new
  end

  def create
    @core_logic_location = CoreLogicLocation.new(core_logic_location_params)

    if @core_logic_location.save
      redirect_to admin_core_logic_locations_url, notice: "Created location: #{@core_logic_location.zip_code} #{@core_logic_location.date}"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @core_logic_location.update(core_logic_location_params)
      redirect_to admin_core_logic_locations_url, notice: "Updated location: #{@core_logic_location.zip_code} #{@core_logic_location.date}"
    else
      render :edit
    end
  end

  def destroy
    @core_logic_location.destroy
    redirect_to admin_core_logic_locations_url, notice: "Deleted location: #{@core_logic_location.zip_code} #{@core_logic_location.date}"
  end

  def import
    file = params[:csv][:file]
    Importers::CoreLogicLocationCSVImporter.new(file.path).import
    redirect_to admin_core_logic_locations_url, notice: 'CoreLogic locations import successful!'
  end

  protected

  def load_core_logic_location
    @core_logic_location = CoreLogicLocation.find(params[:id])
  end

  def core_logic_location_params
    params.require(:core_logic_location).permit!
  end
end
