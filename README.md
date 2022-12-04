# `game-of-life` Package for GNU-Octave

<!-- [![DOI](https://zenodo.org/badge/509427410.svg)](https://zenodo.org/badge/latestdoi/509427410)
[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
![GitHub release (latest by date)](https://img.shields.io/github/v/release/aumpierre-unb/Game-of-Life-for-GNU-Octave) -->

<!-- ![Illustrative graphical output](https://github.com/aumpierre-unb/Game-of-Life-for-GNU-Octave/blob/main/pics/D2fRe.png "Example of graphical output") -->

## Installing and Loading `game-of-life`

```dotnetcli
# this call installs version 0.1.0 and updates to the latest version
pkg install https://github.com/aumpierre-unb/Game-of-Life-for-GNU-Octave/archive/refs/tags/v0.1.0.tar.gz
pkg load game-of-life
pkg update game-of-life
```

<!-- ## Citation of `game-of-life`

You can cite all versions (both released and pre-released), by using
[DOI 105281/zenodo.6960263](https://doi.org/10.5281/zenodo.6960263).

This DOI represents all versions, and will always resolve to the latest one.

To cite the last released version, please check
https://zenodo.org/account/settings/github/repository/aumpierre-unb/Game-of-Life-for-GNU-Octave. -->

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
If strings 'oscillator blinker' or 'still block' or 'spaceship glider' is assigned, matrix is build with the given pattern at the superior left corner of the grid.


**Syntax:**

```dotnetcli
[A]=genzero(m,n[,P=.5])
```

**Examples:**

Generate a spaceship glider pattern in a 9 lines and 7 columns matrix.

```dotnetcli
A=genzero(9,7,'spaceship glider')
```

### `conway`

`conway` computes the configuration of the next generation of a grid of square cells, each of which is in either live or dead.

Each cell will be live or dead in the next generation according to the rules of the Conway's game of life.

By default, the grid is assumed to be non periodic. If cyc=true is given, then grid is assumed to be periodic.

By default, no plot is shown. If fig=true is given, then two plots are shown, the first being the configuration of the original grid and the second, the configuration of the next generation.

By default, the colormap pattern of plots is gray. Please address to the colormap help documentation for different patterns.

**Syntax:**

```dotnetcli
[Re]=f2Re(f,[eps[,fig=false]])
```

**Examples:**

Compute the next generation of a spaceship glider pattern in a 10 by 10 cells grid and visualize the grids on plots.

```dotnetcli
A=[0 0 0 0 0;
   0 0 1 0 0;
   0 0 0 1 0;
   0 1 1 1 0;
   0 0 0 0 0];
A(10,10)=0;
B=conway(A,true,true)
```

### `evolution`

`evolution` simulates the evolution of a grid of square cells according to the rules of the Conway's game of life.

The simulations will be interrupted if the grid comes to a stable configuration.By default, 100 generations will be computed.

By default, the grid is assumed to be not periodic. If cyc=true is given, then grid is assumed periodic.

By default, two plots are shown, the first being the configuration of the original grid and the second, the configuration of the next generations. If fig=false is given, then no plot is shown.

By default, the colormap pattern of plots is gray. Please address to the colormap help documentation for different patterns.

By default, the next generation configuration is shown after s=50 milliseconds.

**Syntax:**

```dotnetcli
[B]=evolution(A,N=100,cyc=false,fig=true,map='gray',s=50)
```

**Examples:**

Visualize the evolution of the first 200 generations of a grid originally set as a spaceship glider pattern in a periodic 13 by 11 cells grid.

```dotnetcli
A=[0 0 0 0 0;
   0 0 1 0 0;
   0 0 0 1 0;
   0 1 1 1 0;
   0 0 0 0 0];
A(13,11)=0;
B=evolution(A,200,true)
```

Copyright &copy; 2022 Alexandre Umpierre

email: aumpierre@gmail.com
