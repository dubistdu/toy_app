class MicropostsController < ApplicationController
  # GET /microposts
  def index
    @microposts = Micropost.all
  end

  # GET /microposts/1
  def show
    @micropost = Micropost.find(params[:id])
  end

  # GET /microposts/new
  def new
    @micropost = Micropost.new
  end

  # GET /microposts/1/edit
  def edit
    @micropost = Micropost.find(params[:id])
  end

  # POST /microposts
  def create
    @micropost = Micropost.new(micropost_params)

    if @micropost.save
      redirect_to @micropost, notice: 'Micropost was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /microposts/1
  def update
    @micropost = Micropost.find(params[:id])
    if @micropost.update(micropost_params)
      redirect_to @micropost, notice: 'Micropost was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /microposts/1
  def destroy
    @micropost = Micropost.find(params[:id])
    @micropost.destroy
    redirect_to microposts_url, notice: 'Micropost was successfully destroyed.'
  end

  private
    # Only allow a trusted parameter "white list" through.
    def micropost_params
      params.require(:micropost).permit(:content, :user_id)
    end
end
