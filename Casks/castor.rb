cask "castor" do
  arch arm: "arm64", intel: "amd64"

  version "1.4.3"
  sha256 arm:   "eb4aa590840646f786adb4e1eb5252125917ced7b01a333413e97ddbecf74350",
         intel: "bbed9429b4750aaac2ae364596d055cdd6daa0cec4b4a7cd59df99a3726d8b04"

  url "https://github.com/stupside/castor/releases/download/v#{version}/castor_#{version}_darwin_#{arch}.tar.gz"
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
