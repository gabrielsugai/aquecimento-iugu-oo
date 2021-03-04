class StudyItem
  attr_reader :id, :title, :category
  attr_accessor :status

  @@current_id = 1 #variavel de classe
  @@study_items = []

  def initialize(title:, category:)
    @id = @@current_id
    @title = title
    @category = category
    @status = false

    @@current_id += 1
    @@study_items << self
  end

  def include?(query)
    title.include?(query) || category.include?(query)
  end

  def to_s
    "##{id} - #{title} - #{category}"
  end

  def self.register
    print 'Digite o título do seu item de estudo: '
    title = gets.chomp
    print 'Digite a categoria do seu item de estudo: '
    category = gets.chomp
    puts "Item '#{title}' da categoria '#{category}' cadastrado com sucesso!"
    new(title: title, category: category)
  end

  def self.change_status
    StudyItem.view(StudyItem.all)
    print("\nDigite o id desejado: ")
    id = gets.chomp.to_i
    found_item = all.filter do |item|
      item.id == id
    end
    found_item.first.status = !found_item.first.status
  end

  def self.all
    @@study_items
  end

  def self.view(items)
    if items.empty?
      puts 'Nenhum item cadastrado'
    else
      incomplete = all.map { |item| item unless item.status }
      completed = all.map { |item| item if item.status }
      puts("Concluidos:")
      puts completed
      puts("==========================")
      puts("Incompletos")
      puts incomplete
    end
  end

  def self.search
    print 'Digite uma palavra para procurar: '
    term = gets.chomp
    found_items = all.filter do |item|
    item.include?(term)
    end
    StudyItem.view(found_items)
  end

  def self.delete
    view(all)
    puts('=========================')
    print 'Digite o id a ser deletado: '
    id = gets.chomp.to_i
    all.delete_if {|item| item.id == id}
  end
end
