class StudyItem
  attr_reader :id, :title, :category

  @@current_id = 1 #variavel de classe
  @@study_items = []

  def initialize(title:, category:)
    @id = @@current_id
    @title = title
    @category = category

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

  def self.all
    @@study_items
  end

  def self.print(items)
    puts items
    puts 'Nenhum item cadastrado' if items.empty?
  end

  def self.search
    print 'Digite uma palavra para procurar: '
    term = gets.chomp
    found_items = all.filter do |item|
    item.include?(term)
    end
    StudyItem.print(found_items)
  end

  def self.delete
    print(all)
    puts('=========================')
    print 'Digite o id a ser deletado: '
    id = gets.chomp.to_i
    all.delete_if {|item| item.id == id}
  end
end
