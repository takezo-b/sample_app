require 'html-scrape'

class SummariesController < ApplicationController
  @url_doc
  @summary_title
  @summary_description

  def index
    if params[:summary_url]
      @url_doc ||= WebPageSummary.new
      @url_doc.open_url(params[:summary_url])
      @summary_title = @url_doc.get_title()
      @summary_description = @url_doc.get_description()
    end
  end

end
