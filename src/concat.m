# Copyright (C) 2022 2023 Alexandre Umpierre
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

function A=concat(M,N)
    # Syntax:
    # [A]=concat(M,N)
    #
    # concat produces the
    #  horiziontal and vertical concatenation
    #  of matrices M and N.
    # concat is an internal function of
    #  the game-of-life toolbox for GNU Octave.
    #
    # Examples:
    # # Concatenate
    # # a 2 by 3 matrix of ones and
    # # a 4 by 5 matrix of random numbers.
    # M=ones(2,3),...
    # N=rand(4,5),...
    # A=concat(M,N)
    P=zeros(size(M,1),size(N,2));
    Q=zeros(size(N,1),size(M,2));
    A=[M P;Q N];
end
