cask "castor" do
  arch arm: "arm64", intel: "amd64"

  version "v2.5.0"
  sha256 arm:   "abd1c1fff0386b1e96080a7d1b70cbae2b1d89ccaa9fe34a685c1bc0e00e4383",
         intel: "e5a78a674985ed92a9cb0f89b50c3dd3551bfa8b95c27bcb66372a9609d5b5b9"

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
