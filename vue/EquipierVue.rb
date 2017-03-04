require 'gtk3'

class EquipierVue < Gtk::Frame

	def initialize(window)
		super()
		@window=window
		
		event1 = Gtk::Box.new(:vertical,5)
		event1.set_homogeneous("r")
		label_title = Gtk::Label.new "Equipiers", :use_underline => true
		event1.add(label_title)

		self.add event1

		show_all
	end

end