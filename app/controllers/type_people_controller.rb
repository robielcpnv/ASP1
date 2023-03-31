class TypePeopleController < ApplicationController
  before_action :set_type_person, only: %i[ show edit update destroy ]

  # GET /type_people or /type_people.json
  def index
    @type_people = TypePerson.all
  end

  # GET /type_people/1 or /type_people/1.json
  def show
  end

  # GET /type_people/new
  def new
    @type_person = TypePerson.new
  end

  # GET /type_people/1/edit
  def edit
  end

  # POST /type_people or /type_people.json
  def create
    @type_person = TypePerson.new(type_person_params)

    respond_to do |format|
      if @type_person.save
        format.html { redirect_to type_person_url(@type_person), notice: "Type person was successfully created." }
        format.json { render :show, status: :created, location: @type_person }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @type_person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /type_people/1 or /type_people/1.json
  def update
    respond_to do |format|
      if @type_person.update(type_person_params)
        format.html { redirect_to type_person_url(@type_person), notice: "Type person was successfully updated." }
        format.json { render :show, status: :ok, location: @type_person }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @type_person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /type_people/1 or /type_people/1.json
  def destroy
    @type_person.destroy

    respond_to do |format|
      format.html { redirect_to type_people_url, notice: "Type person was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_type_person
      @type_person = TypePerson.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def type_person_params
      params.require(:type_person).permit(:name, :slug, :description)
    end
end
