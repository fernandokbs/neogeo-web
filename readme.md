# How to use

```bash
sudo apt update
sudo apt install libsdl2-image-2.0-0
```

```bash
./fbneo -fullscreen mslug
```

```bash
docker build -t neo .
```

```bash
docker run --rm -p 8081:8080 neo
```

```
git clone https://github.com/libretro/FBNeo.git
cd FBNeo/src/burner/libretro
make
cp fbneo_libretro.so ~/.config/retroarch/cores/
```

```
retroarch -L ~/.config/retroarch/cores/fbneo_libretro.so ~/roms/neogeo/mslug.zip
```