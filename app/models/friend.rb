#encoding utf-8
class Friend < ActiveRecord::Base
  validates :longitude, :numericality =>  {:only_integer => true }
  validates :latitude, :numericality =>  {:only_integer => true }
  validates :latitude, :longitude, :name, :presence => true
  attr_accessible :latitude, :longitude, :name, :distance

  public
  #Devolve os amigos perto do atual
  #O valor padrão é 3 como é resquisitado no enunciado
  #mas uma parametro indicando a quantidade, pode ser
  #util para uma manutenão futura, se o requisitos mudarem
  def calculates_near_him(how_many = 3)
  	#a formula para o calculo entre dois ponto do plano
  	#cartesiano é V(x2-x1)²+(y2-y1)², onde "V"(raiz quadrada) 
    #levando em consideração
  	#longitude como x, e latitude como y
    @near_him = Array.new
  	@friends = Friend.where(" id <> #{self.id}")
    @friends.each do |friend|
      aux1 = (friend.longitude - self.longitude)**2
      aux2 = (friend.latitude - self.latitude)**2
      friend.distance= Math.sqrt( aux1 + aux2 )
      @near_him << friend
    end
    #ordena em ordem crescente atraves da propriedade distance
    @friends.sort_by! { |i| i[:distance] }
    #separa apenas a quantidade passada como parametro
    @near_him = @near_him.take(how_many)
  end

  def distance
    @distance
  end

  def distance=(distance)
    @distance = distance
  end

  def near_him
    @near_him
  end

  def near_him=(near_him)
    @near_him = near_him
  end

end
