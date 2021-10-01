class PagesController < ApplicationController
  # before_action :set_paciente, only: [:qr_code_download]
  def index
  end

  def qr_code_download
    @paciente = Paciente.new(set_paciente)
    if @paciente.save
      qr_string = @paciente.qr_string_generate
      created_at = @paciente.created_at.to_s
      filename = "#{created_at.to_s}-#{@paciente.nombre}-#{@paciente.apellido_paterno}.png"
      send_data(RQRCode::QRCode.new(qr_string).as_png(size: 300), type: 'image/png', disposition: 'attachment',filename: filename)
    else
      flash[:notice] = 'Hubo un error al generar el qr.'
      redirect_to root_path
    end
  end

  private
  def set_paciente
    params.permit(:nombre, :apellido_paterno, :apellido_materno, :ci, :observacion)
  end
end
