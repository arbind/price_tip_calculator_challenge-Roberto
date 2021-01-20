# frozen_string_literal: true

Jbuilder.key_format ->(key) { key.to_s.chomp('?') }
