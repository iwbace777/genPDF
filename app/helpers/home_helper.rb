module HomeHelper
  def get_pdf_image_src(image_index)
    @pdf_images[image_index].image ? @pdf_images[image_index].image.image : 'grey-box.png'
  end

  def get_pdf_image_class(index)
    @pdf_images[index].image ? 'self-draggable' : ''
  end
end
