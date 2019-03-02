require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require_relative 'main'
class All_Tests < Minitest::Test
   
    # This unit test check what happen if we give
    # incorrect number of input.
    def test_raises_incorrect_number_input
        assert_raises "Should raise error when input number is incorrect!\n\n" do
            ruby_rush=RubyRush.new(1, 2)
            
        end
    end
        
    
    # This unit test checks what happens if we try to set a value
    # equals boundary value 1.1 to seed,which should be an integer.
    # It should raises the format of correct input in that case.
    # EDGE CASE
    def test_raises_incorrect_seed_input
         
        assert_raises "Should raise error when seed input is not an integer!\n\n" do
            ruby_rush=RubyRush.new(1, 2, 3)
            ruby_rush.seed_check(1.1)
        end
        
         assert_raises "Should raise error when seed input is not a number!\n\n" do
            ruby_rush=RubyRush.new(1, 2, 3)
            ruby_rush.seed_check("")
        end
    end
    
    
    
    
    # This unit test checks what happens if we try to set a value
    # equals boundary value -1, 1.1 and -1,1 to prospectors,which should be an non-
    # negative integer.It should raises the format of correct input in that case.
    # EDGE CASE
    def test_raises_incorrect_prospectors_input
        assert_raises "Should raise error when prospectors input is less than or equal to 0!\n\n" do
            ruby_rush=RubyRush.new(1, 2, 3)
            ruby_rush.prospectors_check(0)
        end
        
        assert_raises "Should raise error when prospectors input is not an integer!\n\n" do
            ruby_rush=RubyRush.new(1, 2, 3)
            rb_rush.prospectors_check(1.1)
        end
         
        assert_raises "Should raise error when prospectors input is not an integer and is less than or equal to 0!\n\n" do
            ruby_rush=RubyRush.new(1, 2, 3)
            ruby_rush.prospectors_check(-1.1)
        end
        
        assert_raises "Should raise error when prospectors input is not a number!\n\n" do
            ruby_rush=RubyRush.new(1, 2, 3)
            ruby_rush.prospectors_check("")
        end
        
    end
    
    
    # This unit test checks what happens if we try to set a value
    # equals boundary value -1,1.1 and -1.1 to turns,which should be an non-
    # negative integer.It should raises the format of correct input in that case.
    # EDGE CASE
    def test_raises_incorrect_turns_input
        assert_raises "Should raise error when turns input is less than or equal to 0!\n\n" do
            ruby_rush=RubyRush.new(1, 2, 3)
            ruby_rush.turns_check(0)
        end
        
        assert_raises "Should raise error when turns input is not an integer!\n\n" do
            ruby_rush=RubyRush.new(1, 2, 3)
            ruby_rush.turns_check(1.1)
        end
        
        assert_raises "Should raise error when turns input is not an integer and is less than or equal to 0!\n\n" do
            ruby_rush=RubyRush.new(1, 2, 3)
            ruby_rush.turns_check(-1.1)
        end
        
         assert_raises "Should raise error when turns input is not a number!\n\n" do
            ruby_rush=RubyRush.new(1, 2, 3)
            ruby_rush.turns_check("")
        end
    end  
    
    # This unit test check for the single and plural of the 
    # instance variables for current ruby and current fake ruby that needed
    # to be printed after each digging.
    def test_check_plural
        ruby_rush=RubyRush.new(1, 2, 3)
        ruby_rush.cur_real_rb=0
        ruby_rush.cur_fake_rb=1
        assert_equal "rubies,ruby", ruby_rush.check_plural
        ruby_rush.real_sp='ruby'
        ruby_rush.fake_sp='ruby'
        ruby_rush.cur_real_rb=1
        ruby_rush.cur_fake_rb=0
        assert_equal "ruby,rubies", ruby_rush.check_plural
        ruby_rush.real_sp='ruby'
        ruby_rush.fake_sp='ruby'
        ruby_rush.cur_real_rb=2
        ruby_rush.cur_fake_rb=2
        assert_equal "rubies,rubies", ruby_rush.check_plural
        ruby_rush.real_sp='ruby'
        ruby_rush.fake_sp='ruby'
        
    end
    
    # This unit test check for the single and plural of the 
    # instance variables for total ruby and total fake ruby that 
    # needed to be printed after each prospector 
    # adone his or her turns.
    def test_check_plural_total
        ruby_rush=RubyRush.new(1, 2, 3)
        ruby_rush.real_rb=0
        ruby_rush.fake_rb=1
        assert_equal "rubies,ruby", ruby_rush.check_plural_total
        ruby_rush.total_real_sp='ruby'
        ruby_rush.total_fake_sp='ruby'
        ruby_rush.real_rb=1
        ruby_rush.fake_rb=0
        assert_equal "ruby,rubies", ruby_rush.check_plural_total
        ruby_rush.total_real_sp='ruby'
        ruby_rush.total_fake_sp='ruby'
        ruby_rush.real_rb=2
        ruby_rush.fake_rb=2
        assert_equal "rubies,rubies", ruby_rush.check_plural_total
        ruby_rush.real_sp='ruby'
        ruby_rush.fake_sp='ruby'
    end
    
    
    # This unit test check for the single and plural of the 
    # instance variable for days that needed to be printed after
    # each prospector done his or her turns.
    def test_check_days
        ruby_rush=RubyRush.new(1, 2, 3)
        ruby_rush.days=1
        assert_equal "day", ruby_rush.check_days
        ruby_rush.dayys="day"
        ruby_rush.days=2
        assert_equal "days", ruby_rush.check_days
        ruby_rush.dayys="day"
    end
    
    
    # This unit test check for the correct format of
    # gains for each prospector after he or she
    # done the turns.
    def test_print_out_gains
        ruby_rush=RubyRush.new(1, 2, 3)
        ruby_rush.days=10
        ruby_rush.real_rb=10
        ruby_rush.fake_rb=10
        ruby_rush.prospector=1
        assert_output("After 10 days, Rubyist 1 found:\n\t10 rubies.\n\t10 fake rubies.\n") {ruby_rush.print_out_gains}
    end
    
    # This unit test check for the correct format
    # of mood for each prospecter after 
    # he or she done the turns.
    def test_print_out_mood
        ruby_rush=RubyRush.new(1, 2, 3)
        ruby_rush.real_rb=10
        assert_output("Going home victorious!\n") {ruby_rush.print_out_mood}
        ruby_rush.real_rb=9
        assert_output("Going home sad.\n") {ruby_rush.print_out_mood}
        ruby_rush.real_rb=0
        assert_output("Going home empty-handed.\n") {ruby_rush.print_out_mood}
    end
    
    # This unit test check for the correct  
    # format of change turn
    def test_print_change_turn
        ruby_rush=RubyRush.new(1, 2, 3)
        ruby_rush.last_city="Enumerable Canyon"
        ruby_rush.city="Duck Type Beach"
        assert_output("Heading from Enumerable Canyon to Duck Type Beach.\n") {ruby_rush.print_change_turn}
    end
    
    
    # This unit test check for the valid next move 
    # city got by the move_turns_enumerable_canyon.
    def test_move_turns_enumerable_canyon_to_duck_type_beach
        ruby_rush=RubyRush.new(1, 2, 3)
        ruby_rush.turn=10
        ruby_rush.random(ruby_rush.seed)
        ruby_rush.move_turns_enumerable_canyon
        assert_includes ['Duck Type Beach', 'Monkey Patch City'], ruby_rush.city
        
     end
    
    
    # This unit test check for the valid next move 
    # city got by the move_turns_duck_type_beach.
    def test_move_turns_duck_type_beach
        ruby_rush=RubyRush.new(1, 2, 3)
        ruby_rush.turn=10
        ruby_rush.random(ruby_rush.seed)
        ruby_rush.move_turns_duck_type_beach
        assert_includes ['Enumerable Canyon', 'Matzburg'], ruby_rush.city
    end
   
    
    # This unit test check for the valid next move 
    # city got by the move_turns_dynamic_palisades.
     def test_move_turns_dynamic_palisades
        ruby_rush=RubyRush.new(1, 2, 3)
        ruby_rush.turn=10
        ruby_rush.random(ruby_rush.seed)
        ruby_rush.move_turns_dynamic_palisades
        assert_includes ['Matzburg', 'Hash Crossing'], ruby_rush.city
    end
    
    
    # This unit test check for the valid next move 
    # city got by the move_turns_matzburgh.
    def test_move_turns_matzburgh
        ruby_rush=RubyRush.new(1, 2, 3)
        ruby_rush.turn=10
        ruby_rush.random(ruby_rush.seed)
        ruby_rush.move_turns_matzburgh
        assert_includes ['Monkey Patch City', 'Duck Type Beach', 'Hash Crossing', 'Dynamic Palisades'], ruby_rush.city
    end
    
    
    # This unit test check for the valid next move 
    # city got by the move_turns_hash_crossing.
    def test_move_turns_hash_crossing
        ruby_rush=RubyRush.new(1, 2, 3)
        ruby_rush.turn=10
        ruby_rush.random(ruby_rush.seed)
        ruby_rush.move_turns_hash_crossing
        assert_includes ['Matzburg', 'Nil Town', 'Dynamic Palisades'], ruby_rush.city
    end
    
    
    # This unit test check for the valid next move 
    # city got by the move_turns_monkey_patch_city.
     def test_move_turns_monkey_patch_city
        ruby_rush=RubyRush.new(1, 2, 3)
        ruby_rush.turn=10
        ruby_rush.random(ruby_rush.seed)
        ruby_rush.move_turns_monkey_patch_city
        assert_includes ['Nil Town', 'Enumerable Canyon', 'Matzburg'], ruby_rush.city
    end
    
    
    # This unit test check for the valid next move 
    # city got by the move_turns_nil_town.
    def test_move_turns_nil_town
        ruby_rush=RubyRush.new(1, 2, 3)
        ruby_rush.turn=10
        ruby_rush.random(ruby_rush.seed)
        ruby_rush.move_turns_nil_town
        assert_includes ['Monkey Patch City', 'Hash Crossing'], ruby_rush.city
    end
    
    
    # This unit test check whether the functionality of print_
    # out_found_nothing is good.
    def test_print_out_found_nothing
        ruby_rush=RubyRush.new(1, 2, 3)
        ruby_rush.real_sp='rubies'
        ruby_rush.fake_sp='rubies'
        assert_output ("\tFound no #{ruby_rush.real_sp} or fake #{ruby_rush.fake_sp} in #{ruby_rush.city}.\n") {ruby_rush.print_out_found_nothing}
    end
    
    
    # This unit test check whether the functionality of print_out_found_long 
    # is good.
    def test_print_out_found_long
        ruby_rush=RubyRush.new(1, 2, 3)
        ruby_rush.real_sp='ruby'
        ruby_rush.fake_sp='ruby'
        ruby_rush.cur_real_rb=1
        ruby_rush.cur_fake_rb=1
        assert_output("\tFound #{ruby_rush.cur_real_rb} #{ruby_rush.real_sp} and #{ruby_rush.cur_fake_rb} fake #{ruby_rush.fake_sp} in #{ruby_rush.city}.\n") {ruby_rush.print_out_found_long}
        ruby_rush.real_sp='rubies'
        ruby_rush.fake_sp='ruby'
        ruby_rush.cur_real_rb=2
        ruby_rush.cur_fake_rb=1
        assert_output("\tFound #{ruby_rush.cur_real_rb} #{ruby_rush.real_sp} and #{ruby_rush.cur_fake_rb} fake #{ruby_rush.fake_sp} in #{ruby_rush.city}.\n") {ruby_rush.print_out_found_long}
         ruby_rush.real_sp='rubies'
        ruby_rush.fake_sp='rubies'
        ruby_rush.cur_real_rb=2
        ruby_rush.cur_fake_rb=1
        assert_output("\tFound #{ruby_rush.cur_real_rb} #{ruby_rush.real_sp} and #{ruby_rush.cur_fake_rb} fake #{ruby_rush.fake_sp} in #{ruby_rush.city}.\n") {ruby_rush.print_out_found_long}
        ruby_rush.real_sp='ruby'
        ruby_rush.fake_sp='rubies'
        ruby_rush.cur_real_rb=1
        ruby_rush.cur_fake_rb=2
        assert_output("\tFound #{ruby_rush.cur_real_rb} #{ruby_rush.real_sp} and #{ruby_rush.cur_fake_rb} fake #{ruby_rush.fake_sp} in #{ruby_rush.city}.\n") {ruby_rush.print_out_found_long}
    end
    
   
    # This unit test enumerable_canyon_search when found something.
    # STUB METHOD
    def test_enumerable_canyon_search_found_something
        ruby_rush=RubyRush.new(1, 2, 3)
        doubled_prng = Minitest::Mock.new('doubled prng')
        def doubled_prng.rand(seed); 1; end
        ruby_rush.prng=doubled_prng
        ruby_rush.cur_real_rb=1
        ruby_rush.cur_fake_rb=1
        assert_output("\tFound #{ruby_rush.cur_real_rb} #{ruby_rush.real_sp} and #{ruby_rush.cur_fake_rb} fake #{ruby_rush.fake_sp} in #{ruby_rush.city}.\n" ) {ruby_rush. enumerable_canyon_search}
    end
    
    
    # This unit test duck_type_beach_search when found something.
    # STUB METHOD
    def test_duck_type_beach_search_found_something
        ruby_rush=RubyRush.new(1, 2, 3)
        doubled_prng = Minitest::Mock.new('doubled prng')
        def doubled_prng.rand(seed); 2; end
        ruby_rush.prng=doubled_prng
        ruby_rush.cur_real_rb=2
        ruby_rush.cur_fake_rb=2
        ruby_rush.real_sp='rubies'
        ruby_rush.fake_sp='rubies'
        assert_output("\tFound #{ruby_rush.cur_real_rb} #{ruby_rush.real_sp} and #{ruby_rush.cur_fake_rb} fake #{ruby_rush.fake_sp} in #{ruby_rush.city}.\n" ) {ruby_rush. duck_type_beach_search}
    end
    
    
    # This unit test  when found dynamic_palisades_search something.
    # STUB METHOD
    def test_dynamic_palisades_search_found_something
        ruby_rush=RubyRush.new(1, 2, 3)
        doubled_prng = Minitest::Mock.new('doubled prng')
        def doubled_prng.rand(seed); 2; end
        ruby_rush.prng=doubled_prng
        ruby_rush.cur_real_rb=2
        ruby_rush.cur_fake_rb=2
        ruby_rush.real_sp='rubies'
        ruby_rush.fake_sp='rubies'
        assert_output("\tFound #{ruby_rush.cur_real_rb} #{ruby_rush.real_sp} and #{ruby_rush.cur_fake_rb} fake #{ruby_rush.fake_sp} in #{ruby_rush.city}.\n" ) {ruby_rush. dynamic_palisades_search}
    end
    
    
    # This unit test matzburgh_search when found something.
    # STUB METHOD
    def test_matzburgh_search_found_something
        ruby_rush=RubyRush.new(1, 2, 3)
        doubled_prng = Minitest::Mock.new('doubled prng')
        def doubled_prng.rand(seed); 3; end
        ruby_rush.prng=doubled_prng
        ruby_rush.cur_real_rb=3
        ruby_rush.real_sp='rubies'
        assert_output("\tFound #{ruby_rush.cur_real_rb} #{ruby_rush.real_sp} in #{ruby_rush.city}.\n" ) {ruby_rush.matzburgh_search}
    end
    
    
    # This unit test hash_crossing_search when found something.
    # STUB METHOD
    def test_hash_crossing_search_found_something
        ruby_rush=RubyRush.new(1, 2, 3)
        doubled_prng = Minitest::Mock.new('doubled prng')
        def doubled_prng.rand(seed); 2; end
        ruby_rush.prng=doubled_prng
        ruby_rush.cur_real_rb=2
        ruby_rush.cur_fake_rb=2
        ruby_rush.real_sp='rubies'
        ruby_rush.fake_sp='rubies'
         assert_output("\tFound #{ruby_rush.cur_real_rb} #{ruby_rush.real_sp} and #{ruby_rush.cur_fake_rb} fake #{ruby_rush.fake_sp} in #{ruby_rush.city}.\n" ) {ruby_rush.hash_crossing_search}
    end
    
    
    # This unit test monkey_patch_city_search when found something.
    # STUB METHOD
    def test_monkey_patch_city_search_found_something
        ruby_rush=RubyRush.new(1, 2, 3)
        doubled_prng = Minitest::Mock.new('doubled prng')
        def doubled_prng.rand(seed); 1; end
        ruby_rush.prng=doubled_prng
        ruby_rush.cur_real_rb=1
        ruby_rush.cur_fake_rb=1
        ruby_rush.real_sp='ruby'
        ruby_rush.fake_sp='ruby'
         assert_output("\tFound #{ruby_rush.cur_real_rb} #{ruby_rush.real_sp} and #{ruby_rush.cur_fake_rb} fake #{ruby_rush.fake_sp} in #{ruby_rush.city}.\n" ) {ruby_rush.monkey_patch_city_search}
    end
    
    
    # This unit test nil_town_search when found something.
    # STUB METHOD
    def test_nil_town_search_found_something
        ruby_rush=RubyRush.new(1, 2, 3)
        doubled_prng = Minitest::Mock.new('doubled prng')
        def doubled_prng.rand(seed); 3; end
        ruby_rush.prng=doubled_prng
        ruby_rush.cur_fake_rb=3
        ruby_rush.fake_sp='rubies'
         assert_output("\tFound #{ruby_rush.cur_fake_rb} fake #{ruby_rush.fake_sp} in #{ruby_rush.city}.\n" ) {ruby_rush.nil_town_search}
    end
    
end
    


    

