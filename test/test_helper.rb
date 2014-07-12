require 'Qt4'

require 'rubygems'
gem 'mocha'
gem 'minitest'
require 'minitest/autorun'
require 'mocha/mini_test'

require_relative "../lib/kidsruby"

module KeyPressEventsTestHelper
  def z_key_press_event
    key_press_event(Qt::Key_Z, "z")
  end

  def shift_key_press_event
    key_press_event(Qt::Key_Shift)
  end

  def backspace_key_press_event
    key_press_event(Qt::Key_Backspace)
  end

  def return_key_press_event
    key_press_event(Qt::Key_Return)
  end

  def ctrl_i_key_press
    key_press_event(Qt::Key_I, '\t', Qt::CTRL)
  end

  def key_press_event(key, text='', modifier=Qt::NoModifier)
    Qt::KeyEvent.new(Qt::Event::KeyPress, key, modifier, text)
  end
end
