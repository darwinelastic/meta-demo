require 'ripper'

# This class handles parser events, extracting
# comments and attaching them to class definitions
class BabyRDoc < Ripper::Filter
  def initialize(*)
    super
    reset_state
  end

  def on_default(event, token, output)
    reset_state
    output
  end

  def on_sp(token, output) output end
  alias on_nil on_sp

  def on_comment(comment, output)
    @comment << comment.sub(/^\s*#\s*/, "    ")
    output
  end

  def on_kw(name, output)
    @expecting_class_name = (name == 'class')
    output
  end

  def on_const(name, output)
    if @expecting_class_name
      output << "#{name}:\n"
      output <<  @comment
    end
    reset_state
    output
  end

  private

  def reset_state
    @comment = ""
    @expecting_class_name = false
  end
end

BabyRDoc.new(File.read(__FILE__)).parse(STDOUT)

