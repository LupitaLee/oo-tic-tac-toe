require "pry"
class TicTacToe
    def initialize
        @board = Array.new(9, " ")
    end

    WIN_COMBINATIONS = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8],
        [0, 4, 8],
        [6, 4, 2]
      ]
      def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
      end

      def input_to_index(string)
        string.to_i - 1
      end
      
      def move(index,token)
        @board[index] = token
       
     end
     def position_taken?(index)
     if @board[index] == " " 
        return false 
      else 
        return true
      end
    end

    def valid_move?(index)
        ! position_taken?(index) && index.between?(0,8)
    end

    def turn_count
        @board.count{|token| token == "X" || token == "O"}
    end

    def current_player
        turn_count % 2 == 0 ? "X" : "O"
    end

    def turn
        puts "puts a number 1-9"
        input =gets.strip
        index = input_to_index(input)

        if valid_move?(index)
            token = current_player
            move(index,token)
            display_board
        else
            turn
        end
    end

       def won? 
            WIN_COMBINATIONS.any? do |win|
             if position_taken?(win[0]) && @board[win[0]] == @board[win[1]] && @board[win[2]] ==  @board[win[0]]
            # binding.pry
             return win
             end
            false      # binding.pry
             end
            end

        def full?
        @board.all?{|space | space != " "}
        end

        def draw? 
          full?  && !won?
        end
        
        def over?
            if draw? == true
                true
            elsif won? 
                true
            else 
                false
            end
        end

        def winner
           if won?
             @board[won?[0]]
           else
            nil
           end
        
        end
        
        def play
           turn until over?
           if winner == "X"
            puts "Congratulations X!"
           elsif winner == "O"
            puts "Congratulations O!"
           else
            puts "Cat's Game!"
        end
    end
end




