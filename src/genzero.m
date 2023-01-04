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

function A=genzero(m,n,P=.50)
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
    #  computed accordingly.
    # If the grid pattern is assigned by strings
    #  'block', 'glider', 'blinker', 'toad' or 'beacon'
    #  matrix is generated with the pattern at
    #  its superior left corner.
    # genzero is a main function of
    #  the game-of-life toolbox for GNU Octave.
    #
    # Examples:
    # # Generate a spaceship glider pattern
    # # in a 9 lines and 7 columns matrix.
    # A=genzero(9,7,'glider')
    #
    # # Generate a 27 by 28 cells grid
    # # where individual cells have a 26:74 chance
    # # to be live or dead.
    # A=genzero(27,28,.26)
    #
    # See also: conway, evolution.
    if isreal(P) && isscalar(P) && P>0
        A=(rand(m,n)<P);
    elseif strcmpi(P,'block')
        A=[0 0 0;
           0 1 1;
           0 1 1];
        if m>size(A,1)
            A(m,end)=0;
        end
        if n>size(A,2)
            A(end,n)=0;
        end
    elseif strcmpi(P,'glider')
        A=[0 0 0 0;
           0 0 1 0;
           0 0 0 1;
           0 1 1 1];
        if m>size(A,1)
            A(m,end)=0;
        end
        if n>size(A,2)
            A(end,n)=0;
        end
    elseif strcmpi(P,'blinker')
        A=[0 0 0 0;
           0 0 1 0;
           0 0 1 0;
           0 0 1 0];
        if m>size(A,1)
            A(m,end)=0;
        end
        if n>size(A,2)
            A(end,n)=0;
        end
    elseif strcmpi(P,'toad')
        A=[0 0 0 0 0;
           0 0 0 0 0
           0 0 1 1 1;
           0 1 1 1 0;
           0 0 0 0 0];
        if m>size(A,1)
            A(m,end)=0;
        end
        if n>size(A,2)
            A(end,n)=0;
        end
    elseif strcmpi(P,'beacon')
        A=[0 0 0 0 0;
           0 1 1 0 0;
           0 1 1 0 0;
           0 0 0 1 1;
           0 0 0 1 1];
        if m>size(A,1)
            A(m,end)=0;
        end
        if n>size(A,2)
            A(end,n)=0;
        end
    end
end

