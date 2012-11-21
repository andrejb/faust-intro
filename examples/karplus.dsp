//-----------------------------------------------
//         Karplus - Strong
//-----------------------------------------------

// noise generator
//---------------------
random = (*(1103515245) + 12345) ~ _ ;
RANDMAX = 2147483647 ;
noise   = random * (1.0/RANDMAX) ;

// delay lines
//---------------------
index(n)   = _ & (n-1) ~ +(1) ;     // n = 2**i
delay(n,d) = n, 0.0, index(n), _ , (index(n)-int(d))
                                       & (n-1) : rwtable ;
// trigger
//--------
impulse    =  _ <: _ , mem : - : (_ > 0.0) ;
release(n) = + ~ ( _ <: _ , ( _ > 0)/n : - ) ;
trigger(n) = impulse : release(n) : _ > 0 ;

// user interface
//-----------------
play(n) = button("play"):trigger(n) ;
dur     = hslider("duration", 128, 2, 512, 1) ;
att     = hslider("attenuation", 0, -10, 10, 0.1) ;

karplus1(bt, dl, att) = noise*bt :
           ( + <: delay(4096, dl-1), delay(4096, dl) )
           ~ ( + : *( (1-bt)/(2+att/100) ) ) : !, _ ;

karplusStrong = karplus1( play(dur), dur, att ) ;

process = karplusStrong;

