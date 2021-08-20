# Build your own PPA package for OpenWRT

## How to build

This is an example of an helloworld written in C++:

```
$ docker build --build-arg giturl=https://github.com/zoobab/openwrt_helloworld --build-arg packname=helloworld -t hellowordcpp .

## Example of output

Sending build context to Docker daemon  79.36kB
Step 1/12 : FROM zoobab/openwrtsdk
 ---> b9618c104016
Step 2/12 : ARG giturl
 ---> Running in 584860a70673
Removing intermediate container 584860a70673
 ---> c5413a034f3a
Step 3/12 : ARG packname
 ---> Running in 25d2a5a7d689
Removing intermediate container 25d2a5a7d689
 ---> 8bc9b673e510
Step 4/12 : RUN [ -z "$giturl" ] && echo "giturl is required" && exit 1 || true
 ---> Running in d0aadd10b8a2
Removing intermediate container d0aadd10b8a2
 ---> b73c7ca83d01
Step 5/12 : RUN [ -z "$packname" ] && echo "packname is required" && exit 1 || true
 ---> Running in a47b032373b9
Removing intermediate container a47b032373b9
 ---> 3e61cf224511
Step 6/12 : RUN echo "src-git myrepo $giturl" >> feeds.conf.default
 ---> Running in b8856c44f207
Removing intermediate container b8856c44f207
 ---> 7bb971226652
Step 7/12 : RUN ./scripts/feeds update myrepo
 ---> Running in 4960d5e7032e
[91mUpdating feed 'myrepo' from 'https://github.com/zoobab/openwrt_helloworld' ...
[0m[91mCloning into './feeds/myrepo'...
[0m[91mCreate index file './feeds/myrepo.index' 
[0m[91m[MCollecting package info: feeds/myrepo/helloworld[0m[91m[MCollecting package info: merging...[0m[91m[MCollecting package info: done[0m
[91m[MCollecting target info: merging...[0m[91m[MCollecting target info: done[0m
Removing intermediate container 4960d5e7032e
 ---> 3e0c3371b229
Step 8/12 : RUN ./scripts/feeds install $packname
 ---> Running in e9836d9b8de3
[91mWARNING: Makefile 'package/linux/Makefile' has a dependency on 'r8169-firmware', which does not exist
WARNING: Makefile 'package/linux/Makefile' has a dependency on 'e100-firmware', which does not exist
WARNING: Makefile 'package/linux/Makefile' has a dependency on 'bnx2-firmware', which does not exist
[0m[91mWARNING: Makefile 'package/linux/Makefile' has a dependency on 'ar3k-firmware', which does not exist
WARNING: Makefile 'package/linux/Makefile' has a dependency on 'mwifiex-sdio-firmware', which does not exist
[0m[91mWARNING: Makefile 'package/linux/Makefile' has a dependency on 'kmod-phy-bcm-ns-usb2', which does not exist
WARNING: Makefile 'package/linux/Makefile' has a dependency on 'edgeport-firmware', which does not exist
[0m[91mWARNING: Makefile 'package/linux/Makefile' has a dependency on 'kmod-phy-bcm-ns-usb3', which does not exist
WARNING: Makefile 'package/linux/Makefile' has a dependency on 'amdgpu-firmware', which does not exist
[0m[91mWARNING: Makefile 'package/linux/Makefile' has a dependency on 'radeon-firmware', which does not exist
[0m[91mWARNING: Makefile 'package/linux/Makefile' has a dependency on 'prism54-firmware', which does not exist
WARNING: Makefile 'package/linux/Makefile' has a dependency on 'rtl8192su-firmware', which does not exist
[0m[91mInstalling package 'helloworld' from myrepo
[0mRemoving intermediate container e9836d9b8de3
 ---> f4a5c15efe78
Step 9/12 : RUN make package/$packname/compile V=s
 ---> Running in 9da2c037a004

[91mWARNING: Makefile 'package/linux/Makefile' has a dependency on 'r8169-firmware', which does not exist
WARNING: Makefile 'package/linux/Makefile' has a dependency on 'e100-firmware', which does not exist
WARNING: Makefile 'package/linux/Makefile' has a dependency on 'bnx2-firmware', which does not exist
[0m[91mWARNING: Makefile 'package/linux/Makefile' has a dependency on 'ar3k-firmware', which does not exist
WARNING: Makefile 'package/linux/Makefile' has a dependency on 'mwifiex-sdio-firmware', which does not exist
[0m[91mWARNING: Makefile 'package/linux/Makefile' has a dependency on 'kmod-phy-bcm-ns-usb2', which does not exist
WARNING: Makefile 'package/linux/Makefile' has a dependency on 'edgeport-firmware', which does not exist
[0m[91mWARNING: Makefile 'package/linux/Makefile' has a dependency on 'kmod-phy-bcm-ns-usb3', which does not exist
[0m[91mWARNING: Makefile 'package/linux/Makefile' has a dependency on 'amdgpu-firmware', which does not exist
WARNING: Makefile 'package/linux/Makefile' has a dependency on 'radeon-firmware', which does not exist
[0m[91mWARNING: Makefile 'package/linux/Makefile' has a dependency on 'prism54-firmware', which does not exist
WARNING: Makefile 'package/linux/Makefile' has a dependency on 'rtl8192su-firmware', which does not exist
[0m[91mtmp/.config-package.in:36:warning: ignoring type redefinition of 'PACKAGE_libc' from 'boolean' to 'tristate'
tmp/.config-package.in:64:warning: ignoring type redefinition of 'PACKAGE_libgcc' from 'boolean' to 'tristate'
tmp/.config-package.in:149:warning: ignoring type redefinition of 'PACKAGE_libpthread' from 'boolean' to 'tristate'
tmp/.config-package.in:177:warning: ignoring type redefinition of 'PACKAGE_librt' from 'boolean' to 'tristate'
[0m#
# configuration written to .config
#
make[1]: Entering directory '/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64'
make[2]: Entering directory '/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/package/toolchain'
[91mMakefile:630: WARNING: skipping libgomp -- package has no install section
[0mtouch /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/.prepared_f88a79181f9c4112cf17b0d42c88ac34_18f1e190c5d53547fed41a3eaa76e9e9_check
mkdir -p /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain
touch /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/.prepared_f88a79181f9c4112cf17b0d42c88ac34_18f1e190c5d53547fed41a3eaa76e9e9
rm -f /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/.configured_*
rm -f /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/target-x86_64_musl/stamp/.toolchain_installed
(cd /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/./; if [ -x ./configure ]; then find /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/ -name config.guess | xargs -r chmod u+w; find /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/ -name config.guess | xargs -r -n1 cp --remove-destination /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/scripts/config.guess; find /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/ -name config.sub | xargs -r chmod u+w; find /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/ -name config.sub | xargs -r -n1 cp --remove-destination /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/scripts/config.sub; AR="x86_64-openwrt-linux-musl-gcc-ar" AS="x86_64-openwrt-linux-musl-gcc -c -Os -pipe -fno-caller-saves -fno-plt -fhonour-copts -Wno-error=unused-but-set-variable -Wno-error=unused-result -iremap/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain:toolchain -Wformat -Werror=format-security -fstack-protector -D_FORTIFY_SOURCE=1 -Wl,-z,now -Wl,-z,relro" LD=x86_64-openwrt-linux-musl-ld NM="x86_64-openwrt-linux-musl-gcc-nm" CC="x86_64-openwrt-linux-musl-gcc" GCC="x86_64-openwrt-linux-musl-gcc" CXX="x86_64-openwrt-linux-musl-g++" RANLIB="x86_64-openwrt-linux-musl-gcc-ranlib" STRIP=x86_64-openwrt-linux-musl-strip OBJCOPY=x86_64-openwrt-linux-musl-objcopy OBJDUMP=x86_64-openwrt-linux-musl-objdump SIZE=x86_64-openwrt-linux-musl-size CFLAGS="-Os -pipe -fno-caller-saves -fno-plt -fhonour-copts -Wno-error=unused-but-set-variable -Wno-error=unused-result -iremap/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain:toolchain -Wformat -Werror=format-security -fstack-protector -D_FORTIFY_SOURCE=1 -Wl,-z,now -Wl,-z,relro " CXXFLAGS="-Os -pipe -fno-caller-saves -fno-plt -fhonour-copts -Wno-error=unused-but-set-variable -Wno-error=unused-result -iremap/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain:toolchain -Wformat -Werror=format-security -fstack-protector -D_FORTIFY_SOURCE=1 -Wl,-z,now -Wl,-z,relro " CPPFLAGS="-I/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/target-x86_64_musl/usr/include -I/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/target-x86_64_musl/include -I/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/toolchain-x86_64_gcc-7.5.0_musl/usr/include -I/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/toolchain-x86_64_gcc-7.5.0_musl/include/fortify -I/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/toolchain-x86_64_gcc-7.5.0_musl/include " LDFLAGS="-L/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/target-x86_64_musl/usr/lib -L/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/target-x86_64_musl/lib -L/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/toolchain-x86_64_gcc-7.5.0_musl/usr/lib -L/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/toolchain-x86_64_gcc-7.5.0_musl/lib -znow -zrelro "   ./configure --target=x86_64-openwrt-linux --host=x86_64-openwrt-linux --build=x86_64-pc-linux-musl --program-prefix="" --program-suffix="" --prefix=/usr --exec-prefix=/usr --bindir=/usr/bin --sbindir=/usr/sbin --libexecdir=/usr/lib --sysconfdir=/etc --datadir=/usr/share --localstatedir=/var --mandir=/usr/man --infodir=/usr/info --disable-nls  ; fi; )
touch /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/.configured_68b329da9893e34099c7d8ad5cb9c940
rm -f /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/.built
touch /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/.built_check
cp -fpR /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/toolchain-x86_64_gcc-7.5.0_musl/lib/libgcc_s.so.1 /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/
touch /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/.built
rm -rf /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/.pkgdir/libc.installed /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/.pkgdir/libc
mkdir -p /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/.pkgdir/libc
install -d -m0755 /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/.pkgdir/libc/lib /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/.pkgdir/libc/usr/bin
cp -fpR /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/toolchain-x86_64_gcc-7.5.0_musl/lib/ld-musl-*.so* /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/.pkgdir/libc/lib/
cp -fpR /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/toolchain-x86_64_gcc-7.5.0_musl/lib/libc.so* /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/.pkgdir/libc/lib/
ln -sf ../../lib/libc.so /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/.pkgdir/libc/usr/bin/ldd
cp -fpR /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/toolchain-x86_64_gcc-7.5.0_musl/lib/libatomic.a /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/toolchain-x86_64_gcc-7.5.0_musl/lib/libc.a /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/toolchain-x86_64_gcc-7.5.0_musl/lib/libcilkrts.a /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/toolchain-x86_64_gcc-7.5.0_musl/lib/libcrypt.a /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/toolchain-x86_64_gcc-7.5.0_musl/lib/libdl.a /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/toolchain-x86_64_gcc-7.5.0_musl/lib/libitm.a /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/toolchain-x86_64_gcc-7.5.0_musl/lib/libm.a /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/toolchain-x86_64_gcc-7.5.0_musl/lib/libpthread.a /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/toolchain-x86_64_gcc-7.5.0_musl/lib/libquadmath.a /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/toolchain-x86_64_gcc-7.5.0_musl/lib/libresolv.a /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/toolchain-x86_64_gcc-7.5.0_musl/lib/librt.a /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/toolchain-x86_64_gcc-7.5.0_musl/lib/libssp_nonshared.a /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/toolchain-x86_64_gcc-7.5.0_musl/lib/libstdc++.a /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/toolchain-x86_64_gcc-7.5.0_musl/lib/libstdc++fs.a /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/toolchain-x86_64_gcc-7.5.0_musl/lib/libsupc++.a /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/toolchain-x86_64_gcc-7.5.0_musl/lib/libutil.a /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/toolchain-x86_64_gcc-7.5.0_musl/lib/libxnet.a /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/.pkgdir/libc/lib/
cp -fpR /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/toolchain-x86_64_gcc-7.5.0_musl/lib/gcc/x86_64-openwrt-linux-musl/7.5.0/libgcc_pic.a /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/.pkgdir/libc/lib/libgcc_s_pic.a; cp -fpR /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/toolchain-x86_64_gcc-7.5.0_musl/lib/gcc/x86_64-openwrt-linux-musl/7.5.0/libgcc.map /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/.pkgdir/libc/lib/libgcc_s_pic.map 
touch /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/.pkgdir/libc.installed
mkdir -p /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/target-x86_64_musl/root-x86/stamp
SHELL= flock /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/tmp/.root-copy.flock -c 'cp -fpR /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/.pkgdir/libc/. /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/target-x86_64_musl/root-x86/'
touch /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/target-x86_64_musl/root-x86/stamp/.libc_installed
mkdir -p /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/bin/targets/x86/64/packages /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/ipkg-x86_64/libgcc/CONTROL /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/target-x86_64_musl/pkginfo
install -d -m0755 /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/ipkg-x86_64/libgcc/lib
cp -fpR /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/toolchain-x86_64_gcc-7.5.0_musl/lib/libgcc_s.so.* /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/ipkg-x86_64/libgcc/lib/
find /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/ipkg-x86_64/libgcc -name 'CVS' -o -name '.svn' -o -name '.#*' -o -name '*~'| xargs -r rm -rf
export CROSS="x86_64-openwrt-linux-musl-"   ; NM="x86_64-openwrt-linux-musl-nm" STRIP="/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/host/bin/sstrip" STRIP_KMOD="/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/scripts/strip-kmod.sh" PATCHELF="/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/host/bin/patchelf" /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/scripts/rstrip.sh /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/ipkg-x86_64/libgcc
rstrip.sh: /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/ipkg-x86_64/libgcc/lib/libgcc_s.so.1: shared object
(cd /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/ipkg-x86_64/libgcc/CONTROL; ( echo "$CONTROL"; printf "Description: "; echo "$DESCRIPTION" | sed -e 's,^[[:space:]]*, ,g'; ) > control; chmod 644 control; ( echo "#!/bin/sh"; echo "[ \"\${IPKG_NO_SCRIPT}\" = \"1\" ] && exit 0"; echo "[ -x "\${IPKG_INSTROOT}/lib/functions.sh" ] || exit 0"; echo ". \${IPKG_INSTROOT}/lib/functions.sh"; echo "default_postinst \$0 \$@"; ) > postinst; ( echo "#!/bin/sh"; echo "[ -x "\${IPKG_INSTROOT}/lib/functions.sh" ] || exit 0"; echo ". \${IPKG_INSTROOT}/lib/functions.sh"; echo "default_prerm \$0 \$@"; ) > prerm; chmod 0755 postinst prerm;  )
install -d -m0755 /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/bin/targets/x86/64/packages
/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/scripts/ipkg-build -c -o 0 -g 0 /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/ipkg-x86_64/libgcc /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/bin/targets/x86/64/packages
Packaged contents of /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/ipkg-x86_64/libgcc into /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/bin/targets/x86/64/packages/libgcc1_7.5.0-2_x86_64.ipk
mkdir -p /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/bin/targets/x86/64/packages /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/ipkg-x86_64/libc/CONTROL /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/target-x86_64_musl/pkginfo
install -d -m0755 /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/ipkg-x86_64/libc/lib /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/ipkg-x86_64/libc/usr/bin
cp -fpR /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/toolchain-x86_64_gcc-7.5.0_musl/lib/ld-musl-*.so* /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/ipkg-x86_64/libc/lib/
cp -fpR /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/toolchain-x86_64_gcc-7.5.0_musl/lib/libc.so* /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/ipkg-x86_64/libc/lib/
ln -sf ../../lib/libc.so /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/ipkg-x86_64/libc/usr/bin/ldd
find /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/ipkg-x86_64/libc -name 'CVS' -o -name '.svn' -o -name '.#*' -o -name '*~'| xargs -r rm -rf
export CROSS="x86_64-openwrt-linux-musl-"   ; NM="x86_64-openwrt-linux-musl-nm" STRIP="/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/host/bin/sstrip" STRIP_KMOD="/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/scripts/strip-kmod.sh" PATCHELF="/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/host/bin/patchelf" /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/scripts/rstrip.sh /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/ipkg-x86_64/libc
rstrip.sh: /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/ipkg-x86_64/libc/lib/libc.so: shared object
(cd /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/ipkg-x86_64/libc/CONTROL; ( echo "$CONTROL"; printf "Description: "; echo "$DESCRIPTION" | sed -e 's,^[[:space:]]*, ,g'; ) > control; chmod 644 control; ( echo "#!/bin/sh"; echo "[ \"\${IPKG_NO_SCRIPT}\" = \"1\" ] && exit 0"; echo "[ -x "\${IPKG_INSTROOT}/lib/functions.sh" ] || exit 0"; echo ". \${IPKG_INSTROOT}/lib/functions.sh"; echo "default_postinst \$0 \$@"; ) > postinst; ( echo "#!/bin/sh"; echo "[ -x "\${IPKG_INSTROOT}/lib/functions.sh" ] || exit 0"; echo ". \${IPKG_INSTROOT}/lib/functions.sh"; echo "default_prerm \$0 \$@"; ) > prerm; chmod 0755 postinst prerm;  )
install -d -m0755 /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/bin/targets/x86/64/packages
/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/scripts/ipkg-build -c -o 0 -g 0 /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/ipkg-x86_64/libc /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/bin/targets/x86/64/packages
Packaged contents of /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/ipkg-x86_64/libc into /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/bin/targets/x86/64/packages/libc_1.1.24-2_x86_64.ipk
mkdir -p /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/bin/targets/x86/64/packages /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/ipkg-x86_64/libatomic/CONTROL /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/target-x86_64_musl/pkginfo
install -d -m0755 /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/ipkg-x86_64/libatomic/lib
cp -fpR /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/toolchain-x86_64_gcc-7.5.0_musl/lib/libatomic.so.* /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/ipkg-x86_64/libatomic/lib/
find /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/ipkg-x86_64/libatomic -name 'CVS' -o -name '.svn' -o -name '.#*' -o -name '*~'| xargs -r rm -rf
export CROSS="x86_64-openwrt-linux-musl-"   ; NM="x86_64-openwrt-linux-musl-nm" STRIP="/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/host/bin/sstrip" STRIP_KMOD="/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/scripts/strip-kmod.sh" PATCHELF="/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/host/bin/patchelf" /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/scripts/rstrip.sh /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/ipkg-x86_64/libatomic
rstrip.sh: /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/ipkg-x86_64/libatomic/lib/libatomic.so.1.2.0: shared object
(cd /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/ipkg-x86_64/libatomic/CONTROL; ( echo "$CONTROL"; printf "Description: "; echo "$DESCRIPTION" | sed -e 's,^[[:space:]]*, ,g'; ) > control; chmod 644 control; ( echo "#!/bin/sh"; echo "[ \"\${IPKG_NO_SCRIPT}\" = \"1\" ] && exit 0"; echo "[ -x "\${IPKG_INSTROOT}/lib/functions.sh" ] || exit 0"; echo ". \${IPKG_INSTROOT}/lib/functions.sh"; echo "default_postinst \$0 \$@"; ) > postinst; ( echo "#!/bin/sh"; echo "[ -x "\${IPKG_INSTROOT}/lib/functions.sh" ] || exit 0"; echo ". \${IPKG_INSTROOT}/lib/functions.sh"; echo "default_prerm \$0 \$@"; ) > prerm; chmod 0755 postinst prerm;  )
install -d -m0755 /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/bin/targets/x86/64/packages
/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/scripts/ipkg-build -c -o 0 -g 0 /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/ipkg-x86_64/libatomic /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/bin/targets/x86/64/packages
Packaged contents of /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/ipkg-x86_64/libatomic into /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/bin/targets/x86/64/packages/libatomic1_7.5.0-2_x86_64.ipk
mkdir -p /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/bin/targets/x86/64/packages /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/ipkg-x86_64/libstdcpp/CONTROL /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/target-x86_64_musl/pkginfo
install -d -m0755 /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/ipkg-x86_64/libstdcpp/usr/lib
cp -fpR /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/toolchain-x86_64_gcc-7.5.0_musl/lib/libstdc++.so.* /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/ipkg-x86_64/libstdcpp/usr/lib/
find /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/ipkg-x86_64/libstdcpp -name 'CVS' -o -name '.svn' -o -name '.#*' -o -name '*~'| xargs -r rm -rf
export CROSS="x86_64-openwrt-linux-musl-"   ; NM="x86_64-openwrt-linux-musl-nm" STRIP="/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/host/bin/sstrip" STRIP_KMOD="/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/scripts/strip-kmod.sh" PATCHELF="/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/host/bin/patchelf" /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/scripts/rstrip.sh /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/ipkg-x86_64/libstdcpp
rstrip.sh: /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/ipkg-x86_64/libstdcpp/usr/lib/libstdc++.so.6.0.24: shared object
(cd /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/ipkg-x86_64/libstdcpp/CONTROL; ( echo "$CONTROL"; printf "Description: "; echo "$DESCRIPTION" | sed -e 's,^[[:space:]]*, ,g'; ) > control; chmod 644 control; ( echo "#!/bin/sh"; echo "[ \"\${IPKG_NO_SCRIPT}\" = \"1\" ] && exit 0"; echo "[ -x "\${IPKG_INSTROOT}/lib/functions.sh" ] || exit 0"; echo ". \${IPKG_INSTROOT}/lib/functions.sh"; echo "default_postinst \$0 \$@"; ) > postinst; ( echo "#!/bin/sh"; echo "[ -x "\${IPKG_INSTROOT}/lib/functions.sh" ] || exit 0"; echo ". \${IPKG_INSTROOT}/lib/functions.sh"; echo "default_prerm \$0 \$@"; ) > prerm; chmod 0755 postinst prerm;  )
install -d -m0755 /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/bin/targets/x86/64/packages
/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/scripts/ipkg-build -c -o 0 -g 0 /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/ipkg-x86_64/libstdcpp /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/bin/targets/x86/64/packages
Packaged contents of /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/ipkg-x86_64/libstdcpp into /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/bin/targets/x86/64/packages/libstdcpp6_7.5.0-2_x86_64.ipk
mkdir -p /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/bin/targets/x86/64/packages /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/ipkg-x86_64/libpthread/CONTROL /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/target-x86_64_musl/pkginfo
install -d -m0755 /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/ipkg-x86_64/libpthread/lib
find /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/ipkg-x86_64/libpthread -name 'CVS' -o -name '.svn' -o -name '.#*' -o -name '*~'| xargs -r rm -rf
export CROSS="x86_64-openwrt-linux-musl-"   ; NM="x86_64-openwrt-linux-musl-nm" STRIP="/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/host/bin/sstrip" STRIP_KMOD="/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/scripts/strip-kmod.sh" PATCHELF="/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/host/bin/patchelf" /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/scripts/rstrip.sh /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/ipkg-x86_64/libpthread
(cd /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/ipkg-x86_64/libpthread/CONTROL; ( echo "$CONTROL"; printf "Description: "; echo "$DESCRIPTION" | sed -e 's,^[[:space:]]*, ,g'; ) > control; chmod 644 control; ( echo "#!/bin/sh"; echo "[ \"\${IPKG_NO_SCRIPT}\" = \"1\" ] && exit 0"; echo "[ -x "\${IPKG_INSTROOT}/lib/functions.sh" ] || exit 0"; echo ". \${IPKG_INSTROOT}/lib/functions.sh"; echo "default_postinst \$0 \$@"; ) > postinst; ( echo "#!/bin/sh"; echo "[ -x "\${IPKG_INSTROOT}/lib/functions.sh" ] || exit 0"; echo ". \${IPKG_INSTROOT}/lib/functions.sh"; echo "default_prerm \$0 \$@"; ) > prerm; chmod 0755 postinst prerm;  )
install -d -m0755 /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/bin/targets/x86/64/packages
/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/scripts/ipkg-build -c -o 0 -g 0 /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/ipkg-x86_64/libpthread /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/bin/targets/x86/64/packages
Packaged contents of /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/ipkg-x86_64/libpthread into /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/bin/targets/x86/64/packages/libpthread_1.1.24-2_x86_64.ipk
mkdir -p /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/bin/targets/x86/64/packages /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/ipkg-x86_64/librt/CONTROL /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/target-x86_64_musl/pkginfo
install -d -m0755 /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/ipkg-x86_64/librt/lib
find /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/ipkg-x86_64/librt -name 'CVS' -o -name '.svn' -o -name '.#*' -o -name '*~'| xargs -r rm -rf
export CROSS="x86_64-openwrt-linux-musl-"   ; NM="x86_64-openwrt-linux-musl-nm" STRIP="/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/host/bin/sstrip" STRIP_KMOD="/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/scripts/strip-kmod.sh" PATCHELF="/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/host/bin/patchelf" /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/scripts/rstrip.sh /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/ipkg-x86_64/librt
(cd /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/ipkg-x86_64/librt/CONTROL; ( echo "$CONTROL"; printf "Description: "; echo "$DESCRIPTION" | sed -e 's,^[[:space:]]*, ,g'; ) > control; chmod 644 control; ( echo "#!/bin/sh"; echo "[ \"\${IPKG_NO_SCRIPT}\" = \"1\" ] && exit 0"; echo "[ -x "\${IPKG_INSTROOT}/lib/functions.sh" ] || exit 0"; echo ". \${IPKG_INSTROOT}/lib/functions.sh"; echo "default_postinst \$0 \$@"; ) > postinst; ( echo "#!/bin/sh"; echo "[ -x "\${IPKG_INSTROOT}/lib/functions.sh" ] || exit 0"; echo ". \${IPKG_INSTROOT}/lib/functions.sh"; echo "default_prerm \$0 \$@"; ) > prerm; chmod 0755 postinst prerm;  )
install -d -m0755 /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/bin/targets/x86/64/packages
/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/scripts/ipkg-build -c -o 0 -g 0 /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/ipkg-x86_64/librt /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/bin/targets/x86/64/packages
Packaged contents of /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/ipkg-x86_64/librt into /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/bin/targets/x86/64/packages/librt_1.1.24-2_x86_64.ipk
echo "libc" >> /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/target-x86_64_musl/pkginfo/toolchain.default.install
rm -rf /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/.pkgdir/libgcc.installed /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/.pkgdir/libgcc
mkdir -p /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/.pkgdir/libgcc
install -d -m0755 /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/.pkgdir/libgcc/lib
cp -fpR /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/toolchain-x86_64_gcc-7.5.0_musl/lib/libgcc_s.so.* /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/.pkgdir/libgcc/lib/
touch /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/.pkgdir/libgcc.installed
rm -rf /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/.pkgdir/libatomic.installed /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/.pkgdir/libatomic
mkdir -p /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/.pkgdir/libatomic
install -d -m0755 /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/.pkgdir/libatomic/lib
cp -fpR /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/toolchain-x86_64_gcc-7.5.0_musl/lib/libatomic.so.* /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/.pkgdir/libatomic/lib/
touch /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/.pkgdir/libatomic.installed
rm -rf /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/.pkgdir/libstdcpp.installed /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/.pkgdir/libstdcpp
mkdir -p /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/.pkgdir/libstdcpp
install -d -m0755 /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/.pkgdir/libstdcpp/usr/lib
cp -fpR /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/toolchain-x86_64_gcc-7.5.0_musl/lib/libstdc++.so.* /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/.pkgdir/libstdcpp/usr/lib/
touch /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/.pkgdir/libstdcpp.installed
rm -rf /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/.pkgdir/libpthread.installed /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/.pkgdir/libpthread
mkdir -p /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/.pkgdir/libpthread
install -d -m0755 /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/.pkgdir/libpthread/lib
touch /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/.pkgdir/libpthread.installed
rm -rf /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/.pkgdir/librt.installed /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/.pkgdir/librt
mkdir -p /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/.pkgdir/librt
install -d -m0755 /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/.pkgdir/librt/lib
touch /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/.pkgdir/librt.installed
mkdir -p /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/target-x86_64_musl/root-x86/stamp
echo '1' | cmp -s - /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/target-x86_64_musl/pkginfo/libgcc.version || echo '1' > /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/target-x86_64_musl/pkginfo/libgcc.version
SHELL= flock /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/tmp/.root-copy.flock -c 'cp -fpR /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/.pkgdir/libgcc/. /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/target-x86_64_musl/root-x86/'
touch /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/target-x86_64_musl/root-x86/stamp/.libgcc_installed
echo "libgcc" >> /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/target-x86_64_musl/pkginfo/toolchain.default.install
mkdir -p /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/target-x86_64_musl/root-x86/stamp
echo '1' | cmp -s - /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/target-x86_64_musl/pkginfo/libatomic.version || echo '1' > /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/target-x86_64_musl/pkginfo/libatomic.version
SHELL= flock /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/tmp/.root-copy.flock -c 'cp -fpR /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/.pkgdir/libatomic/. /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/target-x86_64_musl/root-x86/'
touch /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/target-x86_64_musl/root-x86/stamp/.libatomic_installed
mkdir -p /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/target-x86_64_musl/root-x86/stamp
echo '6' | cmp -s - /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/target-x86_64_musl/pkginfo/libstdcpp.version || echo '6' > /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/target-x86_64_musl/pkginfo/libstdcpp.version
SHELL= flock /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/tmp/.root-copy.flock -c 'cp -fpR /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/.pkgdir/libstdcpp/. /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/target-x86_64_musl/root-x86/'
touch /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/target-x86_64_musl/root-x86/stamp/.libstdcpp_installed
mkdir -p /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/target-x86_64_musl/root-x86/stamp
SHELL= flock /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/tmp/.root-copy.flock -c 'cp -fpR /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/.pkgdir/libpthread/. /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/target-x86_64_musl/root-x86/'
touch /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/target-x86_64_musl/root-x86/stamp/.libpthread_installed
echo "libpthread" >> /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/target-x86_64_musl/pkginfo/toolchain.default.install
mkdir -p /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/target-x86_64_musl/root-x86/stamp
SHELL= flock /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/tmp/.root-copy.flock -c 'cp -fpR /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/.pkgdir/librt/. /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/target-x86_64_musl/root-x86/'
touch /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/target-x86_64_musl/root-x86/stamp/.librt_installed
echo "librt" >> /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/target-x86_64_musl/pkginfo/toolchain.default.install
touch -r /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/.built /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain/.autoremove 2>/dev/null >/dev/null
find /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/toolchain -mindepth 1 -maxdepth 1 -not '(' -type f -and -name '.*' -and -size 0 ')' -and -not -name '.pkgdir' | xargs -r rm -rf
make[2]: Leaving directory '/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/package/toolchain'
time: package/toolchain/compile#1.05#0.19#1.06
make[2]: Entering directory '/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/feeds/myrepo/helloworld'
mkdir -p /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/dl
SHELL= flock /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/tmp/.helloworld-1.0.tar.xz.flock -c '  	 /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/scripts/dl_github_archive.py --dl-dir="/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/dl" --url="https://github.com/nicanor-romero/openwrt_helloworld.git" --version="6af999d4248592b7d73c1acecbe687baf2bd0990" --subdir="helloworld-1.0.1" --source="helloworld-1.0.tar.xz" --hash="x" || ( 	echo "Checking out files from the git repository..."; mkdir -p /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/tmp/dl && cd /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/tmp/dl && rm -rf helloworld-1.0.1 && [ \! -d helloworld-1.0.1 ] && git clone  https://github.com/nicanor-romero/openwrt_helloworld.git helloworld-1.0.1 && (cd helloworld-1.0.1 && git checkout 6af999d4248592b7d73c1acecbe687baf2bd0990 && git submodule update --init --recursive) && echo "Packing checkout..." && export TAR_TIMESTAMP=`cd helloworld-1.0.1 && git log -1 --format='\''@%ct'\''` && rm -rf helloworld-1.0.1/.git && 	tar --numeric-owner --owner=0 --group=0 --mode=a-s --sort=name ${TAR_TIMESTAMP:+--mtime="$TAR_TIMESTAMP"} -c helloworld-1.0.1 | 	xz -zc -7e > /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/tmp/dl/helloworld-1.0.tar.xz && mv /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/tmp/dl/helloworld-1.0.tar.xz /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/dl/ && rm -rf helloworld-1.0.1; );     '
[91mhelloworld-1.0.tar.xz: Download from https://github.com/nicanor-romero/openwrt_helloworld.git failed
helloworld-1.0.tar.xz: Requires sha256sum for verification
[0mChecking out files from the git repository...
[91mCloning into 'helloworld-1.0.1'...
[0m[91mNote: switching to '6af999d4248592b7d73c1acecbe687baf2bd0990'.

You are in 'detached HEAD' state. You can look around, make experimental
changes and commit them, and you can discard any commits you make in this
state without impacting any branches by switching back to a branch.

If you want to create a new branch to retain commits you create, you may
do so (now or later) by using -c with the switch command. Example:

  git switch -c <new-branch-name>

Or undo this operation with:

  git switch -

Turn off this advice by setting config variable advice.detachedHead to false

HEAD is now at 6af999d Added PKG_SOURCE to avoid 'Download/default is missing the FILE field' error
[0mPacking checkout...
touch /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/helloworld-1.0.1/.prepared_3c548ca0e4a9ebed936294a355bb8b9f_18f1e190c5d53547fed41a3eaa76e9e9_check
mkdir -p /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/helloworld-1.0.1
cp -fpR ./src/* /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/helloworld-1.0.1/
touch /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/helloworld-1.0.1/.prepared_3c548ca0e4a9ebed936294a355bb8b9f_18f1e190c5d53547fed41a3eaa76e9e9
rm -f /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/helloworld-1.0.1/.configured_*
rm -f /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/target-x86_64_musl/stamp/.helloworld_installed
mkdir -p /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/helloworld-1.0.1
(cd /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/helloworld-1.0.1; CFLAGS="-Os -pipe -fno-caller-saves -fno-plt -fhonour-copts -Wno-error=unused-but-set-variable -Wno-error=unused-result -iremap/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/helloworld-1.0.1:helloworld-1.0.1 -Wformat -Werror=format-security -fstack-protector -D_FORTIFY_SOURCE=1 -Wl,-z,now -Wl,-z,relro " CXXFLAGS="-Os -pipe -fno-caller-saves -fno-plt -fhonour-copts -Wno-error=unused-but-set-variable -Wno-error=unused-result -iremap/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/helloworld-1.0.1:helloworld-1.0.1 -Wformat -Werror=format-security -fstack-protector -D_FORTIFY_SOURCE=1 -Wl,-z,now -Wl,-z,relro " LDFLAGS="-L/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/target-x86_64_musl/usr/lib -L/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/target-x86_64_musl/lib -L/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/toolchain-x86_64_gcc-7.5.0_musl/usr/lib -L/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/toolchain-x86_64_gcc-7.5.0_musl/lib -znow -zrelro " cmake -DCMAKE_SYSTEM_NAME=Linux -DCMAKE_SYSTEM_VERSION=1 -DCMAKE_SYSTEM_PROCESSOR=x86_64 -DCMAKE_BUILD_TYPE=Release -DCMAKE_C_FLAGS_RELEASE="-DNDEBUG" -DCMAKE_CXX_FLAGS_RELEASE="-DNDEBUG" -DCMAKE_C_COMPILER="/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/toolchain-x86_64_gcc-7.5.0_musl/bin/x86_64-openwrt-linux-musl-gcc" -DCMAKE_C_COMPILER_ARG1="" -DCMAKE_CXX_COMPILER="/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/toolchain-x86_64_gcc-7.5.0_musl/bin/x86_64-openwrt-linux-musl-g++" -DCMAKE_CXX_COMPILER_ARG1="" -DCMAKE_ASM_COMPILER="/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/toolchain-x86_64_gcc-7.5.0_musl/bin/x86_64-openwrt-linux-musl-gcc" -DCMAKE_ASM_COMPILER_ARG1="" -DCMAKE_EXE_LINKER_FLAGS:STRING="-L/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/target-x86_64_musl/usr/lib -L/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/target-x86_64_musl/lib -L/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/toolchain-x86_64_gcc-7.5.0_musl/usr/lib -L/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/toolchain-x86_64_gcc-7.5.0_musl/lib -znow -zrelro" -DCMAKE_MODULE_LINKER_FLAGS:STRING="-L/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/target-x86_64_musl/usr/lib -L/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/target-x86_64_musl/lib -L/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/toolchain-x86_64_gcc-7.5.0_musl/usr/lib -L/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/toolchain-x86_64_gcc-7.5.0_musl/lib -znow -zrelro -Wl,-Bsymbolic-functions" -DCMAKE_SHARED_LINKER_FLAGS:STRING="-L/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/target-x86_64_musl/usr/lib -L/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/target-x86_64_musl/lib -L/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/toolchain-x86_64_gcc-7.5.0_musl/usr/lib -L/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/toolchain-x86_64_gcc-7.5.0_musl/lib -znow -zrelro -Wl,-Bsymbolic-functions" -DCMAKE_AR="/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/toolchain-x86_64_gcc-7.5.0_musl/bin/x86_64-openwrt-linux-musl-gcc-ar" -DCMAKE_NM="/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/toolchain-x86_64_gcc-7.5.0_musl/bin/x86_64-openwrt-linux-musl-gcc-nm" -DCMAKE_RANLIB="/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/toolchain-x86_64_gcc-7.5.0_musl/bin/x86_64-openwrt-linux-musl-gcc-ranlib" -DCMAKE_FIND_ROOT_PATH="/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/target-x86_64_musl/usr;/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/toolchain-x86_64_gcc-7.5.0_musl" -DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM=BOTH -DCMAKE_FIND_ROOT_PATH_MODE_LIBRARY=ONLY -DCMAKE_FIND_ROOT_PATH_MODE_INCLUDE=ONLY -DCMAKE_STRIP=: -DCMAKE_INSTALL_PREFIX=/usr -DDL_LIBRARY=/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/target-x86_64_musl -DCMAKE_PREFIX_PATH=/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/target-x86_64_musl -DCMAKE_SKIP_RPATH=TRUE  /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/helloworld-1.0.1 )
-- The C compiler identification is GNU 7.5.0
-- The CXX compiler identification is GNU 7.5.0
-- Check for working C compiler: /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/toolchain-x86_64_gcc-7.5.0_musl/bin/x86_64-openwrt-linux-musl-gcc
-- Check for working C compiler: /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/toolchain-x86_64_gcc-7.5.0_musl/bin/x86_64-openwrt-linux-musl-gcc -- works
-- Detecting C compiler ABI info
-- Detecting C compiler ABI info - done
-- Detecting C compile features
-- Detecting C compile features - done
-- Check for working CXX compiler: /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/toolchain-x86_64_gcc-7.5.0_musl/bin/x86_64-openwrt-linux-musl-g++
-- Check for working CXX compiler: /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/toolchain-x86_64_gcc-7.5.0_musl/bin/x86_64-openwrt-linux-musl-g++ -- works
-- Detecting CXX compiler ABI info
-- Detecting CXX compiler ABI info - done
-- Detecting CXX compile features
-- Detecting CXX compile features - done
-- Configuring done
-- Generating done
[91mCMake Warning:
  Manually-specified variables were not used by the project:

    CMAKE_ASM_COMPILER
    CMAKE_ASM_COMPILER_ARG1
    CMAKE_FIND_ROOT_PATH_MODE_LIBRARY
    CMAKE_MODULE_LINKER_FLAGS
    CMAKE_SHARED_LINKER_FLAGS
    DL_LIBRARY


[0m-- Build files have been written to: /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/helloworld-1.0.1
touch /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/helloworld-1.0.1/.configured_68b329da9893e34099c7d8ad5cb9c940
rm -f /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/helloworld-1.0.1/.built
touch /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/helloworld-1.0.1/.built_check
CFLAGS="-Os -pipe -fno-caller-saves -fno-plt -fhonour-copts -Wno-error=unused-but-set-variable -Wno-error=unused-result -iremap/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/helloworld-1.0.1:helloworld-1.0.1 -Wformat -Werror=format-security -fstack-protector -D_FORTIFY_SOURCE=1 -Wl,-z,now -Wl,-z,relro  -I/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/target-x86_64_musl/usr/include -I/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/target-x86_64_musl/include -I/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/toolchain-x86_64_gcc-7.5.0_musl/usr/include -I/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/toolchain-x86_64_gcc-7.5.0_musl/include/fortify -I/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/toolchain-x86_64_gcc-7.5.0_musl/include " CXXFLAGS="-Os -pipe -fno-caller-saves -fno-plt -fhonour-copts -Wno-error=unused-but-set-variable -Wno-error=unused-result -iremap/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/helloworld-1.0.1:helloworld-1.0.1 -Wformat -Werror=format-security -fstack-protector -D_FORTIFY_SOURCE=1 -Wl,-z,now -Wl,-z,relro  -I/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/target-x86_64_musl/usr/include -I/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/target-x86_64_musl/include -I/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/toolchain-x86_64_gcc-7.5.0_musl/usr/include -I/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/toolchain-x86_64_gcc-7.5.0_musl/include/fortify -I/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/toolchain-x86_64_gcc-7.5.0_musl/include " LDFLAGS="-L/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/target-x86_64_musl/usr/lib -L/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/target-x86_64_musl/lib -L/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/toolchain-x86_64_gcc-7.5.0_musl/usr/lib -L/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/toolchain-x86_64_gcc-7.5.0_musl/lib -znow -zrelro " make -j1 -C /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/helloworld-1.0.1/. AR="x86_64-openwrt-linux-musl-gcc-ar" AS="x86_64-openwrt-linux-musl-gcc -c -Os -pipe -fno-caller-saves -fno-plt -fhonour-copts -Wno-error=unused-but-set-variable -Wno-error=unused-result -iremap/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/helloworld-1.0.1:helloworld-1.0.1 -Wformat -Werror=format-security -fstack-protector -D_FORTIFY_SOURCE=1 -Wl,-z,now -Wl,-z,relro" LD=x86_64-openwrt-linux-musl-ld NM="x86_64-openwrt-linux-musl-gcc-nm" CC="x86_64-openwrt-linux-musl-gcc" GCC="x86_64-openwrt-linux-musl-gcc" CXX="x86_64-openwrt-linux-musl-g++" RANLIB="x86_64-openwrt-linux-musl-gcc-ranlib" STRIP=x86_64-openwrt-linux-musl-strip OBJCOPY=x86_64-openwrt-linux-musl-objcopy OBJDUMP=x86_64-openwrt-linux-musl-objdump SIZE=x86_64-openwrt-linux-musl-size CROSS="x86_64-openwrt-linux-musl-" ARCH="x86_64" CMAKE_COMMAND='/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/host/bin/cmake' CMAKE_DISABLE_cmake_check_build_system=1 ;
make[3]: Entering directory '/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/helloworld-1.0.1'
make[4]: Entering directory '/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/helloworld-1.0.1'
make[5]: Entering directory '/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/helloworld-1.0.1'
Scanning dependencies of target helloworld
make[5]: Leaving directory '/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/helloworld-1.0.1'
make[5]: Entering directory '/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/helloworld-1.0.1'
[ 33%] Building CXX object CMakeFiles/helloworld.dir/helloworld.cpp.o
[ 66%] Building CXX object CMakeFiles/helloworld.dir/MyClass.cpp.o
[100%] Linking CXX executable helloworld
make[5]: Leaving directory '/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/helloworld-1.0.1'
[100%] Built target helloworld
make[4]: Leaving directory '/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/helloworld-1.0.1'
make[3]: Leaving directory '/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/helloworld-1.0.1'
CFLAGS="-Os -pipe -fno-caller-saves -fno-plt -fhonour-copts -Wno-error=unused-but-set-variable -Wno-error=unused-result -iremap/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/helloworld-1.0.1:helloworld-1.0.1 -Wformat -Werror=format-security -fstack-protector -D_FORTIFY_SOURCE=1 -Wl,-z,now -Wl,-z,relro  -I/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/target-x86_64_musl/usr/include -I/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/target-x86_64_musl/include -I/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/toolchain-x86_64_gcc-7.5.0_musl/usr/include -I/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/toolchain-x86_64_gcc-7.5.0_musl/include/fortify -I/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/toolchain-x86_64_gcc-7.5.0_musl/include " CXXFLAGS="-Os -pipe -fno-caller-saves -fno-plt -fhonour-copts -Wno-error=unused-but-set-variable -Wno-error=unused-result -iremap/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/helloworld-1.0.1:helloworld-1.0.1 -Wformat -Werror=format-security -fstack-protector -D_FORTIFY_SOURCE=1 -Wl,-z,now -Wl,-z,relro  -I/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/target-x86_64_musl/usr/include -I/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/target-x86_64_musl/include -I/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/toolchain-x86_64_gcc-7.5.0_musl/usr/include -I/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/toolchain-x86_64_gcc-7.5.0_musl/include/fortify -I/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/toolchain-x86_64_gcc-7.5.0_musl/include " LDFLAGS="-L/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/target-x86_64_musl/usr/lib -L/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/target-x86_64_musl/lib -L/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/toolchain-x86_64_gcc-7.5.0_musl/usr/lib -L/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/toolchain-x86_64_gcc-7.5.0_musl/lib -znow -zrelro " make -C /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/helloworld-1.0.1/. AR="x86_64-openwrt-linux-musl-gcc-ar" AS="x86_64-openwrt-linux-musl-gcc -c -Os -pipe -fno-caller-saves -fno-plt -fhonour-copts -Wno-error=unused-but-set-variable -Wno-error=unused-result -iremap/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/helloworld-1.0.1:helloworld-1.0.1 -Wformat -Werror=format-security -fstack-protector -D_FORTIFY_SOURCE=1 -Wl,-z,now -Wl,-z,relro" LD=x86_64-openwrt-linux-musl-ld NM="x86_64-openwrt-linux-musl-gcc-nm" CC="x86_64-openwrt-linux-musl-gcc" GCC="x86_64-openwrt-linux-musl-gcc" CXX="x86_64-openwrt-linux-musl-g++" RANLIB="x86_64-openwrt-linux-musl-gcc-ranlib" STRIP=x86_64-openwrt-linux-musl-strip OBJCOPY=x86_64-openwrt-linux-musl-objcopy OBJDUMP=x86_64-openwrt-linux-musl-objdump SIZE=x86_64-openwrt-linux-musl-size CROSS="x86_64-openwrt-linux-musl-" ARCH="x86_64" CMAKE_COMMAND='/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/host/bin/cmake' CMAKE_DISABLE_cmake_check_build_system=1 DESTDIR="/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/helloworld-1.0.1/ipkg-install"  install;
make[3]: Entering directory '/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/helloworld-1.0.1'
make[4]: Entering directory '/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/helloworld-1.0.1'
make[5]: Entering directory '/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/helloworld-1.0.1'
make[5]: Leaving directory '/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/helloworld-1.0.1'
[100%] Built target helloworld
make[4]: Leaving directory '/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/helloworld-1.0.1'
Install the project...
-- Install configuration: "Release"
-- Installing: /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/helloworld-1.0.1/ipkg-install/usr/bin/helloworld
make[3]: Leaving directory '/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/helloworld-1.0.1'
touch /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/helloworld-1.0.1/.built
rm -rf /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/helloworld-1.0.1/.pkgdir/helloworld.installed /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/helloworld-1.0.1/.pkgdir/helloworld
mkdir -p /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/helloworld-1.0.1/.pkgdir/helloworld
install -d -m0755 /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/helloworld-1.0.1/.pkgdir/helloworld/bin
install -m0755 /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/helloworld-1.0.1/helloworld /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/helloworld-1.0.1/.pkgdir/helloworld/bin/
touch /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/helloworld-1.0.1/.pkgdir/helloworld.installed
mkdir -p /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/target-x86_64_musl/root-x86/stamp
SHELL= flock /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/tmp/.root-copy.flock -c 'cp -fpR /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/helloworld-1.0.1/.pkgdir/helloworld/. /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/target-x86_64_musl/root-x86/'
touch /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/target-x86_64_musl/root-x86/stamp/.helloworld_installed
mkdir -p /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/bin/targets/x86/64/packages /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/helloworld-1.0.1/ipkg-x86_64/helloworld/CONTROL /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/target-x86_64_musl/pkginfo
install -d -m0755 /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/helloworld-1.0.1/ipkg-x86_64/helloworld/bin
install -m0755 /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/helloworld-1.0.1/helloworld /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/helloworld-1.0.1/ipkg-x86_64/helloworld/bin/
find /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/helloworld-1.0.1/ipkg-x86_64/helloworld -name 'CVS' -o -name '.svn' -o -name '.#*' -o -name '*~'| xargs -r rm -rf
export CROSS="x86_64-openwrt-linux-musl-"   ; NM="x86_64-openwrt-linux-musl-nm" STRIP="/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/host/bin/sstrip" STRIP_KMOD="/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/scripts/strip-kmod.sh" PATCHELF="/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/host/bin/patchelf" /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/scripts/rstrip.sh /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/helloworld-1.0.1/ipkg-x86_64/helloworld
rstrip.sh: /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/helloworld-1.0.1/ipkg-x86_64/helloworld/bin/helloworld: executable
(cd /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/helloworld-1.0.1/ipkg-x86_64/helloworld/CONTROL; ( echo "$CONTROL"; printf "Description: "; echo "$DESCRIPTION" | sed -e 's,^[[:space:]]*, ,g'; ) > control; chmod 644 control; ( echo "#!/bin/sh"; echo "[ \"\${IPKG_NO_SCRIPT}\" = \"1\" ] && exit 0"; echo "[ -x "\${IPKG_INSTROOT}/lib/functions.sh" ] || exit 0"; echo ". \${IPKG_INSTROOT}/lib/functions.sh"; echo "default_postinst \$0 \$@"; ) > postinst; ( echo "#!/bin/sh"; echo "[ -x "\${IPKG_INSTROOT}/lib/functions.sh" ] || exit 0"; echo ". \${IPKG_INSTROOT}/lib/functions.sh"; echo "default_prerm \$0 \$@"; ) > prerm; chmod 0755 postinst prerm;  )
install -d -m0755 /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/bin/packages/x86_64/myrepo
/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/scripts/ipkg-build -c -o 0 -g 0 /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/helloworld-1.0.1/ipkg-x86_64/helloworld /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/bin/packages/x86_64/myrepo
Packaged contents of /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/helloworld-1.0.1/ipkg-x86_64/helloworld into /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/bin/packages/x86_64/myrepo/helloworld_1.0-1_x86_64.ipk
rm -rf /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/tmp/stage-helloworld
mkdir -p /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/tmp/stage-helloworld/host /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/target-x86_64_musl/packages /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/host/packages
find /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/tmp/stage-helloworld -name '*.la' | xargs -r rm -f; 
if [ -f /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/target-x86_64_musl/packages/helloworld.list ]; then /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/scripts/clean-package.sh "/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/target-x86_64_musl/packages/helloworld.list" "/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/target-x86_64_musl"; fi
if [ -d /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/tmp/stage-helloworld ]; then (cd /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/tmp/stage-helloworld; find ./ > /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/tmp/stage-helloworld.files); 	SHELL= flock /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/tmp/.staging-dir.flock -c ' mv /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/tmp/stage-helloworld.files /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/target-x86_64_musl/packages/helloworld.list && cp -fpR /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/tmp/stage-helloworld/* /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/target-x86_64_musl/; '; fi
rm -rf /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/tmp/stage-helloworld
touch /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/staging_dir/target-x86_64_musl/stamp/.helloworld_installed
touch -r /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/helloworld-1.0.1/.built /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/helloworld-1.0.1/.autoremove 2>/dev/null >/dev/null
find /home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/build_dir/target-x86_64_musl/helloworld-1.0.1 -mindepth 1 -maxdepth 1 -not '(' -type f -and -name '.*' -and -size 0 ')' -and -not -name '.pkgdir' | xargs -r rm -rf
make[2]: Leaving directory '/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64/feeds/myrepo/helloworld'
time: package/feeds/myrepo/helloworld/compile#1.62#0.75#2.74
make[1]: Leaving directory '/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64'
Removing intermediate container 9da2c037a004
 ---> d3e8371cfbd0
Step 10/12 : RUN ./staging_dir/host/bin/usign -G -s ./key-build -p ./key-build.pub -c "Local build key"
 ---> Running in aeb087fabc6a
Removing intermediate container aeb087fabc6a
 ---> b9577d34ec9c
Step 11/12 : RUN make package/index V=s
 ---> Running in e9548561bbad
[91mWARNING: Makefile 'package/linux/Makefile' has a dependency on 'r8169-firmware', which does not exist
WARNING: Makefile 'package/linux/Makefile' has a dependency on 'e100-firmware', which does not exist
WARNING: Makefile 'package/linux/Makefile' has a dependency on 'bnx2-firmware', which does not exist
[0m[91mWARNING: Makefile 'package/linux/Makefile' has a dependency on 'ar3k-firmware', which does not exist
WARNING: Makefile 'package/linux/Makefile' has a dependency on 'mwifiex-sdio-firmware', which does not exist
[0m[91mWARNING: Makefile 'package/linux/Makefile' has a dependency on 'kmod-phy-bcm-ns-usb2', which does not exist
WARNING: Makefile 'package/linux/Makefile' has a dependency on 'edgeport-firmware', which does not exist
[0m[91mWARNING: Makefile 'package/linux/Makefile' has a dependency on 'kmod-phy-bcm-ns-usb3', which does not exist
[0m[91mWARNING: Makefile 'package/linux/Makefile' has a dependency on 'amdgpu-firmware', which does not exist
WARNING: Makefile 'package/linux/Makefile' has a dependency on 'radeon-firmware', which does not exist
[0m[91mWARNING: Makefile 'package/linux/Makefile' has a dependency on 'prism54-firmware', which does not exist
WARNING: Makefile 'package/linux/Makefile' has a dependency on 'rtl8192su-firmware', which does not exist
[0m[91mtmp/.config-package.in:36:warning: ignoring type redefinition of 'PACKAGE_libc' from 'boolean' to 'tristate'
tmp/.config-package.in:64:warning: ignoring type redefinition of 'PACKAGE_libgcc' from 'boolean' to 'tristate'
tmp/.config-package.in:149:warning: ignoring type redefinition of 'PACKAGE_libpthread' from 'boolean' to 'tristate'
tmp/.config-package.in:177:warning: ignoring type redefinition of 'PACKAGE_librt' from 'boolean' to 'tristate'
[0m#
# configuration written to .config
#
make[1]: Entering directory '/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64'
Generating package index...
Generating index for package ./libatomic1_7.5.0-2_x86_64.ipk
Generating index for package ./libgcc1_7.5.0-2_x86_64.ipk
Generating index for package ./libpthread_1.1.24-2_x86_64.ipk
Generating index for package ./librt_1.1.24-2_x86_64.ipk
Generating index for package ./libstdcpp6_7.5.0-2_x86_64.ipk
Generating index for package ./helloworld_1.0-1_x86_64.ipk
Signing package index...
make[1]: Leaving directory '/home/openwrt/openwrt-sdk-19.07.8-x86-64_gcc-7.5.0_musl.Linux-x86_64'
Removing intermediate container e9548561bbad
 ---> 37091c14616a
Step 12/12 : ENTRYPOINT ["python", "-m", "SimpleHTTPServer"]
 ---> Running in dab4e4cf4ebd
Removing intermediate container dab4e4cf4ebd
 ---> 9873db3c5568
Successfully built 9873db3c5568
Successfully tagged helloworldcpp:latest
```
