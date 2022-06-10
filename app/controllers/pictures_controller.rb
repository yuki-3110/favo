class PicturesController < ApplicationController
  before_action :set_picture, only: %i(show edit update destroy)
  before_action :ensure_correct_user, only: %i(edit destroy)

  def index
    @pictures = Picture.all
  end

  def show
  end

  def new
    @picture = Picture.new
  end

  def edit
  end

  def create
    @picture = current_user.pictures.build(picture_params)
    render :new and return if params[:back]
    if @picture.save
      redirect_to pictures_path, notice: "ブログを作成しました！"
    else
      render :new
    end
  end
  
  def confirm
    @picture = current_user.pictures.build(picture_params)
    render :new if @picture.invalid?
  end

  # PATCH/PUT /pictures/1 or /pictures/1.json
  def update
    respond_to do |format|
      if @picture.update(picture_params)
        format.html { redirect_to picture_url(@picture), notice: "ブログを編集しました。" }
        format.json { render :show, status: :ok, location: @picture }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pictures/1 or /pictures/1.json
  def destroy
    @picture.destroy
    respond_to do |format|
      format.html { redirect_to pictures_url, notice: "投稿を削除しました" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_picture
      @picture = Picture.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def picture_params
      params.require(:picture).permit(:title, :content, :image, :user_id)
    end

    def ensure_correct_user
      @picture = Picture.find(params[:id])
      unless @picture.user == current_user
        redirect_to pictures_path
      end
    end
end
