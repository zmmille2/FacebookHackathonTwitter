class Greeter
    def initialize(name = "World!")
        @name = name
    end
    def say_hi
        puts "Hi #{@name}!"
    end
    def say_bye
        puts "Bye #{@name}, come back soon yo imma miss yo fine ass"
    end
end

G = Greeter.new("Zach")
G.say_hi
G.say_bye
