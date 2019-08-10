require "uri"
require "cgi"

class Link < ApplicationRecord
  include ActiveModel::AttributeAssignment
  belongs_to :user

  validates :user, presence: true, uniqueness: { scope: :asin }
  validates :asin, presence: true

  def display_title
    self.name || "Product #{self.asin}"
  end

  def parsed_asin
    query_params["creativeASIN"][0]
  end

  def parsed_store
    query_params["tag"][0]
  end

  def self.from_url(url)
    link = Link.new(url: url)

    begin
      link.assign_attributes(asin: link.parsed_asin)
    rescue
      link.errors.add(:url, "Could not parse url")
    end

    link
  end

  private

  def query_params
    @query_params ||= CGI::parse(URI(self.url).query)
  end
end
