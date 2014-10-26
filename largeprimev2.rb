#much more efficient as it checks each term individually rather than
#generating the whole array of coefficients at once, uses little memory

require_relative 'term'

def is_p? p

  if p == 1 || p == 0
    return false
  end

  current = Term.new(p)
  (p-1).times do |n|
    current = current.derive
    current.reduce(n+1)

    if current.coefficient % p != 0
      return false
    end
  end
  return true
end

class Fixnum
  def is_prime?
    is_p? self
  end
end

class Bignum
  def is_prime?
    is_p? self
  end
end

1000000.times do |x|
  if x.is_prime? 
    puts x 
  end
end