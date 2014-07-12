require_relative "../test_helper"

require 'minitest/reporters'
MiniTest::Reporters.use!

describe Turtle do
  before do
    @iface = mock('interface')
    @iface.stubs(:valid?).returns(true)

    @reply = mock("reply")
    @reply.stubs(:valid?).returns(true)

    InterfaceHelper.any_instance.stubs('get_interface').returns(@iface)
  end

  it "must initialize the remote Turtle" do
    @value = true

    @iface.expects(:call).with('init_turtle').returns(@reply)
    @turtle = Turtle.new
  end

  describe "when working with the class methods" do

    it "must be able to draw" do
      @val = "#fff"
      @reply.stubs(:value).returns(@val)

      @iface.expects(:call).with('init_turtle').returns(@reply)
      @iface.expects(:call).with("background", @value).returns(@reply)
      @iface.expects(:call).with("command_turtle", 'draw();').returns(@reply)
      Turtle.draw do
        background(@val)
      end
    end
  end

  describe "when properly initialized" do
    before do
      @iface.stubs(:call).with('init_turtle').returns(@reply)
      @turtle = Turtle.new
    end

    it "must have a background color" do
      @value = "#fff"
      @reply.stubs(:value).returns(@value)
      @iface.expects(:call).with("background", @value).returns(@reply)
      @turtle.background(@value)
    end

    it "must have a pensize" do
      @value = 3
      @reply.stubs(:value).returns(@value)
      @turtle.pensize(@value)
      assert_includes(@turtle.commands, "pensize(#@value)")
    end

    it "must have a pencolor" do
      @value = "#fff"
      @reply.stubs(:value).returns(@value)
      @turtle.pencolor(@value)
      assert_includes(@turtle.commands, "penstyle('#@value')")
    end

    it "must be able to goto a location" do
      x, y = 3, 4
      value = 5
      @reply.stubs(:value).returns(value)
      @turtle.goto(x, y)
      assert_includes(@turtle.commands, "jump(#{x}, #{y})")
    end

    it "must be able to setheading" do
      value = 90
      @reply.stubs(:value).returns(value)
      @turtle.setheading(value)
      assert_includes(@turtle.commands, "angle(#{value})")
    end

    it "must be able to move forward" do
      value = 3
      @reply.stubs(:value).returns(value)
      @turtle.forward(value)
      assert_includes(@turtle.commands, "go(#{value})")
    end

    it "must be able to move backward" do
      value = 3
      @reply.stubs(:value).returns(value)
      @turtle.backward(value)
      assert_includes(@turtle.commands, "back(#{value})")
    end

    it "must be able to turnleft" do
      degrees = 45
      @turtle.turnleft(degrees)
      assert_includes(@turtle.commands, "turn(#{-degrees})")
    end

    it "must be able to turnright" do
      degrees = 45
      @turtle.turnright(degrees)
      assert_includes(@turtle.commands, "turn(#{degrees})")
    end

    it "must be able to draw" do
      @iface.expects(:call).with('command_turtle', 'draw();').returns(@reply)
      @turtle.draw
    end

    it "must be able to pen up" do
      skip 'Did not convert this yet'
      @iface.expects(:call).with('command_turtle', 'draw();').returns(@reply)
      @turtle.penup
    end

    it "must be able to pen down" do
      skip 'Did not convert this yet'
      @turtle.expects(:add_command)
      @turtle.pendown
    end

    it "must be able to add text" do
      skip 'Did not convert this yet'
      @value = "Some text"
      @reply.stubs(:value).returns(@value)
      @turtle.expects(:add_command)
      @turtle.text(@value)
    end

    it "must be able to change font" do
      skip 'Did not convert this yet'
      @value = "Arial"
      @reply.stubs(:value).returns(@value)
      @turtle.expects(:add_command)
      @turtle.font(@value)
    end

    it "must have a width" do
      @value = 3
      @reply.stubs(:value).returns(@value)
      @iface.expects(:call).with("width").returns(@reply)
      @turtle.width.must_equal(@value)
    end

    it "must have a height" do
      @value = 4
      @reply.stubs(:value).returns(@value)
      @iface.expects(:call).with("height").returns(@reply)
      @turtle.height.must_equal(@value)
    end

  end

  describe "when interpreting colors" do
    before do
      @iface.stubs(:call).returns(@reply)
      @turtle = Turtle.new
    end

    it "must know about green" do
      @turtle.green.must_equal("#008000")
    end

    it "must know about red" do
      @turtle.red.must_equal("#ff0000")
    end

    it "must know about blue" do
      @turtle.blue.must_equal("#0000ff")
    end

    it "must know about chocolate" do
      @turtle.chocolate.must_equal("#d2691e")
    end

    it "must know about rgb colors" do
      @turtle.rgb(255, 0, 0).must_equal("#ff0000")
    end
  end
end
