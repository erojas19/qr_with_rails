class CreatePacientes < ActiveRecord::Migration[6.0]
  def change
    create_table :pacientes do |t|
      t.string :nombre
      t.string :apellido_paterno
      t.string :apellido_materno
      t.string :ci
      t.string :observacion
      t.string :uuid_secure
      t.timestamps
    end
  end
end
