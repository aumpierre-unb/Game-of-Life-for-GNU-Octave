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

function A=genzero(m,n,P=.5)
    # Syntax:
    # [A]=genzero(m,n[,P=.5])
    #
    # genzero generates a matrix of
    #  ones and zeros of
    #  m lines and n columns.
    # By default, elements of the matrix
    #  are computed individually with
    #  50 percent probability of
    #  assuming the value one.
    # If probability for ones if given,
    #  the values of all elements are
    #  computed with this parameter.
    # If strings 'oscillator blinker' or
    #  'still block' or 'spaceship glider'
    #  is assigned, matrix is build with
    #  the given pattern at
    #  the superior left corner of the grid.
    # genzero is a main function of
    #  the game-of-life toolbox for GNU Octave.
    #
    # Examples:
    # # Generate a spaceship glider pattern
    # # in a 9 lines and 7 columns matrix.
    # A=genzero(9,7,'spaceship glider')
    #
    # See also: conway, evolution.
    if isreal(P)&&isscalar(P)&&P>0
        A=(rand(m,n)<P);
    elseif strcmpi(P,"oscillator blinker")
        A=[0 0 0 0 0;
           0 0 1 0 0;
           0 0 1 0 0;
           0 0 1 0 0;
           0 0 0 0 0];
        if m>5
            A(m,end)=0;
        end
        if n>5
            A(end,n)=0;
        end
    elseif strcmpi(P,"still block")
        A=[0 0 0 0;
           0 1 1 0;
           0 1 1 0;
           0 0 0 0];
        if m>4
            A(m,end)=0;
        end
        if n>4
            A(end,n)=0;
        end
    elseif strcmpi(P,"spaceship glider")
        A=[0 0 0 0 0;
           0 0 1 0 0;
           0 0 0 1 0;
           0 1 1 1 0;
           0 0 0 0 0];
        if m>5
            A(m,end)=0;
        end
        if n>5
            A(end,n)=0;
        end
    end
end

