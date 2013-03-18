def __
  "FILL ME IN"
end

def _n_
  999999
end

def ruby_version?(version)
  RUBY_VERSION =~ /^#{version}/ ||
      (version == 'jruby' && defined?(JRUBY_VERSION)) ||
      (version == 'mri' && ! defined?(JRUBY_VERSION))
end

def in_ruby_version(*versions)
  yield if versions.any? { |v| ruby_version?(v) }
end