require 'gtk3'
require_relative '../vue/EquipierVue.rb'
require_relative '../vue/Option.rb'

class Menu < Gtk::Window

	attr_accessor :event1

	def initialize()
		super()
		set_title "Bienvenue dans le programme d'attribution des extras"
		set_default_size 500, 300
		set_resizable true

		signal_connect 'destroy'  do
			Gtk.main_quit
		end
		init_ui
	end

	def init_ui
		#https://lazka.github.io/pgi-docs/Gtk-3.0/classes/Box.html
		@event1 = Gtk::Box.new(:vertical,5)
		@event1.set_homogeneous("r")
		label_title = Gtk::Label.new "Quick Extras", :use_underline => true
		equipierButton = Gtk::Button.new :label=>"Equipier", :use_underline => true
		extraButton = Gtk::Button.new :label=>"Extras", :use_underline => true
		associationButton = Gtk::Button.new :label=>"Associer les extras aux équipiers", :use_underline => true
		optionButton = Gtk::Button.new :label=>"Options", :use_underline => true
		@event1.add(label_title)
		@event1.add(equipierButton)
		@event1.add(extraButton)
		@event1.add(associationButton)
		@event1.add(optionButton)

		optionButton.signal_connect("clicked"){
			remove(@event1)
			self.add(Option.new self)
		}

		equipierButton.signal_connect("clicked"){
			remove(@event1)
			self.add(EquipierVue.new self)
		}
		self.add @event1
		self.applyCSS

		show_all
	end

	def applyCSS()    
	    css = Gtk::CssProvider.new()

	    # css.load_from_file(file)
	    css.load_from_data('''

	    GtkWindow {
	        background-color: #333;
	    }

	    ''')
	    style_context = Gtk::StyleContext.new()
	    style_context = self.get_style_context()
	    style_context.add_provider(css, Gtk::STYLE_PROVIDER_PRIORITY_APPLICATION)
	end
end

#Gtk.init
Menu.new()
Gtk.main