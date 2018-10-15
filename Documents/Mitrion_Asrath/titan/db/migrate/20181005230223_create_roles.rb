class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :nombre
      t.references :usuario

      t.timestamps
    end
    execute <<-SQL
        ALTER TABLE roles
            ADD CONSTRAINT fk_roles_usuarios
            FOREIGN KEY (usuario_id)
            REFERENCES usuarios(id)
    SQL
  end
end
