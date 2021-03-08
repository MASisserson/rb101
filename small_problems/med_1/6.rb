# Stack Machine Interpreter

=begin

input: string
output: integer string
return: a modified stack and register

Mental Model:
The register is the temp variable, the stack is a set of variables in memory.
Operations can happen sequentially from one command.
The command has to be dissected into individual components somehow

Requirements:
1. register initialized to 0
2. No need to validate inputs
3. No return value for the method specified
4. Register and stack initialized on method call
  stack initialized to []

Plan:
0. Initialize register and stack
1. Dissect the command into individual components
2. Loop through the sub-commands, performing each in turn
3. Done

Problems:
1. Dissecting the sub-commands
  Can be done through #split into an array
2. Loop through the sub-commands
  Can be done with #each
3. Performing each command in turn
  Can be done with case statement that calls a separate method named after the command
4. Done

=end

def n(sub_command, register)
  register[0] = sub_command.to_i
end

def push(register, stack)
  stack << register[0]
end

def add(register, stack)
  register[0] = register[0] + stack.pop
end

def sub(register, stack)
  register[0] = register[0] - stack.pop
end

def mult(register, stack)
  register[0] = register[0] * stack.pop
end

def div(register, stack)
  register[0] = register[0] / stack.pop
end

def mod(register, stack)
  register[0] = register[0] % stack.pop
end

def pop(register, stack)
  register[0] = stack.pop
end

def print(register, stack)
  puts register[0].to_s
end

def minilang(command)
  stack = []
  register = [0]
  command.split.each do |sub_command|
    case sub_command
    when 'PUSH'   then push(register, stack)
    when 'ADD'    then add(register, stack)
    when 'SUB'    then sub(register, stack)
    when 'MULT'   then mult(register, stack)
    when 'DIV'    then div(register, stack)
    when 'MOD'    then mod(register, stack)
    when 'POP'    then pop(register, stack)
    when 'PRINT'  then print(register, stack)
    else n(sub_command, register)
    end
  end

  nil
end



# minilang('PRINT')
# 0

# minilang('5 PUSH 3 MULT PRINT')
# 15

# minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# 5
# 3
# 8

# minilang('5 PUSH POP PRINT')
# 5

# minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# 5
# 10
# 4
# 7

# minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# 6

# minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# 12

# minilang('-3 PUSH 5 SUB PRINT')
# 8

minilang('6 PUSH')
# (nothing printed; no PRINT commands)
