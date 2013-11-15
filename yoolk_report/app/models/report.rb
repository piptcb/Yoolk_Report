class Report
  REPORT_NAMES = [
    "Number of Listing in each province",
    "Who is the best operator?"
    ]

  def self.report_name(report_nb)
    try(REPORT_NAMES[report_nb.to_i])
  end

  def self.data_for_chart(report_nb)
    r_nb = report_nb.to_i
    case r_nb
    when 0
      data_for_bar_chart(REPORT_NAMES[r_nb])
    when 1
      data_for_area_chart(REPORT_NAMES[r_nb])
    end
  end

  private
    def self.data_for_bar_chart(report_name)
      puts report_name
      [
        {
          key: report_name,
          values: [
            { label: "PP", value: 102934},
            { label: "BB", value: 10934},
            { label: "SHV", value: 12934},
            { label: "KCHAM", value: 101934},
            { label: "SR", value: 102034},
            { label: "KP", value: 2934}
          ]
        }
      ].to_json
    end
end
