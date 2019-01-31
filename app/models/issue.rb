class Issue < ApplicationRecord
  has_many :comments

  def self.import(file)
    spreadsheet = Roo::Spreadsheet.open(file.path)
    header = [:number,:project_id, :owner_id,:executor_id,:priority,:gravity,:frequency,:product_version,:category_id,:send_date,:os,
              :os_version,:platform,:visibility,:updated_at,:summary,:status_id,:resolution_id,:version_code,:issue_type_id]
    (2..spreadsheet.last_row).each do |i|

      row = Hash[[header, spreadsheet.row(i).collect{|x| x.strip if x.present? || x }].transpose]
      row[:project_id] = Project.find_or_create_by(name: row[:project_id]).id
      row[:category_id] = Category.find_or_create_by(name: row[:category_id]).id
      row[:status_id] = Status.find_or_create_by(name: row[:status_id]).id
      row[:resolution_id] = Resolution.find_or_create_by(name: row[:resolution_id]).id
      row[:issue_type_id] = IssueType.find_or_create_by(name: row[:issue_type_id]).id
       if row[:updated_at].blank? or row[:updated_at].nil?
         row[:updated_at] = DateTime.now
       end

      issue = Issue.find_or_create_by(number: row[:number].to_i)
      issue.attributes = row.to_hash
      issue.save!
    end
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
    when ".csv" then Roo::CSV.new(file.path, nil, :ignore)
    when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
    when ".xlsx" then Roo::Excelx.new(file.path, nil, :ignore)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end

end


