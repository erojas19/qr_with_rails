class CreatePacientes < ActiveRecord::Migration[6.0]
  def change
    create_table :pacientes do |t|
      t.string :nombre
      t.string :apellido_paterno
      t.string :apellido_materno
      t.string :ci
      t.string :observacion
      t.string :uuid_secure
      t.text :qr_string
      t.integer :current_user_id, default: 0
      t.timestamps
    end
  end
end
