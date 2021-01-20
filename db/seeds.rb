# frozen_string_literal: true

seed_files = Dir[File.join(Rails.root, 'db', 'seeds', '*.rb')].sort
seed_files += Dir[File.join(Rails.root, 'db', 'seeds', '{*/}*.rb')].sort

seed_files.each { |seed| load seed }
