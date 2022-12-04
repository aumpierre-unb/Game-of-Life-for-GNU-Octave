# Copyright (C) 2022 Alexandre Umpierre
#
# This file is part of game-of-life toolbox for GNU Octave.
# game-of-life toolbox for GNU Octave is free software:
# you can redistribute it and/or modify it under the terms
# of the GNU General Public License (GPL) version 3
# as published by the Free Software Foundation.
#
# game-of-life toolbox for GNU Octave is distributed in the hope
# that it will be useful, but WITHOUT ANY WARRANTY;
# without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
# See the GNU General Public License for more details.
#
# You should have received a copy of the
# GNU General Public License along with this program
# (license GNU GPLv3.txt).
# It is also available at https://www.gnu.org/licenses/.

function B=evolution(A,N=100,cyc=false,fig=true,map='gray',s=50)
    # Syntax:
    # [B]=evolution(A,N=100,cyc=false,fig=true,map='gray',s=50)
    #
    # evolution simulates the evolution of
    #  a grid of square cells
    #  according to the rules of
    #  the Conway's game of life.
    # The simulations will be interrupted
    #  if the grid comes to a stable configuration.
    # By default, 100 generations will be computed.
    # By default, the grid is assumed to be not periodic.
    #  If cyc=true is given, then grid is assumed periodic.
    # By default, two plots are shown,
    #  the first being
    #  the configuration of the original grid and
    #  the second,
    #  the configuration of the next generations.
    #  If fig=false is given, then no plot is shown.
    # By default, the colormap pattern of plots
    #  is gray. Please address to
    #  the colormap help documentation for
    #  different patterns.
    # By default, the next generation configuration
    #  is shown after s=50 milliseconds.
    # evolution is a main function of
    #  the game-of-life toolbox for GNU Octave.
    #
    # Examples:
    # # Visualize the evolution of
    # # the first 200 generations of
    # # a grid originally set as
    # # a spaceship glider pattern in
    # # a periodic 13 by 11 cells grid.
    # A=[0 0 0 0 0;
    #    0 0 1 0 0;
    #    0 0 0 1 0;
    #    0 1 1 1 0;
    #    0 0 0 0 0];
    # A(13,11)=0;
    # B=evolution(A,200,true)
    #
    # See also: conway, genzero.
    n=0;
    start=true;
    while n<N
        B=conway(A,cyc,:,map);
        n=n+1;
##        if ~any(any(B))
##            printf('All dead after %d iterations!\n',n);
##            image(B*100);
##            break;
##        end
        if all(all(B==A))
            printf('Stability reached after %d itarations.\n',n-1);
            image(B*100);
            break;
        end
        if n==N
            printf('Not stable after %d itarations.\n',n);
        end
        if start && fig
            figs(A,map);
            start=false;
            figs(B,map);
            hold on;
        end
        if fig
            image(B*100);
            pause(s/1000);
        end
        A=B;
    end
endfunction

