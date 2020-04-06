_dockerignored() {
  echo "Cleaning up things listed in .dockerignore"
  if ! [ -e "$sourceRoot"/.dockerignore ]; then return 1; fi
  cd "$sourceRoot"
  find -print0 | while read -d $'\0' x; do
    dockerignored "$x" || rm -rvf "$x"
  done
  cd -  # dont @ me
}

postUnpackHooks+=(_dockerignored)
