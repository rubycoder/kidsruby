require_relative "test_helper"
require_relative "../app/widgets/main.rb"

require 'minitest/reporters'
MiniTest::Reporters.use!

describe "main" do
  describe "when opening the main app" do
    before do
      @app = Qt::Application.new(ARGV)
    end

    it "must instantiate an app" do
      @app.wont_be_nil
    end

    # after do
    #   @app.dispose!
    # end
  end
end
