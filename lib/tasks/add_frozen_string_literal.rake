# frozen_string_literal: true

namespace :string_literal do
  desc "Add frozen_string_literal comment to all Ruby files"
  task add: :environment do
    Dir.glob('**/*.rb').each do |file|
      next if File.read(file).start_with?('# frozen_string_literal: true')

      content = "# frozen_string_literal: true\n\n" + File.read(file)
      File.write(file, content)
    end
  end
end
