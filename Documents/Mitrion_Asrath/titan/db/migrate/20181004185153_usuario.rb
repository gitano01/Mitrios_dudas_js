class Usuario < ActiveRecord::Migration
  def self.up
    create_table :usuarios do |t|
      t.string :usrname, :null => false
      t.string :email,  :null => false
      t.string :password,
      t.string :password_confirmation
      t.timestamps
    end
  end
  def self.down
    drop_table :usuarios
  end
end
