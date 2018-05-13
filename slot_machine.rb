require_relative 'slot_machine_display'

class SlotMachine
  def initialize(wallet)
    play_slot
  end

  def play_slot
    spin_slot = SlotMachineDisplay.new
    @result = spin_slot.print_slot  
  end

  def winnings
    case @result
    when 0
      return -1
    when 1
      return 15
    when 2
      return 8
    when 3
      return 4
    end

 

end