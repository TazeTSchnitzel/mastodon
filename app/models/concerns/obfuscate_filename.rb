module ObfuscateFilename
  extend ActiveSupport::Concern

  class_methods do
    def obfuscate_filename(*args)
      before_action { obfuscate_filename(*args) }
    end
  end

  def obfuscate_filename(path)
    file = params.dig(*path)
    file.original_filename = "media" + File.extname(file.original_filename)
  end
end
