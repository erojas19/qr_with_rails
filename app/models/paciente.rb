class Paciente < ApplicationRecord
  after_create :set_uuid_secure
  def qr_string_generate
    res = "RedVital Medico Gabriel "+ self.uuid_secure.to_s + " " + self.nombre.to_s + " " + self.apellido_paterno.to_s + " " + self.apellido_materno.to_s + " " + self.ci.to_s + " " + self.observacion.to_s
    res
  end

  private
  def set_uuid_secure
    self.uuid_secure = SecureRandom.uuid
  end
end
