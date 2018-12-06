class FileManager
  def initialize(path = 'data/input.json')
    input_file = File.read('data/input.json')
    @data = JSON.parse(input_file)
    @output = Hash[rentals: []]
  end

  def get_data
    @data
  end

  def add_entry_to_file(data)
    @output[:rentals].push(data)
  end

  def output(path='data/output.json')
    output_file = File.new(path, 'w')
    output_file.syswrite(JSON.pretty_generate(@output))
  end
end