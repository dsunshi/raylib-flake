
#include "raylib.h"
#include <stdio.h>

int main(int argc, char **argv) {

  InitWindow(800, 800, "Window Title");

  while (!WindowShouldClose()) {
    BeginDrawing();
    ClearBackground(GREEN);
    EndDrawing();
  }

  return 0;
}
