require('rspec')
require('roman_numerals')

describe('num_to_int')  do
  it('return a number if that number has unique numeral') do
    num_to_int('X').should(eq(10))
  end

  it('correctly returns multiple symbols') do
    num_to_int("II").should(eq(2))
  end

  it('correctly returns a number when the numeral contains a four') do
    num_to_int("IV").should(eq(4))
  end

  it('correctly returns a number when the numeral contains a nine') do
    num_to_int("MCMXCIV").should(eq(1994))
  end

  it('returns an error message for unexpected symbols') do
    num_to_int("PX").should(eq('Unexpected symbol'))
  end

  it('returns an error message for disordered symbols') do
    num_to_int("IL").should(eq('Disordered symbols'))
  end

  it('returns an error message for more than four repeated symbols') do
    num_to_int("IIIII").should(eq('Excess symbols'))
  end

  it('returns proper values when lowercase characters are entered') do
    num_to_int("x").should(eq(10))
  end

  it('returns proper values when a value between zero and one is entered') do
    num_to_int(".xi").should(eq(0.11))
  end

  it('returns proper values when an integer with a decimal is entered') do
    num_to_int("v.xi").should(eq(5.11))
  end

  it('returns proper values when a decimal with leading zeros is entered') do
    num_to_int("MCMXCIV.NNMCMXCIV").should(eq(1994.001994))
  end

end
