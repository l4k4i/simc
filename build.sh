source ~/Downloads/emsdk/emsdk_env.sh &&
emmake cmake . &&
emmake make &&
emcc engine/libengine.a libsimc.a -o simc.js -s WASM=1 -s TOTAL_MEMORY=512MB -s DISABLE_EXCEPTION_CATCHING=0 -s DEMANGLE_SUPPORT=1 -s EXPORTED_FUNCTIONS='["_callSimc","_main"]' -s EXTRA_EXPORTED_RUNTIME_METHODS='["ccall", "cwrap"]'
sed -i 's/simc\.wasm/assets\/lib\/simc\.wasm/g' simc.js
