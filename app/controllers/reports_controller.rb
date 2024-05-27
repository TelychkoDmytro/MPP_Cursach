class ReportsController < ApplicationController
  before_action :set_hoby
  before_action :set_post
  before_action :set_post_report, only: [:show, :edit, :update, :destroy]

  def new
    @post_report = PostReport.new
  end

  def create
    @post_report = @post.post_reports.new(report_params)
    if @post_report.save
      redirect_to hoby_post_path(@hoby, @post), notice: 'Скарга на пост успішно відправлена.'
    else
      puts "Не вдалося!"
      render :new
    end
  end

  private

  def set_hoby
    @hoby = Hoby.find(params[:hoby_id])
  end

  def set_post
    @post = @hoby.posts.find(params[:post_id])
  end

  def set_post_report
    @post_report = PostReport.find(params[:id])
  end

  def report_params
    params.require(:post_report).permit(:reason, :user_id, :post_id, :reported_at, :status)
  end
end
