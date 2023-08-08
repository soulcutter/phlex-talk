class ExamplePhlex < Phlex::HTML
  def initialize(name:, code:, desc:, features:, cost:)
    @name = name
    @code = code
    @desc = desc
    @features = features
    @cost = cost
  end

  def template
    html do
      head { title { "Ruby Toys -- #{@name}" } }
      body do
        h1 { "#{@name} (#{@code})" }
        p { @desc }

        ul do
          @features.each do |f|
            li { b { f } }
          end
        end

        p do
          if @cost < 10
            b { "Only #{@cost}!!!" }
          else
            "Call for a price, today!"
          end
        end
      end
    end
  end
end