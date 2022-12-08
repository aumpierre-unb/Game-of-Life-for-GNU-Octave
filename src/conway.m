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

function B=conway(A,cyc=false,fig=false,map='gray')
    # Syntax:
    # [B]=conway(A[,cyc[,fig]])
    #
    # conway computes
    #  the configuration of
    #  the next generation of
    #  a grid of square cells,
    #  each of which is in either live or dead.
    # Each cell will be live or dead
    #  in the next generation according to
    #  the rules of the Conway's game of life:
    # 1) A live cells with exactly 2 or 3 live neighbors
    #  stays a live cell, otherwise it dies.
    # 2) A dead cell with 3 live neighbors
    #  becomes alive, otherwise is stays dead.
    # By default, the grid is assumed to be non periodic.
    #  If cyc=true is given, then grid is assumed to be periodic.
    # By default, no plot is shown.
    #  If fig=true is given, then
    #  a figure with two subplots is shown,
    #  the first subplot being
    #  the configuration of the original grid and
    #  the second subplot being
    #  the configuration of the next generations.
    # By default, the colormap pattern of plots
    #  is gray. Please address to
    #  the colormap help documentation for
    #  different patterns.
    # conway is a main function of
    #  the game-of-life toolbox for GNU Octave.
    #
    # Examples:
    # # Compute the next generation
    # # of a spaceship glider pattern
    # # in a 10 by 10 cells grid and
    # # visualise the grids on plots.
    # A=[0 0 0 0 0;
    #    0 0 1 0 0;
    #    0 0 0 1 0;
    #    0 1 1 1 0;
    #    0 0 0 0 0];
    # A(10,10)=0;
    # B=conway(A,true,true)
    #
    # See also: genzero, evolution.
    if cyc
        C=[A(:,end),A,A(:,1)];
        D=[C(end,:);C;C(1,:)];
    else
        D=concat(0,A);
        D=concat(D,0);
    end
    B=zeros(size(D));
    for i=2:size(D,1)-1
        for j=2:size(D,2)-1
            viz=0;
            for m=-1:1
                for n=-1:1
                    if (m==0 && n==0)
                        continue;
                    end
                    if D(i+m,j+n)==1
                        viz=viz+1;
                    end
                    if viz==4
                        break;
                    end
                end
            end
            if D(i,j)==1 && viz==2 || viz==3
                B(i,j)=1;
            end
            if D(i,j)==0 && viz==3
                B(i,j)=1;
            end
        end
    end
    B=B(2:end-1,2:end-1);
    if fig
        P=size(A,2);
        Q=size(A,1);
        figure('color','#A3A3A3');subplot(1,2,1);
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
        axis('nolabel','equal');
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
        image(B*100);
        axis('nolabel','equal');
    end
end

