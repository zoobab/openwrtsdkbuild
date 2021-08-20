FROM zoobab/openwrtsdk
ARG giturl
ARG packname
RUN [ -z "$giturl" ] && echo "giturl is required" && exit 1 || true
RUN [ -z "$packname" ] && echo "packname is required" && exit 1 || true
RUN echo "src-git myrepo $giturl" >> feeds.conf.default
RUN ./scripts/feeds update myrepo
RUN ./scripts/feeds install $packname
RUN make package/$packname/compile V=s
RUN ./staging_dir/host/bin/usign -G -s ./key-build -p ./key-build.pub -c "Local build key"
RUN make package/index V=s
ENTRYPOINT ["python", "-m", "SimpleHTTPServer"]
