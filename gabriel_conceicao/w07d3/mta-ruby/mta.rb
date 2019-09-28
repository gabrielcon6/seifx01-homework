# frozen_string_literal: true

@train_station = {
  :N => ['Times Square', '34th', '28th', '23rd', 'Union Square', '8th'],
  :L => ['8th', '6th', 'Union Square', '3rd', '1st'],
  6 => ['Grand Central', '33rd', '28th', '23rd', 'Union Square', 'Astor Place']
}

def checking_lines(line_dep, departure, line_dest, destination)
  @dep = departure
  @dest = destination
  if line_dep == line_dest
    @line = line_dep
    same_line(@line, @dep, @dest)
  else
    @line_1 = line_dep
    @line_2 = line_dest
    first_line(@line_1, @dep)
  end
end

def first_line (line_first, departure)
    i_dep = @train_station[line_first].find_index(departure)
    i_dest = @train_station[line_first].find_index('Union Square')
    path = if i_dest > i_dep
        @train_station[line_first].slice(i_dep + 1, i_dest-1) * ', '
      else
        @train_station[line_first].slice(i_dest + 1, i_dep).reverse * ', '
    end
p "You must travel through the following stops on the #{line_first} line: #{path} and change at Union Square"
second_line(@line_2, @dest)
end

def second_line (line_sec, destination)
    i_dep = @train_station[line_sec].find_index('Union Square')
    i_dest = @train_station[line_sec].find_index(destination)
    path = if i_dest > i_dep
        @train_station[line_sec].slice(i_dep + 1, i_dest) * ', '
      else
        @train_station[line_sec].slice(i_dest + 1, i_dep).reverse * ', '
    end
p "You must travel through the following stops on the #{line_sec} line: #{path}"
end

def same_line(line_name, departure, destination)
  i_dep = @train_station[line_name].find_index(departure)
  i_dest = @train_station[line_name].find_index(destination)
  path = if i_dest > i_dep
           @train_station[line_name].slice(i_dep + 1, i_dest) * ', '
         else
           @train_station[line_name].slice(i_dest + 1, i_dep).reverse * ', '
       end
  "You must travel through the following stops on the #{line_name} line: #{path}"
end

checking_lines(:N, 'Times Square', :L, '1st')
# p train_station[:stations]
