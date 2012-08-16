# -*- coding: utf-8 -*-
require 'rubygems'                                                                                    
require 'open-uri'
require 'nokogiri'


class WebPageSummary
  attr_accessor :target_url
  @doc

  def open_url(url)
    @target_url = url
    @doc = Nokogiri::HTML(open(target_url))
  end

  def get_title()
    return nil if @doc == nil

    title = @doc.css("title")
    if title != nil
      title.text
    end
  end

  def get_description()
    return nil if @doc == nil

    meta_desc = @doc.css("meta[name='description']").first 
    if meta_desc == nil
      meta_desc = @doc.css("meta[name='Description']").first 
    end
    if meta_desc != nil
      content = meta_desc['content'] 
    else
      content = @doc.css("p").text
    end
  end
end

