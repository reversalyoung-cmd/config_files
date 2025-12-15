function gowinfix
    set -l args $argv

    env CGO_ENABLED=1 \
        GOOS=windows GOARCH=amd64 \
        CC=x86_64-w64-mingw32-gcc \
        CXX=x86_64-w64-mingw32-g++ \
        go build \
        -ldflags '-s -w -extldflags "-static -static-libgcc -static-libstdc++"' \
        $args
end
