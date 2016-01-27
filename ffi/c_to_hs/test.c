#include <stdio.h>
#include <stdlib.h>
#include "HsFFI.h"
#ifdef __GLASGOW_HASKELL__
#include "Safe_stub.h"
extern void __stginit_Safe(void);
#endif

int main(int argc, char *argv[])
{
  int i;
  int x;
  hs_init(&argc, &argv);
#ifdef __GLASGOW_HASKELL__
  hs_add_root(__stginit_Safe);
#endif
  
  x = atoi(argv[1]);
  i = add_one_hs(x);
  printf("add_one(%d) = %d", x, i);

  hs_exit();
  return 0;
}
