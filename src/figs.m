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

function figs(A,map)
    # Syntax:
    # figs(A,map)
    #
    # figs produces two plots
    #  the first being
    #  the configuration of the original grid and
    #  the second,
    #  the configuration of the next generation.
    # figs is an internal function of
    #  the game-of-life toolbox for GNU Octave.
    P=size(A,2);
    Q=size(A,1);
    figure('color','#A3A3A3');
    colormap(map);
    set(gca,'xlim',[.5 P+.5],...
    'ylim',[.5 Q+.5],...
    'xgrid','on',...
    'ygrid','on',...
    'gridcolor',[1 1 1],...
    'xtick',[1:P],...
    'xtick',[1:Q],...
    'box','on');
    image(A*100);
    axis('nolabel','equal');
endfunction

