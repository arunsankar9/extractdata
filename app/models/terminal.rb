class Terminal < ActiveRecord::Base
	store :attr_values, accessors: [ :values ], coder: JSON
end
