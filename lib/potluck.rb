class Potluck
  attr_reader :date,
              :dishes

  def initialize(date)
    @date   = date
    @dishes = []
  end

  def add_dish(dish)
    @dishes.push(dish)
  end

  def get_all_from_category(category)
    @dishes.select do |dish|
      dish.category == category
    end
  end
    # .select == .find_all <- sister methods

  #   category_dishes =[]
  #   @dishes.each do |dish|
  #     if dish.category == category
  #       category_dishes << dish
  #     end
  #   end
  #   category_dishes
  # end

  def sorted_dishes
    @dishes.sort_by do |dish|
      dish.name
    end
  end

  def menu
    menu = {}
    sorted_dishes.map do |dish|
      appetizer_to_s = (dish.category.to_s + "s").to_sym
      if menu[appetizer_to_s].nil?
        menu[appetizer_to_s] = [dish.name]
      else
         menu[appetizer_to_s] << dish.name
      end
    end
    menu
  end
end
