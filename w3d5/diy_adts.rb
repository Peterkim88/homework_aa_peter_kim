class Stack

  attr_reader :var_stack

  def initialize
    @var_stack = []
  end

  def push(el)
    self.var_stack.push(el)
  end

  def pop
    self.var_stack.pop
  end

  def peek
    var_stack.last
  end

end