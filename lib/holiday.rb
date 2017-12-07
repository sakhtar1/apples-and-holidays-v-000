holiday_supplies = {
  :winter => {
    :christmas => ["Lights", "Wreath"],
    :new_years => ["Party Hats"]
  },
  :summer => {
    :fourth_of_july => ["Fireworks", "BBQ"]
  },
  :fall => {
    :thanksgiving => ["Turkey"]
  },
  :spring => {
    :memorial_day => ["BBQ"]
  }
}

def second_supply_for_fourth_of_july(holiday_supplies)
  holiday_supplies.map do |season, holidays|
    holidays.map do |holiday, supplies|
      supplies if supplies.include?("BBQ")
    end
  end.flatten.compact
end

def all_supplies(holiday_supplies)
  holiday_supplies.each do |season, data|
    puts "#{season.to_s.capitalize!}:"
    data.each do |holiday, supply|
      # holiday == :fourth_of_july
      # we took the holiday key and converted a string
      # str_holiday == fourth_of_july
      # we took that converted string, and split it to an array with the elements divided by the _ (which removes the _)
      # str_holiday == ["fourth", "of", "july"]
      # we collected over that array in order to capitalize each word
      # str_holiday == ["Fourth", "Of", "July"]
      # we joined the elements together to form a string where each element is divded by an empty space
      # str_holiday == "Fourth Of July"
      str_holiday = holiday.to_s.split("_").collect {|word| word.capitalize!}.join(" ")
      # supplies == ["BBQ", "Fireworks"]
      # we joined it together converting the array to a string dividing each element by a , and a space
      # supplies == "BBQ, Fireworks"
      # "  Fourth Of July: BBQ, Fireworks"
      puts "  #{str_holiday}: #{supply.join(", ")}"
    end
  end
end



def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  holiday_hash.map do |season, holidays|
    holidays.map do |holiday, supplies|
      holiday if supplies.include?("BBQ")
    end
  end.flatten.compact
end
