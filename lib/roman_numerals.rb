class Numerals
  def self.num_to_int(numeral)
    numeral.upcase!
    nums = {"N" => 0, "I" => 1, "V" => 5, "X" => 10, "L" => 50, "C" => 100, "D" => 500, "M" => 1000}
    result = 0
    result_array = []
    dot = ""
    num_split = numeral.split("")
    previous = "N"
    counter = 0
    dis_hash = {"M" => "C","D" => "C","C" => "X","L" => "X","X" => "I","V" => "I"}
    lead_zero = ""
    dec_cmltv = 0
    num_split.each do  |num|
      if (num != ".") && (previous != ".") && (num != "N") && (previous != "N") && (dis_hash[num] != previous) && (nums[previous] < nums[num])
        return "Disordered symbols"
      end
      if (nums.include?(num) == false) && (num != ".")
        return "Unexpected symbol"
      end
      if (num_split[counter] == num_split[counter + 1]) && (num_split[counter] == num_split[counter + 2]) && (num_split[counter] == num_split[counter + 3])
        return "Excess symbols"
      end
      if num == "."
        dot = "."
        result_array << result
        result_array << "."
        result = 0
      elsif (dot == ".") && (dec_cmltv == 0) && (num == "N")
        lead_zero += "0"
      elsif (previous != ".") && (nums[previous] < nums[num]) && (previous != "N")
          result += nums[num] - 2 * nums[previous]
      else
        result += nums[num]
      end
      previous = num
      counter += 1
      if (num != ".") && (dot == ".")
        dec_cmltv += nums[num]
      end
      if counter == numeral.length
        result_array << lead_zero
        result_array << result
      end
    end
    result_array.join("").to_f
  end
end


