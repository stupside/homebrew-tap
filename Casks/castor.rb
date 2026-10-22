cask "castor" do
  arch arm: "arm64", intel: "amd64"

  version "v2.3.0"
  sha256 arm:   "5cb9e46cf2350a919e5aae9f57b712c1e7c0d1791600880611edd113f0c742a4",
         intel: "f65bc09dcdad28f8feb84f884ecc6ee7dc727c46d6fbcfe7f42ac9d8aa74ed53"

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
