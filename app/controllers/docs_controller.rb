class DocsController < ApplicationController
    before_filter :set_menu, :set_doc

    layout 'docs_menu'

  def index
  end

  def show
  end

    private
  def set_menu
      @menu = Doc.select(:name)
  end

  def set_doc
      @doc = Doc.where(:name => params[:name]).first
  end
end
