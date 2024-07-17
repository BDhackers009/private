mkdir bombardier_tmp
cd bombardier_tmp
go mod init bombardier_tmp
go mod edit -replace github.com/codesenberg/bombardier=github.com/PXEiYyMH8F/bombardier@78-add-proxy-support
go install github.com/codesenberg/bombardier@latest
cd ..
rm -r bombardier_tmp
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
