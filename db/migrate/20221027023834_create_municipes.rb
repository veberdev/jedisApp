class CreateMunicipes < ActiveRecord::Migration[7.0]
  def change
    create_table :municipes do |t|
      t.integer :status, default: 1, null: false
      t.string :primeiro_nome, null: false
      t.string :sobrenome, null: false
      t.string :cpf, null: false
      t.string :cns, null: false
      t.string :email, null: false
      t.date :data_nascimento, null: false
      t.string :telefone, null: false
      t.timestamps
    end
  end
end
