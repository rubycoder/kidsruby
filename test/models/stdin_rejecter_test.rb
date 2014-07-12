require_relative "../test_helper"
require_relative "../../app/models/stdin_rejecter"

require 'minitest/reporters'
MiniTest::Reporters.use!

include KeyPressEventsTestHelper

describe StdinRejecter do
  it "calls the reject stdin method on its parent" do
    parent = mock('parent')
    parent.expects('rejectStdin')
    rejecter = StdinRejecter.new(parent, Qt::Key_Return)
    rejecter.keyPressEvent(return_key_press_event)
  end
end
