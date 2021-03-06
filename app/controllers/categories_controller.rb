class CategoriesController < ApplicationController
before_filter :signed_in_user
  before_filter :set_parent_category, :only => [:edit, :new, :create]
  helper_method :sort_column, :sort_direction

  def index
	@categories = Category.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 15, :page => params[:page])
    @parent_name = Category.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @categories }
    end
  end
  
  def list_kendaraan
    @categories = Category.find_all_by_kelompok_asset("Kendaraan")
	  @parent_name = Category.all
<<<<<<< HEAD
  end

  def list_peralatan
    @categories = Category.find_all_by_kelompok_asset("Peralatan")
  @parent_name = Category.all
=======
>>>>>>> a5479d4f1f12e0bb8d71c93cb898c834b242b26d
  end
  
  def list_bangunan
    @categories = Category.find_all_by_kelompok_asset("Bangunan")
	@parent_name = Category.all
  end
  
  def list_tanah
    @categories = Category.find_all_by_kelompok_asset("Tanah")
	@parent_name = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @parent_kelompok = Category.find_all_by_parent_id(params[:kode])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @category }
    end
  end

  def new
    @category = Category.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @category }
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def create
    @category = Category.new(params[:category])
    @category.parent_id=nil if @category.parent_id.empty?
    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: 'Kelompok was successfully created.' }
        format.json { render json: @category, status: :created, location: @category }
      else
        format.html { render action: "new" }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @category = Category.find(params[:id])

    respond_to do |format|
      if @category.update_attributes(params[:category])
        format.html { redirect_to @category, notice: 'Kelompok was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    respond_to do |format|
      format.html { redirect_to categories_url }
      format.json { head :no_content }
    end
  end
  
  private

  def set_parent_category
     @parent_kelompok = Category.where(["parent_id IS NULL"]).map{|x| [x.keterangan, x.kode]}
  end

   def sort_column
     Branch.column_names.include?(params[:sort]) ? params[:sort] : "kode"
   end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
    end
end
