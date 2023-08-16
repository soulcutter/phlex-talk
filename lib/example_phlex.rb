require "phlex"

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

        # ul do
        #   @features.each do |f|
        #     li { b { f } }
        #   end
        # end
        render FeatureList.new(@features) do |feature|
          b { feature }
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

class FeatureList < Phlex::HTML
  def initialize(features) = @features = features

  def template(&)
    ul do
      @features.each do |feature|
        li { yield_content_with_args(feature, &) }
      end
    end
  end
end
