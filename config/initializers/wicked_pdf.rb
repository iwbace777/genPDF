# WickedPdf.config = {
#   #:wkhtmltopdf => '/usr/local/bin/wkhtmltopdf',
#   #:layout => "pdf.html",
#   # :exe_path => '/usr/local/bin/wkhtmltopdf'
# }

# WickedPdf.config = {
#     :wkhtmltopdf => Rails.root.join('bin', 'wkhtmltopdf-amd64').to_s,
#     :exe_path => Rails.root.join('bin', 'wkhtmltopdf-amd64').to_s
# }

if Rails.env.production?
  wkhtmltopdf_path = "#{Rails.root}/bin/wkhtmltopdf-amd64"
  WickedPdf.config = { exe_path: wkhtmltopdf_path, wkhtmltopdf_path: wkhtmltopdf_path}
else
  # Linux (check your processor for Intel x86 or AMD x64)
  # wkhtmltopdf_path = "#{Rails.root}/bin/wkhtmltopdf-amd64"
  # wkhtmltopdf_path = "#{Rails.root}/bin/wkhtmltopdf-i386"
  # OS X
  wkhtmltopdf_path = "#{Rails.root}/bin/wkhtmltopdf-amd64"
  # Windows
  # wkhtmltopdf_path = 'C:\Program Files/wkhtmltopdf/wkhtmltopdf.exe'
  WickedPdf.config = { exe_path: wkhtmltopdf_path, wkhtmltopdf_path: wkhtmltopdf_path}
end


