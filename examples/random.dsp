//-----------------------------------------------
//          Two noises compared
//-----------------------------------------------

RANDMAX = 2147483647;

random1 = ffunction(int random (), <stdlib.h>, "");
noise1 = (random1 << 1) * (1.0/RANDMAX);

random2 = (*(1103515245)+12345) ~ _ ;
noise2 = random2 * (1.0/RANDMAX);

compare(a,b) = (a*(1-button("Switch")) +
                                b*button("Switch"));

process = compare(noise1, noise2) *
          hslider("volume", 0, 0, 1, 0.01) <: _,_  ;

