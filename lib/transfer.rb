class Transfer
  attr_accessor :status, :sender, :receiver, :amount
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    if sender.valid? && receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction
    if valid? == true && sender.balance >= amount && self.status == "pending"
      self.status = "complete"
      receiver.balance += amount
      sender.balance -= amount
   else 
      self.status = "rejected"
     "Transaction rejected. Please check your account balance."
   end

    # if @status == "complete"
    #   puts "Transaction was already excuted"
    # elsif  @sender.balance < @amount #|| Transfer.all.any?{}#enumerable 
    #   self.status = "rejected"
    #   "Transaction rejected. Please check your account balance."
    # else
    #   # self.Transfer
    #   @sender.deposit( @amount * -1 ) 
    #   @receiver.deposit( @amount )
    #   self.status = "complete"
    # end
  end



  def reverse_transfer
    if @status == "complete"
      @sender.deposit( @amount ) 
      @receiver.deposit( @amount * -1)
      @status = "reversed"
    end
  end

end
