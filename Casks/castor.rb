cask "castor" do
  arch arm: "arm64", intel: "amd64"

  version "v2.0.0"
  sha256 arm:   "44f0d07041440561a165fbbe130d362b19a539116a62b80529e877527d46b582",
         intel: "e020e2ae7aeaff344a92820ec899540e270ee178eb1a4bd5d7419cfa09b3ef90"

  url "https://github.com/stupside/castor/releases/download/#{version}/castor_#{version}_darwin_#{arch}.tar.gz"
  name "castor"
  desc "Cast video streams to networked devices"
  homepage "https://github.com/stupside/castor"

  binary "castor"

  # Unsigned, so Gatekeeper would quarantine it.
  postflight do
    system_command "/usr/bin/xattr", args: ["-cr", "#{staged_path}/castor"]
  end
end
