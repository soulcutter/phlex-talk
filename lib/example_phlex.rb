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
        render FeatureList.new(@features) do |list|
          b { list.feature }
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
  attr_reader :feature
  def initialize(features) = @features = features

  def template(&block)
    ul do
      @features.each do |feature|
        li do
          @feature = feature
          yield_content(&block)
        end
      end
    end
  end
end
