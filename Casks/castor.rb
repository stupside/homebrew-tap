cask "castor" do
  arch arm: "arm64", intel: "amd64"

  version "v2.1.0"
  sha256 arm:   "7cdb54ba9618ee173d9dca873c60742bcf54afbe292a199ee818e8a9ee9d9ed8",
         intel: "cb9bf8d9a137ef6300969d3efe6c15181efa85604877cfbad4cf0c22cba28a62"

  url "https://github.com/stupside/castor/releases/download/#{version}/castor_#{version}_darwin_#{arch}.tar.gz"
  name "castor"
  desc "Cast video streams to networked devices"
  homepage "https://github.com/stupside/castor"

  binary "castor"

  # Unsigned, so Gatekeeper would quarantine it. The block form of postflight is
  # deprecated, and postflight_steps has neither system_command nor staged_path.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-cr", "{{staged_path}}/castor"]
  end
end
