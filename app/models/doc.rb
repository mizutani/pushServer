class Doc < ActiveRecord::Base
    attr_accessible :description, :message, :name, :parameter, :response, :tag, :url
    serialize :parameter, Hash
end
