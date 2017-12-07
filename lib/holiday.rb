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
  holiday_supplies[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  holiday_hash[:winter].collect do |holidays, items|
    items << supply
  end
end


def add_supply_to_memorial_day(holiday_hash, supply)
  holiday_hash[:spring][:memorial_day] << supply
end

def all_winter_holiday_supplies(holiday_hash)
  holiday_hash[:winter].collect do |holidays, items|
    items
  end.flatten
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  holiday_hash[season][holiday_name] = supply_array
  holiday_hash
end

def all_supplies_in_holidays(holiday_supplies)
  holiday_supplies.each do |season, data|
    puts "#{season.to_s.capitalize!}:"
    data.each do |holiday, supply|
      str_holiday = holiday.to_s.split("_").collect {|word| word.capitalize!}.join(" ")
      puts "  #{str_holiday}: #{supply.join(", ")}"
    end
  end
end



def all_holidays_with_bbq(holiday_hash)

  holiday_hash.map do |season, holidays|
    holidays.map do |holiday, supplies|
      holiday if supplies.include?("BBQ")
    end
  end.flatten.compact
end
