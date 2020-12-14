# Copyright 2017-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Auto-Generated by cargo-ebuild 0.3.1

EAPI=7

CRATES="
adler-0.2.3
aead-0.3.2
aes-0.4.0
aes-gcm-0.6.0
aes-soft-0.4.0
aesni-0.7.0
arc-swap-0.4.7
async-trait-0.1.41
atomic-0.5.0
atty-0.2.14
autocfg-1.0.1
base-x-0.2.6
base64-0.12.3
binascii-0.1.4
bincode-1.3.1
bitflags-1.2.1
block-buffer-0.9.0
block-cipher-0.7.1
bumpalo-3.4.0
byteorder-1.3.4
bytes-0.5.6
cc-1.0.60
cfg-if-0.1.10
chrono-0.4.19
const_fn-0.4.2
cpuid-bool-0.1.2
crc32fast-1.2.0
crossbeam-channel-0.4.4
crossbeam-deque-0.7.3
crossbeam-epoch-0.8.2
crossbeam-utils-0.7.2
crypto-mac-0.8.0
dashmap-4.0.0-rc6
digest-0.9.0
discard-1.0.4
either-1.6.1
flate2-1.0.18
fnv-1.0.7
fuchsia-zircon-0.3.3
fuchsia-zircon-sys-0.3.3
futures-0.3.6
futures-channel-0.3.6
futures-core-0.3.6
futures-executor-0.3.6
futures-io-0.3.6
futures-macro-0.3.6
futures-sink-0.3.6
futures-task-0.3.6
futures-util-0.3.6
generic-array-0.14.4
getrandom-0.1.15
ghash-0.3.0
glob-0.3.0
h2-0.2.6
hashbrown-0.9.1
hermit-abi-0.1.17
hkdf-0.9.0
hmac-0.8.1
http-0.2.1
http-body-0.3.1
httparse-1.3.4
httpdate-0.3.2
hyper-0.13.8
indexmap-1.6.0
inlinable_string-0.1.11
iovec-0.1.4
itoa-0.4.6
kernel32-sys-0.2.2
lazy_static-1.4.0
lazycell-1.3.0
libc-0.2.79
line-wrap-0.1.1
linked-hash-map-0.5.3
log-0.4.11
maybe-uninit-2.0.0
memchr-2.3.3
memoffset-0.5.6
mime-0.3.16
miniz_oxide-0.4.2
mio-0.6.22
mio-uds-0.6.8
miow-0.2.1
net2-0.2.35
num-integer-0.1.43
num-traits-0.2.12
num_cpus-1.13.0
once_cell-1.4.1
onig-6.1.0
onig_sys-69.5.1
opaque-debug-0.2.3
opaque-debug-0.3.0
percent-encoding-2.1.0
pin-project-0.4.26
pin-project-internal-0.4.26
pin-project-lite-0.1.10
pin-utils-0.1.0
pkg-config-0.3.18
plist-1.0.0
polyval-0.4.1
ppv-lite86-0.2.9
proc-macro-hack-0.5.18
proc-macro-nested-0.1.6
proc-macro2-1.0.24
quote-1.0.7
rand-0.7.3
rand_chacha-0.2.2
rand_core-0.5.1
rand_hc-0.2.0
rayon-1.4.1
rayon-core-1.8.1
ref-cast-1.0.2
ref-cast-impl-1.0.2
regex-syntax-0.6.18
rustc_version-0.2.3
ryu-1.0.5
safemem-0.3.3
same-file-1.0.6
scopeguard-1.1.0
semver-0.9.0
semver-parser-0.7.0
serde-1.0.116
serde_derive-1.0.116
serde_json-1.0.58
sha1-0.6.0
sha2-0.9.1
signal-hook-registry-1.2.1
slab-0.4.2
smallvec-1.4.2
standback-0.2.10
state-0.4.1
stdweb-0.4.20
stdweb-derive-0.5.3
stdweb-internal-macros-0.2.9
stdweb-internal-runtime-0.1.5
subtle-2.3.0
syn-1.0.42
time-0.2.22
time-macros-0.1.1
time-macros-impl-0.1.1
tokio-0.2.22
tokio-macros-0.2.5
tokio-util-0.3.1
toml-0.5.6
tower-service-0.3.0
tracing-0.1.21
tracing-core-0.1.17
try-lock-0.2.3
typenum-1.12.0
ubyte-0.10.0
uncased-0.9.2
unicode-xid-0.2.1
universal-hash-0.4.0
version_check-0.9.2
walkdir-2.3.1
want-0.3.0
wasi-0.9.0+wasi-snapshot-preview1
wasm-bindgen-0.2.68
wasm-bindgen-backend-0.2.68
wasm-bindgen-macro-0.2.68
wasm-bindgen-macro-support-0.2.68
wasm-bindgen-shared-0.2.68
winapi-0.2.8
winapi-0.3.9
winapi-build-0.1.1
winapi-i686-pc-windows-gnu-0.4.0
winapi-util-0.1.5
winapi-x86_64-pc-windows-gnu-0.4.0
ws2_32-sys-0.2.1
xml-rs-0.8.3
yaml-rust-0.4.4
yansi-0.5.0
"

inherit cargo git-r3

EGIT_REPO_URI="https://github.com/sourcegraph/syntect_server"
EGIT_COMMIT="9089f988f93ae6c76ba746e71036a7cd691de018"

DESCRIPTION="syntect_server"

HOMEPAGE="A HTTP server that exposes the Rust Syntect syntax highlighting library for use by other services"
SRC_URI="$(cargo_crate_uris ${CRATES})"
RESTRICT="mirror"
# License set may be more restrictive as OR is not respected
# use cargo-license for a more accurate license picture
LICENSE="0BSD Apache-2.0 Apache-2.0 WITH LLVM-exception BSD-3-Clause BSL-1.0 MIT Unlicense"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND=""

src_prepare() {
        eapply_user
        cargo_gen_config
}
