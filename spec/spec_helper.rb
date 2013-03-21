class FillMeInError < StandardError
end

def __
  'FILL ME IN'
end

def _n_
  999999
end

def ruby_version?(version)
  RUBY_VERSION =~ /^#{version}/ ||
      (version == 'jruby' && defined?(JRUBY_VERSION)) ||
      (version == 'mri' && !defined?(JRUBY_VERSION))
end

def in_ruby_version(*versions)
  yield if versions.any? { |v| ruby_version?(v) }
end

class Object
  def ____(method=nil)
    if method
      self.send(method)
    end
  end

  in_ruby_version("1.9") do
    public :method_missing
  end
end

