cask "castor" do
  arch arm: "arm64", intel: "amd64"

  version "v1.6.2"
  sha256 arm:   "1b88100e06f85abad7adb1a6e0f49cdd8ba760a609a854459b94065d623fa54d",
         intel: "b4cc1fb2bc4e3877c1bc8f9acbd3ff474e50fcf09d47ce5e5fa2c4012fe78ae4"

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
