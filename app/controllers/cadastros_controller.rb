# frozen_string_literal: true

class CadastrosController < ApplicationController
  def create
    return render json: { mensagem: "Erro: Existem campos não preenchidos" }, status: :ok if params[:nome].blank? || params[:idade].blank? || params[:endereco].blank? || params[:cpf].blank? || params[:tipo_sanguineo].blank?
    
    potencial = 0

    potencial = potencial + 1 if params[:dirige]
    potencial = potencial + 1 if params[:armas]
    potencial = potencial + 1 if params[:contato_com_ets]

    aprovado = potencial >= 2

    Cadastros.create!(
      nome: params[:nome],
      idade: params[:idade],
      endereco: params[:endereco],
      cpf: params[:cpf],
      armas: params[:armas],
      dirige: params[:dirige],
      tipo_sanguineo: params[:tipo_sanguineo],
      contato_com_ets: params[:contato_com_ets],
      aprovado: aprovado
    )

    return render json: { mensagem: "Aprovado: #{params[:nome]}, obrigado por contribuir pela sobrevivência da humanidade. Em até 10 dias úteis você receberá em seu endereço o seu kit de combate a seres extraterrestres." }, status: :ok if aprovado

    return render json: { mensagem: "Reprovado: #{params[:nome]}, desculpe, você não possui o perfil necessário para o combate com os seres extraterrestres" }, status: :ok

  end
end
