#source ~/Downloads/emsdk/emsdk_env.sh &&
emmake cmake . &&
emmake make &&
emcc engine/libengine.a libsimc.a -o simc.js -s WASM=1 -s TOTAL_MEMORY=512MB -s ASSERTIONS=1 -s DISABLE_EXCEPTION_CATCHING=0 -s DEMANGLE_SUPPORT=1 -s EXPORTED_FUNCTIONS='["_callSimc","_main"]' -s EXTRA_EXPORTED_RUNTIME_METHODS='["ccall", "cwrap"]' -Oz -v 
#emcc engine/libengine.a libsimc.a -o simc.wasm -Os -s WASM=1 -s SIDE_MODULE=1 -s TOTAL_MEMORY=512MB -s DISABLE_EXCEPTION_CATCHING=0 -s DEMANGLE_SUPPORT=1
#emcc engine/libengine.a libsimc.a -o simc.js -s WASM=0 -s TOTAL_MEMORY=2048MB -s DISABLE_EXCEPTION_CATCHING=0 -s DEMANGLE_SUPPORT=1 -s EXPORTED_FUNCTIONS='["_callSimc","_main"]' -s EXTRA_EXPORTED_RUNTIME_METHODS='["ccall", "cwrap"]' -s EMTERPRETIFY=1 -s EMTERPRETIFY_ASYNC=1 -s EMTERPRETIFY_FILE="simc.binary" -s EMTERPRETIFY_WHITELIST='["_callSimc"]' -Oz
sed -i 's/simc\.wasm/\.\.\/lib\/simc.wasm/g' simc.js
