module PreCommit
  class Configuration
    class Providers

      class Default
        DEFAULTS =
        {
          :warnings => [],
          :checks => [
            :white_space, :console_log, :debugger, :pry, :tabs, :jshint,
            :migrations, :merge_conflict, :local, :nb_space
          ],
        }

        def self.priority
          0
        end

        def initialize(defaults = nil)
          @defaults = defaults || DEFAULTS
        end

        def [](name)
          @defaults[name]
        end
      end

    end
  end
end