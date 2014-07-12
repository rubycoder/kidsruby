require_relative "../test_helper"
require_relative "../../app/models/inverts_theme"

require 'minitest/reporters'
MiniTest::Reporters.use!

class DummyWidget
  include InvertsTheme

  default_theme "foo/bar"
  alternate_theme "foo/baz"

  def set_theme(theme)
    # This method must be implemented in any class that.
    # includes the InvertsTheme module.
  end
end

describe 'dummy widget includes theme inversion' do
  include KeyPressEventsTestHelper

  describe 'inverting the theme' do
    it 'delegates to the javascript function' do
      widget = DummyWidget.new
      widget.current_theme.must_equal "foo/bar"
      widget.keyPressEvent(ctrl_i_key_press)
      widget.current_theme.must_equal "foo/baz"
    end
  end
end
