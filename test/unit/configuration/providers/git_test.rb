require 'minitest_helper'
require 'plugins/pre_commit/configuration/providers/git'

describe PreCommit::Configuration::Providers::Git do
  subject do
    PreCommit::Configuration::Providers::Git
  end

  it "has priority" do
    subject.priority.must_equal(10)
  end

  describe :filesystem do
    before do
      create_temp_dir
      start_git
      sh "git config pre-commit.test2 3"
      sh "git config pre-commit.test3 4"
    end
    after(&:destroy_temp_dir)

    it "reads values" do
      example = subject.new
      example[:test1].must_equal(nil)
      example[:test2].must_equal("3")
      example[:test3].must_equal("4")
    end
  end
end