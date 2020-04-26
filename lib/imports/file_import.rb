class FileImport

  def initialize(path_and_file)
    @file_name = path_and_file
    @data = {}
    @last_name = ''
  end

  def read
    @data = {}
    File.foreach(@file_name) { |line| parseRow(line.chomp) }
    @data
  end

  def parseRow(row)
    data = row.split(' ')
    player = @data[data[0]] ||= { frames: []}
    player[:frames] << '' if new_frame?(data[0])
    fr = player[:frames].last
    fr = fr + '|' unless fr.empty?
    fr = fr + data[1]
    player[:frames][-1] = fr
    @last_name = data[0]
  end

  def new_frame?(name)
    @last_name != name
  end
end
