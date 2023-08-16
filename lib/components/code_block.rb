class CodeBlock < Phlex::HTML
  FORMATTER = Rouge::Formatters::HTML.new

  def initialize(code, syntax:)
    @code = code
    @syntax = syntax.to_sym

    if @syntax == :ruby || @syntax == :html
      @code = @code.gsub(/(?:^|\G) {2}/m, "	")
    end
  end

  def template
    pre(class: "highlight p-5 whitespace-pre-wrap bg-stone-50") {
      unsafe_raw FORMATTER.format(
        lexer.lex(@code)
      )
    }
  end

  private

  def lexer
    Rouge::Lexer.find(@syntax)
  end
end