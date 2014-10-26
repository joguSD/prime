class Term
  attr_accessor :power, :coefficient

  def initialize p, c=1  
    @power = p
    @coefficient = c
  end

  def derive
    Term.new(@power-1,@coefficient*@power)
  end

  def to_s
    "#{@coefficient}x^#{@power}"
  end

  def reduce k
    @coefficient = @coefficient/k
  end
end