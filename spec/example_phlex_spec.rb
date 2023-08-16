require "phlex-testing-nokogiri"

RSpec.describe ExamplePhlex do
  include Phlex::Testing::Nokogiri::DocumentHelper

  def template_params(**kwargs) = {
      name: "Bradley Schaefer", 
      code: "Soulcutter",
      desc: "An okay human", 
      features: %w[wingding thing-a-magig doodad],
      cost: 11,
  }.merge(kwargs.slice(:name, :code, :desc, :features, :cost))

  it "renders a list" do
    output = render ExamplePhlex.new(**template_params(features: %w[one two]))
    expect(output.css("li").map(&:text)).to eq %w[one two]
  end
end
