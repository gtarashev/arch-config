#include <stdlib.h>
#include <ncurses.h>
#include <stdio.h>

// function templates
void printing();
void movingAndSleeping();
void colouring();

// main
int main(void) {
		// starts ncurses
		initscr();
		
		// define start
		int row = 5;
		int col = 0;

		// hide cursor
		curs_set(0);

		// print out alphabet
		for (char c = 65; c <= 90; c++) {
				move(row++, col++);
				addch(c);
				refresh();
				napms(100);
		}

		// try colours
		colouring();

		// finally add a newline and show cursor again
		addch('\n');
		refresh();
		curs_set(1);

}


// coloring function
void colouring() {
		// check if color is available
		if (has_colors()) {
				if (start_color() == OK) {
						init_pair(1, COLOR_YELLOW, COLOR_RED);
						init_pair(2, COLOR_GREEN, COLOR_GREEN);
						init_pair(3, COLOR_MAGENTA, COLOR_CYAN);

						attrset(COLOR_PAIR(1));
						addstr("Yellow and red\n\n");
						refresh();
						attroff(COLOR_PAIR(1));

						attrset(COLOR_PAIR(2) | A_BOLD);
						addstr("Green and green A_BOLD\n\n");
						refresh();
						attroff(COLOR_PAIR(2));
						attroff(A_BOLD);

						attrset(COLOR_PAIR(3));
						addstr("Magenta and cyan\n");
						refresh();
				        attroff(COLOR_PAIR(3));
				} else {
						addstr("Cannot start colours\n");
						refresh();
				}
		} else {
				addstr("Not colour capable\n");
				refresh();
		}
}
