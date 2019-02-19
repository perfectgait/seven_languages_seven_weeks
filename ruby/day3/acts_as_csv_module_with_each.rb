module ActsAsCsv
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def acts_as_csv
      include InstanceMethods
    end
  end

  module InstanceMethods
    def read
      filename = self.class.to_s.downcase + '.txt'
      file = File.new(filename)
      @headers = file.gets.chomp.split(', ')
      @csv_contents = []

      file.each do |row|
        @csv_contents << row.chomp.split(', ')
      end
    end

    def each
      i = 0

      while i < @csv_contents.length
        yield CsvRow.new(@headers, @csv_contents[i])
        i += 1
      end
    end

    attr_accessor :headers, :csv_contents

    def initialize
      read
    end
  end
end

class CsvRow
  def method_missing(name, *args)
    puts @row[@headers.index(name.to_s)]
  end

  def respond_to_missing?(_method_name, _include_private = false)
    true
  end

  def initialize(headers, row)
    @headers = headers
    @row = row
  end
end

class RubyCsv
  include ActsAsCsv
  acts_as_csv
end

csv = RubyCsv.new
csv.each {|row| puts row.one}