class Account
    attr_reader :name
    attr_reader :balance
    
    def initialize(name, balance=100)
        @name = name
        @balance = balance
    end
    
    public
    
    def display_balance(pin_number)
        puts pin_number == pin ? "Balance: $#{@balance}." : pin_error
    end
    
    def deposit(pin_number, amount)
        if pin_number == pin 
            @balance += amount
            puts "Deposited #{amount}. New balance $#{@balance}."
        else
            pin_error 
        end
    end        
    
    def withdraw(pin_number, amount)
        if pin_number == pin 
            if amount > @balance
                puts "Insufficient funds."
            else
                @balance -= amount
                puts "Withdrew #{amount}. New balance $#{@balance}."
            end
        else
            pin_error 
        end
    end
    
    private
    
    def pin
        @pin = 1234
    end
    
    def pin_error
        return "Access denied: incorrect PIN."
    end
    
end

checking_account = Account.new("My Account", 200)
checking_account.display_balance(1234)
checking_account.withdraw(1234, 100)
checking_account.withdraw(1232, 100)
checking_account.deposit(1234, 200)
checking_account.withdraw(1234, 400)