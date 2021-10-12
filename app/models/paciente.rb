class Paciente < ApplicationRecord
  before_create :set_uuid_secure
  after_create :set_qr_string

  def qr_string_generate
    res = "Centro de Salud RedVital medico autorizado Luis Gabriel Callisaya Huaynoca Cel. 60170619 Nro "+ self.uuid_secure.to_s+"-#{self.current_user_id.to_s.rjust(8, "0")}" + " " + self.nombre.to_s + " " + self.apellido_paterno.to_s + " " + self.apellido_materno.to_s + " " + self.ci.to_s + " Apto para conducir vehiculo terreste lugar viacha la paz fecha " + self.created_at.strftime("%d/%m/%Y")+ " Autorizado por SEGIP"
    res.upcase
  end

  private
  
  def set_qr_string
    self.qr_string = self.qr_string_generate
    self.save
  end

  def set_uuid_secure
    valor = Paciente.all.order(current_user_id: :desc).first.current_user_id.to_i rescue 0
    valor = valor + 1
    self.uuid_secure = SecureRandom.hex(10)
    self.current_user_id = valor
  end
end
