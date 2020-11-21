require 'pry'


def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  holiday_hash.each do |season, holidays|             # loop through seasons
    if season == :summer                              # find summer
      holidays.each do |holiday_name, items_needed|   # loop through holidays in summer
        if holiday_name == :fourth_of_july            # find :fourth_of_july
          return items_needed[1]                      # return second item of lists
        end
      end
    end
  end
end

def add_supply_to_winter_holidays(holiday_hash, supply)

  holiday_hash.each do |season, holidays|             # loop through seasons
    if season == :winter                              # find winter
      holidays.each do |holiday_name, items_needed|   # loop through holidays
        items_needed.push(supply)                     # add supply to all arrays
      end
    end
  end
end


def add_supply_to_memorial_day(holiday_hash, supply)

  holiday_hash.each do |season, holidays|             # loop through seasons
    if season == :spring                              # find spring
      holidays.each do |holiday_name, items_needed|   # loop through holidays
        if holiday_name == :memorial_day              # find :memorial_day
          items_needed.push(supply)                   # add supply to array
        end
      end
    end
  end

end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)

  holiday_hash.each do |season_list, holidays|                # loop through seasons
    if season_list == season                                  # find season_list
      holiday_hash[season_list][holiday_name] = supply_array  # add holiday_name and supply_array to season
    end
  end
  holiday_hash                                                # return hash with new holiday and list
end

def all_winter_holiday_supplies(holiday_hash)
  holiday_hash.each do |season, holidays| # loop through seasons
    if season == :winter                  # find winter
      return holidays.values.flatten      # collect and return one array of values
    end
  end
end

def all_supplies_in_holidays(holiday_hash)

  holiday_hash.each do |season, holidays|                                       # loop through seasons
    puts "#{season.capitalize}:"                                                # puts current season
    holidays.each do |holiday_name, items_needed|                               # loop through holidays
      formatted_holiday_name = holiday_name.to_s.split('_').each do |word|      # formats holiday_name
        word.capitalize!
      end
      puts "  #{formatted_holiday_name.join(' ')}: #{items_needed.join(', ')}"  # puts holiday_name and items_needed
    end
  end
  # OUTPUT
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
end

def all_holidays_with_bbq(holiday_hash)                           #=> holiday names that include "BBQ" string

  bbq_holiday = []                                                # empty array for holidays
  holiday_hash.each do |season, holidays|                         # loop through each season
    holidays.collect do |holiday_name, items_needed|                # loop through holidays
      bbq_holiday << holiday_name if items_needed.include?("BBQ")   # put holiday_name in bbq_array if "BBQ" found
    end
  end
  bbq_holiday                                                     # return holiday names as keys
end







