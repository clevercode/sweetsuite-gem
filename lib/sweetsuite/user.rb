module SweetSuite

  class User

    include ActiveModel::Naming
    include ActiveModel::Conversion
    include ActiveModel::AttributeMethods

    def self.profile(api)
      user = MultiJson.decode(api.get('profile.json'))['user']
      new(user)
    end

    def initialize(attributes)
      @attributes = attributes  
    end

    # Always is persisted, since the source of the data is remote
    def persisted?
      true
    end

    ##  Attribute Handling
    def attributes
      @attributes
    end

    def attribute(attr)
      attributes[attr]
    end
    attribute_method_suffix ''


    define_attribute_methods [:first_name, :last_name, :email]


    def name
      '%s %s' % [ first_name, last_name ]
    end


  end

end
