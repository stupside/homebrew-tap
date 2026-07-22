cask "castor" do
  arch arm: "arm64", intel: "amd64"

  version "v1.7.1"
  sha256 arm:   "267e0d7c6ff89547be035459e6b4b445e1d191ac025dba5530ee7be9989b795b",
         intel: "b6b92cf6d2471b605246396a3a16bf3ec312f938022367d90f2115d8610d74bd"

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
