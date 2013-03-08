# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
ENV['S3_KEY']='AKIAI6KCYFLBUQWLVU6Q'
ENV['S3_SECRET']='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'
ENV['S3_BUCKET']='quCircuit'
Refinery.s3_backend = true
Zaytona::Application.initialize!
