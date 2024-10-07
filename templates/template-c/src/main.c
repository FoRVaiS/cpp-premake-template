#include <stdio.h>

#define LOG(...) printf(__VA_ARGS__)

int main(int argc, char *argv[]) {
  LOG("Hello World!\n");
  return 0;
}
