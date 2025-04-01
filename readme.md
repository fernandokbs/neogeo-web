# How to use

```bash
docker build -t retroarch .
```

```bash
docker run --rm -p 8081:8080 retroarch
```

![Alt text](./Screenshot%20from%202025-03-30%2013-02-54.png)


## Step 3: Add ROM files
Due to copyright policies, ROM files are not included in this repository. You must add your own ROM files inside the roms folder. The folder structure should look like this:
```
project-root
├── Dockerfile
├── roms
│   └── mslug.zip
└── ...

```

```
retroarch -L ~/.config/retroarch/cores/fbneo_libretro.so ~/roms/neogeo/mslug.zip
```


## Legal Notice
Please note that emulating video games is legally valid, but distributing ROM files is not. Ensure you own the original game before using any ROM.