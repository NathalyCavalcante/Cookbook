INSERIR_RECEITA = 1
VISUALIZAR_RECEITAS = 2
SAIR = 3


def bem_vindo()
    puts "Bem-vindo ao Cookbook, sua rede social de receitas"
end

def menu()
    puts "[#{INSERIR_RECEITA}] Cadastrar uma receita"
    puts "[#{VISUALIZAR_RECEITAS}] Ver todas as receitas"
    puts "[#{SAIR}] Sair"
    print "Escolha uma opção: "
    gets.to_i()
end

def inserir_receita()
    puts "Digite o nome da receita: "
    nome = gets.chomp()
    puts "Digite o tipo da receita: "
    tipo = gets.chomp()
    puts
    puts "Receita de #{nome} cadastrada com sucesso!" 
    return { nome: nome, tipo: tipo }        
end

def imprimir_receitas(receitas)
    puts "***** Receitas Cadastradas *****"
    receitas.each do |receita|
        puts"#{receita[:nome]} - #{receita[:tipo]}"
        puts
    end
    if receitas.empty?
        puts "Nenhuma receita cadastrada."
        puts
    end
end

bem_vindo()
receitas = []
opcao = menu() 

loop do
    if(opcao == INSERIR_RECEITA) 
        receitas << inserir_receita()
        opcao = menu() 
    elsif(opcao == VISUALIZAR_RECEITAS)
        imprimir_receitas(receitas)       
        opcao = menu()
    elsif(opcao == SAIR) 
        break
    else
        puts "Opção inválida!"
        opcao = menu() 
    end
end

puts "Obrigada por usar o Cookbook!"
