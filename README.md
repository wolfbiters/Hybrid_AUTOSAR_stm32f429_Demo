# Hybrid AUTOSAR stm32f429 Demo

Ada/Rust/C AUTOSAR demo on the stm32f429

![demo](https://github.com/ohenley/hybrid_autosar_stm32f429_demo/blob/main/schematic_and_bom/autosar_demo_web.png?raw=true) 

### Prerequesite (tested on linux ubuntu 20.04 only)

#### Alire: https://github.com/alire-project/alire/releases
- Download and unzip the latest linux zip
- Add `where_you_unzipped/alr` to [PATH](https://phoenixnap.com/kb/linux-add-to-path)  
- Verify Alire is found on your path. 
```console   
which alr
```

#### OpenOCD
```console
sudo apt install openocd
```

#### STM32f429 Discovery board
![stm32f429disco](https://raw.githubusercontent.com/ohenley/blinky_stm32f429disco/main/stm32f429disco.jpg)   
- Plug it to your computer using the [USB MIN B cable](https://www.reviewgeek.com/53587/usb-explained-all-the-different-types-and-what-theyre-used-for/)

### Add custom Alire index (IMPORTANT)
The chain of crates used by this project is a reorganization of files found at [Ada_Drivers_Library](https://github.com/AdaCore/Ada_Drivers_Library).

Install my forked Alire index named `testindex` locally:
```
alr index --add git+https://github.com/ohenley/alire-index.git#stable-1.2.1 --name testindex
```

When you are done, you can delete it:
```
alr index --del testindex
```

### Fetch 
```console
alr get hybrid_autosar_stm32f429_demo
cd hybrid_autosar_stm32f429_demo*
```  

### Build (Terminal)
```console
alr build
```

### Build (GPRBuild)
```console
eval "$(alr printenv)"
gprbuild hybrid_autosar_stm32f429_demo.gpr
```

### Build (GnatStudio)
```console
eval "$(alr printenv)"
gnatstudio hybrid_autosar_stm32f429_demo.gpr
```

### Run

```console
openocd -f /usr/local/share/openocd/scripts/board/stm32f429disc1.cfg -c 'program bin/hybrid_autosar_stm32f429_demo verify reset exit'
```    

### Circuit and BOM

Look in the `schematic_and_bom` folder. You should find an up to date list of the components used and the circuit to build around the stm32f429 disco board. Please make a PR if you identify and fix errors.
