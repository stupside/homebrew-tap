cask "castor" do
  arch arm: "arm64", intel: "amd64"

  version "v1.8.0"
  sha256 arm:   "e1ce2c99399ea8e4f9c5afbdb3d3a91b4979171f8a1e36620dc7561a792c47cf",
         intel: "de44f6499fce2175a1ce93185872e5275a3359b124b18394ab98cbd516ef3338"

  url "https://github.com/stupside/castor/releases/download/#{version}/castor_#{version}_darwin_#{arch}.tar.gz"
  name "castor"
  desc "Cast video streams to networked devices"
  homepage "https://github.com/stupside/castor"

  binary "castor"

  # The binary is unsigned, so macOS Gatekeeper quarantines it on download and
  # refuses to run it. Strip the quarantine attribute so it works out of the box.
  postflight do
    system_command "/usr/bin/xattr", args: ["-cr", "#{staged_path}/castor"]
  end

  zap trash: "~/.castor/config.yml"
end
