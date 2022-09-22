# linux 或者 mac 环境
基本上大部分发行版都可以，没有linux环境的可以装个ubuntu
但是 mac 遇到问题自己搜，我没有苹果设备

# 安装依赖
## mac
mac 所有东西使用 homebrew 安装
> 1. [verilator](https://formulae.brew.sh/formula/verilator)
> 2. [cmake](https://formulae.brew.sh/formula/cmake)

## linux
首先安装cmake和gcc工具链
然后安装veilator

ubuntu和arch可以直接安装源里的，别的发行版如果源里没有可以参考[wiki](https://verilator.org/guide/latest/install.html#)手动安装

ubuntu:
```shell
sudo apt install build-essential
sudo apt install cmake
sudo apt install verilator
```

arch:
```shell
sudo pacman -S base base-devel
sudo pacman -S cmake
sudo pacman -S verilator
```

构建过程
```shell
cmake -S . -B build
cmake --build build
./build/TestBench
```
输出为 `0x1687472ed18011f6d72a1fa3a4762354` 为正确


# chisel
因为chisel只是scala语言的一个包名，所以使用chisel只需要配置scala环境即可

如果你要用chisel，首先安装java环境并配好meavn的镜像

然后在idea里边安装scala插件即可

入门可以做一下 [BootCamp](https://mybinder.org/v2/gh/freechipsproject/chisel-bootcamp/master)和 [zhihu](https://zhuanlan.zhihu.com/p/98097268)

这个实验只需要一些最简单的chisel语法就可以，不用死磕高深的东西

两个输出，分别是 `7fa527984247c36f6e5db5f517fea189` 和 `1687472ed18011f6d72a1fa3a4762354`