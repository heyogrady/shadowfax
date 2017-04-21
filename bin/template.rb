copy_file "bin/setup", force: true
chmod "bin/setup", "+x"

copy_file "bin/server", force: true
chmod "bin/server", "+x"

copy_file "bin/webpack", force: true
chmod "bin/webpack", "+x"

copy_file "bin/webpack-dev-server", force: true
chmod "bin/webpack-dev-server", "+x"

copy_file "bin/webpack-watcher", force: true
chmod "bin/webpack-watcher", "+x"

copy_file "bin/yarn", force: true
chmod "bin/yarn", "+x"

