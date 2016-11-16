module Profile::ProjectsHelper
	def status_projeto status
	    case status
	      when 0
	      	'<span class="label label-default">Inativo<span>'
	      when 1
  			'<span class="label label-success">Ativo<span>'
	      else
	        " "
	    end
    end

    def gravidade valor
  		case valor
  		when 0
  			'<span class="btn btn-success btn-sm" data-toggle="tooltip" data-placement="top" title="Não há problema aqui. Leia o comentário para veer as dicas do avaliador">Sem problema<span>'
  		when 1
  			'<span class="btn btn-info btn-sm" data-toggle="tooltip" data-placement="top" title="O problema cosmético pode ter baixa prioridade para resolução">Cosmético<span>'
  		when 2
  			'<span class="btn btn-yellow btn-sm" data-toggle="tooltip" data-placement="top" title="Problema simples, que pode (e deve) ser resolvido rapidamente">Simples<span>'
  		when 3
  			'<span class="btn btn-orange btn-sm" data-toggle="tooltip" data-placement="top" title="Problema grave. Deve ter alta prioridade para ser resolvido">Grave<span>'
  		when 4
  			'<span class="btn btn-danger btn-sm" data-toggle="tooltip" data-placement="top" title="Gravissímo! Problema com prioridade máxima para resolução. Pode ter grande má influência na usabilidade">Gravíssimo<span>'					
  		else
  			''	
  		end
    end

    def mensagem_nota nota
      case nota
      when 0..1.3
        "Uhnnn. Isso não está bom! Veja nos comentários onde você está errando e tente melhorar. Ainda tem um caminho à percorrer para chegar lá."
      when 1.4..2.6
        "Os avaliadores detectaram alguns errors que devem ser reparados. Veja nos comentários o que você ainda pode melhorar e tente alcançar a nota máxima."
      when 2.7...4
        "Quase lá! Seu projeto já está no caminho certo, mas ainda pode melhorar. Tente resolver esses probleminhas e chegar ao topo."      
      when 4
        "Parabéns! Os avaliadores não encontraram erros graves em seu projeto. Mesmo assim, confira a seção de comentários para ver alguma dica."
      else
        "" 
      end    
    end
end
