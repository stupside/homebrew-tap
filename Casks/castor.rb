cask "castor" do
  arch arm: "arm64", intel: "amd64"

  version "v2.2.0"
  sha256 arm:   "3e0a0dd9cff20e91d97fab4ced622ae41fac36005767176a80c8bd44dce001ee",
         intel: "18911d2bb00111067409a92844cc9c0041aa7e8300d682bd11d9f3fd61c51e86"

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
