curl https://sh.rustup.rs -sSf | sh -s -- -y --default-toolchain stable
export PATH="$HOME/.cargo/bin:$PATH"

cargo install blocktest && blocktest src .md content

hugo
