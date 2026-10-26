cask "castor" do
  arch arm: "arm64", intel: "amd64"

  version "v2.4.0"
  sha256 arm:   "9a6eb84c950ab906152019b5578b93ac6d2b7162381e80cc570acc17dd45b81b",
         intel: "4a624762a36242c77f1f08d08f8323c27b62d22504235ac58a702166682094aa"

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
