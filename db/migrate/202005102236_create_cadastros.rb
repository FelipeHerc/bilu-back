class CreateCadastros < ActiveRecord::Migration[5.2]
  def change
    create_table :cadastros do |t|
      t.string :nome
      t.integer :idade
      t.string :endereco
      t.string :cpf
      t.boolean :armas
      t.boolean :dirige
      t.string :tipo_sanguineo
      t.boolean :contato_com_ets
      t.boolean :aprovado

      t.timestamps
    end
  end
end