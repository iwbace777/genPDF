class HomeController < ApplicationController
  before_action :get_colors
  def index
    @setting = Setting.find(1)
    @images = Image.all
  end

  def download_pdf
    _pdf
  end

  def _pdf
    @setting = Setting.find(1)
    @pdf_images = PdfImage.all
    @images = Image.all
    begin
      respond_to do |format|
        format.html
          @format = 'html'
        format.pdf do
          @format = 'pdf'
          @pdf = render_to_string :pdf => "mashpy.pdf",
                                  :template => 'home/_pdf.html.erb',
                                  :layout => 'pdf.html.erb', :encoding => "UTF-8",
                                  :no_background =>                  false,
                                  :margin =>  {   :top =>               0,                     # default 10 (mm)
                                                  :bottom   =>         0,
                                                  :left =>              0,
                                                  :right =>             0 }
          send_data(@pdf, :filename => "mashpy.pdf",  :type=>"application/pdf")
        end
      end
    rescue => exception
      @exception = exception
    end
  end
  def openPdf
    @setting = Setting.find(1)
    @pdf_images = PdfImage.all
    begin
      respond_to do |format|
        format.html
        format.pdf do
          render  :pdf => "mashpy.pdf",
                  :template => 'home/_pdf.html.erb',
                  :layout => 'pdf.html.erb', :encoding => "UTF-8",
                  :no_background =>                  false,
                  :margin =>  {   :top =>               0,                     # default 10 (mm)
                                  :bottom   =>         0,
                                  :left =>              0,
                                  :right =>             0 },
                  :show_as_html => params[:debug].present?
        end
      end
    rescue => exception
      @exception = exception
    end
  end

  # load pdf html content
  def load_pdf_html
    @format = 'html'

    @setting = Setting.find(1)
    @pdf_images= PdfImage.all

    respond_to do |format|
      format.html { render :partial => 'home/pdf' }
    end
  end

  #save pdf setting
  def store_pdf_setting

    @setting = Setting.find(1)
    @setting.background_color = params[:background_color]

    params[:image_ids].each_with_index { |image_id, index|
      @pdf_image = PdfImage.find(index + 1)
      if !@pdf_image.blank?
        @pdf_image.image_id = image_id
        @pdf_image.save
      else PdfImage.create(:image_id => (index + 1), :id => index)
      end
    }
    respond_to do |format|
      if @setting.save
        format.js {}
        format.json { render :json => 'success' }
      else
        format.html { render action: 'index' }
        format.json { render json: 'failed', status: :unprocessable_entity }
      end
    end
  end

  private

  def get_colors
    @google_colors = [
        ['green', '#7bd148'],
        ['bold_blue', '#5484ed'],
        ['blue', '#a4bdfc'],
        ['turquoise',   '#46d6db'],
        ['light_green', '#7ae7bf'],
        ['bold_green',  '#51b749'],
        ['yellow',      '#fbd75b'],
        ['orange',      '#ffb878'],
        ['red',         '#ff887c'],
        ['bold_red',    '#dc2127'],
        ['purple',      '#dbadff'],
        ['gray',        '#e1e1e1']
    ]
  end
end
