#much more efficient as it checks each term individually rather than
#generating the whole array of coefficients at once, uses little memory

require_relative 'term'

def is_p? p

  if p == 1 || p == 0
    return false
  end

  current = Term.new(p)
  # original line
  # (p-1).times do |n|
  #pascal's triangle is symmetric, maybe only need to check halfway?
  ((p)/2).times do |n|
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

primes = []
100000.times do |x|
  if x.is_prime? 
    primes.push x
    # puts x
  end
end

# print primes
File.open('primes.out', 'w') {|file| file.write(primes.to_s)}