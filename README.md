# C++ Premake Template

The root includes a global configuration in premake5.lua, and individual projects within the packages/ folder.

This template is developed on a Linux machine so problems may occur on a Windows system when using Visual Studio.

Premake5 structure based on TheCherno's Hazel structure.

## File Structure

- ./premake5.lua: Global configuration.
- ./packages/: Home for individual projects.
- ./bin/: Output for compiled binaries.
- ./bin-int/: Intermediary file storage.

## Building
You may develop using a Makefile or a Visual Studio solution, both of which must be manually generated using premake5.

Download and install premake5 for your system from https://premake.github.io/download.

In the root directory (the directory with the global premake5.lua file), run:

```shell
premake5 gmake2    # For Makefiles
                   # gmake should work too but based on previous experiences,
                   # gmake2 worked best
``````

or

```shell
premake5 vs       # For Visual Studio solutions
```

All packages under packages/ will automatically be included in the build process, assuming they have their own premake5.lua defined (see packages/DemoApp).

## Build Configurations

Three build configurations cater to different needs:

- Debug: Symbols, debug preprocess variables, no compiler optimizations—for rapid development.
- Release: Symbols, production preprocess variables, compiler optimizations—for production-like inspections.
- Dist: No symbols, identical to Release—for the final public release.
