# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)

# Mock Textbringer for testing without the actual dependency
module Textbringer
  class Face
    def self.define(name, **options)
      # Mock Face.define
    end
  end

  class Mode
    attr_reader :buffer

    def initialize(buffer)
      @buffer = buffer
    end

    def self.define_syntax(face, pattern)
      # Mock define_syntax
    end

    def self.file_name_pattern
      @file_name_pattern
    end

    def self.file_name_pattern=(pattern)
      @file_name_pattern = pattern
    end
  end
end

require "textbringer/markdown"

require "test/unit"
