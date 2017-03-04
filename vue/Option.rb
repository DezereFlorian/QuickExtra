require 'gtk3'
require_relative '../vue/Menu.rb'

class Option < Gtk::Frame

	attr_accessor :event1

	def initialize(window)
		super()
		@window=window
		
		@event1 = Gtk::Box.new(:vertical,5)
		@event1.set_homogeneous("r")
		label_title = Gtk::Label.new "Options", :use_underline => true
		@event1.add(label_title)
		returnButton = Gtk::Button.new :label=>"Retour", :use_underline=>true

		@event1.add(returnButton)

		returnButton.signal_connect("clicked"){
			remove(@event1)
			self.add(Menu.new self)
		}

		self.add @event1

		show_all
	end

end