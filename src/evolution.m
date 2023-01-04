#  Copyright (C) 2022 2023 Alexandre Umpierre
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

function [B,n]=evolution(A,N=100,cyc=false,fig=true,map='gray',s=30)
    # Syntax:
    # [B]=evolution(A[,N=100[,cyc=false[,fig=true[,map='gray'[,s=30]]]]])
    #
    # evolution simulates the evolution of
    #  a grid of square cells
    #  according to the rules of
    #  the Conway's game of life.
    # The simulations will be interrupted
    #  if the grid comes to
    #  a stable configuration (including death of all cells).
    # By default, N=100 generations will be computed.
    # By default, the grid is assumed to be finite.
    #  If cyc=true is given, then
    #  grid is assumed to be infinite and periodic.
    # By default, a figure with two subplots is shown,
    #  the first subplot being
    #  the configuration of the original grid and
    #  the second subplot being
    #  the configuration of the next generations.
    #  If fig=false is given, then no plot is shown.
    # By default, the colormap pattern of plots
    #  is gray. Please address to
    #  the colormap help documentation for
    #  different patterns.
    # By default, the next generation configuration
    #  is shown after s=30 milliseconds.
    # evolution is a main function of
    #  the game-of-life toolbox for GNU Octave.
    #
    # Examples:
    # # Observe the evolution of
    # # the first 200 generations of
    # # a grid originally set as
    # # a spaceship glider pattern in
    # # a periodic 13 by 11 cells grid.
    # A=genzero(13,11,'glider');...
    # B=evolution(A,200,true)
    #
    # # Generate a periodic 27 by 28 cells grid
    # # where individual cells have a 26:74 chance
    # # to be live or dead and
    # # observe its evolution.
    # A=genzero(27,28,.26);...
    # B=evolution(A,inf,true)
    #
    # See also: conway, genzero.
    n=0;
    C={};
    start=true;
    k=0;
    while n<N
        if n<10
            C=[C A];
            m=n;
        else
            for i=1:10-1
                C{i}=C{i+1};
            end
            C{10}=A;
            m=10;
        end
        B=conway(A,cyc,:,map);
        n=n+1;
        for i=1:m
            if all(all(B==C{i}))
                printf('Stability after %d itarations with period %d.\n',n-1,m-i+1);
                image(B*100);
                return;
            end
        end
        if n==N
            printf('Not stable after %d itarations.\n',n);
        end
        if start && fig
            P=size(A,2);
            Q=size(A,1);
            figure('color','#A3A3A3');
            subplot(1,2,1);
            colormap(map);
            set(gca,'xlim',[.5 P+.5],...
            'ylim',[.5 Q+.5],...
            'xgrid','on',...
            'ygrid','on',...
            'gridcolor',[.73 .73 .73],...
            'xtick',[1:P],...
            'xtick',[1:Q],...
            'box','on');
            image(A*100);
            axis('nolabel','equal','tic[]');
            start=false;
            subplot(1,2,2);
            colormap(map);
            set(gca,'xlim',[.5 P+.5],...
            'ylim',[.5 Q+.5],...
            'xgrid','on',...
            'ygrid','on',...
            'gridcolor',[1 1 1],...
            'xtick',[1:P],...
            'xtick',[1:Q],...
            'box','on');
        end
        if fig
            image(B*100);
            axis('nolabel','equal','tic[]');
            hold on;
            pause(s/1000);
        end
        if false
            k=k+1;
            print(sprintf('animation%04d.gif',k));
        end
        A=B;
    end
endfunction

