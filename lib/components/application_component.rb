class ApplicationComponent < Phlex::HTML
  def h1 = super(class: "text-3xl font-semibold my-5")
	def h2 = super(class: "text-2xl font-semibold mt-10 mb-5")

  def a(**attributes)
    super(
      class: "font-bold text-red-600 underline underline-offset-4",
      **attributes
    )
  end
end