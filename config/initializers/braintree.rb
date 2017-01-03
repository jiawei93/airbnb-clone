Braintree::Configuration.environment = :sandbox
Braintree::Configuration.logger = Logger.new('log/braintree.log'),
Braintree::Configuration.merchant_id = ENV['BRAIN_TREE_ID'],
Braintree::Configuration.public_id = ENV['BRAIN_TREE_KEY'],
Braintree::Configuration.private_key = ENV['BRAIN_TREE_SECRET_KEY']
