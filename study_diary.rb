require_relative 'study_item'

REGISTER = 1
VIEW = 2
CHANGE = 3
SEARCH = 4
DELETE = 5
EXIT = 6

def clear
  system('clear')
end

def wait_keypress
  puts
  puts 'Pressione enter para continuar'
  gets
end

def clear_and_wait_keypress
  wait_keypress
  clear
end

def welcome
  'Bem-vindo ao Diário de Estudos, seu companheiro para estudar!'
end

def menu
  puts "[#{REGISTER}] Cadastrar um item para estudar"
  puts "[#{VIEW}] Ver todos os itens cadastrados"
  puts "[#{CHANGE}] Alterar status de um item"
  puts "[#{SEARCH}] Buscar um item de estudo"
  puts "[#{DELETE}] Deletar um item"
  puts "[#{EXIT}] Sair"
  print 'Escolha uma opção: '
  gets.to_i
end

clear
puts welcome
option = menu

loop do
  clear
  case option
  when REGISTER
    StudyItem.register
  when VIEW
    StudyItem.view(StudyItem.all)
  when CHANGE
    StudyItem.change_status
  when SEARCH
    StudyItem.search
  when DELETE
    StudyItem.delete
  when EXIT
    clear
    puts 'Obrigado por usar o Diário de Estudos'
    break
  else
    puts 'Opção inválida'
  end
  clear_and_wait_keypress
  option = menu
end
