module ObfuscateFilename
  extend ActiveSupport::Concern

  module ClassMethods
    def self.obfuscate_filename(*args)
      before_action { obfuscate_filename(*args) }
    end
  end

  def obfuscate_filename(path)
    file = Array(path).reduce { |params, key| params[key] }
    file.original_filename = "media" + File.extname(file.original_filename)
  end
end