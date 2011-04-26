module WillPaginate
  class Collection < Array
    def to_json(options = {})
      page = { (options.delete(:page) || :page) => self.to_a }
      [:current_page, :per_page, :total_entries, :total_pages].each{ |attr| page[attr] = self.send(attr) }
      page.to_json
    end
  end
end