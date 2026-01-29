class DiariesController < ApplicationController
  before_action :set_diary, only: [:edit, :update, :destroy]

  def index
    @diaries = current_user.diaries.order(entry_date: :desc).page(params[:page]).per(10)
  end

  def new
    @diary = current_user.diaries.build
  end

  def create
    @diary = current_user.diaries.build(diary_params)
    if @diary.save
      redirect_to diaries_path, notice: t('defaults.flash_message.created', item: Diary.model_name.human)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @diary.update(diary_params)
      redirect_to diaries_path, notice: t('defaults.flash_message.updated', item: Diary.model_name.human)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @diary.destroy
    redirect_to diaries_path, notice: t('defaults.flash_message.deleted', item: Diary.model_name.human), status: :see_other
  end

  private

  def set_diary
    @diary = current_user.diaries.find(params[:id])
  end

  def diary_params
    params.require(:diary).permit(:entry_date, :good_1, :good_2, :good_3, :memo, :music_title, :artist_name)
  end
end