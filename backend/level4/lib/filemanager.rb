class FileManager
    def initialize(path="data/input.json")
        inputFile = File.read('data/input.json')
        @data = JSON.parse(inputFile)
        @output = Hash["rentals" => []]
    end

    def get_data
        return @data
    end

    def add_entry_to_file(data)
        @output["rentals"].push(data)
    end

    def output(path="data/output.json")
        outputFile = File.new(path, "w")
        outputFile.syswrite(JSON.pretty_generate(@output))
    end
end