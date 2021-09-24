// This file is a "Hello, world!" in C++ language by GCC for wandbox.
#include <iostream>
#include <cstdlib>

const int height = 48;
const int width = 48;

int drawBoard(char board[width][height]) {
    for ( int i = 0; i < width; ++i) {
        for ( int j = 0; j < height; ++i) {
            std::cout << board[i][j];
        }
        std::cout << std::endl;
    }
    
    return 0;
}

int main()
{
    char playArea[width][height];
    
    for ( int i = 0; i < width; ++i) {
        for ( int j = 0; j < height; ++i) {
            std::cout << "Position(x,y): " + std::toString(i) + " " + std::toString(j) << std:endl; 
            playArea[i][j] = '.';
        }
    }
    
    // Game start
    std::cout << "Welcome to the game." << std::endl;
    
    drawBoard(playArea);
}

// GCC reference:
//   https://gcc.gnu.org/

// C++ language references:
//   https://cppreference.com/
//   https://isocpp.org/
//   http://www.open-std.org/jtc1/sc22/wg21/

// Boost libraries references:
//   https://www.boost.org/doc/
