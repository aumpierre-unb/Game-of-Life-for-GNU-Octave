# `game-of-life` Package for GNU-Octave

[![DOI](https://zenodo.org/badge/509427410.svg)](https://zenodo.org/badge/latestdoi/509427410)
[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
![GitHub release (latest by date)](https://img.shields.io/github/v/release/aumpierre-unb/Game-of-Life-for-GNU-Octave)

<!-- ![Illustrative graphical output](https://github.com/aumpierre-unb/Game-of-Life-for-GNU-Octave/blob/main/pics/D2fRe.png "Example of graphical output") -->

![](animation.gif)

## Installing and Loading `game-of-life`

`game-of-life` is no registered at GNU Octave's repository. 

In order to install `game-of-life`, download the latest version compressed source code at [Releases](https://github.com/aumpierre-unb/Game-of-Life-for-GNU-Octave/releases), set the current directory to the download folder and call the following sequence from your console:

```dotnetcli
# e.g. this call will install version 0.1.1
# for latter versions, adapt the call accordingly
pkg install v0.1.1.tar.gz
pkg load game-of-life
```

## Citation of `game-of-life`

You can cite all versions (both released and pre-released), by using
[DOI 105281/zenodo.7395871](https://doi.org/10.5281/zenodo.7395871).

This DOI represents all versions, and will always resolve to the latest one.

To cite the last released version, please check
https://zenodo.org/account/settings/github/repository/aumpierre-unb/Game-of-Life-for-GNU-Octave.

---

## The Conway's Game of Life

Conway's Game of Life computes the configuration of the next generation of a grid of square cells, each of which is in either live or dead. Each cell will be live or dead in the next generation according to two simple rules:

- A live cells with exactly 2 or 3 live neighbors stays a live cell, otherwise it dies.
- A dead cell with 3 live neighbors becomes alive, otherwise is stays dead.

As simple as these rules may be, they can result in surprising complexity from relatively simple initial configurations.

## The `game-of-life` Package

`game-of-life` provides the following functions:

- `genzero`
- `conway`
- `evolution`

### `genzero`

`genzero` generates a matrix of ones and zeros of m lines and n columns.
By default, elements of the matrix are computed individually with 50 percent probability of assuming the value one.
If probability for ones if given, the values of all elements are computed with this parameter.
If the grid pattern is assigned by strings 'block', 'glider', 'blinker', 'toad' or 'beacon' matrix is generated with the pattern at its superior left corner.

**Syntax:**

```dotnetcli
[A]=genzero(m,n[,P=.5])
```

**Examples:**

Generate a spaceship glider pattern in a 9 lines and 7 columns matrix.

```dotnetcli
A=genzero(9,7,'glider')
```

Generate a 27 by 28 cells grid where individual cells have a 26:74 chance to be live or dead.

```dotnetcli
A=genzero(27,28,.26)
```

### `conway`

`conway` computes the configuration of the next generation of a grid of square cells, each of which is in either live or dead.

Each cell will be live or dead in the next generation according to the rules of the Conway's game of life.

By default, the grid is assumed to be finite. If cyc=true is given, then grid is assumed to be infinite and periodic.

By default, no plot is shown. If fig=true is given, then a figure with two subplots is shown, the first subplot being the configuration of the original grid and the second subplot being the configuration of the next generations.

By default, the colormap pattern of plots is gray. Please address to the colormap help documentation for different patterns.

**Syntax:**

```dotnetcli
[Re]=f2Re(f,[eps[,fig=false]])
```

**Examples:**

Compute the next generation of a spaceship glider pattern in a 10 by 10 cells grid and visualize the grids on plots.

```dotnetcli
A=genzero(10,10,'glider');...
B=conway(A,true,true)
```

### `evolution`

`evolution` simulates the evolution of a grid of square cells according to the rules of the Conway's game of life.

The simulations will be interrupted if the grid comes to a stable configuration.By default, 100 generations will be computed.

By default, the grid is assumed to be finite. If cyc=true is given, then grid is assumed to be infinite and periodic.

By default, a figure with two subplots is shown, the first subplot being the configuration of the original grid and the second subplot being the configuration of the next generations. If fig=false is given, then no plot is shown.

By default, the colormap pattern of plots is gray. Please address to the colormap help documentation for different patterns.

By default, the next generation configuration is shown after s=50 milliseconds.

**Syntax:**

```dotnetcli
[B]=evolution(A,N=100,cyc=false,fig=true,map='gray',s=50)
```

**Examples:**

Observe the evolution of the first 200 generations of a grid originally set as a spaceship glider pattern in a periodic 13 by 11 cells grid.

```dotnetcli
A=genzero(13,11,'glider');...
B=evolution(A,200,true)
```

Generate a periodic 27 by 28 cells grid where individual cells have a 26:74 chance to be live or dead and observe its evolution.

```dotnetcli
A=genzero(27,28,.26);...
B=evolution(A,inf,true)
```

Copyright &copy; 2022 Alexandre Umpierre

email: aumpierre@gmail.com
