require 'minitest/autorun'
require 'minitest/pride'
require './lib/html_reader'

class HTMLReaderTest < Minitest::Test
  def setup
    @reader = HTMLReader.new
  end

  def test_html_reader_exists
    assert_instance_of HTMLReader, @reader
  end

end