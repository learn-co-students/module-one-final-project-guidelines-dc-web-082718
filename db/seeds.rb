class ImportCsv

  @file = File.open("db/albumlist.csv")

  def self.insert_artist_data
    # May need to drop all tables prior to added to DB
    # Shovels what we want to search for in the array
    rows_to_insert = []

    # Parse the CSV file for all Artist object attributes and return array with elements of attributes
    CSV.foreach(@file, :headers => true) do |row|
      row_hash = row.to_hash
      output_hash = {id: row_hash["Number"], name: row_hash["Artist"]}
      rows_to_insert << output_hash
    end
    # Delete Artist elements with the same name
    rows_to_insert.uniq! {|element| element[:name]}

    # Create Artist instance for each elements in row_to_insert and add it to database
    Artist.import(rows_to_insert)
  end

  def self.insert_genre_data
    # May need to drop all tables prior to added to DB
    rows_to_insert = []

    #
    CSV.foreach(@file, :headers => true) do |row|
      row_hash = row.to_hash
      output_hash = {id: row_hash["Number"], name: row_hash["Genre"]}
      rows_to_insert << output_hash
    end
    rows_to_insert.uniq! {|element| element[:name]}

    Genre.import(rows_to_insert)
  end



end
