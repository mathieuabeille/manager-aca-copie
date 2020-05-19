class MaterialsFilter
  attr_reader :params

  def initialize(params)
    @params = params
    @materials = Material.all
  end


  def filter
    filter_by_name
    @materials
  end

  def filter_by_name
    if params[:name].present?
      @materials = @materials.where("name ilike ?", "%#{params[:name]}%")
    end
  end
end
