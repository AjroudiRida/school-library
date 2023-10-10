require './decorator'
class TrimmerDecorator < Decorator
  def correct_name
    super.slice(0, 10) if super.size > 10
  end
end
