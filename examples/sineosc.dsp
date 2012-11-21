//-----------------------------------------------
//      Sinusoidal Oscillator
//-----------------------------------------------

// Mathematical functions & constants
//------------------------------------
//sin   = ffunction(float sin (float), <math.h>, "");
//floor = ffunction(float floor (float), <math.h>, "");
PI    = 3.1415926535897932385;

// Oscillator definition
//--------------------------
tablesize    = 40000 ;
samplingfreq = 44100. ;
time        = (+(1)~_) - 1; // O,1,2,3,...
sinwaveform = time*(2*PI)/tablesize : sin;
decimal     = _ <: -(floor);
phase(freq) = freq/samplingfreq :
                  (+ : decimal) ~ _ : *(tablesize) : int ;
osc(freq)   = phase(freq) : rdtable(tablesize,sinwaveform);

// User interface
//----------------
vol = hslider("volume", 0, 0, 1, 0.001);
freq = hslider("freq", 400, 0, 15000, 0.1);

//----------------
process = osc(freq) * vol;

