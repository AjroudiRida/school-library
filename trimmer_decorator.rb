require_relative 'decorator'
class TrimmerDecorator < Decorator
  def correct_name(name)
    name.strip[0...10]
  end
end
