class Experience < ActiveRecord::Base
  belongs_to :user

  private

  def self.titles_ir
    {
      "Conhecimento de práticas de IHC" => 7.33,
      "Conhecimento de conceitos de Design" => 7.21,
      "Conhecimentos na área de psicologia cognitva" => 6.30,
      "Conhecimentos na área de programação" => 5.39,
      "Formação acadêmica em Design" => 4.93,
      "Formação acadêmica em Engenharia de Software" => 6.18,
      "Formação acadêmica em Programação" => 4.12,
      "Formação acadêmica em Psicologia" => 3.66,
      "Experiência profissional na área de Programação" => 4.81,
      "Experiência profissional na área de Design" => 5.84,
      "Experiência profissional na área de Engenharia de Software" => 6.75,
      "Experiência profissional na área de Psicologia" => 3.78,
      "Conhecimento de linguística" => 6.40,
      "Conhecimento cultural diversificado" => 6.52,
      "Conhecimento de mais de um idioma" => 3.30,
      "Área de atuação profissional relacionada à área de aplicação de software" => 6.87,
      "Ter boa habilidade de comunicação escrita" => 7.55
    }
  end

  public

  enum title: titles_ir.keys

  def value
    Experience.titles_ir[title]
  end
end
