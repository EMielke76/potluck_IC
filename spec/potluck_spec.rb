require './lib/dish'
require './lib/potluck'

RSpec.describe Potluck do
  context 'Iteration II' do
    let(:couscous_salad) {Dish.new("Couscous Salad", :appetizer)}
    let(:summer_pizza) {Dish.new("Summer Pizza", :appetizer)}
    let(:roast_pork) {Dish.new("Roast Pork", :entre)}
    let(:cocktail_meatballs) {Dish.new("Cocktail Meatballs", :entre)}
    let(:candy_salad) {Dish.new("Candy Salad", :dessert)}

    let(:potluck) {Potluck.new("7-13-18")}

    describe 'Potluck' do
      it 'exists' do

        expect(potluck).to be_a(Potluck)
      end

      it 'has attributes' do

        expect(potluck.date).to eq("7-13-18")
        expect(potluck.dishes).to eq([])
      end

      it 'can add dishes' do
        potluck.add_dish(couscous_salad)
        potluck.add_dish(cocktail_meatballs)

        expect(potluck.dishes).to eq([couscous_salad, cocktail_meatballs])
        expect(potluck.dishes.length).to eq(2)
      end
    end

    describe 'Iteration III' do
      let(:bean_dip) {Dish.new("Bean Dip", :appetizer)}
      before :each do
        potluck.add_dish(couscous_salad)
        potluck.add_dish(summer_pizza)
        potluck.add_dish(roast_pork)
        potluck.add_dish(cocktail_meatballs)
        potluck.add_dish(candy_salad)
        potluck.add_dish(bean_dip)
      end

      it 'can get all dishes from a given category' do

        expect(potluck.get_all_from_category(:appetizer)).to eq([couscous_salad, summer_pizza, bean_dip])
        expect(potluck.get_all_from_category(:entre)).to eq([roast_pork, cocktail_meatballs])
        expect(potluck.get_all_from_category(:appetizer).first).to eq(couscous_salad)
        expect(potluck.get_all_from_category(:appetizer).first.name).to eq("Couscous Salad")
      end

      it 'can create a menu' do
        expected = {
          :appetizers => ["Bean Dip", "Couscous Salad", "Summer Pizza"],
          :entres => ["Cocktail Meatballs", "Roast Pork"],
          :desserts => ["Candy Salad"]
        }

        expect(potluck.menu).to eq(expected)
      end
    end
  end
end
