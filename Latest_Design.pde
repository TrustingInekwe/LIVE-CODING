import controlP5.*;

import ddf.minim.*;
import ddf.minim.ugens.*;

Minim minim;
AudioOutput out;
//AudioSample kick, snare, clap;
AudioPlayer kick, snare, clap, hat;
//import processing.sound.*;

//=================================================================================initialization begins=========================================================================================================================================

//Amplitude amp;

PFont font1;

RadioButton r1, r2, r3, w, time0, transpose0, notes0, pan0, effect0, wave0, delete0;
ControlP5 cp5;
int val = 0, octave = 1, func = 0;
Button i0, k0, sn0, h0, c0, sy0, e0, f0, k1, sn1, h1, c1, sy1, e1, k2, sn2, h2, c2, sy2, e2, k3, sn3, h3, c3, sy3, e3, k4, sn4, h4, c4, sy4, e4, k5, sn5, h5, c5, sy5, e5, k6, sn6, h6, c6, sy6, e6, k7, sn7, h7, c7, sy7, e7, play, pause;
Button t0, tr0, r0, a0, de0, p0, instrument0, instrument1, instrument2, instrument3, instrument4, instrument5, instrument6, instrument7;
Button A0, B0, C0, D0, E0, F0, G0, H0, A1, B1, C1, D1, E1, F1, G1, H1, A2, B2, C2, D2, E2, F2, G2, H2, A3, B3, C3, D3, E3, F3, G3, H3, A4, B4, C4, D4, E4, F4, G4, H4, A5, B5, C5, D5, E5, F5, G5, H5, A6, B6, C6, D6, E6, F6, G6, H6;
Button A7, B7, C7, D7, E7, F7, G7, H7;
Button A0p, B0p, C0p, D0p, E0p, F0p, G0p, H0p, A1p, B1p, C1p, D1p, E1p, F1p, G1p, H1p, A2p, B2p, C2p, D2p, E2p, F2p, G2p, H2p, A3p, B3p, C3p, D3p, E3p, F3p, G3p, H3p, A4p, B4p, C4p, D4p, E4p, F4p, G4p, H4p;
Button A5p, B5p, C5p, D5p, E5p, F5p, G5p, H5p, A6p, B6p, C6p, D6p, E6p, F6p, G6p, H6p, A7p, B7p, C7p, D7p, E7p, F7p, G7p, H7p;

//SoundFile kick, snare, clap;

ScrollableList lastP;

//TriOsc triOsc;
//SinOsc sinePiano, sineBass, sineDrum;
//Env env;
//Oscil sineOsc;
//sineOsc = new Oscil
//teusdays  noon, fridays noon and 1

float attackTimePiano = 0.003;
float sustainTimePiano = 0.004;
float sustainLevelPiano = 0.3;
float releaseTimePiano = 0.4;
//PImage img[] = new PImage[4];
PImage imgKICK, imgSNARE, imgHAT, imgCLAP, imgSYNTH;

float attackTimeBass = 0.001;
float sustainTimeBass = 0.004;
float sustainLevelBass = 0.3;
float releaseTimeBass = 0.4;

float attackTimeDrum = 0.005;
float sustainTimeDrum = 0.01;
float sustainLevelDrum = 0.01;
float releaseTimeDrum = 0.4;
int a = 75, b = 100, c = b + 100, inst = 8, inst0 = 8, inst1 = 8, inst2 = 0, inst3 = 0, inst4 = 0, inst5 = 0, inst6 = 0, inst7 = 0, entCircleL = 0, entCircleR = 0, entLeft = 0, entRight = 0, entUp = 0, entDown = 0;
int[] property0 = new int[8], property1 = new int[8], property2 = new int[8], property3 = new int[8], property4 = new int[8], property5 = new int[8], property6 = new int[8], property7 = new int[8];
int[] decision0 = new int[8], decision1 = new int[8], decision2 = new int[8], decision3 = new int[8], decision4 = new int[8], decision5 = new int[8], decision6 = new int[8], decision7 = new int[8];
int[] instSelect = new int[8];
int property = 8, highlight = 0, righty = 8, currentPositionY = 0, currentPositionX = -1, upward = 0, redhighlight = 0, leave = 0, close = 0, run = 0, playALL = 0, firstVal = 0, intRighty = 3, instUpward = 0, checker = 0, entVal_instrument = 0, entVal_pattern = 0;
int synthSel = 0, notes0Row = 0, notes0Col = 0, time0Row = 0, time0Col = 0, currentNotePosition, propLeave = 0, propRighty = 8, propUpward = 0, propHighlight = 0, instPropRighty = 0, instPropUpward = 0, propcurrentPositionX = 0,
propcurrentPositionY = 0;
int patList1 = 0, patList2 = 0, decide = 0, panValue = 0; 
float[] instList0 = new float[8], instList1 = new float[8], instList2 = new float[8], instList3 = new float[8], instList4 = new float[8], instList5 = new float[8], instList6 = new float[8], instList7 = new float[8];
float fr0 = 130.81, fr1 = 146.83, fr2 = 164.81, fr3 = 174.61, fr4 = 196.00, fr5 = 220.00, fr6 = 246.94, fr01 = 261.63, fr11 = 293.66, fr21 = 329.63, fr31 = 349.23, fr41 = 392.00, fr51 = 440.00, fr61 = 493.88, 
fr_0 = 65.41, fr_1 = 73.42, fr_2 = 82.41, fr_3 = 87.31, fr_4 = 98.00, fr_5 = 110.00, fr_6 = 123.47;
//======================================================================================initialization ends=========================================================================================================================================
//sineBass.freq(100);
//  env.play(sineBass, attackTimeBass, sustainTimeBass, sustainLevelBass, releaseTimeBass);
Waveform disWave0 = Waves.SINE, disWave1 = Waves.SINE, disWave2 = Waves.SINE, disWave3 = Waves.SINE, disWave4 = Waves.SINE, disWave5 = Waves.SINE, disWave6 = Waves.SINE, disWave7 = Waves.SINE;
float gainValue0 = 0.5f, gainValue1 = 0.5f, gainValue2 = 0.5f, gainValue3 = 0.5f, gainValue4 = 0.5f, gainValue5 = 0.5f, gainValue6 = 0.5f, gainValue7 = 0.5f, gainValue8 = 0.5f;
int bitRes0 = 0, bitRes1 = 0, bitRes2 = 0, bitRes3 = 0, bitRes4 = 0, bitRes5 = 0, bitRes6 = 0, bitRes7 = 0 ; //1-3
float delayVal0 = 0.0, delayVal1 = 0.0, delayVal2 = 0.0, delayVal3 = 0.0, delayVal4 = 0.0, delayVal5 = 0.0, delayVal6 = 0.0, delayVal7 = 0.0;  // 0.1 - 0.2;
//Sampler     snare;
class ToneInstrument implements Instrument
{
  Oscil sineOsc, sineOsc1, LFO;
  Pan pan, pan1;
  ADSR adsr;
  Delay myDelay, myDelay1;
  BitCrush bitCrush;
  //Gain gain;
  ToneInstrument( float oscFrequency, int panValue, Waveform wave, float gainValue, float delayVal, int bitRes) //for synth
  {
    sineOsc = new Oscil( oscFrequency, gainValue, wave );
    //osc frequency + 
    //ADSR(float maxAmp, float attTime, float decTime, float susLvl, float relTime)
    adsr = new ADSR( 0.5, 0.00001, 0.05, 0.5, 0.1 );
    bitCrush = new BitCrush(bitRes, out.sampleRate());
    myDelay = new Delay( delayVal, 0.1, true, true );
    //adsr = new ADSR( 0.5, 0.00001, 0.05, 0.5, 0.1 );  //NEED TO PATCH THIS UGEN (adsr) TO sineOsc AND pan
    pan = new Pan(panValue);
    sineOsc.patch(adsr);
    //adsr.patch(myDelay);
    //gain.patch( adsr );
    if(bitRes == 0 && delayVal == 0.0){adsr.patch(pan);}
    else if(bitRes != 0 && delayVal == 0.0) {adsr.patch(bitCrush); bitCrush.patch(pan);}
    else if(bitRes == 0 && delayVal != 0.0) {adsr.patch(myDelay); myDelay.patch(pan);}
    else if(bitRes != 0 && delayVal != 0.0) {adsr.patch(bitCrush); bitCrush.patch(myDelay); myDelay.patch(pan);}
    //pan.patch( out );
    //LFO = new Oscil( 0.5, 1.0, wave );
    //adsr.patch( pan );
    //LFO.patch( pan.pan );
  }
  ToneInstrument( float oscFrequency, int panValue, Waveform wave, float gainValue, float delayVal)  //for kick
  {
    sineOsc1 = new Oscil( oscFrequency, gainValue, wave );
    adsr = new ADSR( 0.5, 0.00001, 0.05, 0.5, 0.1 );
    //adsr = new ADSR( 0.5, 0.00001, 0.05, 0.5, 0.1 );
    pan = new Pan(panValue);
    myDelay1 = new Delay( delayVal, 0.1, true, true );
    sineOsc1.patch(adsr);
    //adsr.patch(sineOsc);
    //gain.patch( adsr );
    if(delayVal == 0.0){adsr.patch(pan);}
    else {adsr.patch(myDelay1); myDelay1.patch(pan);}
    
    //pan.patch( out );
    
  }
  void noteOn( float dur )
  {
    pan.patch( out );
    adsr.noteOn();
    //adsr1.noteOn();
    //pan1.patch(out);
  }
  void noteOff()
  {
    pan.unpatch( out );
    //adsr.unpatchAfterRelease( out );
    adsr.noteOff();
    //adsr1.noteOff();
    //pan1.patch(out);
  }
}

//=========================================================================================setup starts=========================================================================================================================================
public void setup(){
  size(1500,900);
  frameRate(4);
  font1 = createFont("SansSerif-30.vlw", 32);
  imgKICK = loadImage("KICK.png");
  imgSNARE = loadImage("SNARE.jpg");
  imgHAT = loadImage("HAT.jpg");
  imgCLAP = loadImage("CLAP.png");
  imgSYNTH = loadImage("SYNTH.jpg");
  //PImage imgKICK, imgSNARE, imgHAT, imgCLAP, imgSYNTH;
  

  //font1 = loadFont("TimesNewRomanPSMT-48.vlw");
  //font2 = createFont("TimesNewRomanPSMT-48.vlw", 30, true);
  minim = new Minim( this );
  // because we are using a Pan UGen, we need a stereo output.
  out = minim.getLineOut( Minim.STEREO, 2048 );
  //ToneInstrument myNote = new ToneInstrument(587.3f, -1);
  //out.playNote( 0.5, 2.6, myNote );
  //currentFreq = Frequency.ofPitch( "A4" );
  //wave = new Oscil( currentFreq, 0.6f, Waves.TRIANGLE );
  //sineOsc = new Oscil( 440, 0.5f, Waves.SINE );
  
   cp5 = new ControlP5(this);
   w = cp5.addRadioButton("WaveRadioButton");
 
 //========================================================================================= Instrument Selection INITIALIZATION =========================================================================================================================================  
   for (int i = 0; i<8; i++){
     instSelect[i] = 8;
   }
   
 //========================================================================================= DECISION INITIALIZATION =========================================================================================================================================  
   for (int i = 0; i<8; i++){
     decision0[i] = 8;
   }
   for (int i = 0; i<8; i++){
     decision1[i] = 8;
   }
   for (int i = 0; i<8; i++){
     decision2[i] = 8;
   }
   for (int i = 0; i<8; i++){
     decision3[i] = 8;
   }
   for (int i = 0; i<8; i++){
     decision4[i] = 8;
   }
   for (int i = 0; i<8; i++){
     decision5[i] = 8;
   }
   for (int i = 0; i<8; i++){
     decision6[i] = 8;
   }
   for (int i = 0; i<8; i++){
     decision7[i] = 8; 
   }
  
  snare = minim.loadFile("snare_clap.wav");
  //kick = minim.loadFile("sub_kick.wav", 512);
  clap = minim.loadFile("808-clap.wav");
  hat = minim.loadFile("808-clap.wav");
  //snare.setVolume(0.1);
  
  

 //========================================================================================= PROPERTY ARRAY INITIALIZATION =========================================================================================================================================  
   for (int i = 0; i<8; i++){
     property0[i] = 8;
   }
   for (int i = 0; i<8; i++){
     property1[i] = 8;
   }
   for (int i = 0; i<8; i++){
     property2[i] = 8;
   }
   for (int i = 0; i<8; i++){
     property3[i] = 8;
   }
   for (int i = 0; i<8; i++){
     property4[i] = 8;
   }
   for (int i = 0; i<8; i++){
     property5[i] = 8;
   }
   for (int i = 0; i<8; i++){
     property6[i] = 8;
   }
   for (int i = 0; i<8; i++){
     property7[i] = 8;
   }
   
   play = cp5.addButton("PLAY").setPosition(10, 10);
   pause = cp5.addButton("PAUSE").setPosition(80, 10);
 
   
//========================================================================================= INSTRUMENT DROPDOWNLIST ====================================================================================================================================
  // for(int j = 0; j < 7; j++){ 
  //cp5.addButton("Instrument" + j).setPosition(b + 100,a + j*50).setSize(70,30).setCaptionLabel("Instrument 0").setCaptionLabel("");
  //}
   
   instrument0 = cp5.addButton("instrument0").setPosition(130, 75).setSize(150,30).setColorBackground(color(255)).setCaptionLabel("");
   instrument1 = cp5.addButton("instrument1").setPosition(130, 125).setSize(150,30).setColorBackground(255).setCaptionLabel("");
   instrument2 = cp5.addButton("instrument2").setPosition(130, 175).setSize(150,30).setColorBackground(255).setCaptionLabel("");
   instrument3 = cp5.addButton("instrument3").setPosition(130, 225).setSize(150,30).setColorBackground(255).setCaptionLabel("");
   instrument4 = cp5.addButton("instrument4").setPosition(130, 275).setSize(150,30).setColorBackground(255).setCaptionLabel("");
   instrument5 = cp5.addButton("instrument5").setPosition(130, 325).setSize(150,30).setColorBackground(255).setCaptionLabel("");
   instrument6 = cp5.addButton("instrument6").setPosition(130, 375).setSize(150,30).setColorBackground(255).setCaptionLabel("");
   instrument7 = cp5.addButton("instrument7").setPosition(130, 425).setSize(150,30).setColorBackground(255).setCaptionLabel("");

//========================================================================================= PROPERTY DROPDOWNLIST ====================================================================================================================================

  //text("Array 0:", 100,a + 0*50, a - 7);
  
  
   //for(int j = 0; j < 8; j++){  
   //   //int k = 65 + j;
   //   //char t = char(k);
   //   String i = str(j);
   //   textSize(15);
   //   text(i, b + 230 + j*100, a - 7);
   //   //cp5.addButton(i).setPosition(b + 200 + j*100, a).setSize(70,30);
   // }
  
  //========================================================================================= Pattern Array Grid Buttons =========================================================================================================================================   
  A0 = cp5.addButton("A" + 0).setPosition(100 + 200 + 0*100, a).setSize(70,30).setCaptionLabel("").setColorBackground(#C6C6C6);
  B0 = cp5.addButton("B" + 0).setPosition(100 + 200 + 1*100, a).setSize(70,30).setCaptionLabel("").setColorBackground(#C6C6C6);
  C0 = cp5.addButton("C" + 0).setPosition(100 + 200 + 2*100, a).setSize(70,30).setCaptionLabel("").setColorBackground(#C6C6C6);
  D0 = cp5.addButton("D" + 0).setPosition(100 + 200 + 3*100, a).setSize(70,30).setCaptionLabel("").setColorBackground(#C6C6C6);
  E0 = cp5.addButton("E" + 0).setPosition(100 + 200 + 4*100, a).setSize(70,30).setCaptionLabel("").setColorBackground(#C6C6C6);
  F0 = cp5.addButton("F" + 0).setPosition(100 + 200 + 5*100, a).setSize(70,30).setCaptionLabel("").setColorBackground(#C6C6C6);
  G0 = cp5.addButton("G" + 0).setPosition(100 + 200 + 6*100, a).setSize(70,30).setCaptionLabel("").setColorBackground(#C6C6C6);
  H0 = cp5.addButton("H" + 0).setPosition(100 + 200 + 7*100, a).setSize(70,30).setCaptionLabel("").setColorBackground(#C6C6C6);
  //for(int j = 0; j < 8; j++){  
  //  int k = 65 + j;
  //  char t = char(k);
  //  String i = str(t);
  //  cp5.addButton(i + 0).setPosition(b + 200 + j*100, a).setSize(70,30).setCaptionLabel("");
  //  print(i + 0);
  //}
  
  A1 = cp5.addButton("A" + 1).setPosition(100 + 200 + 0*100, a + 50).setSize(70,30).setCaptionLabel("").setColorBackground(#C6C6C6);
  B1 = cp5.addButton("B" + 1).setPosition(100 + 200 + 1*100, a + 50).setSize(70,30).setCaptionLabel("").setColorBackground(#C6C6C6);
  C1 = cp5.addButton("C" + 1).setPosition(100 + 200 + 2*100, a + 50).setSize(70,30).setCaptionLabel("").setColorBackground(#C6C6C6);
  D1 = cp5.addButton("D" + 1).setPosition(100 + 200 + 3*100, a + 50).setSize(70,30).setCaptionLabel("").setColorBackground(#C6C6C6);
  E1 = cp5.addButton("E" + 1).setPosition(100 + 200 + 4*100, a + 50).setSize(70,30).setCaptionLabel("").setColorBackground(#C6C6C6);
  F1 = cp5.addButton("F" + 1).setPosition(100 + 200 + 5*100, a + 50).setSize(70,30).setCaptionLabel("").setColorBackground(#C6C6C6);
  G1 = cp5.addButton("G" + 1).setPosition(100 + 200 + 6*100, a + 50).setSize(70,30).setCaptionLabel("").setColorBackground(#C6C6C6);
  H1 = cp5.addButton("H" + 1).setPosition(100 + 200 + 7*100, a + 50).setSize(70,30).setCaptionLabel("").setColorBackground(#C6C6C6);
  //for(int j = 0; j < 8; j++){  
  //  int k = 65 + j;
  //  char t = char(k);
  //  String i = str(t);
  //  cp5.addButton(i + 1).setPosition(b + 200 + j*100, a + 50).setSize(70,30).setCaptionLabel("");
  //}
  
  A2 = cp5.addButton("A" + 2).setPosition(100 + 200 + 0*100, a + 100).setSize(70,30).setCaptionLabel("").setColorBackground(#C6C6C6);
  B2 = cp5.addButton("B" + 2).setPosition(100 + 200 + 1*100, a + 100).setSize(70,30).setCaptionLabel("").setColorBackground(#C6C6C6);
  C2 = cp5.addButton("C" + 2).setPosition(100 + 200 + 2*100, a + 100).setSize(70,30).setCaptionLabel("").setColorBackground(#C6C6C6);
  D2 = cp5.addButton("D" + 2).setPosition(100 + 200 + 3*100, a + 100).setSize(70,30).setCaptionLabel("").setColorBackground(#C6C6C6);
  E2 = cp5.addButton("E" + 2).setPosition(100 + 200 + 4*100, a + 100).setSize(70,30).setCaptionLabel("").setColorBackground(#C6C6C6);
  F2 = cp5.addButton("F" + 2).setPosition(100 + 200 + 5*100, a + 100).setSize(70,30).setCaptionLabel("").setColorBackground(#C6C6C6);
  G2 = cp5.addButton("G" + 2).setPosition(100 + 200 + 6*100, a + 100).setSize(70,30).setCaptionLabel("").setColorBackground(#C6C6C6);
  H2 = cp5.addButton("H" + 2).setPosition(100 + 200 + 7*100, a + 100).setSize(70,30).setCaptionLabel("").setColorBackground(#C6C6C6);

  A3 = cp5.addButton("A" + 3).setPosition(100 + 200 + 0*100, a + 150).setSize(70,30).setCaptionLabel("").setColorBackground(#C6C6C6);
  B3 = cp5.addButton("B" + 3).setPosition(100 + 200 + 1*100, a + 150).setSize(70,30).setCaptionLabel("").setColorBackground(#C6C6C6);
  C3 = cp5.addButton("C" + 3).setPosition(100 + 200 + 2*100, a + 150).setSize(70,30).setCaptionLabel("").setColorBackground(#C6C6C6);
  D3 = cp5.addButton("D" + 3).setPosition(100 + 200 + 3*100, a + 150).setSize(70,30).setCaptionLabel("").setColorBackground(#C6C6C6);
  E3 = cp5.addButton("E" + 3).setPosition(100 + 200 + 4*100, a + 150).setSize(70,30).setCaptionLabel("").setColorBackground(#C6C6C6);
  F3 = cp5.addButton("F" + 3).setPosition(100 + 200 + 5*100, a + 150).setSize(70,30).setCaptionLabel("").setColorBackground(#C6C6C6);
  G3 = cp5.addButton("G" + 3).setPosition(100 + 200 + 6*100, a + 150).setSize(70,30).setCaptionLabel("").setColorBackground(#C6C6C6);
  H3 = cp5.addButton("H" + 3).setPosition(100 + 200 + 7*100, a + 150).setSize(70,30).setCaptionLabel("").setColorBackground(#C6C6C6);
  
  A4 = cp5.addButton("A" + 4).setPosition(100 + 200 + 0*100, a + 200).setSize(70,30).setCaptionLabel("").setColorBackground(#C6C6C6);
  B4 = cp5.addButton("B" + 4).setPosition(100 + 200 + 1*100, a + 200).setSize(70,30).setCaptionLabel("").setColorBackground(#C6C6C6);
  C4 = cp5.addButton("C" + 4).setPosition(100 + 200 + 2*100, a + 200).setSize(70,30).setCaptionLabel("").setColorBackground(#C6C6C6);
  D4 = cp5.addButton("D" + 4).setPosition(100 + 200 + 3*100, a + 200).setSize(70,30).setCaptionLabel("").setColorBackground(#C6C6C6);
  E4 = cp5.addButton("E" + 4).setPosition(100 + 200 + 4*100, a + 200).setSize(70,30).setCaptionLabel("").setColorBackground(#C6C6C6);
  F4 = cp5.addButton("F" + 4).setPosition(100 + 200 + 5*100, a + 200).setSize(70,30).setCaptionLabel("").setColorBackground(#C6C6C6);
  G4 = cp5.addButton("G" + 4).setPosition(100 + 200 + 6*100, a + 200).setSize(70,30).setCaptionLabel("").setColorBackground(#C6C6C6);
  H4 = cp5.addButton("H" + 4).setPosition(100 + 200 + 7*100, a + 200).setSize(70,30).setCaptionLabel("").setColorBackground(#C6C6C6);
  
  A5 = cp5.addButton("A" + 5).setPosition(100 + 200 + 0*100, a + 250).setSize(70,30).setCaptionLabel("").setColorBackground(#C6C6C6);
  B5 = cp5.addButton("B" + 5).setPosition(100 + 200 + 1*100, a + 250).setSize(70,30).setCaptionLabel("").setColorBackground(#C6C6C6);
  C5 = cp5.addButton("C" + 5).setPosition(100 + 200 + 2*100, a + 250).setSize(70,30).setCaptionLabel("").setColorBackground(#C6C6C6);
  D5 = cp5.addButton("D" + 5).setPosition(100 + 200 + 3*100, a + 250).setSize(70,30).setCaptionLabel("").setColorBackground(#C6C6C6);
  E5 = cp5.addButton("E" + 5).setPosition(100 + 200 + 4*100, a + 250).setSize(70,30).setCaptionLabel("").setColorBackground(#C6C6C6);
  F5 = cp5.addButton("F" + 5).setPosition(100 + 200 + 5*100, a + 250).setSize(70,30).setCaptionLabel("").setColorBackground(#C6C6C6);
  G5 = cp5.addButton("G" + 5).setPosition(100 + 200 + 6*100, a + 250).setSize(70,30).setCaptionLabel("").setColorBackground(#C6C6C6);
  H5 = cp5.addButton("H" + 5).setPosition(100 + 200 + 7*100, a + 250).setSize(70,30).setCaptionLabel("").setColorBackground(#C6C6C6);
  
  A6 = cp5.addButton("A" + 6).setPosition(100 + 200 + 0*100, a + 300).setSize(70,30).setCaptionLabel("").setColorBackground(#C6C6C6);
  B6 = cp5.addButton("B" + 6).setPosition(100 + 200 + 1*100, a + 300).setSize(70,30).setCaptionLabel("").setColorBackground(#C6C6C6);
  C6 = cp5.addButton("C" + 6).setPosition(100 + 200 + 2*100, a + 300).setSize(70,30).setCaptionLabel("").setColorBackground(#C6C6C6);
  D6 = cp5.addButton("D" + 6).setPosition(100 + 200 + 3*100, a + 300).setSize(70,30).setCaptionLabel("").setColorBackground(#C6C6C6);
  E6 = cp5.addButton("E" + 6).setPosition(100 + 200 + 4*100, a + 300).setSize(70,30).setCaptionLabel("").setColorBackground(#C6C6C6);
  F6 = cp5.addButton("F" + 6).setPosition(100 + 200 + 5*100, a + 300).setSize(70,30).setCaptionLabel("").setColorBackground(#C6C6C6);
  G6 = cp5.addButton("G" + 6).setPosition(100 + 200 + 6*100, a + 300).setSize(70,30).setCaptionLabel("").setColorBackground(#C6C6C6);
  H6 = cp5.addButton("H" + 6).setPosition(100 + 200 + 7*100, a + 300).setSize(70,30).setCaptionLabel("").setColorBackground(#C6C6C6);
  
  A7 = cp5.addButton("A" + 7).setPosition(100 + 200 + 0*100, a + 350).setSize(70,30).setCaptionLabel("").setColorBackground(#C6C6C6);
  B7 = cp5.addButton("B" + 7).setPosition(100 + 200 + 1*100, a + 350).setSize(70,30).setCaptionLabel("").setColorBackground(#C6C6C6);
  C7 = cp5.addButton("C" + 7).setPosition(100 + 200 + 2*100, a + 350).setSize(70,30).setCaptionLabel("").setColorBackground(#C6C6C6);
  D7 = cp5.addButton("D" + 7).setPosition(100 + 200 + 3*100, a + 350).setSize(70,30).setCaptionLabel("").setColorBackground(#C6C6C6);
  E7 = cp5.addButton("E" + 7).setPosition(100 + 200 + 4*100, a + 350).setSize(70,30).setCaptionLabel("").setColorBackground(#C6C6C6);
  F7 = cp5.addButton("F" + 7).setPosition(100 + 200 + 5*100, a + 350).setSize(70,30).setCaptionLabel("").setColorBackground(#C6C6C6);
  G7 = cp5.addButton("G" + 7).setPosition(100 + 200 + 6*100, a + 350).setSize(70,30).setCaptionLabel("").setColorBackground(#C6C6C6);
  H7 = cp5.addButton("H" + 7).setPosition(100 + 200 + 7*100, a + 350).setSize(70,30).setCaptionLabel("").setColorBackground(#C6C6C6);
  
  //========================================================================================= Pattern Property Array Grid Buttons =========================================================================================================================================   
  
  A0p = cp5.addButton("A" + 0 + "p").setPosition((width/2) + (width/5) + 115 + 0*35 - 65, a).setSize(35,30).setCaptionLabel("").setColorBackground(#FFFFFF);
  B0p = cp5.addButton("B" + 0 + "p").setPosition((width/2) + (width/5) + 115 + 1*35 - 55, a).setSize(35,30).setCaptionLabel("").setColorBackground(#FFFFFF);
  C0p = cp5.addButton("C" + 0 + "p").setPosition((width/2) + (width/5) + 115 + 2*35 - 45, a).setSize(35,30).setCaptionLabel("").setColorBackground(#FFFFFF);
  D0p = cp5.addButton("D" + 0 + "p").setPosition((width/2) + (width/5) + 115 + 3*35 - 35, a).setSize(35,30).setCaptionLabel("").setColorBackground(#FFFFFF);
  E0p = cp5.addButton("E" + 0 + "p").setPosition((width/2) + (width/5) + 115 + 4*35 - 25, a).setSize(35,30).setCaptionLabel("").setColorBackground(#FFFFFF);
  F0p = cp5.addButton("F" + 0 + "p").setPosition((width/2) + (width/5) + 115 + 5*35 - 15, a).setSize(35,30).setCaptionLabel("").setColorBackground(#FFFFFF);
  G0p = cp5.addButton("G" + 0 + "p").setPosition((width/2) + (width/5) + 115 + 6*35 - 5, a).setSize(35,30).setCaptionLabel("").setColorBackground(#FFFFFF);
  H0p = cp5.addButton("H" + 0 + "p").setPosition((width/2) + (width/5) + 115 + 7*35 + 5 , a).setSize(35,30).setCaptionLabel("").setColorBackground(#FFFFFF);
  //for(int j = 1; j < 8; j++){  
  //  int k = 65 + j;
  //  char t = char(k);
  //  String i = str(t);
  //  cp5.addButton(i + 0 + "p").setPosition((width/2) + (width/5) + 115 + j*35, a).setSize(30,30);
  //}
  
  A1p = cp5.addButton("A" + 1 + "p").setPosition((width/2) + (width/5) + 115 + 0*35 - 65, a + 50).setSize(35,30).setCaptionLabel("").setColorBackground(#FFFFFF);
  B1p = cp5.addButton("B" + 1 + "p").setPosition((width/2) + (width/5) + 115 + 1*35 - 55, a + 50).setSize(35,30).setCaptionLabel("").setColorBackground(#FFFFFF);
  C1p = cp5.addButton("C" + 1 + "p").setPosition((width/2) + (width/5) + 115 + 2*35 - 45, a + 50).setSize(35,30).setCaptionLabel("").setColorBackground(#FFFFFF);
  D1p = cp5.addButton("D" + 1 + "p").setPosition((width/2) + (width/5) + 115 + 3*35 - 35, a + 50).setSize(35,30).setCaptionLabel("").setColorBackground(#FFFFFF);
  E1p = cp5.addButton("E" + 1 + "p").setPosition((width/2) + (width/5) + 115 + 4*35 - 25, a + 50).setSize(35,30).setCaptionLabel("").setColorBackground(#FFFFFF);
  F1p = cp5.addButton("F" + 1 + "p").setPosition((width/2) + (width/5) + 115 + 5*35 - 15, a + 50).setSize(35,30).setCaptionLabel("").setColorBackground(#FFFFFF);
  G1p = cp5.addButton("G" + 1 + "p").setPosition((width/2) + (width/5) + 115 + 6*35 - 5, a + 50).setSize(35,30).setCaptionLabel("").setColorBackground(#FFFFFF);
  H1p = cp5.addButton("H" + 1 + "p").setPosition((width/2) + (width/5) + 115 + 7*35 + 5, a + 50).setSize(35,30).setCaptionLabel("").setColorBackground(#FFFFFF);
  //for(int j = 0; j < 8; j++){  
  //  int k = 65 + j;
  //  char t = char(k);
  //  String i = str(t);
  //  cp5.addButton(i + 1 + "p").setPosition((width/2) + (width/5) + 115 + j*35, a + 50).setSize(30,30).setCaptionLabel("");
  //}
  
  A2p = cp5.addButton("A" + 2 + "p").setPosition((width/2) + (width/5) + 115 + 0*35 - 65, a + 100).setSize(35,30).setCaptionLabel("").setColorBackground(#FFFFFF);
  B2p = cp5.addButton("B" + 2 + "p").setPosition((width/2) + (width/5) + 115 + 1*35 - 55, a + 100).setSize(35,30).setCaptionLabel("").setColorBackground(#FFFFFF);
  C2p = cp5.addButton("C" + 2 + "p").setPosition((width/2) + (width/5) + 115 + 2*35 - 45, a + 100).setSize(35,30).setCaptionLabel("").setColorBackground(#FFFFFF);
  D2p = cp5.addButton("D" + 2 + "p").setPosition((width/2) + (width/5) + 115 + 3*35 - 35, a + 100).setSize(35,30).setCaptionLabel("").setColorBackground(#FFFFFF);
  E2p = cp5.addButton("E" + 2 + "p").setPosition((width/2) + (width/5) + 115 + 4*35 - 25, a + 100).setSize(35,30).setCaptionLabel("").setColorBackground(#FFFFFF);
  F2p = cp5.addButton("F" + 2 + "p").setPosition((width/2) + (width/5) + 115 + 5*35 - 15, a + 100).setSize(35,30).setCaptionLabel("").setColorBackground(#FFFFFF);
  G2p = cp5.addButton("G" + 2 + "p").setPosition((width/2) + (width/5) + 115 + 6*35 - 5, a + 100).setSize(35,30).setCaptionLabel("").setColorBackground(#FFFFFF);
  H2p = cp5.addButton("H" + 2 + "p").setPosition((width/2) + (width/5) + 115 + 7*35 + 5, a + 100).setSize(35,30).setCaptionLabel("").setColorBackground(#FFFFFF);
  //for(int j = 0; j < 8; j++){  
  //  int k = 65 + j;
  //  char t = char(k);
  //  String i = str(t);
  //  cp5.addButton(i + 2 + "p").setPosition((width/2) + (width/5) + 115 + j*35, a + 100).setSize(30,30).setCaptionLabel("");
  //}
  
  A3p = cp5.addButton("A" + 3 + "p").setPosition((width/2) + (width/5) + 115 + 0*35 - 65, a + 150).setSize(35,30).setCaptionLabel("").setColorBackground(#FFFFFF);
  B3p = cp5.addButton("B" + 3 + "p").setPosition((width/2) + (width/5) + 115 + 1*35 - 55, a + 150).setSize(35,30).setCaptionLabel("").setColorBackground(#FFFFFF);
  C3p = cp5.addButton("C" + 3 + "p").setPosition((width/2) + (width/5) + 115 + 2*35 - 45, a + 150).setSize(35,30).setCaptionLabel("").setColorBackground(#FFFFFF);
  D3p = cp5.addButton("D" + 3 + "p").setPosition((width/2) + (width/5) + 115 + 3*35 - 35, a + 150).setSize(35,30).setCaptionLabel("").setColorBackground(#FFFFFF);
  E3p = cp5.addButton("E" + 3 + "p").setPosition((width/2) + (width/5) + 115 + 4*35 - 25, a + 150).setSize(35,30).setCaptionLabel("").setColorBackground(#FFFFFF);
  F3p = cp5.addButton("F" + 3 + "p").setPosition((width/2) + (width/5) + 115 + 5*35 - 15, a + 150).setSize(35,30).setCaptionLabel("").setColorBackground(#FFFFFF);
  G3p = cp5.addButton("G" + 3 + "p").setPosition((width/2) + (width/5) + 115 + 6*35 - 5, a + 150).setSize(35,30).setCaptionLabel("").setColorBackground(#FFFFFF);
  H3p = cp5.addButton("H" + 3 + "p").setPosition((width/2) + (width/5) + 115 + 7*35 + 5, a + 150).setSize(35,30).setCaptionLabel("").setColorBackground(#FFFFFF);
  //for(int j = 0; j < 8; j++){  
  //  int k = 65 + j;
  //  char t = char(k);
  //  String i = str(t);
  //  cp5.addButton(i + 3 + "p").setPosition((width/2) + (width/5) + 115 + j*35, a + 150).setSize(30,30).setCaptionLabel("");
  //}
  
  A4p = cp5.addButton("A" + 4 + "p").setPosition((width/2) + (width/5) + 115 + 0*35 - 65, a + 200).setSize(35,30).setCaptionLabel("").setColorBackground(#FFFFFF);
  B4p = cp5.addButton("B" + 4 + "p").setPosition((width/2) + (width/5) + 115 + 1*35 - 55, a + 200).setSize(35,30).setCaptionLabel("").setColorBackground(#FFFFFF);
  C4p = cp5.addButton("C" + 4 + "p").setPosition((width/2) + (width/5) + 115 + 2*35 - 45, a + 200).setSize(35,30).setCaptionLabel("").setColorBackground(#FFFFFF);
  D4p = cp5.addButton("D" + 4 + "p").setPosition((width/2) + (width/5) + 115 + 3*35 - 35, a + 200).setSize(35,30).setCaptionLabel("").setColorBackground(#FFFFFF);
  E4p = cp5.addButton("E" + 4 + "p").setPosition((width/2) + (width/5) + 115 + 4*35 - 25, a + 200).setSize(35,30).setCaptionLabel("").setColorBackground(#FFFFFF);
  F4p = cp5.addButton("F" + 4 + "p").setPosition((width/2) + (width/5) + 115 + 5*35 - 15, a + 200).setSize(35,30).setCaptionLabel("").setColorBackground(#FFFFFF);
  G4p = cp5.addButton("G" + 4 + "p").setPosition((width/2) + (width/5) + 115 + 6*35 - 5, a + 200).setSize(35,30).setCaptionLabel("").setColorBackground(#FFFFFF);
  H4p = cp5.addButton("H" + 4 + "p").setPosition((width/2) + (width/5) + 115 + 7*35 + 5, a + 200).setSize(35,30).setCaptionLabel("").setColorBackground(#FFFFFF);
  //for(int j = 0; j < 8; j++){  
  //  int k = 65 + j;
  //  char t = char(k);
  //  String i = str(t);
  //  cp5.addButton(i + 4 + "p").setPosition((width/2) + (width/5) + 115 + j*35, a + 200).setSize(30,30).setCaptionLabel("");
  //}
  
  A5p = cp5.addButton("A" + 5 + "p").setPosition((width/2) + (width/5) + 115 + 0*35 - 65, a + 250).setSize(35,30).setCaptionLabel("").setColorBackground(#FFFFFF);
  B5p = cp5.addButton("B" + 5 + "p").setPosition((width/2) + (width/5) + 115 + 1*35 - 55, a + 250).setSize(35,30).setCaptionLabel("").setColorBackground(#FFFFFF);
  C5p = cp5.addButton("C" + 5 + "p").setPosition((width/2) + (width/5) + 115 + 2*35 - 45, a + 250).setSize(35,30).setCaptionLabel("").setColorBackground(#FFFFFF);
  D5p = cp5.addButton("D" + 5 + "p").setPosition((width/2) + (width/5) + 115 + 3*35 - 35, a + 250).setSize(35,30).setCaptionLabel("").setColorBackground(#FFFFFF);
  E5p = cp5.addButton("E" + 5 + "p").setPosition((width/2) + (width/5) + 115 + 4*35 - 25, a + 250).setSize(35,30).setCaptionLabel("").setColorBackground(#FFFFFF);
  F5p = cp5.addButton("F" + 5 + "p").setPosition((width/2) + (width/5) + 115 + 5*35 - 15, a + 250).setSize(35,30).setCaptionLabel("").setColorBackground(#FFFFFF);
  G5p = cp5.addButton("G" + 5 + "p").setPosition((width/2) + (width/5) + 115 + 6*35 - 5, a + 250).setSize(35,30).setCaptionLabel("").setColorBackground(#FFFFFF);
  H5p = cp5.addButton("H" + 5 + "p").setPosition((width/2) + (width/5) + 115 + 7*35 + 5, a + 250).setSize(35,30).setCaptionLabel("").setColorBackground(#FFFFFF);
  //for(int j = 0; j < 8; j++){  
  // int k = 65 + j;
  //  char t = char(k);
  //  String i = str(t);
  //  cp5.addButton(i + 5 + "p").setPosition((width/2) + (width/5) + 115 + j*35, a + 250).setSize(30,30).setCaptionLabel("");
  //}
  
  A6p = cp5.addButton("A" + 6 + "p").setPosition((width/2) + (width/5) + 115 + 0*35 - 65, a + 300).setSize(35,30).setCaptionLabel("").setColorBackground(#FFFFFF);
  B6p = cp5.addButton("B" + 6 + "p").setPosition((width/2) + (width/5) + 115 + 1*35 - 55, a + 300).setSize(35,30).setCaptionLabel("").setColorBackground(#FFFFFF);
  C6p = cp5.addButton("C" + 6 + "p").setPosition((width/2) + (width/5) + 115 + 2*35 - 45, a + 300).setSize(35,30).setCaptionLabel("").setColorBackground(#FFFFFF);
  D6p = cp5.addButton("D" + 6 + "p").setPosition((width/2) + (width/5) + 115 + 3*35 - 35, a + 300).setSize(35,30).setCaptionLabel("").setColorBackground(#FFFFFF);
  E6p = cp5.addButton("E" + 6 + "p").setPosition((width/2) + (width/5) + 115 + 4*35 - 25, a + 300).setSize(35,30).setCaptionLabel("").setColorBackground(#FFFFFF);
  F6p = cp5.addButton("F" + 6 + "p").setPosition((width/2) + (width/5) + 115 + 5*35 - 15, a + 300).setSize(35,30).setCaptionLabel("").setColorBackground(#FFFFFF);
  G6p = cp5.addButton("G" + 6 + "p").setPosition((width/2) + (width/5) + 115 + 6*35 - 5, a + 300).setSize(35,30).setCaptionLabel("").setColorBackground(#FFFFFF);
  H6p = cp5.addButton("H" + 6 + "p").setPosition((width/2) + (width/5) + 115 + 7*35 + 5, a + 300).setSize(35,30).setCaptionLabel("").setColorBackground(#FFFFFF);
  //for(int j = 0; j < 8; j++){  
  // int k = 65 + j;
  //  char t = char(k);
  //  String i = str(t);
  //  cp5.addButton(i + 6 + "p").setPosition((width/2) + (width/5) + 115 + j*35, a + 300).setSize(30,30).setCaptionLabel("");
  //}
  
  A7p = cp5.addButton("A" + 7 + "p").setPosition((width/2) + (width/5) + 115 + 0*35 - 65, a + 350).setSize(35,30).setCaptionLabel("").setColorBackground(#FFFFFF);
  B7p = cp5.addButton("B" + 7 + "p").setPosition((width/2) + (width/5) + 115 + 1*35 - 55, a + 350).setSize(35,30).setCaptionLabel("").setColorBackground(#FFFFFF);
  C7p = cp5.addButton("C" + 7 + "p").setPosition((width/2) + (width/5) + 115 + 2*35 - 45, a + 350).setSize(35,30).setCaptionLabel("").setColorBackground(#FFFFFF);
  D7p = cp5.addButton("D" + 7 + "p").setPosition((width/2) + (width/5) + 115 + 3*35 - 35, a + 350).setSize(35,30).setCaptionLabel("").setColorBackground(#FFFFFF);
  E7p = cp5.addButton("E" + 7 + "p").setPosition((width/2) + (width/5) + 115 + 4*35 - 25, a + 350).setSize(35,30).setCaptionLabel("").setColorBackground(#FFFFFF);
  F7p = cp5.addButton("F" + 7 + "p").setPosition((width/2) + (width/5) + 115 + 5*35 - 15, a + 350).setSize(35,30).setCaptionLabel("").setColorBackground(#FFFFFF);
  G7p = cp5.addButton("G" + 7 + "p").setPosition((width/2) + (width/5) + 115 + 6*35 - 5, a + 350).setSize(35,30).setCaptionLabel("").setColorBackground(#FFFFFF);
  H7p = cp5.addButton("H" + 7 + "p").setPosition((width/2) + (width/5) + 115 + 7*35 + 5, a + 350).setSize(35,30).setCaptionLabel("").setColorBackground(#FFFFFF);
  //for(int j = 0; j < 8; j++){  
  //  int k = 65 + j;
  //  char t = char(k);
  //  String i = str(t);
  //  cp5.addButton(i + 7 + "p").setPosition((width/2) + (width/5) + 115 + j*35, a + 350).setSize(30,30).setCaptionLabel("");
  //}
  
 
 //=========================================================================================A TYPE OF WAVE========================================================================================================================================= 
  //// Create triangle wave
  //triOsc = new TriOsc(this);
  
  //// Create sine wave for piano
  //sinePiano = new SinOsc(this);
  
  //// Create sine wave for bass
  //sineBass = new SinOsc(this);
  
  //// Create sine wave for bass
  //sineDrum = new SinOsc(this);

  //// Create the envelope 
  //env  = new Env(this); 
 //=========================================================================================A TYPE OF WAVE END=========================================================================================================================================
 
 
 //=========================================================================================INSTRUMENT SECTION=========================================================================================================================================
 
 //fill(100,90, 90);
    ////rect(100, height/2 + 130, (width/5), height/2 - 150 , 60); // GAIN
    //fill(0);
    //textSize(30);
    //text("INSTRUMENT", 150, height/2 + 175);
    ////k1.remove();
    ////sn1.remove();
    ////h1.remove();
    ////c1.remove();
    ////sy1.remove();
    ////e1.remove();
    ////inst1 = 8;
    //.setColorBackground(color(#F1C67A)).setFont(font1).setCaptionLabel("PAN").setColorCaptionLabel(0);
     k0 = cp5.addButton("KICK" +0).setPosition(30,height/2 + 80).setSize(125,80).setColorBackground(color(255, 0, 0)).setCaptionLabel("KICK");
     sn0 = cp5.addButton("SNARE" +0).setPosition(165,height/2 + 80).setSize(125,80).setColorBackground(color(255, 0, 0)).setCaptionLabel("SNARE");
     h0 = cp5.addButton("HAT"+0).setPosition(30,height/2 + 200).setSize(125,80).setColorBackground(color(255, 0, 0)).setCaptionLabel("HAT");
     c0 = cp5.addButton("CLAP" +0).setPosition(165,height/2 + 200).setSize(125,80).setColorBackground(color(255, 0, 0)).setCaptionLabel("CLAP");
     sy0 = cp5.addButton("SYNTH" +0).setPosition(30,height/2 + 320).setSize(125,80).setColorBackground(color(255, 0, 0)).setCaptionLabel("SYNTH");
     e0 = cp5.addButton("ENVELOPES" +0).setPosition(165,height/2 + 320).setSize(125,80).setColorBackground(color(255, 0, 0)).setCaptionLabel("ENVELOPES");
     
     //f0 = cp5.addButton("NUM1" +0).setPosition(1200,height/2 + 250).setSize(70,70);

   
//textFont(font1);
//text("word", 10, 50);
     t0 = cp5.addButton("GAIN" +0).setPosition(300,height/2 + 79).setSize(230,90).setColorBackground(color(#F1C67A)).setFont(font1).setCaptionLabel("GAIN").setColorCaptionLabel(0);
     tr0 = cp5.addButton("TRANSPOSE" +0).setPosition(575,height/2 + 79).setSize(230,90).setColorBackground(color(#F1C67A)).setFont(font1).setCaptionLabel("TRANSPOSE").setColorCaptionLabel(0);
     r0 = cp5.addButton("EFFECTS"+0).setPosition(845,height/2 + 79).setSize(230,90).setColorBackground(color(#F1C67A)).setFont(font1).setCaptionLabel("EFFECTS").setColorCaptionLabel(0);
     a0 = cp5.addButton("WAVE" +0).setPosition(300,height/2 + 200).setSize(230,90).setColorBackground(color(#F1C67A)).setFont(font1).setCaptionLabel("WAVE").setColorCaptionLabel(0);
     de0 = cp5.addButton("DELETE" +0).setPosition(575,height/2 + 200).setSize(230,90).setColorBackground(color(#F1C67A)).setFont(font1).setCaptionLabel("DELETE").setColorCaptionLabel(0);
     p0 = cp5.addButton("PAN" +0).setPosition(845,height/2 + 200).setSize(230,90).setColorBackground(color(#F1C67A)).setFont(font1).setCaptionLabel("PAN").setColorCaptionLabel(0);

  
}


//================================================================================================CONTROLLER MANIPULATION END========================================================================================================================================
//========================================================================================================================================================================================================================================

//========================================================================================== DRAW BEGINS ========================================================================================================
public void draw() {
  background(#1B3749);
  //cp5.draw();
 if (instrument0.getLabel() == "SYNTH"){
   fill(250);
  textSize(15);
  text("FUNCTIONS", 300, (height/2) + 70);
  text("INSTRUMENT TYPE", 30, (height/2) + 70);
  text("SELECT NOTE", 1100, height/2 + 70);
 }
 else{
  fill(250);
  textSize(15);
  text("FUNCTIONS", 300, (height/2) + 70);
  text("INSTRUMENT TYPE", 30, (height/2) + 70);
  text("SELECTED FUNCTION PARAMETERS", 1100, height/2 + 70);
 }
 

  
  if(property ==  0){
    fill(100,90, 90);
    rect(500, height/2 + 130, (width/5), height/2 - 150 , 60); // GAIN
    fill(250);
    textSize(30);
    text("ARRAY PROPERTIES 0", 510, height/2 + 175);
  }
  else{
  }
  if(property ==  1){
    //fill(100,90, 90);
    fill(250, 0,0);
    rect(700, height/2 + 130, (width/5), height/2 - 150 , 60); // GAIN
    fill(250);
    textSize(30);
    text("HAHA PROPERTIES1", 600, height/2 + 175);
  }
  else{
  }
  if(property ==  2){
    fill(100,90, 90);
    rect(500, height/2 + 130, (width/5), height/2 - 150 , 60); // GAIN
    fill(250);
    textSize(30);
    text("ARRAY PROPERTIES 2", 510, height/2 + 175);
  }
  else{
  }
  if(property ==  10){
    fill(100,90, 90);
    rect(500, height/2 + 130, (width/5), height/2 - 150 , 60); // GAIN
    fill(250);
    textSize(30);
    text("ARRAY PROPERTIES 10", 510, height/2 + 175);
  }
  else{
  }
  if(property ==  11){
    fill(100,90, 90);
    rect(500, height/2 + 130, (width/5), height/2 - 150 , 60); // GAIN
    fill(250);
    textSize(30);
    text("ARRAY PROPERTIES 11", 510, height/2 + 175);
  }
  else{
  }
  if(property ==  12){
    fill(100,90, 90);
    rect(500, height/2 + 130, (width/5), height/2 - 150 , 60); // GAIN
    fill(250);
    textSize(30);
    text("ARRAY PROPERTIES 12", 510, height/2 + 175);
  }
  else{
  }
  if(property ==  20){
    fill(100,90, 90);
    rect(500, height/2 + 130, (width/5), height/2 - 150 , 60); // GAIN
    fill(250);
    textSize(30);
    text("ARRAY PROPERTIES 20", 510, height/2 + 175);
  }
  else{
  }
  if(property ==  21){
    fill(100,90, 90);
    rect(500, height/2 + 130, (width/5), height/2 - 150 , 60); // GAIN
    fill(250);
    textSize(30);
    text("ARRAY PROPERTIES 21", 510, height/2 + 175);
  }
  else{
  }
  if(property ==  22){
    fill(100,90, 90);
    rect(500, height/2 + 130, (width/5), height/2 - 150 , 60); // GAIN
    fill(250);
    textSize(30);
    text("ARRAY PROPERTIES 22", 510, height/2 + 175);
  }
  else{
  }
  if(property ==  30){
    fill(100,90, 90);
    rect(500, height/2 + 130, (width/5), height/2 - 150 , 60); // GAIN
    fill(250);
    textSize(30);
    text("ARRAY PROPERTIES 30", 510, height/2 + 175);
  }
  else{
  }
  if(property ==  31){
    fill(100,90, 90);
    rect(500, height/2 + 130, (width/5), height/2 - 150 , 60); // GAIN
    fill(250);
    textSize(30);
    text("ARRAY PROPERTIES 31", 510, height/2 + 175);
  }
  else{
  }
  if(property ==  32){
    fill(100,90, 90);
    rect(500, height/2 + 130, (width/5), height/2 - 150 , 60); // GAIN
    fill(250);
    textSize(30);
    text("ARRAY PROPERTIES 32", 510, height/2 + 175);
  }
  else{
  }
  
  //if(entVal_instrument == 1 && highlight == 0 && (redhighlight == 1 || redhighlight == 4)){
  //  highlight = 1;
  //  //righty = -1;
  //  redhighlight = 1;
  //  leave = 1;
  //  righty = currentPositionX;
  //  //if (highlight == 2){
  //    intRighty = 0;
  //  //}
  //}
 
  
  if((redhighlight == 1 || redhighlight == 4) && leave == 1){
      fill(0, 255, 0);
      rect(110,63, (width/2) + (width/5) - 80, height/2 - 45);
      fill(#1B3749);
      rect(115,68, (width/2) + (width/5) - 90, height/2 - 55);
  }
//print(entVal_pattern);

//================================================================================NAVIGATING THE PATTERN GRIDS=========================================================================================================================== 
      runningthrough();
        //print("first leave =" + leave);
     
      
if (leave == 0 || propLeave == 0){
        if (redhighlight == 1){
            fill(0, 255, 0);
            rect(110,63, (width/2) + (width/5) - 80, height/2 - 45);
            fill(#1B3749);
            rect(115,68, (width/2) + (width/5) - 90, height/2 - 55);
        }
        if (redhighlight == 2){
            //fill(250, 0, 0);
            //rect((width/2) + (width/5) + 100, 50, (width/5), height/2, 60);
            fill(0, 255, 0);
            rect((width/2) + (width/5) + 40, 63, (width/5) + 70, height/2 - 45);
            fill(#1B3749);
            rect((width/2) + (width/5) + 45, 68, (width/5) + 60, height/2 - 55);
        }
        if (redhighlight == 3){
            //fill(250, 0, 0);
            //rect(50, (height/2) + 100 , (width/2) + (width/5) + 350, (height/3) + 50, 60);
        }
        if (redhighlight == 4){
            fill(0, 255, 0);
            rect(110,63, (width/2) + (width/5) - 80, height/2 - 45);
            fill(#1B3749);
            rect(115,68, (width/2) + (width/5) - 90, height/2 - 55);
        }
    }
//================================================================================LOOPING THE GRIDS================================================================================
    if (playALL == 0){      
        int k = 0;
        while (k < run && k < 8){
          movingRectangles(k);
          k = k + 1;
    }
  gettingInstrumentValues();
  print("instList0[0] equals = "+ instList0[0]);
    
          run = (run % 8) + 1;
          print ("run =" + run);
          print("\n");
          if (run == 1){
           if(instrument0.getLabel() == "SYNTH" && instList0[0] != 0){
                ToneInstrument myNote00 = new ToneInstrument(instList0[0] , panValue, disWave0, gainValue0, delayVal0, bitRes0);
                out.playNote( 0.0, 0.1, myNote00 );
              }
              
              if(instrument1.getLabel() == "SYNTH" && instList1[0] != 0){
                //synthNote0();
                //out.playNote( 0.0, 0.5, "C3" );
                    ToneInstrument myNote10 = new ToneInstrument(instList1[0] , panValue, disWave1, gainValue1, delayVal1, bitRes1);
                    out.playNote( 0.0, 0.05, myNote10 );
              }
              
               if(instrument2.getLabel() == "SYNTH" && instList2[0] != 0){
            //    //synthNote0();
                    ToneInstrument myNote20 = new ToneInstrument(instList2[0] , panValue, disWave2, gainValue2, delayVal2, bitRes2);
                    out.playNote( 0.0, 0.05, myNote20 );
              }
              
               if(instrument3.getLabel() == "SYNTH" && instList3[0] != 0){
            //    //synthNote0();
                    ToneInstrument myNote30 = new ToneInstrument(instList3[0] , panValue, disWave3, gainValue3, delayVal3, bitRes3);
                    out.playNote( 0.0, 0.05, myNote30 );
              }
               if(instrument4.getLabel() == "SYNTH" && instList4[0] != 0){
            //    //synthNote0();
                    ToneInstrument myNote40 = new ToneInstrument(instList4[0] , panValue, disWave4, gainValue4, delayVal4, bitRes4);
                    out.playNote( 0.0, 0.05, myNote40 );
              }
               if(instrument5.getLabel() == "SYNTH" && instList5[0] != 0){
            //    //synthNote0();
                    ToneInstrument myNote50 = new ToneInstrument(instList5[0] , panValue, disWave5, gainValue5, delayVal5, bitRes5);
                    out.playNote( 0.0, 0.05, myNote50 );
              }
               if(instrument6.getLabel() == "SYNTH" && instList6[0] != 0){
            //    //synthNote0();
                    ToneInstrument myNote60 = new ToneInstrument(instList6[0] , panValue, disWave6, gainValue6, delayVal6, bitRes6);
                    out.playNote( 0.0, 0.05, myNote60 );
              }
                if(instrument7.getLabel() == "SYNTH" && instList7[0] != 0){
            //    //synthNote0();
                    ToneInstrument myNote70 = new ToneInstrument(instList7[0] , panValue, disWave7, gainValue7, delayVal7, bitRes7);
                    out.playNote( 0.0, 0.05, myNote70 );
              }
              
            if (decision0[0] == 1){
              if(instrument0.getLabel() == "KICK"){
                instList0[0] = 50.0;
                ToneInstrument myNote00 = new ToneInstrument(instList0[0] , panValue, disWave0, gainValue0, delayVal0);
                out.playNote( 0.0, 0.05, myNote00);
                print("kick!!!!!!!!!!!!!");
                //KICK0();
                //kick.play();
                //kick.pan(1);
              }
              if(instrument0.getLabel() == "SNARE"){
                snare.rewind();
                snare.play();
                //SNARE0();
                //instList0[0] = 198.0;
                //ToneInstrument myNote00 = new ToneInstrument(instList0[0] , panValue, disWave0, gainValue0);
                //out.playNote( 0.0, 0.1, myNote00);
                //snare.trigger();
              }
              if(instrument0.getLabel() == "CLAP"){
                //SNARE0();
                clap.rewind();
                clap.play(); 
              }
            }
             if (decision1[0] == 1 ){
               
                 if(instrument1.getLabel() == "KICK"){
                   instList1[0] = 50.0;
                   ToneInstrument myNote10 = new ToneInstrument(instList1[0] , panValue, disWave1, gainValue1, delayVal1);
                   out.playNote( 0.0, 0.1, myNote10);
                    //KICK0();
                    //kick.play(); 
                  }
                  if(instrument1.getLabel() == "SNARE"){
                    snare.rewind();
                    snare.play();
                    //SNARE0();
                    //snare.play(); 
                  }
              if(instrument1.getLabel() == "CLAP"){
                //SNARE0();
                clap.rewind();
                clap.play(); 
              }
              }
             if (decision2[0] == 1 ){
                 if(instrument2.getLabel() == "KICK"){
                   instList2[0] = 50.0;
                   ToneInstrument myNote20 = new ToneInstrument(instList2[0] , panValue, disWave2, gainValue2, delayVal2);
                   out.playNote( 0.0, 0.1, myNote20);
                  //kick.play();
                 }
                  if(instrument2.getLabel() == "SNARE"){
                    snare.rewind();
                    snare.play();
                  }
              if(instrument2.getLabel() == "CLAP"){
                //SNARE0();
                clap.rewind();
                clap.play(); 
              }
                }
             if (decision3[0] ==  1){
                  if(instrument3.getLabel() == "KICK"){
                   instList3[0] = 50.0;
                   ToneInstrument myNote30 = new ToneInstrument(instList3[0] , panValue, disWave3, gainValue3, delayVal3);
                   out.playNote( 0.0, 0.1, myNote30);
                    
                  //kick.play();
                 }
                  if(instrument3.getLabel() == "SNARE"){
                    snare.rewind();
                    snare.play();
                  }
              if(instrument3.getLabel() == "CLAP"){
                //SNARE0();
                clap.rewind();
                clap.play(); 
              }
              }
             if (decision4[0] == 1 ){
                  if(instrument4.getLabel() == "KICK"){
                   instList4[0] = 50.0;
                   ToneInstrument myNote40 = new ToneInstrument(instList4[0] , panValue, disWave4, gainValue4, delayVal4);
                   out.playNote( 0.0, 0.1, myNote40);
                  //kick.play();
                 }
                  if(instrument4.getLabel() == "SNARE"){
                    snare.rewind();
                    snare.play();
                  }
              if(instrument4.getLabel() == "CLAP"){
                //SNARE0();
                clap.rewind();
                clap.play(); 
              }
                }
             if (decision5[0] == 1 ){
                  if(instrument5.getLabel() == "KICK"){
                   instList5[0] = 50.0;
                   ToneInstrument myNote50 = new ToneInstrument(instList5[0] , panValue, disWave5, gainValue5, delayVal5);
                   out.playNote( 0.0, 0.1, myNote50);
                  //kick.play();
                 }
                  if(instrument5.getLabel() == "SNARE"){
                    snare.rewind();
                    snare.play();
                  }
              if(instrument5.getLabel() == "CLAP"){
                //SNARE0();
                clap.rewind();
                clap.play(); 
              }
                }
             if (decision6[0] == 1 ){
                  if(instrument6.getLabel() == "KICK"){
                   instList6[0] = 50.0;
                   ToneInstrument myNote60 = new ToneInstrument(instList6[0] , panValue, disWave6, gainValue6, delayVal6);
                   out.playNote( 0.0, 0.1, myNote60);
                  //kick.play();
                 }
                  if(instrument6.getLabel() == "SNARE"){
                    snare.rewind();
                    snare.play();
                  }
              if(instrument6.getLabel() == "CLAP"){
                //SNARE0();
                clap.rewind();
                clap.play(); 
              }
                }
              if (decision7[0] == 1 ){
                  if(instrument7.getLabel() == "KICK"){
                   instList7[0] = 50.0;
                   ToneInstrument myNote70 = new ToneInstrument(instList7[0] , panValue, disWave7, gainValue7, delayVal7);
                   out.playNote( 0.0, 0.1, myNote70);
                  //kick.play();
                 }
                  if(instrument7.getLabel() == "SNARE"){
                    snare.rewind();
                    snare.play();
                  }
              if(instrument7.getLabel() == "CLAP"){
                //SNARE0();
                clap.rewind();
                clap.play(); 
              }
                }
          }
           if (run == 2){
             if(instrument0.getLabel() == "SYNTH" && instList0[1] != 0){
                    //synthNote1();
                    //out.playNote( 0.0, 0.5, "C" + instList0[1] );
                    ToneInstrument myNote01 = new ToneInstrument(instList0[1] , panValue, disWave0, gainValue0, delayVal0, bitRes0);
                    out.playNote( 0.0, 0.05, myNote01 );
                  }
               if(instrument1.getLabel() == "SYNTH" && instList1[1] != 0){
                    //synthNote1();
                    ToneInstrument myNote11 = new ToneInstrument(instList1[1] , panValue, disWave1, gainValue1, delayVal1, bitRes1);
                    out.playNote( 0.0, 0.05, myNote11 );
                  }
                if(instrument2.getLabel() == "SYNTH" && instList2[1] != 0){
               //     //synthNote1();
                    ToneInstrument myNote01 = new ToneInstrument(instList0[1] , panValue, disWave2, gainValue2, delayVal2, bitRes2);
                    out.playNote( 0.0, 0.05, myNote01 );
                  }
                if(instrument3.getLabel() == "SYNTH" && instList3[1] != 0){
                    //synthNote1();
                    ToneInstrument myNote31 = new ToneInstrument(instList3[1] , panValue, disWave3, gainValue3, delayVal3, bitRes3);
                    out.playNote( 0.0, 0.05, myNote31 );
                  }
                if(instrument4.getLabel() == "SYNTH" && instList4[1] != 0){
                    //synthNote1();
                    ToneInstrument myNote41 = new ToneInstrument(instList4[1] , panValue, disWave4, gainValue4, delayVal4, bitRes4);
                    out.playNote( 0.0, 0.05, myNote41 );
                  }
                if(instrument5.getLabel() == "SYNTH" && instList5[1] != 0){
                    //synthNote3();
                    ToneInstrument myNote51 = new ToneInstrument(instList5[1] , panValue, disWave5, gainValue5, delayVal5, bitRes5);
                    out.playNote( 0.0, 0.05, myNote51 );
                  }
                if(instrument6.getLabel() == "SYNTH" && instList6[1] != 0){
                    //synthNote1();
                    ToneInstrument myNote61 = new ToneInstrument(instList6[1] , panValue, disWave6, gainValue6, delayVal6, bitRes6);
                    out.playNote( 0.0, 0.05, myNote61 );
                  }
                if(instrument7.getLabel() == "SYNTH" && instList7[1] != 0){
                    //synthNote1();
                    ToneInstrument myNote71 = new ToneInstrument(instList7[1] , panValue, disWave7, gainValue7, delayVal7, bitRes7);
                    out.playNote( 0.0, 0.05, myNote71 );
                  }
              if (decision0[1] == 1 ){
                  if(instrument0.getLabel() == "KICK"){
                    instList0[1] = 50.0;
                    ToneInstrument myNote01 = new ToneInstrument(instList0[1] , panValue, disWave0, gainValue0, delayVal0);
                    out.playNote( 0.0, 0.1, myNote01);
                    ////KICK0();
                    //kick.play(); 
                  }
                  if(instrument0.getLabel() == "SNARE"){
                    snare.rewind();
                    snare.play();
                  }
              if(instrument0.getLabel() == "CLAP"){
                //SNARE0();
                clap.rewind();
                clap.play(); 
              }
                }
             if (decision1[1] == 1 ){
                  if(instrument1.getLabel() == "KICK"){
                   instList1[1] = 50.0;
                   ToneInstrument myNote11 = new ToneInstrument(instList1[1] , panValue, disWave1, gainValue1, delayVal1);
                   out.playNote( 0.0, 0.1, myNote11);
                    //KICK0();
                    //kick.play(); 
                  }
                  if(instrument1.getLabel() == "SNARE"){
                    snare.rewind();
                    snare.play();
                  }
              if(instrument1.getLabel() == "CLAP"){
                //SNARE0();
                clap.rewind();
                clap.play(); 
              }
                }
              if (decision2[1] == 1 ){
                  if(instrument2.getLabel() == "KICK"){
                   instList2[1] = 50.0;
                   ToneInstrument myNote21 = new ToneInstrument(instList2[1] , panValue, disWave2, gainValue2, delayVal2);
                   out.playNote( 0.0, 0.1, myNote21);
                  //KICK0();
                  //kick.play();
                 }
                  if(instrument2.getLabel() == "SNARE"){
                    snare.rewind();
                    snare.play();
                  }
              if(instrument2.getLabel() == "CLAP"){
                //SNARE0();
                clap.rewind();
                clap.play(); 
              }
                }
              if (decision3[1] == 1 ){
                  if(instrument3.getLabel() == "KICK"){
                   instList3[1] = 50.0;
                   ToneInstrument myNote31 = new ToneInstrument(instList3[1] , panValue, disWave3, gainValue3, delayVal3);
                   out.playNote( 0.0, 0.1, myNote31);
                  //kick.play();
                 }
                  if(instrument3.getLabel() == "SNARE"){
                    snare.rewind();
                    snare.play();
                  }
              if(instrument3.getLabel() == "CLAP"){
                //SNARE0();
                clap.rewind();
                clap.play(); 
              }
                }
               if (decision4[1] == 1 ){
                  if(instrument4.getLabel() == "KICK"){
                   instList4[1] = 50.0;
                   ToneInstrument myNote41 = new ToneInstrument(instList4[1] , panValue, disWave4, gainValue4, delayVal4);
                   out.playNote( 0.0, 0.1, myNote41);
                  //kick.play();
                 }
                  if(instrument4.getLabel() == "SNARE"){
                    snare.rewind();
                    snare.play();
                  }
              if(instrument4.getLabel() == "CLAP"){
                //SNARE0();
                clap.rewind();
                clap.play(); 
              }
                }
               if (decision5[1] == 1 ){
                  if(instrument5.getLabel() == "KICK"){
                   instList5[1] = 50.0;
                   ToneInstrument myNote51 = new ToneInstrument(instList5[1] , panValue, disWave5, gainValue5, delayVal5);
                   out.playNote( 0.0, 0.1, myNote51);
                  //kick.play();
                 }
                  if(instrument5.getLabel() == "SNARE"){
                    snare.rewind();
                    snare.play();
                  }
              if(instrument5.getLabel() == "CLAP"){
                //SNARE0();
                clap.rewind();
                clap.play(); 
              }
                }
               if (decision6[1] == 1 ){
                  if(instrument6.getLabel() == "KICK"){
                   instList6[1] = 50.0;
                   ToneInstrument myNote61 = new ToneInstrument(instList6[1] , panValue, disWave6, gainValue6, delayVal6);
                   out.playNote( 0.0, 0.1, myNote61);
                  //kick.play();
                 }
                  if(instrument6.getLabel() == "SNARE"){
                    snare.rewind();
                    snare.play();
                  }
              if(instrument6.getLabel() == "CLAP"){
                //SNARE0();
                clap.rewind();
                clap.play(); 
              }
                }
               if (decision7[1] == 1 ){
                  if(instrument7.getLabel() == "KICK"){
                   instList7[1] = 50.0;
                   ToneInstrument myNote71 = new ToneInstrument(instList7[1] , panValue, disWave7, gainValue7, delayVal7);
                   out.playNote( 0.0, 0.1, myNote71);
                  //kick.play();
                 }
                  if(instrument7.getLabel() == "SNARE"){
                    snare.rewind();
                    snare.play();
                  }
              if(instrument7.getLabel() == "CLAP"){
                //SNARE0();
                clap.rewind();
                clap.play(); 
              }
                }
           }
            if (run == 3){  
                  if(instrument0.getLabel() == "SYNTH" && instList0[2] != 0){
                    //synthNote2();
                    ToneInstrument myNote02 = new ToneInstrument(instList0[2] , panValue, disWave0, gainValue0, delayVal0, bitRes0);
                    out.playNote( 0.0, 0.05, myNote02 );
                    //out.playNote( 0.0, 0.05, myNote02 );
                  }
               if(instrument1.getLabel() == "SYNTH" && instList1[2] != 0){
                    //synthNote1();
                    ToneInstrument myNote12 = new ToneInstrument(instList1[2] , panValue, disWave1, gainValue1, delayVal1, bitRes1);
                    out.playNote( 0.0, 0.05, myNote12 );
                  }
                if(instrument2.getLabel() == "SYNTH" && instList2[2] != 0){
                    //synthNote1();
                    ToneInstrument myNote22 = new ToneInstrument(instList2[2] , panValue, disWave2, gainValue2, delayVal2, bitRes2);
                    out.playNote( 0.0, 0.05, myNote22 );
                  }
                if(instrument3.getLabel() == "SYNTH" && instList3[2] != 0){
                    //synthNote1();
                    ToneInstrument myNote32 = new ToneInstrument(instList3[2] , panValue, disWave3, gainValue3, delayVal3, bitRes3);
                    out.playNote( 0.0, 0.05, myNote32 );
                  }
                if(instrument4.getLabel() == "SYNTH" && instList4[2] != 0){
                    //synthNote1();
                    ToneInstrument myNote42 = new ToneInstrument(instList4[2] , panValue, disWave4, gainValue4, delayVal4, bitRes4);
                    out.playNote( 0.0, 0.05, myNote42 );
                  }
                if(instrument5.getLabel() == "SYNTH" && instList5[2] != 0){
                    //synthNote3();
                    ToneInstrument myNote52 = new ToneInstrument(instList5[2] , panValue, disWave5, gainValue5, delayVal5, bitRes5);
                    out.playNote( 0.0, 0.05, myNote52 );
                  }
                if(instrument6.getLabel() == "SYNTH" && instList6[2] != 0){
                    //synthNote1();
                    ToneInstrument myNote62 = new ToneInstrument(instList6[2] , panValue, disWave6, gainValue6, delayVal6, bitRes6);
                    out.playNote( 0.0, 0.05, myNote62 );
                  }
                if(instrument7.getLabel() == "SYNTH" && instList7[2] != 0){
                    //synthNote1();
                    ToneInstrument myNote72 = new ToneInstrument(instList7[2] , panValue, disWave7, gainValue7, delayVal7, bitRes7);
                    out.playNote( 0.0, 0.05, myNote72 );
                  }
              if (decision0[2] == 1 ){
                  if(instrument0.getLabel() == "KICK"){
                    instList0[2] = 50.0;
                    ToneInstrument myNote02 = new ToneInstrument(instList0[2] , panValue, disWave0, gainValue0, delayVal0);
                    out.playNote( 0.0, 0.1, myNote02);
                    //KICK0();
                    //kick.play(); 
                  }
                  if(instrument0.getLabel() == "SNARE"){
                    snare.rewind();
                    snare.play();
                  }
              if(instrument0.getLabel() == "CLAP"){
                //SNARE0();
                clap.rewind();
                clap.play(); 
              }
                }
              if (decision1[2] == 1 ){
                  if(instrument1.getLabel() == "KICK"){
                   instList1[2] = 50.0;
                   ToneInstrument myNote12 = new ToneInstrument(instList1[2] , panValue, disWave1, gainValue1, delayVal1);
                   out.playNote( 0.0, 0.1, myNote12);
                    //KICK0();
                    //kick.play(); 
                  }
                  if(instrument1.getLabel() == "SNARE"){
                    snare.rewind();
                    snare.play();
                    //snare.play(); 
                  }
              if(instrument1.getLabel() == "CLAP"){
                //SNARE0();
                clap.rewind();
                clap.play(); 
              }
                }
              if (decision2[2] == 1 ){
                  if(instrument2.getLabel() == "KICK"){
                   instList2[2] = 50.0;
                   ToneInstrument myNote22 = new ToneInstrument(instList2[2] , panValue, disWave2, gainValue2, delayVal2);
                   out.playNote( 0.0, 0.1, myNote22);
                  //kick.play();
                 }
                  if(instrument2.getLabel() == "SNARE"){
                    snare.rewind();
                    snare.play();
                  }
              if(instrument2.getLabel() == "CLAP"){
                //SNARE0();
                clap.rewind();
                clap.play(); 
              }
                }
              if (decision3[2] == 1 ){
                  if(instrument3.getLabel() == "KICK"){
                   instList3[2] = 50.0;
                   ToneInstrument myNote32 = new ToneInstrument(instList3[2] , panValue, disWave3, gainValue3, delayVal3);
                   out.playNote( 0.0, 0.1, myNote32);
                  //kick.play();
                 }
                  if(instrument3.getLabel() == "SNARE"){
                    snare.rewind();
                    snare.play();
                  }
              if(instrument3.getLabel() == "CLAP"){
                //SNARE0();
                clap.rewind();
                clap.play(); 
              }
                }
              if (decision4[2] == 1 ){
                  if(instrument4.getLabel() == "KICK"){
                   instList4[2] = 50.0;
                   ToneInstrument myNote42 = new ToneInstrument(instList4[2] , panValue, disWave4, gainValue4, delayVal4);
                   out.playNote( 0.0, 0.1, myNote42);
                  //kick.play();
                 }
                  if(instrument4.getLabel() == "SNARE"){
                    snare.rewind();
                    snare.play();
                  }
              if(instrument4.getLabel() == "CLAP"){
                //SNARE0();
                clap.rewind();
                clap.play(); 
              }
                }
              if (decision5[2] == 1 ){
                  if(instrument5.getLabel() == "KICK"){
                   instList5[2] = 50.0;
                   ToneInstrument myNote52 = new ToneInstrument(instList5[2] , panValue, disWave5, gainValue5, delayVal5);
                   out.playNote( 0.0, 0.1, myNote52);
                  //kick.play();
                 }
                  if(instrument5.getLabel() == "SNARE"){
                    snare.rewind();
                    snare.play();
                  }
              if(instrument5.getLabel() == "CLAP"){
                //SNARE0();
                clap.rewind();
                clap.play(); 
              }
                }
              if (decision6[2] == 1 ){
                  if(instrument6.getLabel() == "KICK"){
                   instList6[2] = 50.0;
                   ToneInstrument myNote62 = new ToneInstrument(instList6[2] , panValue, disWave6, gainValue6, delayVal6);
                   out.playNote( 0.0, 0.1, myNote62);
                  //kick.play();
                 }
                  if(instrument6.getLabel() == "SNARE"){
                    snare.rewind();
                    snare.play();
                  }
              if(instrument6.getLabel() == "CLAP"){
                //SNARE0();
                clap.rewind();
                clap.play(); 
              }
                }
              if (decision7[2] == 1 ){
                  if(instrument7.getLabel() == "KICK"){
                   instList7[2] = 50.0;
                   ToneInstrument myNote72 = new ToneInstrument(instList7[2] , panValue, disWave7, gainValue7, delayVal7);
                   out.playNote( 0.0, 0.1, myNote72);
                  //kick.play();
                 }
                  if(instrument7.getLabel() == "SNARE"){
                    snare.rewind();
                    snare.play();
                  }
              if(instrument7.getLabel() == "CLAP"){
                //SNARE0();
                clap.rewind();
                clap.play(); 
              }
                }
            }
              if (run == 4){
                  if(instrument0.getLabel() == "SYNTH" && instList0[3] != 0){
                    //synthNote3();  
                    ToneInstrument myNote03 = new ToneInstrument(instList0[3] , panValue, disWave0, gainValue0, delayVal0, bitRes0);
                    out.playNote( 0.0, 0.05, myNote03 );
                  }
               if(instrument1.getLabel() == "SYNTH" && instList1[3] != 0){
              //      //synthNote3();
                    ToneInstrument myNote13 = new ToneInstrument(instList1[3] , panValue, disWave1, gainValue1, delayVal1, bitRes1);
                    out.playNote( 0.0, 0.05, myNote13 );
                  }
                if(instrument2.getLabel() == "SYNTH" && instList2[3] != 0){
              //      //synthNote3();
                    ToneInstrument myNote23 = new ToneInstrument(instList2[3] , panValue, disWave2, gainValue2, delayVal2, bitRes2);
                    out.playNote( 0.0, 0.05, myNote23 );
                  }
                if(instrument3.getLabel() == "SYNTH" && instList3[3] != 0){
              //      //synthNote3();
                    ToneInstrument myNote33 = new ToneInstrument(instList3[3] , panValue, disWave3, gainValue3, delayVal3, bitRes3);
                    out.playNote( 0.0, 0.05, myNote33 );
                  }
                if(instrument4.getLabel() == "SYNTH" && instList4[3] != 0){
              //      //synthNote3();
                    ToneInstrument myNote43 = new ToneInstrument(instList4[3] , panValue, disWave4, gainValue4, delayVal4, bitRes4);
                    out.playNote( 0.0, 0.05, myNote43 );
                  }
                if(instrument5.getLabel() == "SYNTH" && instList5[3] != 0){
              //      //synthNote3(); 
                    ToneInstrument myNote53 = new ToneInstrument(instList5[3] , panValue, disWave5, gainValue5, delayVal5, bitRes5);
                    out.playNote( 0.0, 0.05, myNote53 );
                  }
                if(instrument6.getLabel() == "SYNTH" && instList6[3] != 0){
              //      //synthNote3();
                    ToneInstrument myNote63 = new ToneInstrument(instList6[3] , panValue, disWave6, gainValue6, delayVal6, bitRes6);
                    out.playNote( 0.0, 0.05, myNote63 );
                  }
                if(instrument7.getLabel() == "SYNTH" && instList7[3] != 0){
              //      //synthNote3();
                    ToneInstrument myNote73 = new ToneInstrument(instList7[3] , panValue, disWave7, gainValue7, delayVal7, bitRes7);
                    out.playNote( 0.0, 0.05, myNote73 );
                  }
              if (decision0[3] == 1 ){
                  if(instrument0.getLabel() == "KICK"){
                    instList0[3] = 50.0;
                    ToneInstrument myNote03 = new ToneInstrument(instList0[3] , panValue, disWave0, gainValue0, delayVal0);
                    out.playNote( 0.0, 0.1, myNote03);
                    //KICK0();
                    //kick.play(); 
                  }
                  if(instrument0.getLabel() == "SNARE"){
                    snare.rewind();
                    snare.play();
                  }
              if(instrument0.getLabel() == "CLAP"){
                //SNARE0();
                clap.rewind();
                clap.play(); 
              }
                }
              if (decision1[3] == 1 ){
                  if(instrument1.getLabel() == "KICK"){
                   instList1[3] = 50.0;
                   ToneInstrument myNote13 = new ToneInstrument(instList1[3] , panValue, disWave1, gainValue1, delayVal1);
                   out.playNote( 0.0, 0.1, myNote13);
                    //KICK0();
                    //kick.play(); 
                  }
                  if(instrument1.getLabel() == "SNARE"){
                    snare.rewind();
                    snare.play();
                  }
              if(instrument1.getLabel() == "CLAP"){
                //SNARE0();
                clap.rewind();
                clap.play(); 
              }
                }
              if (decision2[3] == 1 ){
                  if(instrument2.getLabel() == "KICK"){
                   instList2[3] = 50.0;
                   ToneInstrument myNote23 = new ToneInstrument(instList2[3] , panValue, disWave2, gainValue2, delayVal2);
                   out.playNote( 0.0, 0.1, myNote23);
                  //kick.play();
                 }
                  if(instrument2.getLabel() == "SNARE"){
                    snare.rewind();
                    snare.play();
                  }
              if(instrument2.getLabel() == "CLAP"){
                //SNARE0();
                clap.rewind();
                clap.play(); 
              }
                }
              if (decision3[3] == 1 ){
                  if(instrument3.getLabel() == "KICK"){
                   instList3[3] = 50.0;
                   ToneInstrument myNote33 = new ToneInstrument(instList3[3] , panValue, disWave3, gainValue3, delayVal3);
                   out.playNote( 0.0, 0.1, myNote33);
                  //kick.play();
                 }
                  if(instrument3.getLabel() == "SNARE"){
                    snare.rewind();
                    snare.play();
                  }
              if(instrument3.getLabel() == "CLAP"){
                //SNARE0();
                clap.rewind();
                clap.play(); 
              }
                }
              if (decision4[3] == 1 ){
                  if(instrument4.getLabel() == "KICK"){
                   instList4[3] = 50.0;
                   ToneInstrument myNote43 = new ToneInstrument(instList4[3] , panValue, disWave4, gainValue4, delayVal4);
                   out.playNote( 0.0, 0.1, myNote43);
                  //kick.play();
                 }
                  if(instrument4.getLabel() == "SNARE"){
                    snare.rewind();
                    snare.play();
                  }
              if(instrument4.getLabel() == "CLAP"){
                //SNARE0();
                clap.rewind();
                clap.play(); 
              }
                }
              if (decision5[3] == 1 ){
                  if(instrument5.getLabel() == "KICK"){
                   instList5[3] = 50.0;
                   ToneInstrument myNote53 = new ToneInstrument(instList5[3] , panValue, disWave5, gainValue5, delayVal5);
                   out.playNote( 0.0, 0.1, myNote53);
                  //kick.play();
                 }
                  if(instrument5.getLabel() == "SNARE"){
                    snare.rewind();
                    snare.play();
                  }
              if(instrument5.getLabel() == "CLAP"){
                //SNARE0();
                clap.rewind();
                clap.play(); 
              }
                }
              if (decision6[3] == 1 ){
                 if(instrument6.getLabel() == "KICK"){
                   instList6[3] = 50.0;
                   ToneInstrument myNote63 = new ToneInstrument(instList6[3] , panValue, disWave6, gainValue6, delayVal6);
                   out.playNote( 0.0, 0.1, myNote63);
                  //kick.play();
                 }
                  if(instrument6.getLabel() == "SNARE"){
                    snare.rewind();
                    snare.play();
                  }
              if(instrument6.getLabel() == "CLAP"){
                //SNARE0();
                clap.rewind();
                clap.play(); 
              }
                }
              if (decision7[3] == 1 ){
                  if(instrument7.getLabel() == "KICK"){
                   instList7[3] = 50.0;
                   ToneInstrument myNote73 = new ToneInstrument(instList7[3] , panValue, disWave7, gainValue7, delayVal7);
                   out.playNote( 0.0, 0.1, myNote73);
                  //kick.play();
                 }
                  if(instrument7.getLabel() == "SNARE"){
                    snare.rewind();
                    snare.play();
                    
                  }
              if(instrument7.getLabel() == "CLAP"){
                //SNARE0();
                clap.rewind();
                clap.play(); 
              }
                }
              }
              
              if(run == 5){  
                  if(instrument0.getLabel() == "SYNTH" && instList0[4] != 0){
                    //synthNote4();
                    ToneInstrument myNote04 = new ToneInstrument(instList0[4] , panValue, disWave0, gainValue0, delayVal0, bitRes0);
                    out.playNote( 0.0, 0.05, myNote04 );
                  }
               if(instrument1.getLabel() == "SYNTH" && instList1[4] != 0){
                    //synthNote4();
                    ToneInstrument myNote14 = new ToneInstrument(instList1[4] , panValue, disWave1, gainValue1, delayVal1, bitRes1);
                    out.playNote( 0.0, 0.05, myNote14);
                  }
                if(instrument2.getLabel() == "SYNTH" && instList2[4] != 0){
                    //synthNote4();
                    ToneInstrument myNote24 = new ToneInstrument(instList2[4] , panValue, disWave2, gainValue2, delayVal2, bitRes2);
                    out.playNote( 0.0, 0.05, myNote24 );
                  }
                if(instrument3.getLabel() == "SYNTH" && instList3[4] != 0){
                    //synthNote4();
                    ToneInstrument myNote34 = new ToneInstrument(instList3[4] , panValue, disWave3, gainValue3, delayVal3, bitRes3);
                    out.playNote( 0.0, 0.05, myNote34 );
                  }
                if(instrument4.getLabel() == "SYNTH" && instList4[4] != 0){
                    //synthNote4();
                    ToneInstrument myNote44 = new ToneInstrument(instList4[4] , panValue, disWave4, gainValue4, delayVal4, bitRes4);
                    out.playNote( 0.0, 0.05, myNote44 );
                  }
                if(instrument5.getLabel() == "SYNTH" && instList5[4] != 0){
                    //synthNote4();
                    ToneInstrument myNote54= new ToneInstrument(instList5[4] , panValue, disWave5, gainValue5, delayVal5, bitRes5);
                    out.playNote( 0.0, 0.05, myNote54);
                  }
                if(instrument6.getLabel() == "SYNTH" && instList6[4] != 0){
                    //synthNote4();
                    ToneInstrument myNote64 = new ToneInstrument(instList6[4] , panValue, disWave6, gainValue6, delayVal6, bitRes6);
                    out.playNote( 0.0, 0.05, myNote64 );
                  }
                if(instrument7.getLabel() == "SYNTH" && instList7[4] != 0){
                    //synthNote4();
                    ToneInstrument myNote74 = new ToneInstrument(instList7[4] , panValue, disWave7, gainValue7, delayVal7, bitRes7);
                    out.playNote( 0.0, 0.05, myNote74 );
                  }
               if (decision0[4] == 1 ){
                  if(instrument0.getLabel() == "KICK"){
                    instList0[4] = 50.0;
                    ToneInstrument myNote04 = new ToneInstrument(instList0[4] , panValue, disWave0, gainValue0, delayVal0);
                    out.playNote( 0.0, 0.1, myNote04);
                  //kick.play();
                 }
                  if(instrument0.getLabel() == "SNARE"){
                    snare.rewind();
                    snare.play();
                  }
              if(instrument0.getLabel() == "CLAP"){
                //SNARE0();
                clap.rewind();
                clap.play(); 
              }
                }
              if (decision1[4] == 1 ){
                  if(instrument1.getLabel() == "KICK"){
                   instList1[4] = 50.0;
                   ToneInstrument myNote14 = new ToneInstrument(instList1[4] , panValue, disWave1, gainValue1, delayVal1);
                   out.playNote( 0.0, 0.1, myNote14);
                  //kick.play();
                 }
                  if(instrument1.getLabel() == "SNARE"){
                    snare.rewind();
                    snare.play();
                  }
              if(instrument1.getLabel() == "CLAP"){
                //SNARE0();
                clap.rewind();
                clap.play(); 
              }
                }
              if (decision2[4] == 1 ){
                  if(instrument2.getLabel() == "KICK"){
                   instList2[4] = 50.0;
                   ToneInstrument myNote24 = new ToneInstrument(instList2[4] , panValue, disWave2, gainValue2, delayVal2);
                   out.playNote( 0.0, 0.1, myNote24);
                  //kick.play();
                 }
                  if(instrument2.getLabel() == "SNARE"){
                    snare.rewind();
                    snare.play();
                  }
              if(instrument2.getLabel() == "CLAP"){
                //SNARE0();
                clap.rewind();
                clap.play(); 
              }
                }
              if (decision3[4] == 1 ){
                  if(instrument3.getLabel() == "KICK"){
                   instList3[4] = 50.0;
                   ToneInstrument myNote34 = new ToneInstrument(instList3[4] , panValue, disWave3, gainValue3, delayVal3);
                   out.playNote( 0.0, 0.1, myNote34);
                  //kick.play();
                 }
                  if(instrument3.getLabel() == "SNARE"){
                    snare.rewind();
                    snare.play();
                  }
              if(instrument3.getLabel() == "CLAP"){
                //SNARE0();
                clap.rewind();
                clap.play(); 
              }
                }
              if (decision4[4] == 1 ){
                  if(instrument4.getLabel() == "KICK"){
                   instList4[4] = 50.0;
                   ToneInstrument myNote44 = new ToneInstrument(instList4[4] , panValue, disWave4, gainValue4, delayVal4);
                   out.playNote( 0.0, 0.1, myNote44);
                  //kick.play();
                 }
                  if(instrument4.getLabel() == "SNARE"){
                    snare.rewind();
                    snare.play();
                  }
              if(instrument4.getLabel() == "CLAP"){
                //SNARE0();
                clap.rewind();
                clap.play(); 
              }
                }
              if (decision5[4] == 1 ){
                  if(instrument5.getLabel() == "KICK"){
                   instList5[4] = 50.0;
                   ToneInstrument myNote54 = new ToneInstrument(instList5[4] , panValue, disWave5, gainValue5, delayVal5);
                   out.playNote( 0.0, 0.1, myNote54);
                  //kick.play();
                 }
                  if(instrument5.getLabel() == "SNARE"){
                    snare.rewind();
                    snare.play();
                  }
              if(instrument5.getLabel() == "CLAP"){
                //SNARE0();
                clap.rewind();
                clap.play(); 
              }
                }
              if (decision6[4] == 1 ){
                  if(instrument6.getLabel() == "KICK"){
                   instList6[4] = 50.0;
                   ToneInstrument myNote64 = new ToneInstrument(instList6[4] , panValue, disWave6, gainValue6, delayVal6);
                   out.playNote( 0.0, 0.1, myNote64);
                  //kick.play();
                 }
                  if(instrument6.getLabel() == "SNARE"){
                    snare.rewind();
                    snare.play();
                  }
              if(instrument6.getLabel() == "CLAP"){
                //SNARE0();
                clap.rewind();
                clap.play(); 
              }
                }
              if (decision7[4] == 1 ){
                  if(instrument7.getLabel() == "KICK"){
                   instList7[4] = 50.0;
                   ToneInstrument myNote74 = new ToneInstrument(instList7[4] , panValue, disWave7, gainValue7, delayVal7);
                   out.playNote( 0.0, 0.1, myNote74);
                  //kick.play();
                 }
                  if(instrument7.getLabel() == "SNARE"){
                    snare.rewind();
                    snare.play();
                  }
              if(instrument7.getLabel() == "CLAP"){
                //SNARE0();
                clap.rewind();
                clap.play(); 
              }
                }  
              }
            if(run == 6) {
                  if(instrument0.getLabel() == "SYNTH" && instList0[5] != 0){
                    //synthNote5();
                    ToneInstrument myNote05 = new ToneInstrument(instList0[5] , panValue, disWave0, gainValue0, delayVal0, bitRes0);
                    out.playNote( 0.0, 0.05, myNote05 );
                  }
               if(instrument1.getLabel() == "SYNTH" && instList1[5] != 0){
                    //synthNote5();
                    ToneInstrument myNote15 = new ToneInstrument(instList1[5] , panValue, disWave1, gainValue1, delayVal1, bitRes1);
                    out.playNote( 0.0, 0.05, myNote15 );
                  }
                if(instrument2.getLabel() == "SYNTH" && instList2[5] != 0){
                    //synthNote5();
                    ToneInstrument myNote25 = new ToneInstrument(instList2[5] , panValue, disWave2, gainValue2, delayVal2, bitRes2);
                    out.playNote( 0.0, 0.05, myNote25 );
                  }
                if(instrument3.getLabel() == "SYNTH" && instList3[5] != 0){
                    //synthNote5();
                    ToneInstrument myNote35 = new ToneInstrument(instList3[5] , panValue, disWave3, gainValue3, delayVal3, bitRes3);
                    out.playNote( 0.0, 0.05, myNote35 );
                  }
                if(instrument4.getLabel() == "SYNTH" && instList4[5] != 0){
                    //synthNote5();
                    ToneInstrument myNote45 = new ToneInstrument(instList4[5] , panValue, disWave4, gainValue4, delayVal4, bitRes4);
                    out.playNote( 0.0, 0.05, myNote45 );
                  }
                if(instrument5.getLabel() == "SYNTH" && instList5[5] != 0){
                    //synthNote5();
                    ToneInstrument myNote55 = new ToneInstrument(instList5[5] , panValue, disWave5, gainValue5, delayVal5, bitRes5);
                    out.playNote( 0.0, 0.05, myNote55 );
                  }
                if(instrument6.getLabel() == "SYNTH" && instList6[5] != 0){
                    //synthNote5();
                    ToneInstrument myNote65 = new ToneInstrument(instList6[5] , panValue, disWave6, gainValue6, delayVal6, bitRes6);
                    out.playNote( 0.0, 0.05, myNote65 );
                  }
                if(instrument7.getLabel() == "SYNTH" && instList7[5] != 0){
                    //synthNote5();
                    ToneInstrument myNote75 = new ToneInstrument(instList7[5] , panValue, disWave7, gainValue7, delayVal7, bitRes7);
                    out.playNote( 0.0, 0.05, myNote75 );
                  }
              if (decision0[5] == 1 ){
                  if(instrument0.getLabel() == "KICK"){
                    instList0[5] = 50.0;
                    ToneInstrument myNote05 = new ToneInstrument(instList0[5] , panValue, disWave0, gainValue0, delayVal0);
                    out.playNote( 0.0, 0.1, myNote05);
                  //kick.play();
                 }
                  if(instrument0.getLabel() == "SNARE"){
                    snare.rewind();
                    snare.play();
                  }
                }
              if (decision1[5] == 1 ){
                  if(instrument1.getLabel() == "KICK"){
                    instList1[5] = 50.0;
                    ToneInstrument myNote15 = new ToneInstrument(instList1[5] , panValue, disWave1, gainValue1, delayVal1);
                    out.playNote( 0.0, 0.1, myNote15);
                 }
                  if(instrument1.getLabel() == "SNARE"){
                    snare.rewind();
                    snare.play();
                  }
              if(instrument1.getLabel() == "CLAP"){
                //SNARE0();
                clap.rewind();
                clap.play(); 
              }
                }
              if (decision2[5] == 1 ){
                  if(instrument2.getLabel() == "KICK"){
                    instList2[5] = 50.0;
                    ToneInstrument myNote25 = new ToneInstrument(instList2[5] , panValue, disWave2, gainValue2, delayVal2);
                    out.playNote( 0.0, 0.1, myNote25);
                 }
                  if(instrument2.getLabel() == "SNARE"){
                    snare.rewind();
                    snare.play();
                  }
              if(instrument2.getLabel() == "CLAP"){
                //SNARE0();
                clap.rewind();
                clap.play(); 
              }
                }
              if (decision3[5] == 1 ){
                  if(instrument3.getLabel() == "KICK"){
                    instList3[5] = 50.0;
                    ToneInstrument myNote35 = new ToneInstrument(instList3[5] , panValue, disWave3, gainValue3, delayVal3);
                    out.playNote( 0.0, 0.1, myNote35);
                 }
                  if(instrument3.getLabel() == "SNARE"){
                    snare.rewind();
                    snare.play();
                  }
              if(instrument3.getLabel() == "CLAP"){
                //SNARE0();
                clap.rewind();
                clap.play(); 
              }
                }
              if (decision4[5] == 1 ){
                  if(instrument4.getLabel() == "KICK"){
                   instList4[5] = 50.0;
                   ToneInstrument myNote45 = new ToneInstrument(instList4[5] , panValue, disWave4, gainValue4, delayVal4);
                   out.playNote( 0.0, 0.1, myNote45);
                  //kick.play();
                 }
                  if(instrument4.getLabel() == "SNARE"){
                    snare.rewind();
                    snare.play();
                  }
              if(instrument4.getLabel() == "CLAP"){
                //SNARE0();
                clap.rewind();
                clap.play(); 
              }
                }
              if (decision5[5] == 1 ){
                  if(instrument5.getLabel() == "KICK"){
                   instList5[5] = 50.0;
                   ToneInstrument myNote55 = new ToneInstrument(instList5[5] , panValue, disWave5, gainValue5, delayVal5);
                   out.playNote( 0.0, 0.1, myNote55);
                  //kick.play();
                 }
                  if(instrument5.getLabel() == "SNARE"){
                    snare.rewind();
                    snare.play();
                  }
              if(instrument5.getLabel() == "CLAP"){
                //SNARE0();
                clap.rewind();
                clap.play(); 
              }
                }
              if (decision6[5] == 1 ){
                 if(instrument6.getLabel() == "KICK"){
                   instList6[5] = 50.0;
                   ToneInstrument myNote65 = new ToneInstrument(instList6[5] , panValue, disWave6, gainValue6, delayVal6);
                   out.playNote( 0.0, 0.1, myNote65);
                  //kick.play();
                 }
                  if(instrument6.getLabel() == "SNARE"){
                    snare.rewind();
                    snare.play();
                    //snare.play();
                  }
              if(instrument6.getLabel() == "CLAP"){
                //SNARE0();
                clap.rewind();
                clap.play(); 
              }
                }
              if (decision7[5] == 1 ){
                  if(instrument7.getLabel() == "KICK"){
                   instList7[5] = 50.0;
                   ToneInstrument myNote75 = new ToneInstrument(instList7[5] , panValue, disWave7, gainValue7, delayVal7);
                   out.playNote( 0.0, 0.1, myNote75);
                  //kick.play();
                 }
                  if(instrument7.getLabel() == "SNARE"){
                    snare.rewind();
                    snare.play();
                    //snare.play();
                  }
              if(instrument7.getLabel() == "CLAP"){
                //SNARE0();
                clap.rewind();
                clap.play(); 
              }
                }  
            }
            
            if(run == 7){
                  if(instrument0.getLabel() == "SYNTH" && instList0[6] != 0){
                    //synthNote6();
                    ToneInstrument myNote06 = new ToneInstrument(instList0[6] , panValue, disWave0, gainValue0, delayVal0, bitRes0);
                    out.playNote( 0.0, 0.05, myNote06 );
                  }
               if(instrument1.getLabel() == "SYNTH" && instList1[6] != 0){
                    //synthNote6();
                    ToneInstrument myNote16 = new ToneInstrument(instList1[6] , panValue, disWave1, gainValue1, delayVal1, bitRes1);
                    out.playNote( 0.0, 0.05, myNote16 );
                  }
                if(instrument2.getLabel()== "SYNTH" && instList2[6] != 0){
                    //synthNote6();
                    ToneInstrument myNote26 = new ToneInstrument(instList2[6] , panValue, disWave2, gainValue2, delayVal2, bitRes2);
                    out.playNote( 0.0, 0.05, myNote26 );
                  }
                if(instrument3.getLabel() == "SYNTH" && instList3[6] != 0){
                    //synthNote6();
                    ToneInstrument myNote36 = new ToneInstrument(instList3[6] , panValue, disWave3, gainValue3, delayVal3, bitRes3);
                    out.playNote( 0.0, 0.05, myNote36 );
                  }
                if(instrument4.getLabel() == "SYNTH" && instList4[6] != 0){
                    //synthNote6();
                    ToneInstrument myNote46 = new ToneInstrument(instList4[6] , panValue, disWave4, gainValue4, delayVal4, bitRes4);
                    out.playNote( 0.0, 0.05, myNote46 );
                  }
                if(instrument5.getLabel() == "SYNTH" && instList5[6] != 0){
                    //synthNote6();
                    ToneInstrument myNote56 = new ToneInstrument(instList5[6] , panValue, disWave5, gainValue5, delayVal5, bitRes5);
                    out.playNote( 0.0, 0.05, myNote56 );
                  }
                if(instrument6.getLabel() == "SYNTH" && instList6[6] != 0){
                    //synthNote6();
                    ToneInstrument myNote66 = new ToneInstrument(instList6[6] , panValue, disWave6, gainValue6, delayVal6, bitRes6);
                    out.playNote( 0.0, 0.05, myNote66 );
                  }
                if(instrument7.getLabel() == "SYNTH" && instList7[6] != 0){
                    //synthNote6();
                    ToneInstrument myNote76 = new ToneInstrument(instList7[6] , panValue, disWave7, gainValue7, delayVal7, bitRes7);
                    out.playNote( 0.0, 0.05, myNote76 );
                  }
               if (decision0[6] == 1 ){
                  if(instrument0.getLabel() == "KICK"){
                    instList0[6] = 50.0;
                    ToneInstrument myNote06 = new ToneInstrument(instList0[6] , panValue, disWave0, gainValue0, delayVal0);
                    out.playNote( 0.0, 0.1, myNote06);
                  //kick.play();
                 }
                  if(instrument0.getLabel() == "SNARE"){
                    snare.rewind();
                    snare.play();
                  }
              if(instrument0.getLabel() == "CLAP"){
                //SNARE0();
                clap.rewind();
                clap.play(); 
              }
                }
              if (decision1[6] == 1 ){
                  if(instrument1.getLabel() == "KICK"){
                   instList1[6] = 50.0;
                   ToneInstrument myNote16 = new ToneInstrument(instList1[6] , panValue, disWave1, gainValue1, delayVal1);
                   out.playNote( 0.0, 0.1, myNote16);
                  //kick.play();
                 }
                  if(instrument1.getLabel() == "SNARE"){
                    snare.rewind();
                    snare.play();
                    //snare.play();
                  }
              if(instrument1.getLabel() == "CLAP"){
                //SNARE0();
                clap.rewind();
                clap.play(); 
              }
                }
              if (decision2[6] == 1 ){
                  if(instrument2.getLabel() == "KICK"){
                   instList2[6] = 50.0;
                   ToneInstrument myNote26 = new ToneInstrument(instList2[6] , panValue, disWave2, gainValue2, delayVal2);
                   out.playNote( 0.0, 0.1, myNote26);
                  //kick.play();
                 }
                  if(instrument2.getLabel() == "SNARE"){
                    snare.rewind();
                    snare.play();
                    //snare.play();
                  }
              if(instrument2.getLabel() == "CLAP"){
                //SNARE0();
                clap.rewind();
                clap.play(); 
              }
                }
              if (decision3[6] == 1 ){
                  if(instrument3.getLabel() == "KICK"){
                   instList3[6] = 50.0;
                   ToneInstrument myNote36 = new ToneInstrument(instList3[6] , panValue, disWave3, gainValue3, delayVal3);
                   out.playNote( 0.0, 0.1, myNote36);
                  //kick.play();
                 }
                  if(instrument3.getLabel() == "SNARE"){
                    snare.rewind();
                    snare.play();
                    //snare.play();
                  }
              if(instrument3.getLabel() == "CLAP"){
                //SNARE0();
                clap.rewind();
                clap.play(); 
              }
                }
              if (decision4[6] == 1 ){
                  if(instrument4.getLabel() == "KICK"){
                   instList4[6] = 50.0;
                   ToneInstrument myNote46 = new ToneInstrument(instList4[6] , panValue, disWave4, gainValue4, delayVal4);
                   out.playNote( 0.0, 0.1, myNote46);
                  //kick.play();
                 }
                  if(instrument4.getLabel() == "SNARE"){
                    snare.rewind();
                    snare.play();
                    //snare.play();
                  }
              if(instrument4.getLabel() == "CLAP"){
                //SNARE0();
                clap.rewind();
                clap.play(); 
              }
                }
              if (decision5[6] == 1 ){
                  if(instrument5.getLabel() == "KICK"){
                   instList5[6] = 50.0;
                   ToneInstrument myNote56 = new ToneInstrument(instList5[6] , panValue, disWave5, gainValue5, delayVal5);
                   out.playNote( 0.0, 0.1, myNote56);
                  //kick.play();
                 }
                  if(instrument5.getLabel() == "SNARE"){
                    snare.rewind();
                    snare.play();
                    //snare.play();
                  }
              if(instrument5.getLabel() == "CLAP"){
                //SNARE0();
                clap.rewind();
                clap.play(); 
              }
                }
              if (decision6[6] == 1 ){
                  if(instrument6.getLabel() == "KICK"){
                   instList6[6] = 50.0;
                   ToneInstrument myNote66 = new ToneInstrument(instList6[6] , panValue, disWave6, gainValue6, delayVal6);
                   out.playNote( 0.0, 0.1, myNote66);
                  //kick.play();
                 }
                  if(instrument6.getLabel() == "SNARE"){
                    snare.rewind();
                    snare.play();
                    //snare.play();
                  }
              if(instrument6.getLabel() == "CLAP"){
                //SNARE0();
                clap.rewind();
                clap.play(); 
              }
                }
              if (decision7[6] == 1 ){
                  if(instrument7.getLabel() == "KICK"){
                   instList7[6] = 50.0;
                   ToneInstrument myNote76 = new ToneInstrument(instList7[6] , panValue, disWave7, gainValue7, delayVal7);
                   out.playNote( 0.0, 0.1, myNote76);
                  //kick.play();
                 }
                  if(instrument7.getLabel() == "SNARE"){
                    snare.rewind();
                    snare.play();
                    //snare.play();
                  }
              if(instrument7.getLabel() == "CLAP"){
                //SNARE0();
                clap.rewind();
                clap.play(); 
              }
                }  
            }
             if(run == 8){ 
               if(instrument0.getLabel() == "SYNTH" && instList0[7] != 0){
                    //synthNote6();
                    ToneInstrument myNote07 = new ToneInstrument(instList0[7] , panValue, disWave0, gainValue0, delayVal0, bitRes0);
                    out.playNote( 0.0, 0.05, myNote07 );
                  }
               if(instrument1.getLabel() == "SYNTH" && instList1[7] != 0){
                    //synthNote6();
                    ToneInstrument myNote17 = new ToneInstrument(instList1[7] , panValue, disWave1, gainValue1, delayVal1, bitRes1);
                    out.playNote( 0.0, 0.05, myNote17 );
                  }
               if(instrument2.getLabel() == "SYNTH" && instList2[7] != 0){
                    //synthNote6();
                    ToneInstrument myNote27 = new ToneInstrument(instList2[7] , panValue, disWave2, gainValue2, delayVal2, bitRes2);
                    out.playNote( 0.0, 0.05, myNote27 );
                  }
               if(instrument3.getLabel() == "SYNTH" && instList3[7] != 0){
                    //synthNote6();
                    ToneInstrument myNote37 = new ToneInstrument(instList3[7] , panValue, disWave3, gainValue3, delayVal3, bitRes3);
                    out.playNote( 0.0, 0.05, myNote37 );
                  }
               if(instrument4.getLabel() == "SYNTH" && instList4[7] != 0){
                    //synthNote6();
                    ToneInstrument myNote47 = new ToneInstrument(instList4[7] , panValue, disWave4, gainValue4, delayVal4, bitRes4);
                    out.playNote( 0.0, 0.05, myNote47 );
                  }
               if(instrument5.getLabel() == "SYNTH" && instList5[7] != 0){
                    //synthNote6();
                    ToneInstrument myNote57 = new ToneInstrument(instList5[7] , panValue, disWave5, gainValue5, delayVal5, bitRes5);
                    out.playNote( 0.0, 0.05, myNote57 );
                  }
               if(instrument6.getLabel() == "SYNTH" && instList6[7] != 0){
                    //synthNote6();
                    ToneInstrument myNote67 = new ToneInstrument(instList6[7] , panValue, disWave6, gainValue6, delayVal6, bitRes6);
                    out.playNote( 0.0, 0.05, myNote67 );
                  }
               if(instrument7.getLabel() == "SYNTH" && instList7[7] != 0){
                    //synthNote6();
                    ToneInstrument myNote77 = new ToneInstrument(instList7[7] , panValue, disWave7, gainValue7, delayVal7, bitRes7);
                    out.playNote( 0.0, 0.05, myNote77 );
                  }
               if (decision0[7] == 1 ){
                  if(instrument0.getLabel() == "KICK"){
                    instList0[7] = 50.0;
                    ToneInstrument myNote07 = new ToneInstrument(instList0[7] , panValue, disWave0, gainValue0, delayVal0);
                    out.playNote( 0.0, 0.1, myNote07);
                  //kick.play();
                 }
                  if(instrument0.getLabel() == "SNARE"){
                    snare.rewind();
                    snare.play();
                    //snare.play();
                  }
              if(instrument0.getLabel() == "CLAP"){
                //SNARE0();
                clap.rewind();
                clap.play(); 
              }
                }
              if (decision1[7] == 1 ){
                  if(instrument1.getLabel() == "KICK"){
                   instList1[7] = 50.0;
                   ToneInstrument myNote17 = new ToneInstrument(instList1[7] , panValue, disWave1, gainValue1, delayVal1);
                   out.playNote( 0.0, 0.1, myNote17);
                  //kick.play();
                 }
                  if(instrument1.getLabel() == "SNARE"){
                    snare.rewind();
                    snare.play();
                    //snare.play();
                  }
              if(instrument1.getLabel() == "CLAP"){
                //SNARE0();
                clap.rewind();
                clap.play(); 
              }
                }
              if (decision2[7] == 1 ){
                  if(instrument2.getLabel() == "KICK"){
                   instList2[7] = 50.0;
                   ToneInstrument myNote27 = new ToneInstrument(instList2[7] , panValue, disWave2, gainValue2, delayVal2);
                   out.playNote( 0.0, 0.1, myNote27);
                  //kick.play();
                 }
                  if(instrument2.getLabel() == "SNARE"){
                    snare.rewind();
                    snare.play();
                    //snare.play();
                  }
              if(instrument2.getLabel() == "CLAP"){
                //SNARE0();
                clap.rewind();
                clap.play(); 
              }
                }
              if (decision3[7] == 1 ){
                  if(instrument3.getLabel() == "KICK"){
                   instList3[7] = 50.0;
                   ToneInstrument myNote37 = new ToneInstrument(instList3[7] , panValue, disWave3, gainValue3, delayVal3);
                   out.playNote( 0.0, 0.1, myNote37);
                  //kick.play();
                 }
                  if(instrument3.getLabel() == "SNARE"){
                    snare.rewind();
                    snare.play();
                    //snare.play();
                  }
              if(instrument3.getLabel() == "CLAP"){
                //SNARE0();
                clap.rewind();
                clap.play(); 
              }
                }
              if (decision4[7] == 1 ){
                  if(instrument4.getLabel() == "KICK"){
                   instList4[7] = 50.0;
                   ToneInstrument myNote47 = new ToneInstrument(instList4[7] , panValue, disWave4, gainValue4, delayVal4);
                   out.playNote( 0.0, 0.1, myNote47);
                  //kick.play();
                 }
                  if(instrument4.getLabel() == "SNARE"){
                    snare.rewind();
                    snare.play();
                    //snare.play();
                  }
              if(instrument4.getLabel() == "CLAP"){
                //SNARE0();
                clap.rewind();
                clap.play(); 
              }
                }
              if (decision5[7] == 1 ){
                  if(instrument5.getLabel() == "KICK"){
                   instList5[7] = 50.0;
                   ToneInstrument myNote57 = new ToneInstrument(instList5[7] , panValue, disWave5, gainValue5, delayVal5);
                   out.playNote( 0.0, 0.1, myNote57);
                  //kick.play();
                 }
                  if(instrument5.getLabel() == "SNARE"){
                    snare.rewind();
                    snare.play();
                    //snare.play();
                  }
              if(instrument5.getLabel() == "CLAP"){
                //SNARE0();
                clap.rewind();
                clap.play(); 
              }
                }
              if (decision6[7] == 1 ){
                  if(instrument6.getLabel() == "KICK"){
                   instList6[7] = 50.0;
                   ToneInstrument myNote67 = new ToneInstrument(instList6[7] , panValue, disWave6, gainValue6, delayVal6);
                   out.playNote( 0.0, 0.1, myNote67);
                  //kick.play();
                 }
                  if(instrument6.getLabel() == "SNARE"){
                    snare.rewind();
                    snare.play();
                    //snare.play();
                  }
              if(instrument6.getLabel() == "CLAP"){
                //SNARE0();
                clap.rewind();
                clap.play(); 
              }
                }
              if (decision7[7] == 1 ){
                  if(instrument7.getLabel() == "KICK"){
                   instList7[7] = 50.0;
                   ToneInstrument myNote77 = new ToneInstrument(instList7[7] , panValue, disWave7, gainValue7, delayVal7);
                   out.playNote( 0.0, 0.1, myNote77);
                  //kick.play();
                 }
                  if(instrument7.getLabel() == "SNARE"){
                    snare.rewind();
                    snare.play();
                    //snare.play();
                  }
              if(instrument7.getLabel() == "CLAP"){
                //SNARE0();
                clap.rewind();
                clap.play(); 
              }
                }  
          }
          
          //decision0[0] = 0;
    }
 
// ADDEDDDDDDD=====================================================================================  
      //print("highlight =" +highlight);
      //print("\n");
      //print("instSelect =" +instSelect[0]);
      //print("\n");
      print("\n");
      //print("instSelect =="+instSelect[0]+instSelect[1]+instSelect[3]);
      //print("\n");
      if(patList2 == 0){
      if(instSelect[0] == 1){
              //cp5.get(controlP5.Button.class, "Instrument" + 0).setColorBackground( color(255, 255, 0) );
              //inst = 0;
              print("\n");
              print("here now!!!");
              print("\n");
              highlight = 2;
              //print(highlight);
              if(instUpward == 0){
                //cp5.get(controlP5.Button.class, "SYNTH" + 0).setColorBackground( color(255, 0, 0) );
                //cp5.get(controlP5.Button.class, "ENVELOPES" + 0).setColorBackground( color(255, 0, 0) );
                cp5.get(controlP5.Button.class, "SNARE" + 0).setColorBackground( color(255, 0, 0) );
                //cp5.get(controlP5.Button.class, "HAT" + 0).setColorBackground( color(255, 0, 0) );
                //cp5.get(controlP5.Button.class, "CLAP" + 0).setColorBackground( color(255, 0, 0) );
                if(intRighty == 0){
                    //print(intRighty);
                    cp5.get(controlP5.Button.class, "KICK" + 0).setColorBackground( color(0, 250, 0) );
                    cp5.get(controlP5.Button.class, "SNARE" + 0).setColorBackground( color(255, 0, 0) );
                    cp5.get(controlP5.Button.class, "HAT" + 0).setColorBackground( color(255, 0, 0) );
                    cp5.get(controlP5.Button.class, "CLAP" + 0).setColorBackground( color(255, 0, 0) );
                    //print(intRighty+"..."+intRighty);
                    if(entVal_instrument == 2 && highlight == 2 && instUpward == 0 && intRighty == 0){
                      cp5.get(controlP5.Button.class, "instrument" + 0).setCaptionLabel("KICK").setColorCaptionLabel(255);
                    }
                    if(entVal_instrument == 3){
                        highlight = 1;
                        instSelect[0] = 0;
                        cp5.get(controlP5.Button.class, "KICK" + 0).setColorBackground( color(255, 0, 0) );
                        entVal_instrument = 1;
                      }
                }
                if(intRighty == 1){
                  //print("second Value:"+intRighty);
                    //cp5.get(controlP5.Button.class, "SYNTH" + 0).setColorBackground( color(255, 0, 0) );
                    cp5.get(controlP5.Button.class, "SNARE" + 0).setColorBackground( color(0, 255, 0) );
                    cp5.get(controlP5.Button.class, "KICK" + 0).setColorBackground( color(255, 0, 0) );
                    cp5.get(controlP5.Button.class, "HAT" + 0).setColorBackground( color(255, 0, 0) );
                    cp5.get(controlP5.Button.class, "CLAP" + 0).setColorBackground( color(255, 0, 0) );
                  if(entVal_instrument == 2 && highlight == 2 && instUpward == 0 && intRighty == 1){
                    cp5.get(controlP5.Button.class, "instrument" + 0).setCaptionLabel("SNARE").setColorCaptionLabel(255);
                  }
                  if(entVal_instrument == 3){
                        highlight = 1;
                        instSelect[0] = 0;
                        cp5.get(controlP5.Button.class, "SNARE" + 0).setColorBackground( color(255, 0, 0) );
                        entVal_instrument = 1;
                      }
                }
                if(intRighty == 2){
                 
                }
              }
              
              if(instUpward == 1){
                //cp5.get(controlP5.Button.class, "KICK" + 0).setColorBackground( color(255, 0, 0) );
                //cp5.get(controlP5.Button.class, "SNARE" + 0).setColorBackground( color(255, 0, 0) );
                //cp5.get(controlP5.Button.class, "HAT" + 0).setColorBackground( color(0, 255, 0) );
                if(intRighty == 0){
                  
                   //print(intRighty);
                  cp5.get(controlP5.Button.class, "HAT" + 0).setColorBackground( color(0, 255, 0) );
                  cp5.get(controlP5.Button.class, "SNARE" + 0).setColorBackground( color(255, 0, 0) );
                  cp5.get(controlP5.Button.class, "KICK" + 0).setColorBackground( color(255, 0, 0) );
                  cp5.get(controlP5.Button.class, "CLAP" + 0).setColorBackground( color(255, 0, 0) );
                  cp5.get(controlP5.Button.class, "SYNTH" + 0).setColorBackground( color(255, 0, 0) );
                  cp5.get(controlP5.Button.class, "ENVELOPES" + 0).setColorBackground( color(255, 0, 0) );
                  if(entVal_instrument == 2 && highlight == 2 && instUpward == 1 && intRighty == 0){
                    cp5.get(controlP5.Button.class, "instrument" + 0).setCaptionLabel("HAT").setColorCaptionLabel(255);
                  }
                  if(entVal_instrument == 3){
                        highlight = 1;
                        instSelect[0] = 0;
                        cp5.get(controlP5.Button.class, "HAT" + 0).setColorBackground( color(255, 0, 0) );
                        entVal_instrument = 1;
                      }
                  
                }
                if(intRighty == 1){
                  //print(intRighty);
                  cp5.get(controlP5.Button.class, "CLAP" + 0).setColorBackground( color(0, 255, 0) );
                  cp5.get(controlP5.Button.class, "HAT" + 0).setColorBackground( color(255, 0, 0) );
                  cp5.get(controlP5.Button.class, "KICK" + 0).setColorBackground( color(255, 0, 0) );
                  cp5.get(controlP5.Button.class, "SNARE" + 0).setColorBackground( color(255, 0, 0) );
                  cp5.get(controlP5.Button.class, "SYNTH" + 0).setColorBackground( color(255, 0, 0) );
                  cp5.get(controlP5.Button.class, "ENVELOPES" + 0).setColorBackground( color(255, 0, 0) );
                  
                  if(entVal_instrument == 2 && highlight == 2 && instUpward == 1 && intRighty == 1){
                    cp5.get(controlP5.Button.class, "instrument" + 0).setCaptionLabel("CLAP");
                  }
                  if(entVal_instrument == 3){
                        highlight = 1;
                        instSelect[0] = 0;
                        cp5.get(controlP5.Button.class, "CLAP" + 0).setColorBackground( color(255, 0, 0) );
                        entVal_instrument = 1;
                      }
                 
                }
              }
                if(intRighty == 2){
                  
                }
                if (instUpward == 2){
                    if(intRighty == 0){
                    cp5.get(controlP5.Button.class, "SYNTH" + 0).setColorBackground( color(0, 255, 0) );
                    cp5.get(controlP5.Button.class, "CLAP" + 0).setColorBackground( color(255, 0, 0) );
                    cp5.get(controlP5.Button.class, "HAT" + 0).setColorBackground( color(255, 0, 0) );
                    cp5.get(controlP5.Button.class, "ENVELOPES" + 0).setColorBackground( color(255, 0, 0) );
                    if(entVal_instrument == 2 && highlight == 2 && instUpward == 2 && intRighty == 0){
                      cp5.get(controlP5.Button.class, "instrument" + 0).setCaptionLabel("SYNTH");
                      
                    }
                    if(entVal_instrument == 3){
                        highlight = 1;
                        instSelect[0] = 0;
                        cp5.get(controlP5.Button.class, "SYNTH" + 0).setColorBackground( color(255, 0, 0) );
                        entVal_instrument = 1;
                      }
                  }
                  
                  
                  if (intRighty == 1){
                     //print(intRighty);
                  cp5.get(controlP5.Button.class, "ENVELOPES" + 0).setColorBackground( color(0, 255, 0) );
                  cp5.get(controlP5.Button.class, "SYNTH" + 0).setColorBackground( color(255, 0, 0) );
                  cp5.get(controlP5.Button.class, "CLAP" + 0).setColorBackground( color(255, 0, 0) );
                  if(entVal_instrument == 2 && highlight == 2 && instUpward == 2 && intRighty == 1){
                    cp5.get(controlP5.Button.class, "instrument" + 0).setCaptionLabel("ENVELOPES");
                  }
                  if(entVal_instrument == 3){
                        highlight = 1;
                        instSelect[0] = 0;
                        cp5.get(controlP5.Button.class, "ENVELOPES" + 0).setColorBackground( color(255, 0, 0) );
                        entVal_instrument = 1;
                      }
                  }
                  
                }
              
              
      }
      
        if(instSelect[1] == 1){
           highlight = 2;
           if(instUpward == 0){
                //cp5.get(controlP5.Button.class, "SYNTH" + 0).setColorBackground( color(255, 0, 0) );
                //cp5.get(controlP5.Button.class, "ENVELOPES" + 0).setColorBackground( color(255, 0, 0) );
                cp5.get(controlP5.Button.class, "SNARE" + 0).setColorBackground( color(255, 0, 0) );
                //cp5.get(controlP5.Button.class, "HAT" + 0).setColorBackground( color(255, 0, 0) );
                //cp5.get(controlP5.Button.class, "CLAP" + 0).setColorBackground( color(255, 0, 0) );
                if(intRighty == 0){
                    //print(intRighty);
                    cp5.get(controlP5.Button.class, "KICK" + 0).setColorBackground( color(0, 255, 0) );
                    cp5.get(controlP5.Button.class, "SNARE" + 0).setColorBackground( color(255, 0, 0) );
                    cp5.get(controlP5.Button.class, "HAT" + 0).setColorBackground( color(255, 0, 0) );
                    cp5.get(controlP5.Button.class, "CLAP" + 0).setColorBackground( color(255, 0, 0) );
                    //print(intRighty+"..."+intRighty);
                    if(entVal_instrument == 2 && highlight == 2 && instUpward == 0 && intRighty == 0){
                      cp5.get(controlP5.Button.class, "instrument" + 1).setCaptionLabel("KICK").setColorCaptionLabel(255);
                    }
                    if(entVal_instrument == 3){
                        highlight = 1;
                        instSelect[1] = 0;
                        cp5.get(controlP5.Button.class, "KICK" + 0).setColorBackground( color(255, 0, 0) );
                        entVal_instrument = 1;
                      }
                }
                if(intRighty == 1){
                  //print("second Value:"+intRighty);
                    //cp5.get(controlP5.Button.class, "SYNTH" + 0).setColorBackground( color(255, 0, 0) );
                    cp5.get(controlP5.Button.class, "SNARE" + 0).setColorBackground( color(0, 255, 0) );
                    cp5.get(controlP5.Button.class, "KICK" + 0).setColorBackground( color(255, 0, 0) );
                    cp5.get(controlP5.Button.class, "HAT" + 0).setColorBackground( color(255, 0, 0) );
                    cp5.get(controlP5.Button.class, "CLAP" + 0).setColorBackground( color(255, 0, 0) );
                  if(entVal_instrument == 2 && highlight == 2 && instUpward == 0 && intRighty == 1){
                    cp5.get(controlP5.Button.class, "instrument" + 1).setCaptionLabel("SNARE").setColorCaptionLabel(255);
                  }
                  if(entVal_instrument == 3){
                        highlight = 1;
                        instSelect[1] = 0;
                        cp5.get(controlP5.Button.class, "SNARE" + 0).setColorBackground( color(255, 0, 0) );
                        entVal_instrument = 1;
                      }
                }
                if(intRighty == 2){
                 
                }
              }
              
              if(instUpward == 1){
                //cp5.get(controlP5.Button.class, "KICK" + 0).setColorBackground( color(255, 0, 0) );
                //cp5.get(controlP5.Button.class, "SNARE" + 0).setColorBackground( color(255, 0, 0) );
                //cp5.get(controlP5.Button.class, "HAT" + 0).setColorBackground( color(0, 255, 0) );
                if(intRighty == 0){
                  
                   //print(intRighty);
                  cp5.get(controlP5.Button.class, "HAT" + 0).setColorBackground( color(0, 255, 0) );
                  cp5.get(controlP5.Button.class, "SNARE" + 0).setColorBackground( color(255, 0, 0) );
                  cp5.get(controlP5.Button.class, "KICK" + 0).setColorBackground( color(255, 0, 0) );
                  cp5.get(controlP5.Button.class, "CLAP" + 0).setColorBackground( color(255, 0, 0) );
                  cp5.get(controlP5.Button.class, "SYNTH" + 0).setColorBackground( color(255, 0, 0) );
                  cp5.get(controlP5.Button.class, "ENVELOPES" + 0).setColorBackground( color(255, 0, 0) );
                  if(entVal_instrument == 2 && highlight == 2 && instUpward == 1 && intRighty == 0){
                    cp5.get(controlP5.Button.class, "instrument" + 1).setCaptionLabel("HAT");
                  }
                  if(entVal_instrument == 3){
                        highlight = 1;
                        instSelect[1] = 0;
                        cp5.get(controlP5.Button.class, "HAT" + 0).setColorBackground( color(255, 0, 0) );
                        entVal_instrument = 1;
                      }
                  
                }
                if(intRighty == 1){
                  //print(intRighty);
                  cp5.get(controlP5.Button.class, "CLAP" + 0).setColorBackground( color(0, 255, 0) );
                  cp5.get(controlP5.Button.class, "HAT" + 0).setColorBackground( color(255, 0, 0) );
                  cp5.get(controlP5.Button.class, "KICK" + 0).setColorBackground( color(255, 0, 0) );
                  cp5.get(controlP5.Button.class, "SNARE" + 0).setColorBackground( color(255, 0, 0) );
                  cp5.get(controlP5.Button.class, "SYNTH" + 0).setColorBackground( color(255, 0, 0) );
                  cp5.get(controlP5.Button.class, "ENVELOPES" + 0).setColorBackground( color(255, 0, 0) );
                  
                  if(entVal_instrument == 2 && highlight == 2 && instUpward == 1 && intRighty == 1){
                    cp5.get(controlP5.Button.class, "instrument" + 1).setCaptionLabel("CLAP");
                  }
                  if(entVal_instrument == 3){
                        highlight = 1;
                        instSelect[1] = 0;
                        cp5.get(controlP5.Button.class, "CLAP" + 0).setColorBackground( color(255, 0, 0) );
                        entVal_instrument = 1;
                      }
                 
                }
              }
                if(intRighty == 2){
                  
                }
                if (instUpward == 2){
                    if(intRighty == 0){
                    cp5.get(controlP5.Button.class, "SYNTH" + 0).setColorBackground( color(0, 255, 0) );
                    cp5.get(controlP5.Button.class, "CLAP" + 0).setColorBackground( color(255, 0, 0) );
                    cp5.get(controlP5.Button.class, "HAT" + 0).setColorBackground( color(255, 0, 0) );
                    cp5.get(controlP5.Button.class, "ENVELOPES" + 0).setColorBackground( color(255, 0, 0) );
                    if(entVal_instrument == 2 && highlight == 2 && instUpward == 2 && intRighty == 0){
                      cp5.get(controlP5.Button.class, "instrument" + 1).setCaptionLabel("SYNTH");
                      
                    }
                    if(entVal_instrument == 3){
                        highlight = 1;
                        instSelect[1] = 0;
                        cp5.get(controlP5.Button.class, "SYNTH" + 0).setColorBackground( color(255, 0, 0) );
                        entVal_instrument = 1;
                      }
                  }
                  
                  
                  if (intRighty == 1){
                     //print(intRighty);
                  cp5.get(controlP5.Button.class, "ENVELOPES" + 0).setColorBackground( color(0, 255, 0) );
                  cp5.get(controlP5.Button.class, "SYNTH" + 0).setColorBackground( color(255, 0, 0) );
                  cp5.get(controlP5.Button.class, "CLAP" + 0).setColorBackground( color(255, 0, 0) );
                  if(entVal_instrument == 2 && highlight == 2 && instUpward == 2 && intRighty == 1){
                    cp5.get(controlP5.Button.class, "instrument" + 0).setCaptionLabel("ENVELOPES");
                  }
                  if(entVal_instrument == 3){
                        highlight = 1;
                        instSelect[1] = 0;
                        cp5.get(controlP5.Button.class, "ENVELOPES" + 0).setColorBackground( color(255, 0, 0) );
                        entVal_instrument = 1;
                      }
                  }
                  
                }
                
        }
        if(instSelect[2] == 1){
          highlight = 2;
          if(instUpward == 0){
                //cp5.get(controlP5.Button.class, "SYNTH" + 0).setColorBackground( color(255, 0, 0) );
                //cp5.get(controlP5.Button.class, "ENVELOPES" + 0).setColorBackground( color(255, 0, 0) );
                cp5.get(controlP5.Button.class, "SNARE" + 0).setColorBackground( color(255, 0, 0) );
                //cp5.get(controlP5.Button.class, "HAT" + 0).setColorBackground( color(255, 0, 0) );
                //cp5.get(controlP5.Button.class, "CLAP" + 0).setColorBackground( color(255, 0, 0) );
                if(intRighty == 0){
                    //print(intRighty);
                    cp5.get(controlP5.Button.class, "KICK" + 0).setColorBackground( color(0, 255, 0) );
                    cp5.get(controlP5.Button.class, "SNARE" + 0).setColorBackground( color(255, 0, 0) );
                    cp5.get(controlP5.Button.class, "HAT" + 0).setColorBackground( color(255, 0, 0) );
                    cp5.get(controlP5.Button.class, "CLAP" + 0).setColorBackground( color(255, 0, 0) );
                    //print(intRighty+"..."+intRighty);
                    if(entVal_instrument == 2 && highlight == 2 && instUpward == 0 && intRighty == 0){
                      cp5.get(controlP5.Button.class, "instrument" + 2).setCaptionLabel("KICK").setColorCaptionLabel(255);
                    }
                    if(entVal_instrument == 3){
                        highlight = 1;
                        instSelect[2] = 0;
                        cp5.get(controlP5.Button.class, "KICK" + 0).setColorBackground( color(255, 0, 0) );
                        entVal_instrument = 1;
                      }
                }
                if(intRighty == 1){
                  //print("second Value:"+intRighty);
                    //cp5.get(controlP5.Button.class, "SYNTH" + 0).setColorBackground( color(255, 0, 0) );
                    cp5.get(controlP5.Button.class, "SNARE" + 0).setColorBackground( color(0, 255, 0) );
                    cp5.get(controlP5.Button.class, "KICK" + 0).setColorBackground( color(255, 0, 0) );
                    cp5.get(controlP5.Button.class, "HAT" + 0).setColorBackground( color(255, 0, 0) );
                    cp5.get(controlP5.Button.class, "CLAP" + 0).setColorBackground( color(255, 0, 0) );
                  if(entVal_instrument == 2 && highlight == 2 && instUpward == 0 && intRighty == 1){
                    cp5.get(controlP5.Button.class, "instrument" + 2).setCaptionLabel("SNARE").setColorCaptionLabel(255);
                  }
                  if(entVal_instrument == 3){
                        highlight = 1;
                        instSelect[2] = 0;
                        cp5.get(controlP5.Button.class, "SNARE" + 0).setColorBackground( color(255, 0, 0) );
                        entVal_instrument = 1;
                      }
                }
                if(intRighty == 2){
                 
                }
              }
              
              if(instUpward == 1){
                //cp5.get(controlP5.Button.class, "KICK" + 0).setColorBackground( color(255, 0, 0) );
                //cp5.get(controlP5.Button.class, "SNARE" + 0).setColorBackground( color(255, 0, 0) );
                //cp5.get(controlP5.Button.class, "HAT" + 0).setColorBackground( color(0, 255, 0) );
                if(intRighty == 0){
                  
                   //print(intRighty);
                  cp5.get(controlP5.Button.class, "HAT" + 0).setColorBackground( color(0, 255, 0) );
                  cp5.get(controlP5.Button.class, "SNARE" + 0).setColorBackground( color(255, 0, 0) );
                  cp5.get(controlP5.Button.class, "KICK" + 0).setColorBackground( color(255, 0, 0) );
                  cp5.get(controlP5.Button.class, "CLAP" + 0).setColorBackground( color(255, 0, 0) );
                  cp5.get(controlP5.Button.class, "SYNTH" + 0).setColorBackground( color(255, 0, 0) );
                  cp5.get(controlP5.Button.class, "ENVELOPES" + 0).setColorBackground( color(255, 0, 0) );
                  if(entVal_instrument == 2 && highlight == 2 && instUpward == 1 && intRighty == 0){
                    cp5.get(controlP5.Button.class, "instrument" + 2).setCaptionLabel("HAT");
                  }
                  if(entVal_instrument == 3){
                        highlight = 1;
                        instSelect[2] = 0;
                        cp5.get(controlP5.Button.class, "HAT" + 0).setColorBackground( color(255, 0, 0) );
                        entVal_instrument = 1;
                      }
                  
                }
                if(intRighty == 1){
                  //print(intRighty);
                  cp5.get(controlP5.Button.class, "CLAP" + 0).setColorBackground( color(0, 255, 0) );
                  cp5.get(controlP5.Button.class, "HAT" + 0).setColorBackground( color(255, 0, 0) );
                  cp5.get(controlP5.Button.class, "KICK" + 0).setColorBackground( color(255, 0, 0) );
                  cp5.get(controlP5.Button.class, "SNARE" + 0).setColorBackground( color(255, 0, 0) );
                  cp5.get(controlP5.Button.class, "SYNTH" + 0).setColorBackground( color(255, 0, 0) );
                  cp5.get(controlP5.Button.class, "ENVELOPES" + 0).setColorBackground( color(255, 0, 0) );
                  
                  if(entVal_instrument == 2 && highlight == 2 && instUpward == 1 && intRighty == 1){
                    cp5.get(controlP5.Button.class, "instrument" + 2).setCaptionLabel("CLAP");
                  }
                  if(entVal_instrument == 3){
                        highlight = 1;
                        instSelect[2] = 0;
                        cp5.get(controlP5.Button.class, "CLAP" + 0).setColorBackground( color(255, 0, 0) );
                        entVal_instrument = 1;
                      }
                 
                }
              }
                if(intRighty == 2){
                  
                }
                if (instUpward == 2){
                    if(intRighty == 0){
                    cp5.get(controlP5.Button.class, "SYNTH" + 0).setColorBackground( color(0, 255, 0) );
                    cp5.get(controlP5.Button.class, "CLAP" + 0).setColorBackground( color(255, 0, 0) );
                    cp5.get(controlP5.Button.class, "HAT" + 0).setColorBackground( color(255, 0, 0) );
                    cp5.get(controlP5.Button.class, "ENVELOPES" + 0).setColorBackground( color(255, 0, 0) );
                    if(entVal_instrument == 2 && highlight == 2 && instUpward == 2 && intRighty == 0){
                      cp5.get(controlP5.Button.class, "instrument" + 2).setCaptionLabel("SYNTH");
                      
                    }
                    if(entVal_instrument == 3){
                        highlight = 1;
                        instSelect[2] = 0;
                        cp5.get(controlP5.Button.class, "SYNTH" + 0).setColorBackground( color(255, 0, 0) );
                        entVal_instrument = 1;
                      }
                  }
                  
                  
                  if (intRighty == 1){
                     //print(intRighty);
                  cp5.get(controlP5.Button.class, "ENVELOPES" + 0).setColorBackground( color(0, 255, 0) );
                  cp5.get(controlP5.Button.class, "SYNTH" + 0).setColorBackground( color(255, 0, 0) );
                  cp5.get(controlP5.Button.class, "CLAP" + 0).setColorBackground( color(255, 0, 0) );
                  if(entVal_instrument == 2 && highlight == 2 && instUpward == 2 && intRighty == 1){
                    cp5.get(controlP5.Button.class, "instrument" + 2).setCaptionLabel("ENVELOPES");
                  }
                  if(entVal_instrument == 3){
                        highlight = 1;
                        instSelect[2] = 0;
                        cp5.get(controlP5.Button.class, "ENVELOPES" + 0).setColorBackground( color(255, 0, 0) );
                        entVal_instrument = 1;
                      }
                  }
                  
                }
              
        }
        if(instSelect[3] == 1){
          highlight = 2;
          if(instUpward == 0){
                //cp5.get(controlP5.Button.class, "SYNTH" + 0).setColorBackground( color(255, 0, 0) );
                //cp5.get(controlP5.Button.class, "ENVELOPES" + 0).setColorBackground( color(255, 0, 0) );
                cp5.get(controlP5.Button.class, "SNARE" + 0).setColorBackground( color(255, 0, 0) );
                //cp5.get(controlP5.Button.class, "HAT" + 0).setColorBackground( color(255, 0, 0) );
                //cp5.get(controlP5.Button.class, "CLAP" + 0).setColorBackground( color(255, 0, 0) );
                if(intRighty == 0){
                    //print(intRighty);
                    cp5.get(controlP5.Button.class, "KICK" + 0).setColorBackground( color(0, 255, 0) );
                    cp5.get(controlP5.Button.class, "SNARE" + 0).setColorBackground( color(255, 0, 0) );
                    cp5.get(controlP5.Button.class, "HAT" + 0).setColorBackground( color(255, 0, 0) );
                    cp5.get(controlP5.Button.class, "CLAP" + 0).setColorBackground( color(255, 0, 0) );
                    //print(intRighty+"..."+intRighty);
                    if(entVal_instrument == 2 && highlight == 2 && instUpward == 0 && intRighty == 0){
                      cp5.get(controlP5.Button.class, "instrument" + 3).setCaptionLabel("KICK").setColorCaptionLabel(255);
                    }
                    if(entVal_instrument == 3){
                        highlight = 1;
                        instSelect[3] = 0;
                        cp5.get(controlP5.Button.class, "KICK" + 0).setColorBackground( color(255, 0, 0) );
                        entVal_instrument = 1;
                      }
                }
                if(intRighty == 1){
                  //print("second Value:"+intRighty);
                    //cp5.get(controlP5.Button.class, "SYNTH" + 0).setColorBackground( color(255, 0, 0) );
                    cp5.get(controlP5.Button.class, "SNARE" + 0).setColorBackground( color(0, 255, 0) );
                    cp5.get(controlP5.Button.class, "KICK" + 0).setColorBackground( color(255, 0, 0) );
                    cp5.get(controlP5.Button.class, "HAT" + 0).setColorBackground( color(255, 0, 0) );
                    cp5.get(controlP5.Button.class, "CLAP" + 0).setColorBackground( color(255, 0, 0) );
                  if(entVal_instrument == 2 && highlight == 2 && instUpward == 0 && intRighty == 1){
                    cp5.get(controlP5.Button.class, "instrument" + 3).setCaptionLabel("SNARE").setColorCaptionLabel(255);
                  }
                  if(entVal_instrument == 3){
                        highlight = 1;
                        instSelect[3] = 0;
                        cp5.get(controlP5.Button.class, "SNARE" + 0).setColorBackground( color(255, 0, 0) );
                        entVal_instrument = 1;
                      }
                }
                if(intRighty == 2){
                 
                }
              }
              
              if(instUpward == 1){
                //cp5.get(controlP5.Button.class, "KICK" + 0).setColorBackground( color(255, 0, 0) );
                //cp5.get(controlP5.Button.class, "SNARE" + 0).setColorBackground( color(255, 0, 0) );
                //cp5.get(controlP5.Button.class, "HAT" + 0).setColorBackground( color(0, 255, 0) );
                if(intRighty == 0){
                  
                   //print(intRighty);
                  cp5.get(controlP5.Button.class, "HAT" + 0).setColorBackground( color(0, 255, 0) );
                  cp5.get(controlP5.Button.class, "SNARE" + 0).setColorBackground( color(255, 0, 0) );
                  cp5.get(controlP5.Button.class, "KICK" + 0).setColorBackground( color(255, 0, 0) );
                  cp5.get(controlP5.Button.class, "CLAP" + 0).setColorBackground( color(255, 0, 0) );
                  cp5.get(controlP5.Button.class, "SYNTH" + 0).setColorBackground( color(255, 0, 0) );
                  cp5.get(controlP5.Button.class, "ENVELOPES" + 0).setColorBackground( color(255, 0, 0) );
                  if(entVal_instrument == 2 && highlight == 2 && instUpward == 1 && intRighty == 0){
                    cp5.get(controlP5.Button.class, "instrument" + 3).setCaptionLabel("HAT");
                  }
                  if(entVal_instrument == 3){
                        highlight = 1;
                        instSelect[3] = 0;
                        cp5.get(controlP5.Button.class, "HAT" + 0).setColorBackground( color(255, 0, 0) );
                        entVal_instrument = 1;
                      }
                  
                }
                if(intRighty == 1){
                  //print(intRighty);
                  cp5.get(controlP5.Button.class, "CLAP" + 0).setColorBackground( color(0, 255, 0) );
                  cp5.get(controlP5.Button.class, "HAT" + 0).setColorBackground( color(255, 0, 0) );
                  cp5.get(controlP5.Button.class, "KICK" + 0).setColorBackground( color(255, 0, 0) );
                  cp5.get(controlP5.Button.class, "SNARE" + 0).setColorBackground( color(255, 0, 0) );
                  cp5.get(controlP5.Button.class, "SYNTH" + 0).setColorBackground( color(255, 0, 0) );
                  cp5.get(controlP5.Button.class, "ENVELOPES" + 0).setColorBackground( color(255, 0, 0) );
                  
                  if(entVal_instrument == 2 && highlight == 2 && instUpward == 1 && intRighty == 1){
                    cp5.get(controlP5.Button.class, "instrument" + 3).setCaptionLabel("CLAP");
                  }
                  if(entVal_instrument == 3){
                        highlight = 1;
                        instSelect[3] = 0;
                        cp5.get(controlP5.Button.class, "CLAP" + 0).setColorBackground( color(255, 0, 0) );
                        entVal_instrument = 1;
                      }
                 
                }
              }
                if(intRighty == 2){
                  
                }
                if (instUpward == 2){
                    if(intRighty == 0){
                    cp5.get(controlP5.Button.class, "SYNTH" + 0).setColorBackground( color(0, 255, 0) );
                    cp5.get(controlP5.Button.class, "CLAP" + 0).setColorBackground( color(255, 0, 0) );
                    cp5.get(controlP5.Button.class, "HAT" + 0).setColorBackground( color(255, 0, 0) );
                    cp5.get(controlP5.Button.class, "ENVELOPES" + 0).setColorBackground( color(255, 0, 0) );
                    if(entVal_instrument == 2 && highlight == 2 && instUpward == 2 && intRighty == 0){
                      cp5.get(controlP5.Button.class, "instrument" + 3).setCaptionLabel("SYNTH");
                      
                    }
                    if(entVal_instrument == 3){
                        highlight = 1;
                        instSelect[3] = 0;
                        cp5.get(controlP5.Button.class, "SYNTH" + 0).setColorBackground( color(255, 0, 0) );
                        entVal_instrument = 1;
                      }
                  }
                  
                  
                  if (intRighty == 1){
                     //print(intRighty);
                  cp5.get(controlP5.Button.class, "ENVELOPES" + 0).setColorBackground( color(0, 255, 0) );
                  cp5.get(controlP5.Button.class, "SYNTH" + 0).setColorBackground( color(255, 0, 0) );
                  cp5.get(controlP5.Button.class, "CLAP" + 0).setColorBackground( color(255, 0, 0) );
                  if(entVal_instrument == 2 && highlight == 2 && instUpward == 2 && intRighty == 1){
                    cp5.get(controlP5.Button.class, "instrument" + 3).setCaptionLabel("ENVELOPES");
                  }
                  if(entVal_instrument == 3){
                        highlight = 1;
                        instSelect[3] = 0;
                        cp5.get(controlP5.Button.class, "ENVELOPES" + 0).setColorBackground( color(255, 0, 0) );
                        entVal_instrument = 1;
                      }
                  }
                  
                }
                
        }
        if(instSelect[4] == 1){
          highlight = 2;
          if(instUpward == 0){
                //cp5.get(controlP5.Button.class, "SYNTH" + 0).setColorBackground( color(255, 0, 0) );
                //cp5.get(controlP5.Button.class, "ENVELOPES" + 0).setColorBackground( color(255, 0, 0) );
                cp5.get(controlP5.Button.class, "SNARE" + 0).setColorBackground( color(255, 0, 0) );
                //cp5.get(controlP5.Button.class, "HAT" + 0).setColorBackground( color(255, 0, 0) );
                //cp5.get(controlP5.Button.class, "CLAP" + 0).setColorBackground( color(255, 0, 0) );
                if(intRighty == 0){
                    //print(intRighty);
                    cp5.get(controlP5.Button.class, "KICK" + 0).setColorBackground( color(0, 255, 0) );
                    cp5.get(controlP5.Button.class, "SNARE" + 0).setColorBackground( color(255, 0, 0) );
                    cp5.get(controlP5.Button.class, "HAT" + 0).setColorBackground( color(255, 0, 0) );
                    cp5.get(controlP5.Button.class, "CLAP" + 0).setColorBackground( color(255, 0, 0) );
                    //print(intRighty+"..."+intRighty);
                    if(entVal_instrument == 2 && highlight == 2 && instUpward == 0 && intRighty == 0){
                      cp5.get(controlP5.Button.class, "instrument" + 4).setCaptionLabel("KICK").setColorCaptionLabel(255);
                    }
                    if(entVal_instrument == 3){
                        highlight = 1;
                        instSelect[4] = 0;
                        cp5.get(controlP5.Button.class, "KICK" + 0).setColorBackground( color(255, 0, 0) );
                        entVal_instrument = 1;
                      }
                }
                if(intRighty == 1){
                  //print("second Value:"+intRighty);
                    //cp5.get(controlP5.Button.class, "SYNTH" + 0).setColorBackground( color(255, 0, 0) );
                    cp5.get(controlP5.Button.class, "SNARE" + 0).setColorBackground( color(0, 255, 0) );
                    cp5.get(controlP5.Button.class, "KICK" + 0).setColorBackground( color(255, 0, 0) );
                    cp5.get(controlP5.Button.class, "HAT" + 0).setColorBackground( color(255, 0, 0) );
                    cp5.get(controlP5.Button.class, "CLAP" + 0).setColorBackground( color(255, 0, 0) );
                  if(entVal_instrument == 2 && highlight == 2 && instUpward == 0 && intRighty == 1){
                    cp5.get(controlP5.Button.class, "instrument" + 4).setCaptionLabel("SNARE").setColorCaptionLabel(255);
                  }
                  if(entVal_instrument == 3){
                        highlight = 1;
                        instSelect[4] = 0;
                        cp5.get(controlP5.Button.class, "SNARE" + 0).setColorBackground( color(255, 0, 0) );
                        entVal_instrument = 1;
                      }
                }
                if(intRighty == 2){
                 
                }
              }
              
              if(instUpward == 1){
                //cp5.get(controlP5.Button.class, "KICK" + 0).setColorBackground( color(255, 0, 0) );
                //cp5.get(controlP5.Button.class, "SNARE" + 0).setColorBackground( color(255, 0, 0) );
                //cp5.get(controlP5.Button.class, "HAT" + 0).setColorBackground( color(0, 255, 0) );
                if(intRighty == 0){
                  
                   //print(intRighty);
                  cp5.get(controlP5.Button.class, "HAT" + 0).setColorBackground( color(0, 255, 0) );
                  cp5.get(controlP5.Button.class, "SNARE" + 0).setColorBackground( color(255, 0, 0) );
                  cp5.get(controlP5.Button.class, "KICK" + 0).setColorBackground( color(255, 0, 0) );
                  cp5.get(controlP5.Button.class, "CLAP" + 0).setColorBackground( color(255, 0, 0) );
                  cp5.get(controlP5.Button.class, "SYNTH" + 0).setColorBackground( color(255, 0, 0) );
                  cp5.get(controlP5.Button.class, "ENVELOPES" + 0).setColorBackground( color(255, 0, 0) );
                  if(entVal_instrument == 2 && highlight == 2 && instUpward == 1 && intRighty == 0){
                    cp5.get(controlP5.Button.class, "instrument" + 4).setCaptionLabel("HAT");
                  }
                  if(entVal_instrument == 3){
                        highlight = 1;
                        instSelect[4] = 0;
                        cp5.get(controlP5.Button.class, "HAT" + 0).setColorBackground( color(255, 0, 0) );
                        entVal_instrument = 1;
                      }
                  
                }
                if(intRighty == 1){
                  //print(intRighty);
                  cp5.get(controlP5.Button.class, "CLAP" + 0).setColorBackground( color(0, 255, 0) );
                  cp5.get(controlP5.Button.class, "HAT" + 0).setColorBackground( color(255, 0, 0) );
                  cp5.get(controlP5.Button.class, "KICK" + 0).setColorBackground( color(255, 0, 0) );
                  cp5.get(controlP5.Button.class, "SNARE" + 0).setColorBackground( color(255, 0, 0) );
                  cp5.get(controlP5.Button.class, "SYNTH" + 0).setColorBackground( color(255, 0, 0) );
                  cp5.get(controlP5.Button.class, "ENVELOPES" + 0).setColorBackground( color(255, 0, 0) );
                  
                  if(entVal_instrument == 2 && highlight == 2 && instUpward == 1 && intRighty == 1){
                    cp5.get(controlP5.Button.class, "instrument" + 4).setCaptionLabel("CLAP");
                  }
                  if(entVal_instrument == 3){
                        highlight = 1;
                        instSelect[4] = 0;
                        cp5.get(controlP5.Button.class, "CLAP" + 0).setColorBackground( color(255, 0, 0) );
                        entVal_instrument = 1;
                      }
                 
                }
              }
                if(intRighty == 2){
                  
                }
                if (instUpward == 2){
                    if(intRighty == 0){
                    cp5.get(controlP5.Button.class, "SYNTH" + 0).setColorBackground( color(0, 255, 0) );
                    cp5.get(controlP5.Button.class, "CLAP" + 0).setColorBackground( color(255, 0, 0) );
                    cp5.get(controlP5.Button.class, "HAT" + 0).setColorBackground( color(255, 0, 0) );
                    cp5.get(controlP5.Button.class, "ENVELOPES" + 0).setColorBackground( color(255, 0, 0) );
                    if(entVal_instrument == 2 && highlight == 2 && instUpward == 2 && intRighty == 0){
                      cp5.get(controlP5.Button.class, "instrument" + 4).setCaptionLabel("SYNTH");
                      
                    }
                    if(entVal_instrument == 3){
                        highlight = 1;
                        instSelect[4] = 0;
                        cp5.get(controlP5.Button.class, "SYNTH" + 0).setColorBackground( color(255, 0, 0) );
                        entVal_instrument = 1;
                      }
                  }
                  
                  
                  if (intRighty == 1){
                     //print(intRighty);
                  cp5.get(controlP5.Button.class, "ENVELOPES" + 0).setColorBackground( color(0, 255, 0) );
                  cp5.get(controlP5.Button.class, "SYNTH" + 0).setColorBackground( color(255, 0, 0) );
                  cp5.get(controlP5.Button.class, "CLAP" + 0).setColorBackground( color(255, 0, 0) );
                  if(entVal_instrument == 2 && highlight == 2 && instUpward == 2 && intRighty == 1){
                    cp5.get(controlP5.Button.class, "instrument" + 4).setCaptionLabel("ENVELOPES");
                  }
                  if(entVal_instrument == 3){
                        highlight = 1;
                        instSelect[4] = 0;
                        cp5.get(controlP5.Button.class, "ENVELOPES" + 0).setColorBackground( color(255, 0, 0) );
                        entVal_instrument = 1;
                      }
                  }
                  
                }
               
        }
        if(instSelect[5] == 1){
          highlight = 2;
          if(instUpward == 0){
                //cp5.get(controlP5.Button.class, "SYNTH" + 0).setColorBackground( color(255, 0, 0) );
                //cp5.get(controlP5.Button.class, "ENVELOPES" + 0).setColorBackground( color(255, 0, 0) );
                cp5.get(controlP5.Button.class, "SNARE" + 0).setColorBackground( color(255, 0, 0) );
                //cp5.get(controlP5.Button.class, "HAT" + 0).setColorBackground( color(255, 0, 0) );
                //cp5.get(controlP5.Button.class, "CLAP" + 0).setColorBackground( color(255, 0, 0) );
                if(intRighty == 0){
                    //print(intRighty);
                    cp5.get(controlP5.Button.class, "KICK" + 0).setColorBackground( color(0, 255, 0) );
                    cp5.get(controlP5.Button.class, "SNARE" + 0).setColorBackground( color(255, 0, 0) );
                    cp5.get(controlP5.Button.class, "HAT" + 0).setColorBackground( color(255, 0, 0) );
                    cp5.get(controlP5.Button.class, "CLAP" + 0).setColorBackground( color(255, 0, 0) );
                    //print(intRighty+"..."+intRighty);
                    if(entVal_instrument == 2 && highlight == 2 && instUpward == 0 && intRighty == 0){
                      cp5.get(controlP5.Button.class, "instrument" + 5).setCaptionLabel("KICK").setColorCaptionLabel(255);
                    }
                    if(entVal_instrument == 3){
                        highlight = 1;
                        instSelect[5] = 0;
                        cp5.get(controlP5.Button.class, "KICK" + 0).setColorBackground( color(255, 0, 0) );
                        entVal_instrument = 1;
                      }
                }
                if(intRighty == 1){
                  //print("second Value:"+intRighty);
                    //cp5.get(controlP5.Button.class, "SYNTH" + 0).setColorBackground( color(255, 0, 0) );
                    cp5.get(controlP5.Button.class, "SNARE" + 0).setColorBackground( color(0, 255, 0) );
                    cp5.get(controlP5.Button.class, "KICK" + 0).setColorBackground( color(255, 0, 0) );
                    cp5.get(controlP5.Button.class, "HAT" + 0).setColorBackground( color(255, 0, 0) );
                    cp5.get(controlP5.Button.class, "CLAP" + 0).setColorBackground( color(255, 0, 0) );
                  if(entVal_instrument == 2 && highlight == 2 && instUpward == 0 && intRighty == 1){
                    cp5.get(controlP5.Button.class, "instrument" + 5).setCaptionLabel("SNARE").setColorCaptionLabel(255);
                  }
                  if(entVal_instrument == 3){
                        highlight = 1;
                        instSelect[5] = 0;
                        cp5.get(controlP5.Button.class, "SNARE" + 0).setColorBackground( color(255, 0, 0) );
                        entVal_instrument = 1;
                      }
                }
                if(intRighty == 2){
                 
                }
              }
              
              if(instUpward == 1){
                //cp5.get(controlP5.Button.class, "KICK" + 0).setColorBackground( color(255, 0, 0) );
                //cp5.get(controlP5.Button.class, "SNARE" + 0).setColorBackground( color(255, 0, 0) );
                //cp5.get(controlP5.Button.class, "HAT" + 0).setColorBackground( color(0, 255, 0) );
                if(intRighty == 0){
                  
                   //print(intRighty);
                  cp5.get(controlP5.Button.class, "HAT" + 0).setColorBackground( color(0, 255, 0) );
                  cp5.get(controlP5.Button.class, "SNARE" + 0).setColorBackground( color(255, 0, 0) );
                  cp5.get(controlP5.Button.class, "KICK" + 0).setColorBackground( color(255, 0, 0) );
                  cp5.get(controlP5.Button.class, "CLAP" + 0).setColorBackground( color(255, 0, 0) );
                  cp5.get(controlP5.Button.class, "SYNTH" + 0).setColorBackground( color(255, 0, 0) );
                  cp5.get(controlP5.Button.class, "ENVELOPES" + 0).setColorBackground( color(255, 0, 0) );
                  if(entVal_instrument == 2 && highlight == 2 && instUpward == 1 && intRighty == 0){
                    cp5.get(controlP5.Button.class, "instrument" + 5).setCaptionLabel("HAT");
                  }
                  if(entVal_instrument == 3){
                        highlight = 1;
                        instSelect[5] = 0;
                        cp5.get(controlP5.Button.class, "HAT" + 0).setColorBackground( color(255, 0, 0) );
                        entVal_instrument = 1;
                      }
                  
                }
                if(intRighty == 1){
                  //print(intRighty);
                  cp5.get(controlP5.Button.class, "CLAP" + 0).setColorBackground( color(0, 255, 0) );
                  cp5.get(controlP5.Button.class, "HAT" + 0).setColorBackground( color(255, 0, 0) );
                  cp5.get(controlP5.Button.class, "KICK" + 0).setColorBackground( color(255, 0, 0) );
                  cp5.get(controlP5.Button.class, "SNARE" + 0).setColorBackground( color(255, 0, 0) );
                  cp5.get(controlP5.Button.class, "SYNTH" + 0).setColorBackground( color(255, 0, 0) );
                  cp5.get(controlP5.Button.class, "ENVELOPES" + 0).setColorBackground( color(255, 0, 0) );
                  
                  if(entVal_instrument == 2 && highlight == 2 && instUpward == 1 && intRighty == 1){
                    cp5.get(controlP5.Button.class, "instrument" + 5).setCaptionLabel("CLAP");
                  }
                  if(entVal_instrument == 3){
                        highlight = 1;
                        instSelect[5] = 0;
                        cp5.get(controlP5.Button.class, "CLAP" + 0).setColorBackground( color(255, 0, 0) );
                        entVal_instrument = 1;
                      }
                 
                }
              }
                if(intRighty == 2){
                  
                }
                if (instUpward == 2){
                    if(intRighty == 0){
                    cp5.get(controlP5.Button.class, "SYNTH" + 0).setColorBackground( color(0, 255, 0) );
                    cp5.get(controlP5.Button.class, "CLAP" + 0).setColorBackground( color(255, 0, 0) );
                    cp5.get(controlP5.Button.class, "HAT" + 0).setColorBackground( color(255, 0, 0) );
                    cp5.get(controlP5.Button.class, "ENVELOPES" + 0).setColorBackground( color(255, 0, 0) );
                    if(entVal_instrument == 2 && highlight == 2 && instUpward == 2 && intRighty == 0){
                      cp5.get(controlP5.Button.class, "instrument" + 5).setCaptionLabel("SYNTH");
                      
                    }
                    if(entVal_instrument == 3){
                        highlight = 1;
                        instSelect[5] = 0;
                        cp5.get(controlP5.Button.class, "SYNTH" + 0).setColorBackground( color(255, 0, 0) );
                        entVal_instrument = 1;
                      }
                  }
                  
                  
                  if (intRighty == 1){
                     //print(intRighty);
                  cp5.get(controlP5.Button.class, "ENVELOPES" + 0).setColorBackground( color(0, 255, 0) );
                  cp5.get(controlP5.Button.class, "SYNTH" + 0).setColorBackground( color(255, 0, 0) );
                  cp5.get(controlP5.Button.class, "CLAP" + 0).setColorBackground( color(255, 0, 0) );
                  if(entVal_instrument == 2 && highlight == 2 && instUpward == 2 && intRighty == 1){
                    cp5.get(controlP5.Button.class, "instrument" + 5).setCaptionLabel("ENVELOPES");
                  }
                  if(entVal_instrument == 3){
                        highlight = 1;
                        instSelect[5] = 0;
                        cp5.get(controlP5.Button.class, "ENVELOPES" + 0).setColorBackground( color(255, 0, 0) );
                        entVal_instrument = 1;
                      }
                  }
                  
                }
              
        }
        if(instSelect[6] == 1){
          highlight = 2;
          if(instUpward == 0){
                //cp5.get(controlP5.Button.class, "SYNTH" + 0).setColorBackground( color(255, 0, 0) );
                //cp5.get(controlP5.Button.class, "ENVELOPES" + 0).setColorBackground( color(255, 0, 0) );
                cp5.get(controlP5.Button.class, "SNARE" + 0).setColorBackground( color(255, 0, 0) );
                //cp5.get(controlP5.Button.class, "HAT" + 0).setColorBackground( color(255, 0, 0) );
                //cp5.get(controlP5.Button.class, "CLAP" + 0).setColorBackground( color(255, 0, 0) );
                if(intRighty == 0){
                    //print(intRighty);
                    cp5.get(controlP5.Button.class, "KICK" + 0).setColorBackground( color(0, 255, 0) );
                    cp5.get(controlP5.Button.class, "SNARE" + 0).setColorBackground( color(255, 0, 0) );
                    cp5.get(controlP5.Button.class, "HAT" + 0).setColorBackground( color(255, 0, 0) );
                    cp5.get(controlP5.Button.class, "CLAP" + 0).setColorBackground( color(255, 0, 0) );
                    //print(intRighty+"..."+intRighty);
                    if(entVal_instrument == 2 && highlight == 2 && instUpward == 0 && intRighty == 0){
                      cp5.get(controlP5.Button.class, "instrument" + 6).setCaptionLabel("KICK").setColorCaptionLabel(255);
                    }
                    if(entVal_instrument == 3){
                        highlight = 1;
                        instSelect[6] = 0;
                        cp5.get(controlP5.Button.class, "KICK" + 0).setColorBackground( color(255, 0, 0) );
                        entVal_instrument = 1;
                      }
                }
                if(intRighty == 1){
                  //print("second Value:"+intRighty);
                    //cp5.get(controlP5.Button.class, "SYNTH" + 0).setColorBackground( color(255, 0, 0) );
                    cp5.get(controlP5.Button.class, "SNARE" + 0).setColorBackground( color(0, 255, 0) );
                    cp5.get(controlP5.Button.class, "KICK" + 0).setColorBackground( color(255, 0, 0) );
                    cp5.get(controlP5.Button.class, "HAT" + 0).setColorBackground( color(255, 0, 0) );
                    cp5.get(controlP5.Button.class, "CLAP" + 0).setColorBackground( color(255, 0, 0) );
                  if(entVal_instrument == 2 && highlight == 2 && instUpward == 0 && intRighty == 1){
                    cp5.get(controlP5.Button.class, "instrument" + 6).setCaptionLabel("SNARE").setColorCaptionLabel(255);
                  }
                  if(entVal_instrument == 3){
                        highlight = 1;
                        instSelect[6] = 0;
                        cp5.get(controlP5.Button.class, "SNARE" + 0).setColorBackground( color(255, 0, 0) );
                        entVal_instrument = 1;
                      }
                }
                if(intRighty == 2){
                 
                }
              }
              
              if(instUpward == 1){
                //cp5.get(controlP5.Button.class, "KICK" + 0).setColorBackground( color(255, 0, 0) );
                //cp5.get(controlP5.Button.class, "SNARE" + 0).setColorBackground( color(255, 0, 0) );
                //cp5.get(controlP5.Button.class, "HAT" + 0).setColorBackground( color(0, 255, 0) );
                if(intRighty == 0){
                  
                   //print(intRighty);
                  cp5.get(controlP5.Button.class, "HAT" + 0).setColorBackground( color(0, 255, 0) );
                  cp5.get(controlP5.Button.class, "SNARE" + 0).setColorBackground( color(255, 0, 0) );
                  cp5.get(controlP5.Button.class, "KICK" + 0).setColorBackground( color(255, 0, 0) );
                  cp5.get(controlP5.Button.class, "CLAP" + 0).setColorBackground( color(255, 0, 0) );
                  cp5.get(controlP5.Button.class, "SYNTH" + 0).setColorBackground( color(255, 0, 0) );
                  cp5.get(controlP5.Button.class, "ENVELOPES" + 0).setColorBackground( color(255, 0, 0) );
                  if(entVal_instrument == 2 && highlight == 2 && instUpward == 1 && intRighty == 0){
                    cp5.get(controlP5.Button.class, "instrument" + 6).setCaptionLabel("HAT");
                  }
                  if(entVal_instrument == 3){
                        highlight = 1;
                        instSelect[6] = 0;
                        cp5.get(controlP5.Button.class, "HAT" + 0).setColorBackground( color(255, 0, 0) );
                        entVal_instrument = 1;
                      }
                  
                }
                if(intRighty == 1){
                  //print(intRighty);
                  cp5.get(controlP5.Button.class, "CLAP" + 0).setColorBackground( color(0, 255, 0) );
                  cp5.get(controlP5.Button.class, "HAT" + 0).setColorBackground( color(255, 0, 0) );
                  cp5.get(controlP5.Button.class, "KICK" + 0).setColorBackground( color(255, 0, 0) );
                  cp5.get(controlP5.Button.class, "SNARE" + 0).setColorBackground( color(255, 0, 0) );
                  cp5.get(controlP5.Button.class, "SYNTH" + 0).setColorBackground( color(255, 0, 0) );
                  cp5.get(controlP5.Button.class, "ENVELOPES" + 0).setColorBackground( color(255, 0, 0) );
                  
                  if(entVal_instrument == 2 && highlight == 2 && instUpward == 1 && intRighty == 1){
                    cp5.get(controlP5.Button.class, "instrument" + 6).setCaptionLabel("CLAP");
                  }
                  if(entVal_instrument == 3){
                        highlight = 1;
                        instSelect[6] = 0;
                        cp5.get(controlP5.Button.class, "CLAP" + 0).setColorBackground( color(255, 0, 0) );
                        entVal_instrument = 1;
                      }
                 
                }
              }
                if(intRighty == 2){
                  
                }
                if (instUpward == 2){
                    if(intRighty == 0){
                    cp5.get(controlP5.Button.class, "SYNTH" + 0).setColorBackground( color(0, 255, 0) );
                    cp5.get(controlP5.Button.class, "CLAP" + 0).setColorBackground( color(255, 0, 0) );
                    cp5.get(controlP5.Button.class, "HAT" + 0).setColorBackground( color(255, 0, 0) );
                    cp5.get(controlP5.Button.class, "ENVELOPES" + 0).setColorBackground( color(255, 0, 0) );
                    if(entVal_instrument == 2 && highlight == 2 && instUpward == 2 && intRighty == 0){
                      cp5.get(controlP5.Button.class, "instrument" + 6).setCaptionLabel("SYNTH");
                      
                    }
                    if(entVal_instrument == 3){
                        highlight = 1;
                        instSelect[6] = 0;
                        cp5.get(controlP5.Button.class, "SYNTH" + 0).setColorBackground( color(255, 0, 0) );
                        entVal_instrument = 1;
                      }
                  }
                  
                  
                  if (intRighty == 1){
                     //print(intRighty);
                  cp5.get(controlP5.Button.class, "ENVELOPES" + 0).setColorBackground( color(0, 255, 0) );
                  cp5.get(controlP5.Button.class, "SYNTH" + 0).setColorBackground( color(255, 0, 0) );
                  cp5.get(controlP5.Button.class, "CLAP" + 0).setColorBackground( color(255, 0, 0) );
                  if(entVal_instrument == 2 && highlight == 2 && instUpward == 2 && intRighty == 1){
                    cp5.get(controlP5.Button.class, "instrument" + 6).setCaptionLabel("ENVELOPES");
                  }
                  if(entVal_instrument == 3){
                        highlight = 1;
                        instSelect[6] = 0;
                        cp5.get(controlP5.Button.class, "ENVELOPES" + 0).setColorBackground( color(255, 0, 0) );
                        entVal_instrument = 1;
                      }
                  }
                  
                }
            
        }
        if(instSelect[7] == 1){
          highlight = 2;
          if(instUpward == 0){
                //cp5.get(controlP5.Button.class, "SYNTH" + 0).setColorBackground( color(255, 0, 0) );
                //cp5.get(controlP5.Button.class, "ENVELOPES" + 0).setColorBackground( color(255, 0, 0) );
                cp5.get(controlP5.Button.class, "SNARE" + 0).setColorBackground( color(255, 0, 0) );
                //cp5.get(controlP5.Button.class, "HAT" + 0).setColorBackground( color(255, 0, 0) );
                //cp5.get(controlP5.Button.class, "CLAP" + 0).setColorBackground( color(255, 0, 0) );
                if(intRighty == 0){
                    //print(intRighty);
                    cp5.get(controlP5.Button.class, "KICK" + 0).setColorBackground( color(0, 255, 0) );
                    cp5.get(controlP5.Button.class, "SNARE" + 0).setColorBackground( color(255, 0, 0) );
                    cp5.get(controlP5.Button.class, "HAT" + 0).setColorBackground( color(255, 0, 0) );
                    cp5.get(controlP5.Button.class, "CLAP" + 0).setColorBackground( color(255, 0, 0) );
                    //print(intRighty+"..."+intRighty);
                    if(entVal_instrument == 2 && highlight == 2 && instUpward == 0 && intRighty == 0){
                      cp5.get(controlP5.Button.class, "instrument" + 7).setCaptionLabel("KICK").setColorCaptionLabel(255);
                    }
                    if(entVal_instrument == 3){
                        highlight = 1;
                        instSelect[7] = 0;
                        cp5.get(controlP5.Button.class, "KICK" + 0).setColorBackground( color(255, 0, 0) );
                        entVal_instrument = 1;
                      }
                }
                if(intRighty == 1){
                  //print("second Value:"+intRighty);
                    //cp5.get(controlP5.Button.class, "SYNTH" + 0).setColorBackground( color(255, 0, 0) );
                    cp5.get(controlP5.Button.class, "SNARE" + 0).setColorBackground( color(0, 255, 0) );
                    cp5.get(controlP5.Button.class, "KICK" + 0).setColorBackground( color(255, 0, 0) );
                    cp5.get(controlP5.Button.class, "HAT" + 0).setColorBackground( color(255, 0, 0) );
                    cp5.get(controlP5.Button.class, "CLAP" + 0).setColorBackground( color(255, 0, 0) );
                  if(entVal_instrument == 2 && highlight == 2 && instUpward == 0 && intRighty == 1){
                    cp5.get(controlP5.Button.class, "instrument" + 7).setCaptionLabel("SNARE").setColorCaptionLabel(255);
                  }
                  if(entVal_instrument == 3){
                        highlight = 1;
                        instSelect[7] = 0;
                        cp5.get(controlP5.Button.class, "SNARE" + 0).setColorBackground( color(255, 0, 0) );
                        entVal_instrument = 1;
                      }
                }
                if(intRighty == 2){
                 
                }
              }
              
              if(instUpward == 1){
                //cp5.get(controlP5.Button.class, "KICK" + 0).setColorBackground( color(255, 0, 0) );
                //cp5.get(controlP5.Button.class, "SNARE" + 0).setColorBackground( color(255, 0, 0) );
                //cp5.get(controlP5.Button.class, "HAT" + 0).setColorBackground( color(0, 255, 0) );
                if(intRighty == 0){
                  
                   //print(intRighty);
                  cp5.get(controlP5.Button.class, "HAT" + 0).setColorBackground( color(0, 255, 0) );
                  cp5.get(controlP5.Button.class, "SNARE" + 0).setColorBackground( color(255, 0, 0) );
                  cp5.get(controlP5.Button.class, "KICK" + 0).setColorBackground( color(255, 0, 0) );
                  cp5.get(controlP5.Button.class, "CLAP" + 0).setColorBackground( color(255, 0, 0) );
                  cp5.get(controlP5.Button.class, "SYNTH" + 0).setColorBackground( color(255, 0, 0) );
                  cp5.get(controlP5.Button.class, "ENVELOPES" + 0).setColorBackground( color(255, 0, 0) );
                  if(entVal_instrument == 2 && highlight == 2 && instUpward == 1 && intRighty == 0){
                    cp5.get(controlP5.Button.class, "instrument" + 7).setCaptionLabel("HAT");
                  }
                  if(entVal_instrument == 3){
                        highlight = 1;
                        instSelect[7] = 0;
                        cp5.get(controlP5.Button.class, "HAT" + 0).setColorBackground( color(255, 0, 0) );
                        entVal_instrument = 1;
                      }
                  
                }
                if(intRighty == 1){
                  //print(intRighty);
                  cp5.get(controlP5.Button.class, "CLAP" + 0).setColorBackground( color(0, 255, 0) );
                  cp5.get(controlP5.Button.class, "HAT" + 0).setColorBackground( color(255, 0, 0) );
                  cp5.get(controlP5.Button.class, "KICK" + 0).setColorBackground( color(255, 0, 0) );
                  cp5.get(controlP5.Button.class, "SNARE" + 0).setColorBackground( color(255, 0, 0) );
                  cp5.get(controlP5.Button.class, "SYNTH" + 0).setColorBackground( color(255, 0, 0) );
                  cp5.get(controlP5.Button.class, "ENVELOPES" + 0).setColorBackground( color(255, 0, 0) );
                  
                  if(entVal_instrument == 2 && highlight == 2 && instUpward == 1 && intRighty == 1){
                    cp5.get(controlP5.Button.class, "instrument" + 7).setCaptionLabel("CLAP");
                  }
                  if(entVal_instrument == 3){
                        highlight = 1;
                        instSelect[7] = 0;
                        cp5.get(controlP5.Button.class, "CLAP" + 0).setColorBackground( color(255, 0, 0) );
                        entVal_instrument = 1;
                      }
                 
                }
              }
                if(intRighty == 2){
                  
                }
                if (instUpward == 2){
                    if(intRighty == 0){
                    cp5.get(controlP5.Button.class, "SYNTH" + 0).setColorBackground( color(0, 255, 0) );
                    cp5.get(controlP5.Button.class, "CLAP" + 0).setColorBackground( color(255, 0, 0) );
                    cp5.get(controlP5.Button.class, "HAT" + 0).setColorBackground( color(255, 0, 0) );
                    cp5.get(controlP5.Button.class, "ENVELOPES" + 0).setColorBackground( color(255, 0, 0) );
                    if(entVal_instrument == 2 && highlight == 2 && instUpward == 2 && intRighty == 0){
                      cp5.get(controlP5.Button.class, "instrument" + 7).setCaptionLabel("SYNTH");
                      
                    }
                    if(entVal_instrument == 3){
                        highlight = 1;
                        instSelect[7] = 0;
                        cp5.get(controlP5.Button.class, "SYNTH" + 0).setColorBackground( color(255, 0, 0) );
                        entVal_instrument = 1;
                      }
                  }
                  
                  
                  if (intRighty == 1){
                     //print(intRighty);
                  cp5.get(controlP5.Button.class, "ENVELOPES" + 0).setColorBackground( color(0, 255, 0) );
                  cp5.get(controlP5.Button.class, "SYNTH" + 0).setColorBackground( color(255, 0, 0) );
                  cp5.get(controlP5.Button.class, "CLAP" + 0).setColorBackground( color(255, 0, 0) );
                  if(entVal_instrument == 2 && highlight == 2 && instUpward == 2 && intRighty == 1){
                    cp5.get(controlP5.Button.class, "instrument" + 7).setCaptionLabel("ENVELOPES");
                  }
                  if(entVal_instrument == 3){
                        highlight = 1;
                        instSelect[7] = 0;
                        cp5.get(controlP5.Button.class, "ENVELOPES" + 0).setColorBackground( color(255, 0, 0) );
                        entVal_instrument = 1;
                      }
                  }
                  
                }
           
        }
      }
      
      //if (close == 1){cp5.get(ScrollableList.class, "Instrument" + 7).setOpen(false);}
          
      if(decide == 1){
     
        if (decision0[0] == 1  && instrument0.getLabel() != "SYNTH" ){
              cp5.get(controlP5.Button.class, "A" + 0).setColorBackground( color(255, 255, 0) );
            }
        if (decision0[1] == 1  && instrument0.getLabel() != "SYNTH" ){
              cp5.get(controlP5.Button.class, "B" + 0).setColorBackground( color(255, 255, 0) );
            }
   
         if (decision0[2] == 1  && instrument0.getLabel() != "SYNTH" ){
              cp5.get(controlP5.Button.class, "C" + 0).setColorBackground( color(255, 255, 0) );
            }
         if (decision0[3] == 1  && instrument0.getLabel() != "SYNTH" ){
              cp5.get(controlP5.Button.class, "D" + 0).setColorBackground( color(255, 255, 0) );
            }
         if (decision0[4] ==  1  && instrument0.getLabel() != "SYNTH"){
              cp5.get(controlP5.Button.class, "E" + 0).setColorBackground( color(255, 255, 0) );
            }
         if (decision0[5] == 1  && instrument0.getLabel() != "SYNTH" ){
              cp5.get(controlP5.Button.class, "F" + 0).setColorBackground( color(255, 255, 0) );
            }
         if (decision0[6] == 1  && instrument0.getLabel() != "SYNTH" ){
              cp5.get(controlP5.Button.class, "G" + 0).setColorBackground( color(255, 255, 0) );
            }
         if (decision0[7] == 1  && instrument0.getLabel() != "SYNTH" ){
              cp5.get(controlP5.Button.class, "H" + 0).setColorBackground( color(255, 255, 0) );
            }
          
          if (decision1[0] == 1  && instrument1.getLabel() != "SYNTH" ){
              cp5.get(controlP5.Button.class, "A" + 1).setColorBackground( color(255, 255, 0) );
            }
         if (decision1[1] == 1  && instrument1.getLabel() != "SYNTH" ){
              cp5.get(controlP5.Button.class, "B" + 1).setColorBackground( color(255, 255, 0) );
            }
          if (decision1[2] == 1  && instrument1.getLabel() != "SYNTH" ){
              cp5.get(controlP5.Button.class, "C" + 1).setColorBackground( color(255, 255, 0) );
            }
          if (decision1[3] == 1  && instrument1.getLabel() != "SYNTH" ){
              cp5.get(controlP5.Button.class, "D" + 1).setColorBackground( color(255, 255, 0) );
            }
           if (decision1[4] == 1  && instrument1.getLabel() != "SYNTH" ){
              cp5.get(controlP5.Button.class, "E" + 1).setColorBackground( color(255, 255, 0) );
            }
           if (decision1[5] == 1  && instrument1.getLabel() != "SYNTH" ){
              cp5.get(controlP5.Button.class, "F" + 1).setColorBackground( color(255, 255, 0) );
            }
           if (decision1[6] == 1  && instrument1.getLabel() != "SYNTH" ){
              cp5.get(controlP5.Button.class, "G" + 1).setColorBackground( color(255, 255, 0) );
            }
           if (decision1[7] == 1  && instrument1.getLabel() != "SYNTH" ){
              cp5.get(controlP5.Button.class, "H" + 1).setColorBackground( color(255, 255, 0) );
            }
          
          if (decision2[0] == 1  && instrument2.getLabel() != "SYNTH" ){
              cp5.get(controlP5.Button.class, "A" + 2).setColorBackground( color(255, 255, 0) );
            }
          if (decision2[1] == 1  && instrument2.getLabel() != "SYNTH" ){
              cp5.get(controlP5.Button.class, "B" + 2).setColorBackground( color(255, 255, 0) );
            }
          if (decision2[2] == 1  && instrument2.getLabel() != "SYNTH" ){
              cp5.get(controlP5.Button.class, "C" + 2).setColorBackground( color(255, 255, 0) );
            }
          if (decision2[3] == 1  && instrument2.getLabel() != "SYNTH" ){
              cp5.get(controlP5.Button.class, "D" + 2).setColorBackground( color(255, 255, 0) );
            }
          if (decision2[4] == 1  && instrument2.getLabel() != "SYNTH" ){
              cp5.get(controlP5.Button.class, "E" + 2).setColorBackground( color(255, 255, 0) );
            }
          if (decision2[5] == 1  && instrument2.getLabel() != "SYNTH" ){
              cp5.get(controlP5.Button.class, "F" + 2).setColorBackground( color(255, 255, 0) );
            }
          if (decision2[6] == 1  && instrument2.getLabel() != "SYNTH" ){
              cp5.get(controlP5.Button.class, "G" + 2).setColorBackground( color(255, 255, 0) );
            }
          if (decision2[7] == 1  && instrument2.getLabel() != "SYNTH" ){
              cp5.get(controlP5.Button.class, "H" + 2).setColorBackground( color(255, 255, 0) );
            }
          
          if (decision3[0] == 1  && instrument3.getLabel() != "SYNTH" ){
              cp5.get(controlP5.Button.class, "A" + 3).setColorBackground( color(255, 255, 0) );
            }
          if (decision3[1] == 1  && instrument3.getLabel() != "SYNTH" ){
              cp5.get(controlP5.Button.class, "B" + 3).setColorBackground( color(255, 255, 0) );
            }
          if (decision3[2] == 1  && instrument3.getLabel() != "SYNTH" ){
              cp5.get(controlP5.Button.class, "C" + 3).setColorBackground( color(255, 255, 0) );
            }
          if (decision3[3] == 1  && instrument3.getLabel() != "SYNTH" ){
              cp5.get(controlP5.Button.class, "D" + 3).setColorBackground( color(255, 255, 0) );
            }
          if (decision3[4] == 1  && instrument3.getLabel() != "SYNTH" ){
              cp5.get(controlP5.Button.class, "E" + 3).setColorBackground( color(255, 255, 0) );
            }
          if (decision3[5] == 1  && instrument3.getLabel() != "SYNTH" ){
              cp5.get(controlP5.Button.class, "F" + 3).setColorBackground( color(255, 255, 0) );
            }
          if (decision3[6] == 1  && instrument3.getLabel() != "SYNTH" ){
              cp5.get(controlP5.Button.class, "G" + 3).setColorBackground( color(255, 255, 0) );
            }
          if (decision3[7] == 1  && instrument3.getLabel() != "SYNTH" ){
              cp5.get(controlP5.Button.class, "H" + 3).setColorBackground( color(255, 255, 0) );
            }
           if (decision4[0] == 1  && instrument4.getLabel() != "SYNTH" ){
              cp5.get(controlP5.Button.class, "A" + 4).setColorBackground( color(255, 255, 0) );
            }
          if (decision4[1] == 1  && instrument4.getLabel() != "SYNTH" ){
              cp5.get(controlP5.Button.class, "B" + 4).setColorBackground( color(255, 255, 0) );
            }
          if (decision4[2] == 1  && instrument4.getLabel() != "SYNTH" ){
              cp5.get(controlP5.Button.class, "C" + 4).setColorBackground( color(255, 255, 0) );
            }
          if (decision4[3] == 1  && instrument4.getLabel() != "SYNTH" ){
              cp5.get(controlP5.Button.class, "D" + 4).setColorBackground( color(255, 255, 0) );
            }
          if (decision4[4] == 1  && instrument4.getLabel() != "SYNTH" ){
              cp5.get(controlP5.Button.class, "E" + 4).setColorBackground( color(255, 255, 0) );
            }
          if (decision4[5] == 1  && instrument4.getLabel() != "SYNTH" ){
              cp5.get(controlP5.Button.class, "F" + 4).setColorBackground( color(255, 255, 0) );
            }
          if (decision4[6] == 1  && instrument4.getLabel() != "SYNTH" ){
              cp5.get(controlP5.Button.class, "G" + 4).setColorBackground( color(255, 255, 0) );
            }
          if (decision4[7] == 1  && instrument4.getLabel() != "SYNTH" ){
              cp5.get(controlP5.Button.class, "H" + 4).setColorBackground( color(255, 255, 0) );
            }  
             
          if (decision5[0] == 1  && instrument5.getLabel() != "SYNTH" ){
              cp5.get(controlP5.Button.class, "A" + 5).setColorBackground( color(255, 255, 0) );
            }
          if (decision5[1] == 1  && instrument5.getLabel() != "SYNTH" ){
              cp5.get(controlP5.Button.class, "B" + 5).setColorBackground( color(255, 255, 0) );
            }
          if (decision5[2] == 1  && instrument5.getLabel() != "SYNTH" ){
              cp5.get(controlP5.Button.class, "C" + 5).setColorBackground( color(255, 255, 0) );
            }
          if (decision5[3] == 1  && instrument5.getLabel() != "SYNTH" ){
              cp5.get(controlP5.Button.class, "D" + 5).setColorBackground( color(255, 255, 0) );
            }
          if (decision5[4] == 1  && instrument5.getLabel() != "SYNTH" ){
              cp5.get(controlP5.Button.class, "E" + 5).setColorBackground( color(255, 255, 0) );
            }
          if (decision5[5] == 1  && instrument5.getLabel() != "SYNTH" ){
              cp5.get(controlP5.Button.class, "F" + 5).setColorBackground( color(255, 255, 0) );
            }
          if (decision5[6] == 1  && instrument5.getLabel() != "SYNTH" ){
              cp5.get(controlP5.Button.class, "G" + 5).setColorBackground( color(255, 255, 0) );
            }
          if (decision5[7] == 1  && instrument5.getLabel() != "SYNTH" ){
              cp5.get(controlP5.Button.class, "H" + 5).setColorBackground( color(255, 255, 0) );
            }  
          
           if (decision6[0] == 1  && instrument6.getLabel() != "SYNTH" ){
              cp5.get(controlP5.Button.class, "A" + 6).setColorBackground( color(255, 255, 0) );
            }
          if (decision6[1] == 1  && instrument6.getLabel() != "SYNTH" ){
              cp5.get(controlP5.Button.class, "B" + 6).setColorBackground( color(255, 255, 0) );
            }
          if (decision6[2] == 1  && instrument6.getLabel() != "SYNTH" ){
              cp5.get(controlP5.Button.class, "C" + 6).setColorBackground( color(255, 255, 0) );
            }
          if (decision6[3] == 1  && instrument6.getLabel() != "SYNTH" ){
              cp5.get(controlP5.Button.class, "D" + 6).setColorBackground( color(255, 255, 0) );
            }
          if (decision6[4] == 1  && instrument6.getLabel() != "SYNTH" ){
              cp5.get(controlP5.Button.class, "E" + 6).setColorBackground( color(255, 255, 0) );
            }
          if (decision6[5] == 1  && instrument6.getLabel() != "SYNTH" ){
              cp5.get(controlP5.Button.class, "F" + 6).setColorBackground( color(255, 255, 0) );
            }
          if (decision6[6] == 1  && instrument6.getLabel() != "SYNTH" ){
              cp5.get(controlP5.Button.class, "G" + 6).setColorBackground( color(255, 255, 0) );
            }
          if (decision6[7] == 1  && instrument6.getLabel() != "SYNTH" ){
              cp5.get(controlP5.Button.class, "H" + 6).setColorBackground( color(255, 255, 0) );
            }  
          
           if (decision7[0] == 1  && instrument7.getLabel() != "SYNTH" ){
              cp5.get(controlP5.Button.class, "A" + 7).setColorBackground( color(255, 255, 0) );
            }
          if (decision7[1] == 1  && instrument7.getLabel() != "SYNTH" ){
              cp5.get(controlP5.Button.class, "B" + 7).setColorBackground( color(255, 255, 0) );
            }
          if (decision7[2] == 1  && instrument7.getLabel() != "SYNTH" ){
              cp5.get(controlP5.Button.class, "C" + 7).setColorBackground( color(255, 255, 0) );
            }
          if (decision7[3] == 1  && instrument7.getLabel() != "SYNTH" ){
              cp5.get(controlP5.Button.class, "D" + 7).setColorBackground( color(255, 255, 0) );
            }
          if (decision7[4] == 1  && instrument7.getLabel() != "SYNTH" ){
              cp5.get(controlP5.Button.class, "E" + 7).setColorBackground( color(255, 255, 0) );
            }
          if (decision7[5] == 1  && instrument7.getLabel() != "SYNTH" ){
              cp5.get(controlP5.Button.class, "F" + 7).setColorBackground( color(255, 255, 0) );
            }
          if (decision7[6] == 1  && instrument7.getLabel() != "SYNTH" ){
              cp5.get(controlP5.Button.class, "G" + 7).setColorBackground( color(255, 255, 0) );
            }
          if (decision7[7] == 1  && instrument7.getLabel() != "SYNTH" ){
              cp5.get(controlP5.Button.class, "H" + 7).setColorBackground( color(255, 255, 0) );
            }  
      }

  

    if(propHighlight == 1){
        if(propUpward == 0){
          property0();
        }
        if(propUpward == 1){
          property1();
        }
        if(propUpward == 2){
          property2();
        }
        if(propUpward == 3){
          property3();
        }
        if(propUpward == 4){
          property4();
        }
        if(propUpward == 5){
          property5();
        }
        if(propUpward == 6){
          property6();
        }
        if(propUpward == 7){
          property7();
        }
    }
    
    if(propHighlight == 2){
      if(propUpward == 0 || propUpward == 1 || propUpward == 2 || propUpward == 3 || propUpward == 4 || propUpward == 5 || propUpward == 6 || propUpward == 7  ){
          propFunction0();
        }
        
    }
    if(propHighlight == 3){
      if(propUpward == 0 || propUpward == 1 || propUpward == 2 || propUpward == 3 || propUpward == 4 || propUpward == 5 || propUpward == 6 || propUpward == 7){
         //fill(0,255,0);
         ////rect( 1100, height/2 + 75,170,120);
         //rect( (width/2) + (width/5) + 40, height/2 + 75,(width/5), height/2 - 250);
         //text("SELECTED FUNCTION", 1100, height/2 + 70);
         //fill(0, 255, 0);
         //   rect((width/2) + (width/5) + 40, 63, (width/5) + 70, height/2 - 45);
         //   fill(#1B3749);
         //   rect((width/2) + (width/5) + 45, 68, (width/5) + 60, height/2 - 55);
          propFuncSel0();
        }
    }
    
    if(propHighlight == 4){
      
    }
  
  

 
  
  //print("\n");
  //print("highlight ="+highlight);
  //print("\n");
   
  // //print("time0Col =" + time0Col);
  // //print("time0Row =" + time0Row);
  // //print("\n");.setcaptionlabel("
   
  // print("propHighlight == "+ propHighlight);
  // print("\n");
   
  //  print("\n");
  //print("highlight is now = " + highlight);
  //print("\n");
  
  //print("entVal_instrument is "+entVal_instrument);
  //print("\n");
  //print("decide ="+ decide);
  //print("\n");
  
  //========================================================================================== Pattern Tag Text ========================================================================================================
  fill(250);
  textSize(15);
  text("INSTRUMENT",b + 25,a - 15);
  
  fill(250);
  textSize(15);
  text("PATTERN ARRAY",b + 200,a - 15);
  
  fill(250);
  textSize(15);
  text("PROPERTY",b + 997,a - 15);
  
  fill(250);
  textSize(15);
  text("ARRAY 0:", 30,a + 20);
  text("ARRAY 1:", 30,a + 70);
  text("ARRAY 2:", 30,a + 120);
  text("ARRAY 3:", 30,a + 170);
  text("ARRAY 4:", 30,a + 220);
  text("ARRAY 5:", 30,a + 270);
  text("ARRAY 6:", 30,a + 320);
  text("ARRAY 7:", 30,a + 370);
  
  fill(255, 0, 0);
  rect(125,72,160,36);
  rect(125,121,160,36);
  rect(125,171,160,36);
  rect(125,221,160,36);
  rect(125,271,160,36);
  rect(125,321,160,36);
  rect(125,371,160,36);
  rect(125,421,160,36);
  
  for(int i = 71; i< 450; i+=50){
    fill(#F1C67A);
    rect(1096,i,42,37);
    rect(1141,i,42,37);
    rect(1186,i,42,37);
    rect(1231,i,42,37);
    rect(1276,i,42,37);
    rect(1321,i,42,37);
    rect(1366,i,42,37);
    rect(1411,i,42,37);
  }
  
  
  
  fill(#C6C6C6);
  circle(720,height/2 + 390, 70);
  circle(800,height/2 + 390, 70);
  rect(610,height/2 + 340, 20, 40);
  rect(570,height/2 + 380, 40, 20);
  rect(630,height/2 + 380, 40, 20);
  rect(610,height/2 + 400, 20, 40);
  
  if (entCircleL == 1){
    fill (0, 255, 0);
    circle(720,height/2 + 390, 70);
  }
  if (entCircleR == 1){
    fill (0, 255, 0);
    circle(800,height/2 + 390, 70);
  }
  if (entUp == 1){
    fill (0, 255, 0);
    rect(610,height/2 + 340, 20, 40);
  }
  if (entLeft == 1){
    fill (0, 255, 0);
    rect(570,height/2 + 380, 40, 20);
  }
  if (entRight == 1){
    fill (0, 255, 0);
    rect(630,height/2 + 380, 40, 20);
  }
  if (entDown == 1){
    fill (0, 255, 0);
    rect(610,height/2 + 400, 20, 40);
  }
  
  entCircleL = 0;
  entCircleR = 0;
  entLeft = 0;
  entRight = 0;
  entUp = 0;
  entDown = 0;
  
  // k0 = cp5.addButton("KICK" +0).setPosition(30,height/2 + 80).setSize(125,80).setColorBackground(color(255, 0, 0));
  // sn0 = cp5.addButton("SNARE" +0).setPosition(165,height/2 + 80).setSize(125,80).setColorBackground(color(255, 0, 0));
  // h0 = cp5.addButton("HAT"+0).setPosition(30,height/2 + 170).setSize(125,80).setColorBackground(color(255, 0, 0));
  // c0 = cp5.addButton("CLAP" +0).setPosition(165,height/2 + 170).setSize(125,80).setColorBackground(color(255, 0, 0));
  // sy0 = cp5.addButton("SYNTH" +0).setPosition(30,height/2 + 260).setSize(125,80).setColorBackground(color(255, 0, 0));
  // e0 = cp5.addButton("ENVELOPES" +0).setPosition(165,height/2 + 260).setSize(125,80).setColorBackground(color(255, 0, 0));
  //image(imgKICK, 30,height/2 + 80, 130, 90);
  //imgKICK = loadImage("KICK.png");
  //imgSNARE = loadImage("SNARE.png");
  //imgHAT = loadImage("HAT.png");
  //imgCLAP = loadImage("CLAP.png");
  //imgSYNTH =
  print("\nsynthsel == "+ synthSel);
  //if(upward == 0 && entVal_pattern == 1 && highlight == 1 && righty >= 0 && instrument0.getLabel" && synthSel == 2 && (redhighlight == 1 || redhighlight == 4)){
  //}
  print("\nupward ==" + upward);
  print("\nentVal_pattern =="+ entVal_pattern);
  print("\nhighlight ==" + highlight);
  //print("
  
  fill(255);
  textSize(15);
  text("KICK", 70, height/2 + 180);
  text("SNARE", 200, height/2 + 180);
  text("HAT", 70, height/2 + 300);
  text("CLAP", 200, height/2 + 300);
  text("SYNTH", 70, height/2 + 420);
  text("ENVELOPES", 200, height/2 + 420);
  cp5.setAutoDraw(false); 
  cp5.draw();
  image(imgKICK, 35,height/2 + 85, 115, 71);
  image(imgSNARE, 170,height/2 + 85, 115, 71);
  image(imgHAT, 35,height/2 + 204, 115, 71);
  image(imgCLAP, 170,height/2 + 204, 115, 71);
  image(imgSYNTH, 35,height/2 + 324, 115, 71);
 }
 //========================================================================================== DRAW ENDS ========================================================================================================
 //==================================================================================================================================================================================================
 
 //void smallrec(){
 // smallrectangle();
 //}
 
 //========================================================================================== Section highlighter ========================================================================================================
 void keyPressed() {
   if (keyCode == TAB){
     //if ((highlight == 1 || highlight == 2 ) && (redhighlight == 1 || redhighlight == 4)){
     //  leave = 0;
     //  highlight = 0;
     //  currentPositionX = righty;
     //  print("\n");
     //  print("leave is" + leave);
     //  print("\n");
     //  print("highlight is" + highlight);
     //  print("\n");
     //}
     entCircleR = 1;
     if ((highlight == 1) && (redhighlight == 1 || redhighlight == 4)){
       patList1 = 1;
       instSelect[0] = 8;
       entVal_instrument = 0;
       leave = 0;
       highlight = 0;
       currentPositionX = righty;
       currentPositionY = upward;
       print("\n");
       print("TAB2 highlight is now = " + highlight);
       print("\n");
       //patList1 = 1;
     }
     
     
     
     if ((highlight == 2) && (redhighlight == 1 || redhighlight == 4)){
       //leave = 0;
       //highlight = 0;
       //currentPositionX = righty;
       cp5.get(controlP5.Button.class, "KICK" + 0).setColorBackground( color(255, 0, 0) );
       cp5.get(controlP5.Button.class, "HAT" + 0).setColorBackground( color(255, 0, 0) );
       cp5.get(controlP5.Button.class, "CLAP" + 0).setColorBackground( color(255, 0, 0) );
       cp5.get(controlP5.Button.class, "ENVELOPES" + 0).setColorBackground( color(255, 0, 0) );
       cp5.get(controlP5.Button.class, "SNARE" + 0).setColorBackground( color(255, 0, 0) );
       cp5.get(controlP5.Button.class, "SYNTH" + 0).setColorBackground( color(255, 0, 0) );
       
       instrument0.setCaptionLabel("");
       instrument1.setCaptionLabel("");
       instrument2.setCaptionLabel("");
       instrument3.setCaptionLabel("");
       instrument4.setCaptionLabel("");
       instrument5.setCaptionLabel("");
       instrument6.setCaptionLabel("");
       instrument7.setCaptionLabel("");
       
       entVal_instrument = 1;
       highlight--;
       instSelect[0] = 0;
       patList2 = 1;
       print("\n");
       print("TAB1 highlight is now = " + highlight);
       print("\n");
  
     }
     
     if((upward == 0 || upward == 1 || upward == 2 || upward == 3 || upward == 4 || upward == 5 || upward == 6 || upward == 7) 
     && entVal_pattern == 1 && highlight == 1 && righty >= 0 && instrument0.getLabel() == "SYNTH" && synthSel > 0 && (redhighlight == 1 || redhighlight == 4)){
      synthSel = 0;
      highlight = 1;
      entVal_pattern = 0;
      notes0.deactivateAll();
      notes0.hide();
      //entVal_pattern = 0;
      notesCaptionHide0();
    }
     
     
     
     
     if ((propHighlight == 1) && redhighlight == 2){
       propLeave = 0;
       propHighlight = 0;
       propcurrentPositionX = propRighty;
       propcurrentPositionY = propUpward;
     }
       
       if ((propHighlight == 2) && redhighlight == 2){
       //propLeave = 0;
       //propHighlight = 0;
       //propcurrentPositionX = propRighty;
          propHighlight--;
          cp5.get(controlP5.Button.class, "GAIN" + 0).setColorBackground( color(#F1C67A) );
          cp5.get(controlP5.Button.class, "TRANSPOSE" + 0).setColorBackground( color(#F1C67A) );
          cp5.get(controlP5.Button.class, "PAN" + 0).setColorBackground( color(#F1C67A) );
          cp5.get(controlP5.Button.class, "DELETE" + 0).setColorBackground( color(#F1C67A) );
          cp5.get(controlP5.Button.class, "WAVE" + 0).setColorBackground( color(#F1C67A) );
          cp5.get(controlP5.Button.class, "DELETE" + 0).setColorBackground( color(#F1C67A) );
          cp5.get(controlP5.Button.class, "EFFECTS" + 0).setColorBackground( color(#F1C67A) );
     }
     
    if ((propHighlight == 3) && redhighlight == 2){
      if (instPropUpward == 0){
        if(instPropRighty == 0){
          propHighlight--;
          time0.hide();
        }
        if(instPropRighty == 1){
          propHighlight--;
          transpose0.hide();
        }
        if(instPropRighty == 2){
          propHighlight--;
          effect0.hide();
        }
      }
      if (instPropUpward == 1){
        if(instPropRighty == 0){
          propHighlight--;
          wave0.hide();
        }
        if(instPropRighty == 1){
          propHighlight--;
          delete0.hide();
        }
        if(instPropRighty == 2){
          propHighlight--;
          pan0.hide();
        }
      }
       //propLeave = 0;
       //propHighlight = 0;
       //propcurrentPositionX = propRighty;
     }
   
   }
   
//int property = 8, highlight = 0, righty = 8, currentPositionX = -1, upward = 0, redhighlight = 0, leave = 0, close = 0, run = 0, playALL = 0, firstVal = 0, intRighty = 3, instUpward = 0, checker = 0, entVal_instrument = 0, entVal_pattern = 0;
//int synthSel = 0, notes0Row = 0, notes0Col = 0, time0Row = 0, time0Col = 0, currentNotePosition, ;
//int patList1 = 0, patList2 = 0;
//if(entVal_instrument == 1 && highlight == 0 && (redhighlight == 1 || redhighlight == 4)){
//    highlight = 1;
//    //righty = -1;
//    redhighlight = 1;
//    leave = 1;
//    righty = currentPositionX;
//    //if (highlight == 2){
//      intRighty = 0;
//    //}
//  }
   
   if (keyCode == ENTER){
     print("propHighlight =\n" + propHighlight);
  if ( entVal_instrument == 2 && (redhighlight == 1 || redhighlight == 4) ){
    entVal_instrument = 3;
  }
  if(righty > -1 && righty < 8 && entVal_instrument == 1 &&  highlight == 1 && (redhighlight == 1 || redhighlight == 4)){
    decide = 1;
    //patList2 = 0;
    //synthSel = 0; 
  }
  if( righty == -1 && entVal_instrument == 1 &&  highlight == 1 && (redhighlight == 1 || redhighlight == 4)){
    highlight = 2;
    entVal_instrument = 2;
    redhighlight = 1;
    leave = 1;
    instUpward = 0;
    intRighty = 0;
    patList2 = 0;
    //decide = 1;
      if(upward == 0){
        instSelect[0] = 1;
      }
      else 
      if(upward == 1){
        instSelect[1] = 1;
      }
      else 
      if(upward == 2){
        instSelect[2] = 1;
      }
      else 
      if(upward == 3){
        instSelect[3] = 1;
      }
      else 
      if(upward == 4){
        instSelect[4] = 1;
      }
      else 
      if(upward == 5){
        instSelect[5] = 1;
      }
      else 
      if(upward == 6){
        instSelect[6] = 1;
      }
      else 
      if(upward == 7){
        instSelect[7] = 1;
      }
    }
  if ( entVal_instrument == 0 && (redhighlight == 1 || redhighlight == 4) ){
      righty = currentPositionX;
      upward = currentPositionY;
      highlight = 1;
      patList1 = 0;
      //entVal_instrument = constrain(entVal_instrument, 0, 2); 
      ++entVal_instrument;
      //print("Not here ");
      entCircleL = 1;
    }
    
    
    
    if (righty >= 0 && (redhighlight == 1 || redhighlight == 4)){
      entCircleL = 1;
      if (righty == 8){
        entVal_instrument = 1;
        //print("Not here again");
        //print("EntValue initial = "+entVal_instrument);
        //print("\n");
      }
      else{
        entVal_pattern = 1;
        //print("entVal_pattern = "+entVal_pattern+"!");
        //print("\n");
      }
    }
    
    if(redhighlight == 2 && propHighlight == 3){
      funcPropSelec();
    }
    if(redhighlight == 2 && (propHighlight == 2 || propHighlight == 1)){
      propHighlight++;
      print("\n");
      print("propHighlight2 == "+propHighlight );
      print("\n");
    }

    if(redhighlight == 2 && propUpward == 0 && propRighty == 8 && propHighlight == 0){
      propHighlight++;
      propUpward = 0;
      propRighty = 0;
      propLeave = 1;
      print("propHighlight1 ==  "+propHighlight);
    }
    else if(redhighlight == 2 && propRighty != 8 && propHighlight == 0){
      propHighlight++;
      propUpward = propcurrentPositionY;
      propRighty = propcurrentPositionX;
      propLeave = 1;
      print("propHighlight1 CONTINUED ==  "+propHighlight);
    }
    
    if(upward == 0 && entVal_pattern == 1 && highlight == 1 && righty >= 0 && instrument0.getLabel() == "SYNTH" && synthSel < 2 && (redhighlight == 1 || redhighlight == 4)){
      synthSel++;
    }
    if(upward == 1 && entVal_pattern == 1 && highlight == 1 && righty >= 0 && instrument1.getLabel() == "SYNTH" && synthSel < 2 && (redhighlight == 1 || redhighlight == 4)){
      synthSel++;
    }
    if(upward == 2 && entVal_pattern == 1 && highlight == 1 && righty >= 0 && instrument2.getLabel() == "SYNTH" && synthSel < 2 && (redhighlight == 1 || redhighlight == 4)){
      synthSel++;
    }
    if(upward == 3 && entVal_pattern == 1 && highlight == 1 && righty >= 0 && instrument3.getLabel() == "SYNTH" && synthSel < 2 && (redhighlight == 1 || redhighlight == 4)){
      synthSel++;
    }
    if(upward == 4 && entVal_pattern == 1 && highlight == 1 && righty >= 0 && instrument4.getLabel() == "SYNTH" && synthSel < 2 && (redhighlight == 1 || redhighlight == 4)){
      synthSel++;
    }
    if(upward == 5 && entVal_pattern == 1 && highlight == 1 && righty >= 0 && instrument5.getLabel() == "SYNTH" && synthSel < 2 && (redhighlight == 1 || redhighlight == 4)){
      synthSel++;
    }
    if(upward == 6 && entVal_pattern == 1 && highlight == 1 && righty >= 0 && instrument6.getLabel() == "SYNTH" && synthSel < 2 && (redhighlight == 1 || redhighlight == 4)){
      synthSel++;
    }
    if(upward == 7 && entVal_pattern == 1 && highlight == 1 && righty >= 0 && instrument7.getLabel() == "SYNTH" && synthSel < 2 && (redhighlight == 1 || redhighlight == 4)){
      synthSel++;
    }
    if(upward == 0 && entVal_pattern == 1 && highlight == 1 && righty >= 0 && instrument0.getLabel() == "SYNTH" && synthSel == 2 && (redhighlight == 1 || redhighlight == 4)){
      synthSel = 0;
      notes0.deactivateAll();
      notes0.hide();
      entVal_pattern = 0;
      notesCaptionHide0();
    }
    if(upward == 1 && entVal_pattern == 1 && highlight == 1 && righty >= 0 && instrument1.getLabel() == "SYNTH" && synthSel == 2 && (redhighlight == 1 || redhighlight == 4)){
      notes0.deactivateAll();
      notes0.hide();
      entVal_pattern = 0;
      notesCaptionHide1();
      synthSel = 0;
    }
    if(upward == 2 && entVal_pattern == 1 && highlight == 1 && righty >= 0 && instrument2.getLabel() == "SYNTH" && synthSel == 2 && (redhighlight == 1 || redhighlight == 4)){
      synthSel = 0;
      notes0.deactivateAll();
      notes0.hide();
      entVal_pattern = 0;
      notesCaptionHide2();
    }
    if(upward == 3 && entVal_pattern == 1 && highlight == 1 && righty >= 0 && instrument3.getLabel() == "SYNTH" && synthSel == 2 && (redhighlight == 1 || redhighlight == 4)){
      synthSel = 0;
      notes0.deactivateAll();
      notes0.hide();
      entVal_pattern = 0;
      notesCaptionHide3();
    }
    if(upward == 4 && entVal_pattern == 1 && highlight == 1 && righty >= 0 && instrument4.getLabel() == "SYNTH" && synthSel == 2 && (redhighlight == 1 || redhighlight == 4)){
      synthSel = 0;
      notes0.deactivateAll();
      notes0.hide();
      entVal_pattern = 0;
      notesCaptionHide4();
    }
    if(upward == 5 && entVal_pattern == 1 && highlight == 1 && righty >= 0 && instrument5.getLabel() == "SYNTH" && synthSel == 2 && (redhighlight == 1 || redhighlight == 4)){
      synthSel = 0;
      notes0.deactivateAll();
      notes0.hide();
      entVal_pattern = 0;
      notesCaptionHide5();
    }
    if(upward == 6 && entVal_pattern == 1 && highlight == 1 && righty >= 0 && instrument6.getLabel() == "SYNTH" && synthSel == 2 && (redhighlight == 1 || redhighlight == 4)){
      synthSel = 0;
      notes0.deactivateAll();
      notes0.hide();
      entVal_pattern = 0;
      notesCaptionHide6();
    }
    if(upward == 7 && entVal_pattern == 1 && highlight == 1 && righty >= 0 && instrument7.getLabel() == "SYNTH" && synthSel == 2 && (redhighlight == 1 || redhighlight == 4)){
      synthSel = 0;
      notes0.deactivateAll();
      notes0.hide();
      entVal_pattern = 0;
      notesCaptionHide7();
    }
 }
 
  if (key == CODED) {
    if (keyCode == UP) {
      entUp = 1;
      if (highlight == 0 && propHighlight == 0){
        redhighlight = 1;
      }
      if (highlight == 1 && upward > 0 && synthSel == 0 && (redhighlight == 1 || redhighlight == 4)){
        upward--;
      }
      if (highlight == 2 && instUpward > 0 && synthSel == 0 && (redhighlight == 1 || redhighlight == 4) ){
        instUpward--;
        //print(instUpward);
      }
      if(entVal_pattern == 1 && highlight == 1 && synthSel == 1  && notes0Col <= 2 && notes0Col >= 1 && (redhighlight == 1 || redhighlight == 4)){
        --notes0Col;
        print("note Up = "+notes0Col);
      }
      
      //propRighty = 8, propUpward = 0, propHighlight = 0 property = 8, highlight = 0, righty = 8, currentPositionX = -1, upward = 0, redhighlight = 0,;
      if(redhighlight == 2 && propHighlight == 1 && propUpward > 0){
        propUpward--;
      }
      if(redhighlight == 2 && propHighlight == 2 && instPropUpward > 0){
        instPropUpward--;
        print("\n");
        print("instPropUpward == !!!!!" + instPropUpward);
        print("\n");
      }
        //notes0Row = 0, notes0Col = 0, time0Row = 0, time0Col = 0

      
      if(redhighlight == 2 && propHighlight == 3){
          if(instPropUpward == 0 && instPropRighty == 0){
            time0Col--;
            time0Col = constrain(time0Col, 0, 5);
            //print("\n");
            //print("time0Col = " + time0Col);
            //print("\n");
          }
          else if(instPropUpward == 0 && instPropRighty == 1){
            time0Col--;
            time0Col = constrain(time0Col, 0, 2);
            //print("\n");
            //print("time0Col = " + time0Col);
            //print("\n");
          }
          else if(instPropUpward == 0 && instPropRighty == 2){
            time0Col--;
            time0Col = constrain(time0Col, 0, 2);
            //print("\n");
            //print("time0Col = " + time0Col);
            //print("\n");
          }
          else if(instPropUpward == 1 && instPropRighty == 0){
            time0Col--;
            time0Col = constrain(time0Col, 0, 2);
            //print("\n");
            //print("time0Col = " + time0Col);
            //print("\n");
          }
          else if(instPropUpward == 1 && instPropRighty == 1){
            time0Col--;
            time0Col = constrain(time0Col, 0, 2);
          }
          else if(instPropUpward == 1 && instPropRighty == 2){
            time0Col--;
            time0Col = constrain(time0Col, 0, 2);
            //print("\n");
            //print("time0Col = " + time0Col);
            //print("\n");
          }
        }
    } 
    
    else if (keyCode == DOWN) {
      entDown = 1;
      if (highlight == 0 && synthSel == 0 && propHighlight == 0){
        redhighlight = 3;
      }
      if (highlight == 1 && upward < 7 && synthSel == 0 && (redhighlight == 1 || redhighlight == 4)){
            upward++;
            print("upward IS"+upward); 
      }
      if (highlight == 2 && instUpward < 2 && synthSel == 0 && (redhighlight == 1 || redhighlight == 4)){
        instUpward++;
        print("instUpward IS" + instUpward);
      }
      if(entVal_pattern == 1 && highlight == 1 && synthSel == 1 && notes0Col >= 0 && notes0Col <= 1 && (redhighlight == 1 || redhighlight == 4)){
        notes0Col++;
        print("note Down = "+notes0Col);
        print("\n");
      }
      //propRighty = 8, propUpward = 0, propHighlight = 0 property = 8, highlight = 0, righty = 8, currentPositionX = -1, upward = 0, redhighlight = 0,;
      if(redhighlight == 2 && propHighlight == 1 && propUpward < 8){
        propUpward++;
        print("propUpward isssss"+propUpward);
      }
      if(redhighlight == 2 && propHighlight == 2 && instPropUpward == 0){
        instPropUpward++;
        print("\n");
        print("instPropUpward == !!!!!" + instPropUpward);
        print("\n");
      }
      
        //notes0Row = 0, notes0Col = 0, time0Row = 0, time0Col = 0
      //if(redhighlight == 2 && propHighlight == 3 && time0Col < 6){
      //  time0Col++;
      //  print("\n");
      //  print("time0Col = " + time0Col);
      //  print("\n");
      //}
      
      if(redhighlight == 2 && propHighlight == 3){
          if(instPropUpward == 0 && instPropRighty == 0){
            time0Col++;
            time0Col = constrain(time0Col, 0, 5);
            //print("\n");
            //print("time0Col = " + time0Col);
            //print("\n");
          }
          else if(instPropUpward == 0 && instPropRighty == 1){
            time0Col++;
            time0Col = constrain(time0Col, 0, 2);
            //print("\n");
            //print("time0Col = " + time0Col);
            //print("\n");
          }
          else if(instPropUpward == 0 && instPropRighty == 2){
            time0Col++;
            time0Col = constrain(time0Col, 0, 1);
            //print("\n");
            //print("time0Col = " + time0Col);
            //print("\n");
          }
          else if(instPropUpward == 1 && instPropRighty == 0){
            time0Col++;
            time0Col = constrain(time0Col, 0, 2);
            //print("\n");
            //print("time0Col = " + time0Col);
            //print("\n");
          }
          else if(instPropUpward == 1 && instPropRighty == 1){
            time0Col++;
            time0Col = constrain(time0Col, 0, 2);
          }
          else if(instPropUpward == 1 && instPropRighty == 2){
            time0Col++;
            time0Col = constrain(time0Col, 0, 2);
            //print("\n");
            //print("time0Col = " + time0Col);
            //print("\n");
          }
        }
      
    }
      
    else if (keyCode == RIGHT) {
      entRight = 1;
      if (highlight == 0 && propHighlight == 0){
        redhighlight = 2;
      }
      if (highlight == 1 && righty < 7 && righty >= -1 && synthSel == 0 && (redhighlight == 1 || redhighlight == 4)){
        righty++;
        //print(righty);  
      } 
      if (entVal_instrument == 2 && highlight == 2 && intRighty < 1 && synthSel == 0 && (redhighlight == 1 || redhighlight == 4)){
        intRighty++;
        //print("right =" + intRighty);
      }
      if(entVal_pattern == 1 && highlight == 1 && synthSel == 1 && notes0Row < 2 && (redhighlight == 1 || redhighlight == 4)){
        notes0Row++;
      }
      
      //propRighty = 8, propUpward = 0, propHighlight = 0 property = 8, highlight = 0, righty = 8, currentPositionX = -1, upward = 0, redhighlight = 0,;
      if(redhighlight == 2 && propUpward >= 0 && propRighty >= 0 && propRighty < 7 && propHighlight == 1){
        propRighty++;
        print("propRighty Increment =" + propRighty);
        print("\n");
      }
      if(redhighlight == 2 && propHighlight == 2 && instPropRighty < 2){
        instPropRighty++;
        print("\n");
        print("instPropRighty == !!!!!" + instPropRighty);
        print("\n");
      }
      
        //notes0Row = 0, notes0Col = 0, time0Row = 0, time0Col = 0
        if(redhighlight == 2 && propHighlight == 3){
          if(instPropUpward == 0 && instPropRighty == 0){
            //time0Row++;
            //time0Row = constrain(time0Row, 0, 2);
            //print("\n");
            //print("time0Row = " + time0Row);
            //print("\n");
          }
          else if(instPropUpward == 0 && instPropRighty == 1){
            time0Row++;
            time0Row = constrain(time0Row, 0, 2);
            print("\n");
            print("time0Row = " + time0Row);
            print("\n");
          }
          else if(instPropUpward == 0 && instPropRighty == 2){
            time0Row++;
            time0Row = constrain(time0Row, 0, 1);
            print("\n");
            print("time0Row = " + time0Row);
            print("\n");
          }
          else if(instPropUpward == 1 && instPropRighty == 1){
            time0Row++;
            time0Row = constrain(time0Row, 0, 2);
            print("\n");
            print("time0Row = " + time0Row);
            print("\n");
          }
          
        }
      
      
    } 
    
    else if (keyCode == LEFT) {
      entLeft = 1;
      if (highlight == 0 && synthSel == 0 && propHighlight == 0){
        redhighlight = 4;
      }
      if (highlight == 1 && righty > -1 && synthSel == 0 && (redhighlight == 1 || redhighlight == 4)){
        righty--;
        //print(righty);
      }
      if (entVal_instrument == 2 && highlight == 2 && intRighty > 0 && synthSel == 0 && (redhighlight == 1 || redhighlight == 4)){
        intRighty--;
        //print("left =" + intRighty);
      }
      if(entVal_pattern == 1 && highlight == 1 && synthSel == 1  && synthSel == 1 && notes0Row > 0 ){
        notes0Row--;
      }
      
      //propRighty = 8, propUpward = 0, propHighlight = 0 property = 8, highlight = 0, righty = 8, currentPositionX = -1, upward = 0, redhighlight = 0,;
      if(redhighlight == 2 && propUpward >= 0 && propRighty >= 0 && propRighty < 7 && propHighlight == 1){
        propRighty--;
        print("propRighty Increment =" + propRighty);
        print("\n");
      }
      if(redhighlight == 2 && propHighlight == 2 && instPropRighty > 0){
        instPropRighty--;
        print("\n");
        print("instPropRighty == ----" + instPropRighty);
        print("\n");
      }
      
      
      if(redhighlight == 2 && propHighlight == 3){
          if(instPropUpward == 0 && instPropRighty == 0){
            time0Row--;
            time0Row = constrain(time0Row, 0, 2);
            print("\n");
            print("time0Row = " + time0Row);
            print("\n");
          }
          else if(instPropUpward == 0 && instPropRighty == 1){
            time0Row--;
            time0Row = constrain(time0Row, 0, 2);
            print("\n");
            print("time0Row = " + time0Row);
            print("\n");
          }
          else if(instPropUpward == 0 && instPropRighty == 2){
            time0Row--;
            time0Row = constrain(time0Row, 0, 2);
            print("\n");
            print("time0Row = " + time0Row);
            print("\n");
          }
          else if(instPropUpward == 1 && instPropRighty == 1){
            time0Row--;
            time0Row = constrain(time0Row, 0, 2);
            print("\n");
            print("time0Row = " + time0Row);
            print("\n");
          }
        }
      
      
      
    } 
     else{
      
    //fillVal = 126;
      }
  }
 }

  
 //========================================================================================== Section highlighter ENDS ========================================================================================================
 //==================================================================================================================================================================================================
 
 //============================================================================================SELECTECTED FUNCTION ======================================================================================================
 void GAIN0(){
   //func = 1;
 ////========================================================================================= FUNCTION Radio Buttons =========================================================================================================================================   
  //fill(100,90, 90);
  //rect(450, height/2 + 130, (width/8.5), 150, 60); //WAVE
  //fill(250);
  //textSize(30);
  ////text("WAVE", 500, height/2 + 175);
  //time0 is for GAIN!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!========================================================!!!!!!!!!!!!!!!!!!!!!!
  time0 = cp5.addRadioButton("timeRadioButton1");
             time0.setPosition(1100, height/2 + 79);
             time0.setSize(20,20);
             time0.setColorForeground(color(120));
             time0.setColorActive(color(255));
             time0.setColorLabel(color(255));
             time0.setItemsPerRow(3);
             time0.setSpacingColumn(50);
             time0.setSpacingRow(50);
             time0.addItem("10",1);
             time0.addItem("20",2);
             time0.addItem("30",3);
             time0.addItem("40",4);
             time0.addItem("50",5);
             time0.addItem("60",6);
             time0.addItem("70",7);
             ;
  pan0.hide();
  transpose0.hide();
      
  }
  
  void PAN0(){
 ////========================================================================================= FUNCTION Radio Buttons =========================================================================================================================================   
     pan0 = cp5.addRadioButton("notesRadioButton8");
             pan0.setPosition(1100, height/2 + 79);
             pan0.setSize(20,20);
             pan0.setColorForeground(color(120));
             pan0.setColorActive(color(255));
             pan0.setColorLabel(color(255));
             pan0.setItemsPerRow(1);
             //pan0.setSpacingColumn(50);
             pan0.setSpacingRow(50);
             pan0.addItem("1",1);
             pan0.addItem("0",2);
             pan0.addItem("-1",3);
             ;
    time0.hide();
    transpose0.hide();
    //Controller.setGroup("transpose0") == 0
      
   
 }
 
 void TRANSPOSE0(){
    print("a");
    transpose0 = cp5.addRadioButton("notesRadioButton9");
             transpose0.setPosition(1100, height/2 + 79);
             transpose0.setSize(20,20);
             transpose0.setColorForeground(color(120));
             transpose0.setColorActive(color(255));
             transpose0.setColorLabel(color(255));
             transpose0.setItemsPerRow(1);
             //transpose0.setSpacingColumn(50);
             transpose0.setSpacingRow(5);
             transpose0.addItem("1",2);
             transpose0.addItem("2",3);
             transpose0.addItem("3",4);
             transpose0.addItem("4",5);
             transpose0.addItem("0",1);
             transpose0.addItem("-1",2);
             transpose0.addItem("-2",3);
             transpose0.addItem("-3",4);
             transpose0.addItem("-4",5);
             ;
    time0.hide();
    pan0.hide();  
   
 }

 void funcPropSelec(){
   if(propUpward == 0){
     if(propRighty == 0){
       if(instPropUpward == 0){
         if(instPropRighty == 0){
           if(time0Col == 0){
               A0p.setCaptionLabel("G0.5").setColorCaptionLabel(0);
               gainValue0 = 0.5f;
           }
           if(time0Col == 1){
               A0p.setCaptionLabel("G1").setColorCaptionLabel(0);
               gainValue0 = 1.0f;
           }
           if(time0Col == 2){
               A0p.setCaptionLabel("G2").setColorCaptionLabel(0);
               gainValue0 = 1.5f;
           }
           if(time0Col == 3){
               A0p.setCaptionLabel("G3").setColorCaptionLabel(0);
               gainValue0 = 2.0f;
           }
           if(time0Col == 4){
               A0p.setCaptionLabel("G4").setColorCaptionLabel(0);
               gainValue0 = 2.5f;
           }
           if(time0Col == 5){
               A0p.setCaptionLabel("G5").setColorCaptionLabel(0);
               gainValue0 = 3.0f;
           }
                 //propHighlight = 1;
         }
         
         if(instPropRighty == 1){
           if(time0Col == 0){
             if (time0Row == 0){
               A0p.setCaptionLabel("Tr0").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               A0p.setCaptionLabel("Tr1").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               A0p.setCaptionLabel("Tr2").setColorCaptionLabel(0);
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               A0p.setCaptionLabel("Tr3").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               A0p.setCaptionLabel("Tr4").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               A0p.setCaptionLabel("Tr-1").setColorCaptionLabel(0);
             }
           }
           if(time0Col == 2){
             if (time0Row == 0){
               A0p.setCaptionLabel("Tr-2").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               A0p.setCaptionLabel("Tr-3").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               A0p.setCaptionLabel("Tr-4").setColorCaptionLabel(0);
             }
           }
         }
         if(instPropRighty == 2){
           if(time0Col == 0){
             if (time0Row == 0){
               A0p.setCaptionLabel("D_off").setColorCaptionLabel(0);
               delayVal0 = 0.0;
             }
             if (time0Row == 1){
               A0p.setCaptionLabel("D_on").setColorCaptionLabel(0);
               delayVal0 = 0.5;
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               A0p.setCaptionLabel("B_off").setColorCaptionLabel(0);
               bitRes0 = 0;
             }
             if (time0Row == 1){
               A0p.setCaptionLabel("B_on").setColorCaptionLabel(0);
               bitRes0 = 2;
             }
           }
         }
       }
       if(instPropUpward == 1){
         if(instPropRighty == 0){
           if(time0Col == 0){
               A0p.setCaptionLabel("Sin").setColorCaptionLabel(0);
               disWave0 = Waves.SINE;
                 //sineOsc.patch( out );
           }
           if(time0Col == 1){
               A0p.setCaptionLabel("Sq").setColorCaptionLabel(0);
               //panValue = 1;
               disWave0 =  Waves.SQUARE;
                 //sineOsc.patch( out );
           }
           if(time0Col == 2){
               A0p.setCaptionLabel("Saw").setColorCaptionLabel(0);
               //panValue = 2;
               disWave0 = Waves.SAW;
           }
                 //propHighlight = 1;
         }
         if(instPropRighty == 1){
           if(time0Col == 0){
             A0p.setCaptionLabel("");
           }
           if(time0Col == 1){
             A0.setCaptionLabel("");
             B0.setCaptionLabel("");
             C0.setCaptionLabel("");
             D0.setCaptionLabel("");
             E0.setCaptionLabel("");
             F0.setCaptionLabel("");
             G0.setCaptionLabel("");
             H0.setCaptionLabel("");
             for(int i = 0; i < 8; i++){
             instList0[i] = 0.0;
             }
           }
         }
         if(instPropRighty == 2){
           if(time0Col == 0){
               A0p.setCaptionLabel("P0").setColorCaptionLabel(0);
               panValue = 0;
           }
           if(time0Col == 1){
               A0p.setCaptionLabel("P1").setColorCaptionLabel(0);
               panValue = 1;
           }
           if(time0Col == 2){
               A0p.setCaptionLabel("P-1").setColorCaptionLabel(0);
               panValue = 2;
           }
                 //propHighlight = 1;
         }
       }
       
     }
     
     if(propRighty == 1){
       if(instPropUpward == 0){
         if(instPropRighty == 0){
           if(time0Col == 0){
               B0p.setCaptionLabel("G0").setColorCaptionLabel(0);
               gainValue0 = 0.5f;
           }
           if(time0Col == 1){
               B0p.setCaptionLabel("G1").setColorCaptionLabel(0);
               gainValue0 = 1.0f;
           }
           if(time0Col == 2){
               B0p.setCaptionLabel("G2").setColorCaptionLabel(0);
               gainValue0 = 1.5f;
           }
           if(time0Col == 3){
               B0p.setCaptionLabel("G3").setColorCaptionLabel(0);
               gainValue0 = 2.0f;
           }
           if(time0Col == 4){
               B0p.setCaptionLabel("G4").setColorCaptionLabel(0);
               gainValue0 = 2.5f;
           }
           if(time0Col == 5){
               B0p.setCaptionLabel("G5").setColorCaptionLabel(0);
               gainValue0 = 3.0f;
           }
                 //propHighlight = 1;
         }
         if(instPropRighty == 1){
           if(time0Col == 0){
             if (time0Row == 0){
               B0p.setCaptionLabel("Tr0").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               B0p.setCaptionLabel("Tr1").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               B0p.setCaptionLabel("Tr2").setColorCaptionLabel(0);
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               B0p.setCaptionLabel("Tr3").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               B0p.setCaptionLabel("Tr4").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               B0p.setCaptionLabel("Tr-1").setColorCaptionLabel(0);
             }
           }
           if(time0Col == 2){
             if (time0Row == 0){
               B0p.setCaptionLabel("Tr-2").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               B0p.setCaptionLabel("Tr-3").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               B0p.setCaptionLabel("Tr-4").setColorCaptionLabel(0);
             }
           }
         }
         if(instPropRighty == 2){
           if(time0Col == 0){
             if (time0Row == 0){
               B0p.setCaptionLabel("D_on").setColorCaptionLabel(0);
               delayVal0 = 0.0;
             }
             if (time0Row == 1){
               B0p.setCaptionLabel("D_on").setColorCaptionLabel(0);
               delayVal0 = 0.5;
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               B0p.setCaptionLabel("B_off").setColorCaptionLabel(0);
               bitRes0 = 0;
             }
             if (time0Row == 1){
               B0p.setCaptionLabel("B_on").setColorCaptionLabel(0);
               bitRes0 = 2;
             }
           }
         }
       }
       if(instPropUpward == 1){
         if(instPropRighty == 0){
           if(time0Col == 0){
               B0p.setCaptionLabel("Sin").setColorCaptionLabel(0);
               disWave0 = Waves.SINE;
                 //sineOsc.patch( out );
           }
           if(time0Col == 1){
               B0p.setCaptionLabel("Sq").setColorCaptionLabel(0);
               //panValue = 1;
               disWave0 =  Waves.SQUARE;
                 //sineOsc.patch( out );
           }
           if(time0Col == 2){
               B0p.setCaptionLabel("Saw").setColorCaptionLabel(0);
               //panValue = 2;
               disWave0 = Waves.SAW;
           }
                 //propHighlight = 1;
         }
         if(instPropRighty == 1){
           if(time0Col == 0){
             B0p.setCaptionLabel("");
           }
           if(time0Col == 1){
             A0.setCaptionLabel("");
             B0.setCaptionLabel("");
             C0.setCaptionLabel("");
             D0.setCaptionLabel("");
             E0.setCaptionLabel("");
             F0.setCaptionLabel("");
             G0.setCaptionLabel("");
             H0.setCaptionLabel("");
             for(int i = 0; i < 8; i++){
             instList0[i] = 0.0;
             decision0[i] = 0;
             A0.setColorBackground(#c6c6c6);
             }
           }
         }
         if(instPropRighty == 2){
           if(time0Col == 0){
               B0p.setCaptionLabel("P0").setColorCaptionLabel(0);
               panValue = 0;
           }
           if(time0Col == 1){
               B0p.setCaptionLabel("P1").setColorCaptionLabel(0);
               panValue = 1;
           }
           if(time0Col == 2){
               B0p.setCaptionLabel("P-1").setColorCaptionLabel(0);
               panValue = 2;
           }
                 //propHighlight = 1;
         }
       }
     }
     
     if(propRighty == 2){
       if(instPropUpward == 0){
         if(instPropRighty == 0){
           if(time0Col == 0){
               C0p.setCaptionLabel("G0").setColorCaptionLabel(0);
               gainValue0 = 0.5f;
           }
           if(time0Col == 1){
               C0p.setCaptionLabel("G1").setColorCaptionLabel(0);
               gainValue0 = 1.0f;
           }
           if(time0Col == 2){
               C0p.setCaptionLabel("G2").setColorCaptionLabel(0);
               gainValue0 = 1.5f;
           }
           if(time0Col == 3){
               C0p.setCaptionLabel("G3").setColorCaptionLabel(0);
               gainValue0 = 2.0f;
           }
           if(time0Col == 4){
               C0p.setCaptionLabel("G4").setColorCaptionLabel(0);
               gainValue0 = 2.5f;
           }
           if(time0Col == 5){
               C0p.setCaptionLabel("G5").setColorCaptionLabel(0);
               gainValue0 = 3.0f;
           }
                 //propHighlight = 1;
         }
         if(instPropRighty == 1){
           if(time0Col == 0){
             if (time0Row == 0){
               C0p.setCaptionLabel("Tr0").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               C0p.setCaptionLabel("Tr1").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               C0p.setCaptionLabel("Tr2").setColorCaptionLabel(0);
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               C0p.setCaptionLabel("Tr3").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               C0p.setCaptionLabel("Tr4").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               C0p.setCaptionLabel("Tr-1").setColorCaptionLabel(0);
             }
           }
           if(time0Col == 2){
             if (time0Row == 0){
               C0p.setCaptionLabel("Tr-2").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               C0p.setCaptionLabel("Tr-3").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               C0p.setCaptionLabel("Tr-4").setColorCaptionLabel(0);
             }
           }
         }
         if(instPropRighty == 2){
           if(time0Col == 0){
             if (time0Row == 0){
               C0p.setCaptionLabel("D_off").setColorCaptionLabel(0);
               delayVal0 = 0.0;
             }
             if (time0Row == 1){
               C0p.setCaptionLabel("D_on").setColorCaptionLabel(0);
               delayVal0 = 0.5;
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               C0p.setCaptionLabel("B_on").setColorCaptionLabel(0);
               bitRes0 = 0;
             }
             if (time0Row == 1){
               C0p.setCaptionLabel("B_off").setColorCaptionLabel(0);
               bitRes0 = 2;
             }
           }
         }
       }
       if(instPropUpward == 1){
         if(instPropRighty == 0){
           if(time0Col == 0){
               C0p.setCaptionLabel("Sin").setColorCaptionLabel(0);
               disWave0 = Waves.SINE;
                 //sineOsc.patch( out );
           }
           if(time0Col == 1){
               C0p.setCaptionLabel("Sq").setColorCaptionLabel(0);
               //panValue = 1;
               disWave0 =  Waves.SQUARE;
                 //sineOsc.patch( out );
           }
           if(time0Col == 2){
               C0p.setCaptionLabel("Saw").setColorCaptionLabel(0);
               //panValue = 2;
               disWave0 = Waves.SAW;
           }
                 //propHighlight = 1;
         }
         if(instPropRighty == 1){
           if(time0Col == 0){
             C0p.setCaptionLabel("");
           }
           if(time0Col == 1){
             A0.setCaptionLabel("");
             B0.setCaptionLabel("");
             C0.setCaptionLabel("");
             D0.setCaptionLabel("");
             E0.setCaptionLabel("");
             F0.setCaptionLabel("");
             G0.setCaptionLabel("");
             H0.setCaptionLabel("");
             for(int i = 0; i < 8; i++){
             instList0[i] = 0.0;
             }
           }
         }
         if(instPropRighty == 2){
           if(time0Col == 0){
               C0p.setCaptionLabel("P0").setColorCaptionLabel(0);
               panValue = 0;
           }
           if(time0Col == 1){
               C0p.setCaptionLabel("P1").setColorCaptionLabel(0);
               panValue = 1;
           }
           if(time0Col == 2){
               C0p.setCaptionLabel("P-1").setColorCaptionLabel(0);
               panValue = 2;
           }
                 //propHighlight = 1;
         }
       }
     }
     
     if(propRighty == 3){
       if(instPropUpward == 0){
         if(instPropRighty == 0){
           if(time0Col == 0){
               D0p.setCaptionLabel("G0").setColorCaptionLabel(0);
               gainValue0 = 0.5f;
           }
           if(time0Col == 1){
               D0p.setCaptionLabel("G1").setColorCaptionLabel(0);
               gainValue0 = 1.0f;
           }
           if(time0Col == 2){
               D0p.setCaptionLabel("G2").setColorCaptionLabel(0);
               gainValue0 = 1.5f;
           }
           if(time0Col == 3){
               D0p.setCaptionLabel("G3").setColorCaptionLabel(0);
               gainValue0 = 2.0f;
           }
           if(time0Col == 4){
               D0p.setCaptionLabel("G4").setColorCaptionLabel(0);
               gainValue0 = 2.5f;
           }
           if(time0Col == 5){
               D0p.setCaptionLabel("G5").setColorCaptionLabel(0);
               gainValue0 = 3.0f;
           }
                 //propHighlight = 1;
         }
         if(instPropRighty == 1){
           if(time0Col == 0){
             if (time0Row == 0){
               D0p.setCaptionLabel("Tr0").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               D0p.setCaptionLabel("Tr1").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               D0p.setCaptionLabel("Tr2").setColorCaptionLabel(0);
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               D0p.setCaptionLabel("Tr3").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               D0p.setCaptionLabel("Tr4").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               D0p.setCaptionLabel("Tr-1").setColorCaptionLabel(0);
             }
           }
           if(time0Col == 2){
             if (time0Row == 0){
               D0p.setCaptionLabel("Tr-2").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               D0p.setCaptionLabel("Tr-3").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               D0p.setCaptionLabel("Tr-4").setColorCaptionLabel(0);
             }
           }
         }
         if(instPropRighty == 2){
           if(time0Col == 0){
             if (time0Row == 0){
               D0p.setCaptionLabel("D_off").setColorCaptionLabel(0);
               delayVal0 = 0.0;
             }
             if (time0Row == 1){
               D0p.setCaptionLabel("D_on").setColorCaptionLabel(0);
               delayVal0 = 0.5;
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               D0p.setCaptionLabel("B_off").setColorCaptionLabel(0);
               bitRes0 = 0;
             }
             if (time0Row == 1){
               D0p.setCaptionLabel("B_on").setColorCaptionLabel(0);
               bitRes0 = 2;
             }
           }
         }
       }
       if(instPropUpward == 1){
         if(instPropRighty == 0){
           if(time0Col == 0){
               D0p.setCaptionLabel("Sin").setColorCaptionLabel(0);
               disWave0 = Waves.SINE;
                 //sineOsc.patch( out );
           }
           if(time0Col == 1){
               D0p.setCaptionLabel("Sq").setColorCaptionLabel(0);
               //panValue = 1;
               disWave0 =  Waves.SQUARE;
                 //sineOsc.patch( out );
           }
           if(time0Col == 2){
               D0p.setCaptionLabel("Saw").setColorCaptionLabel(0);
               //panValue = 2;
               disWave0 = Waves.SAW;
           }
                 //propHighlight = 1;
         }
         if(instPropRighty == 1){
           if(time0Col == 0){
             D0p.setCaptionLabel("");
           }
           if(time0Col == 1){
             A0.setCaptionLabel("");
             B0.setCaptionLabel("");
             C0.setCaptionLabel("");
             D0.setCaptionLabel("");
             E0.setCaptionLabel("");
             F0.setCaptionLabel("");
             G0.setCaptionLabel("");
             H0.setCaptionLabel("");
             for(int i = 0; i < 8; i++){
             instList0[i] = 0.0;
             }
           }
         }
         if(instPropRighty == 2){
           if(time0Col == 0){
               D0p.setCaptionLabel("P0").setColorCaptionLabel(0);
               panValue = 0;
           }
           if(time0Col == 1){
               D0p.setCaptionLabel("P1").setColorCaptionLabel(0);
               panValue = 1;
           }
           if(time0Col == 2){
               D0p.setCaptionLabel("P-1").setColorCaptionLabel(0);
               panValue = 2;
           }
                 //propHighlight = 1;
         }
       }
     }
     
     if(propRighty == 4){
       if(instPropUpward == 0){
         if(instPropRighty == 0){
           if(time0Col == 0){
               E0p.setCaptionLabel("G0").setColorCaptionLabel(0);
               gainValue0 = 0.5f;
           }
           if(time0Col == 1){
               E0p.setCaptionLabel("G1").setColorCaptionLabel(0);
               gainValue0 = 1.0f;
           }
           if(time0Col == 2){
               E0p.setCaptionLabel("G2").setColorCaptionLabel(0);
               gainValue0 = 1.5f;
           }
           if(time0Col == 3){
               E0p.setCaptionLabel("G3").setColorCaptionLabel(0);
               gainValue0 = 2.0f;
           }
           if(time0Col == 4){
               E0p.setCaptionLabel("G4").setColorCaptionLabel(0);
               gainValue0 = 2.5f;
           }
           if(time0Col == 5){
               E0p.setCaptionLabel("G5").setColorCaptionLabel(0);
               gainValue0 = 3.0f;
           }
                 //propHighlight = 1;
         }
         if(instPropRighty == 1){
           if(time0Col == 0){
             if (time0Row == 0){
               E0p.setCaptionLabel("Tr0").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               E0p.setCaptionLabel("Tr1").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               E0p.setCaptionLabel("Tr2").setColorCaptionLabel(0);
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               E0p.setCaptionLabel("Tr3").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               E0p.setCaptionLabel("Tr4").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               E0p.setCaptionLabel("Tr-1").setColorCaptionLabel(0);
             }
           }
           if(time0Col == 2){
             if (time0Row == 0){
               E0p.setCaptionLabel("Tr-2").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               E0p.setCaptionLabel("Tr-3").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               E0p.setCaptionLabel("Tr-4").setColorCaptionLabel(0);
             }
           }
         }
         if(instPropRighty == 2){
           if(time0Col == 0){
             if (time0Row == 0){
               E0p.setCaptionLabel("D_off").setColorCaptionLabel(0);
               delayVal0 = 0.0;
             }
             if (time0Row == 1){
               E0p.setCaptionLabel("D_on").setColorCaptionLabel(0);
               delayVal0 = 0.5;
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               E0p.setCaptionLabel("B_off").setColorCaptionLabel(0);
               bitRes0 = 0;
             }
             if (time0Row == 1){
               E0p.setCaptionLabel("B_on").setColorCaptionLabel(0);
               bitRes0 = 2;
             }
           }
         }
       }
       if(instPropUpward == 1){
         if(instPropRighty == 0){
           if(time0Col == 0){
               E0p.setCaptionLabel("Sin").setColorCaptionLabel(0);
               disWave0 = Waves.SINE;
                 //sineOsc.patch( out );
           }
           if(time0Col == 1){
               E0p.setCaptionLabel("Sq").setColorCaptionLabel(0);
               //panValue = 1;
               disWave0 =  Waves.SQUARE;
                 //sineOsc.patch( out );
           }
           if(time0Col == 2){
               E0p.setCaptionLabel("Saw").setColorCaptionLabel(0);
               //panValue = 2;
               disWave0 = Waves.SAW;
           }
                 //propHighlight = 1;
         }
         if(instPropRighty == 1){
           if(time0Col == 0){
             E0p.setCaptionLabel("");
           }
           if(time0Col == 1){
             A0.setCaptionLabel("");
             B0.setCaptionLabel("");
             C0.setCaptionLabel("");
             D0.setCaptionLabel("");
             E0.setCaptionLabel("");
             F0.setCaptionLabel("");
             G0.setCaptionLabel("");
             H0.setCaptionLabel("");
             for(int i = 0; i < 8; i++){
             instList0[i] = 0.0;
             }
           }
         }
         if(instPropRighty == 2){
           if(time0Col == 0){
               E0p.setCaptionLabel("P0").setColorCaptionLabel(0);
               panValue = 0;
           }
           if(time0Col == 1){
               E0p.setCaptionLabel("P1").setColorCaptionLabel(0);
               panValue = 1;
           }
           if(time0Col == 2){
               E0p.setCaptionLabel("P-1").setColorCaptionLabel(0);
               panValue = 2;
           }
                 //propHighlight = 1;
         }
       }
     }
     
     if(propRighty == 5){
       if(instPropUpward == 0){
         if(instPropRighty == 0){
           if(time0Col == 0){
               F0p.setCaptionLabel("G0").setColorCaptionLabel(0);
               gainValue0 = 0.5f;
           }
           if(time0Col == 1){
               F0p.setCaptionLabel("G1").setColorCaptionLabel(0);
               gainValue0 = 1.0f;
           }
           if(time0Col == 2){
               F0p.setCaptionLabel("G2").setColorCaptionLabel(0);
               gainValue0 = 1.5f;
           }
           if(time0Col == 3){
               F0p.setCaptionLabel("G3").setColorCaptionLabel(0);
               gainValue0 = 2.0f;
           }
           if(time0Col == 4){
               F0p.setCaptionLabel("G4").setColorCaptionLabel(0);
               gainValue0 = 2.5f;
           }
           if(time0Col == 5){
               F0p.setCaptionLabel("G5").setColorCaptionLabel(0);
               gainValue0 = 3.0f;
           }
                 //propHighlight = 1;
         }
         if(instPropRighty == 1){
           if(time0Col == 0){
             if (time0Row == 0){
               F0p.setCaptionLabel("Tr0").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               F0p.setCaptionLabel("Tr1").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               F0p.setCaptionLabel("Tr2").setColorCaptionLabel(0);
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               F0p.setCaptionLabel("Tr3").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               F0p.setCaptionLabel("Tr4").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               F0p.setCaptionLabel("Tr-1").setColorCaptionLabel(0);
             }
           }
           if(time0Col == 2){
             if (time0Row == 0){
               F0p.setCaptionLabel("Tr-2").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               F0p.setCaptionLabel("Tr-3").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               F0p.setCaptionLabel("Tr-4").setColorCaptionLabel(0);
             }
           }
         }
         if(instPropRighty == 2){
           if(time0Col == 0){
             if (time0Row == 0){
               F0p.setCaptionLabel("D_off").setColorCaptionLabel(0);
               delayVal0 = 0.0;
             }
             if (time0Row == 1){
               F0p.setCaptionLabel("D_on").setColorCaptionLabel(0);
               delayVal0 = 0.5;
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               F0p.setCaptionLabel("B_off").setColorCaptionLabel(0);
               bitRes0 = 0;
             }
             if (time0Row == 1){
               F0p.setCaptionLabel("B_on").setColorCaptionLabel(0);
               bitRes0 = 2;
             }
           }
         }
       }
       if(instPropUpward == 1){
         if(instPropRighty == 0){
           if(time0Col == 0){
               F0p.setCaptionLabel("Sin").setColorCaptionLabel(0);
               disWave0 = Waves.SINE;
                 //sineOsc.patch( out );
           }
           if(time0Col == 1){
               F0p.setCaptionLabel("Sq").setColorCaptionLabel(0);
               //panValue = 1;
               disWave0 =  Waves.SQUARE;
                 //sineOsc.patch( out );
           }
           if(time0Col == 2){
               F0p.setCaptionLabel("Saw").setColorCaptionLabel(0);
               //panValue = 2;
               disWave0 = Waves.SAW;
           }
                 //propHighlight = 1;
         }
         if(instPropRighty == 1){
           if(time0Col == 0){
             F0p.setCaptionLabel("");
           }
           if(time0Col == 1){
             A0.setCaptionLabel("");
             B0.setCaptionLabel("");
             C0.setCaptionLabel("");
             D0.setCaptionLabel("");
             E0.setCaptionLabel("");
             F0.setCaptionLabel("");
             G0.setCaptionLabel("");
             H0.setCaptionLabel("");
             for(int i = 0; i < 8; i++){
             instList0[i] = 0.0;
             }
           }
         }
         if(instPropRighty == 2){
           if(time0Col == 0){
               F0p.setCaptionLabel("P0").setColorCaptionLabel(0);
               panValue = 0;
           }
           if(time0Col == 1){
               F0p.setCaptionLabel("P1").setColorCaptionLabel(0);
               panValue = 1;
           }
           if(time0Col == 2){
               F0p.setCaptionLabel("P-1").setColorCaptionLabel(0);
               panValue = 2;
           }
                 //propHighlight = 1;
         }
       }
     }
   }
   
   
   if(propUpward == 1){
     if(propRighty == 0){
       if(instPropUpward == 0){
         if(instPropRighty == 0){
           if(time0Col == 0){
               A1p.setCaptionLabel("G0").setColorCaptionLabel(0);
               gainValue1 = 0.5f;
           }
           if(time0Col == 1){
               A1p.setCaptionLabel("G1").setColorCaptionLabel(0);
               gainValue1 = 1.0f;
           }
           if(time0Col == 2){
               A1p.setCaptionLabel("G2").setColorCaptionLabel(0);
               gainValue1 = 1.5f;
           }
           if(time0Col == 3){
               A1p.setCaptionLabel("G3").setColorCaptionLabel(0);
               gainValue1 = 2.0f;
           }
           if(time0Col == 4){
               A1p.setCaptionLabel("G4").setColorCaptionLabel(0);
               gainValue1 = 2.5f;
           }
           if(time0Col == 5){
               A1p.setCaptionLabel("G5").setColorCaptionLabel(0);
               gainValue1 = 3.0f;
           }
                 //propHighlight = 1;
         }
         if(instPropRighty == 1){
           if(time0Col == 0){
             if (time0Row == 0){
               A1p.setCaptionLabel("Tr0").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               A1p.setCaptionLabel("Tr1").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               A1p.setCaptionLabel("Tr2").setColorCaptionLabel(0);
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               A1p.setCaptionLabel("Tr3").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               A1p.setCaptionLabel("Tr4").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               A1p.setCaptionLabel("Tr-1").setColorCaptionLabel(0);
             }
           }
           if(time0Col == 2){
             if (time0Row == 0){
               A1p.setCaptionLabel("Tr-2").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               A1p.setCaptionLabel("Tr-3").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               A1p.setCaptionLabel("Tr-4").setColorCaptionLabel(0);
             }
           }
         }
         if(instPropRighty == 2){
           if(time0Col == 0){
             if (time0Row == 0){
               A1p.setCaptionLabel("D_off").setColorCaptionLabel(0);
               delayVal1 = 0.0;
             }
             if (time0Row == 1){
               A1p.setCaptionLabel("D_on").setColorCaptionLabel(0);
               delayVal1 = 0.5;
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               A1p.setCaptionLabel("B_off").setColorCaptionLabel(0);
               bitRes1 = 0;
             }
             if (time0Row == 1){
               A1p.setCaptionLabel("B_on").setColorCaptionLabel(0);
               bitRes1 = 2;
             }
           }
         }
       }
       if(instPropUpward == 1){
         if(instPropRighty == 0){
           if(time0Col == 0){
               A1p.setCaptionLabel("Sin").setColorCaptionLabel(0);
               disWave0 = Waves.SINE;
                 //sineOsc.patch( out );
           }
           if(time0Col == 1){
               A1p.setCaptionLabel("Sq").setColorCaptionLabel(0);
               //panValue = 1;
               disWave0 =  Waves.SQUARE;
                 //sineOsc.patch( out );
           }
           if(time0Col == 2){
               A1p.setCaptionLabel("Saw").setColorCaptionLabel(0);
               //panValue = 2;
               disWave0 = Waves.SAW;
           }
                 //propHighlight = 1;
         }
         if(instPropRighty == 1){
           if(time0Col == 0){
             A1p.setCaptionLabel("");
           }
           if(time0Col == 1){
             A1.setCaptionLabel("");
             B1.setCaptionLabel("");
             C1.setCaptionLabel("");
             D1.setCaptionLabel("");
             E1.setCaptionLabel("");
             F1.setCaptionLabel("");
             G1.setCaptionLabel("");
             H1.setCaptionLabel("");
             for(int i = 0; i < 8; i++){
             instList1[i] = 0.0;
             }
           }
         }
         if(instPropRighty == 2){
           if(time0Col == 0){
               A1p.setCaptionLabel("P0").setColorCaptionLabel(0);
               panValue = 0;
           }
           if(time0Col == 1){
               A1p.setCaptionLabel("P1").setColorCaptionLabel(0);
               panValue = 1;
           }
           if(time0Col == 2){
               A1p.setCaptionLabel("P-1").setColorCaptionLabel(0);
               panValue = 2;
           }
                 //propHighlight = 1;
         }
       }
       
     }
     
     if(propRighty == 1){
       if(instPropUpward == 0){
         if(instPropRighty == 0){
           if(time0Col == 0){
               B1p.setCaptionLabel("G0").setColorCaptionLabel(0);
               gainValue1 = 0.5f;
           }
           if(time0Col == 1){
               B1p.setCaptionLabel("G1").setColorCaptionLabel(0);
               gainValue1 = 1.0f;
           }
           if(time0Col == 2){
               B1p.setCaptionLabel("G2").setColorCaptionLabel(0);
               gainValue1 = 1.5f;
           }
           if(time0Col == 3){
               B1p.setCaptionLabel("G3").setColorCaptionLabel(0);
               gainValue1 = 2.0f;
           }
           if(time0Col == 4){
               B1p.setCaptionLabel("G4").setColorCaptionLabel(0);
               gainValue1 = 2.5f;
           }
           if(time0Col == 5){
               B1p.setCaptionLabel("G5").setColorCaptionLabel(0);
               gainValue1 = 3.0f;
           }
                 //propHighlight = 1;
         }
         if(instPropRighty == 1){
           if(time0Col == 0){
             if (time0Row == 0){
               B1p.setCaptionLabel("Tr0").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               B1p.setCaptionLabel("Tr1").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               B1p.setCaptionLabel("Tr2").setColorCaptionLabel(0);
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               B1p.setCaptionLabel("Tr3").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               B1p.setCaptionLabel("Tr4").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               B1p.setCaptionLabel("Tr-1").setColorCaptionLabel(0);
             }
           }
           if(time0Col == 2){
             if (time0Row == 0){
               B1p.setCaptionLabel("Tr-2").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               B1p.setCaptionLabel("Tr-3").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               B1p.setCaptionLabel("Tr-4").setColorCaptionLabel(0);
             }
           }
         }
         if(instPropRighty == 2){
           if(time0Col == 0){
             if (time0Row == 0){
               B1p.setCaptionLabel("D_off").setColorCaptionLabel(0);
               delayVal1 = 0.0;
             }
             if (time0Row == 1){
               B1p.setCaptionLabel("D_on").setColorCaptionLabel(0);
               delayVal1 = 0.5;
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               B1p.setCaptionLabel("B_off").setColorCaptionLabel(0);
               bitRes1 = 0;
             }
             if (time0Row == 1){
               B1p.setCaptionLabel("B_on").setColorCaptionLabel(0);
               bitRes1 = 2;
             }
           }
         }
       }
       if(instPropUpward == 1){
         if(instPropRighty == 0){
           if(time0Col == 0){
               B1p.setCaptionLabel("Sin").setColorCaptionLabel(0);
               disWave0 = Waves.SINE;
                 //sineOsc.patch( out );
           }
           if(time0Col == 1){
               B1p.setCaptionLabel("Sq").setColorCaptionLabel(0);
               //panValue = 1;
               disWave0 =  Waves.SQUARE;
                 //sineOsc.patch( out );
           }
           if(time0Col == 2){
               B1p.setCaptionLabel("Saw").setColorCaptionLabel(0);
               //panValue = 2;
               disWave0 = Waves.SAW;
           }
                 //propHighlight = 1;
         }
         if(instPropRighty == 1){
           if(time0Col == 0){
             B1p.setCaptionLabel("");
           }
           if(time0Col == 1){
             A1.setCaptionLabel("");
             B1.setCaptionLabel("");
             C1.setCaptionLabel("");
             D1.setCaptionLabel("");
             E1.setCaptionLabel("");
             F1.setCaptionLabel("");
             G1.setCaptionLabel("");
             H1.setCaptionLabel("");
             for(int i = 0; i < 8; i++){
             instList1[i] = 0.0;
             }
           }
         }
         if(instPropRighty == 2){
           if(time0Col == 0){
               B1p.setCaptionLabel("P0").setColorCaptionLabel(0);
               panValue = 0;
           }
           if(time0Col == 1){
               B1p.setCaptionLabel("P1").setColorCaptionLabel(0);
               panValue = 1;
           }
           if(time0Col == 2){
               B1p.setCaptionLabel("P-1").setColorCaptionLabel(0);
               panValue = 2;
           }
                 //propHighlight = 1;
         }
       }
     }
     
     if(propRighty == 2){
       if(instPropUpward == 0){
         if(instPropRighty == 0){
           if(time0Col == 0){
               C1p.setCaptionLabel("G0").setColorCaptionLabel(0);
               gainValue1 = 0.5f;
           }
           if(time0Col == 1){
               C1p.setCaptionLabel("G1").setColorCaptionLabel(0);
               gainValue1 = 1.0f;
           }
           if(time0Col == 2){
               C1p.setCaptionLabel("G2").setColorCaptionLabel(0);
               gainValue1 = 1.5f;
           }
           if(time0Col == 3){
               C1p.setCaptionLabel("G3").setColorCaptionLabel(0);
               gainValue1 = 2.0f;
           }
           if(time0Col == 4){
               C1p.setCaptionLabel("G4").setColorCaptionLabel(0);
               gainValue1 = 2.5f;
           }
           if(time0Col == 5){
               C1p.setCaptionLabel("G5").setColorCaptionLabel(0);
               gainValue1 = 3.0f;
           }
                 //propHighlight = 1;
         }
         if(instPropRighty == 1){
           if(time0Col == 0){
             if (time0Row == 0){
               C1p.setCaptionLabel("Tr0").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               C1p.setCaptionLabel("Tr1").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               C1p.setCaptionLabel("Tr2").setColorCaptionLabel(0);
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               C1p.setCaptionLabel("Tr3").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               C1p.setCaptionLabel("Tr4").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               C1p.setCaptionLabel("Tr-1").setColorCaptionLabel(0);
             }
           }
           if(time0Col == 2){
             if (time0Row == 0){
               C1p.setCaptionLabel("Tr-2").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               C1p.setCaptionLabel("Tr-3").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               C1p.setCaptionLabel("Tr-4").setColorCaptionLabel(0);
             }
           }
         }
         if(instPropRighty == 2){
           if(time0Col == 0){
             if (time0Row == 0){
               C1p.setCaptionLabel("D_off").setColorCaptionLabel(0);
               delayVal1 = 0.0;
             }
             if (time0Row == 1){
               C1p.setCaptionLabel("D_on").setColorCaptionLabel(0);
               delayVal1 = 0.5;
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               C1p.setCaptionLabel("B_off").setColorCaptionLabel(0);
               bitRes1 = 0;
             }
             if (time0Row == 1){
               C1p.setCaptionLabel("B_on").setColorCaptionLabel(0);
               bitRes1 = 2;
             }
           }
         }
       }
       if(instPropUpward == 1){
         if(instPropRighty == 0){
           if(time0Col == 0){
               C1p.setCaptionLabel("Sin").setColorCaptionLabel(0);
               disWave0 = Waves.SINE;
                 //sineOsc.patch( out );
           }
           if(time0Col == 1){
               C1p.setCaptionLabel("Sq").setColorCaptionLabel(0);
               //panValue = 1;
               disWave0 =  Waves.SQUARE;
                 //sineOsc.patch( out );
           }
           if(time0Col == 2){
               C1p.setCaptionLabel("Saw").setColorCaptionLabel(0);
               //panValue = 2;
               disWave0 = Waves.SAW;
           }
                 //propHighlight = 1;
         }
         if(instPropRighty == 1){
           if(time0Col == 0){
             C1p.setCaptionLabel("");
           }
           if(time0Col == 1){
             A1.setCaptionLabel("");
             B1.setCaptionLabel("");
             C1.setCaptionLabel("");
             D1.setCaptionLabel("");
             E1.setCaptionLabel("");
             F1.setCaptionLabel("");
             G1.setCaptionLabel("");
             H1.setCaptionLabel("");
             for(int i = 0; i < 8; i++){
             instList1[i] = 0.0;
             }
           }
         }
         if(instPropRighty == 2){
           if(time0Col == 0){
               C1p.setCaptionLabel("P0").setColorCaptionLabel(0);
               panValue = 0;
           }
           if(time0Col == 1){
               C1p.setCaptionLabel("P1").setColorCaptionLabel(0);
               panValue = 1;
           }
           if(time0Col == 2){
               C1p.setCaptionLabel("P-1").setColorCaptionLabel(0);
               panValue = 2;
           }
                 //propHighlight = 1;
         }
       }
     }
     
     if(propRighty == 3){
       if(instPropUpward == 0){
         if(instPropRighty == 0){
           if(time0Col == 0){
               D1p.setCaptionLabel("G0").setColorCaptionLabel(0);
               gainValue1 = 0.5f;
           }
           if(time0Col == 1){
               D1p.setCaptionLabel("G1").setColorCaptionLabel(0);
               gainValue1 = 1.0f;
           }
           if(time0Col == 2){
               D1p.setCaptionLabel("G2").setColorCaptionLabel(0);
               gainValue1 = 1.5f;
           }
           if(time0Col == 3){
               D1p.setCaptionLabel("G3").setColorCaptionLabel(0);
               gainValue1 = 2.0f;
           }
           if(time0Col == 4){
               D1p.setCaptionLabel("G4").setColorCaptionLabel(0);
               gainValue1 = 2.5f;
           }
           if(time0Col == 5){
               D1p.setCaptionLabel("G5").setColorCaptionLabel(0);
               gainValue1 = 3.0f;
           }
                 //propHighlight = 1;
         }
         if(instPropRighty == 1){
           if(time0Col == 0){
             if (time0Row == 0){
               D1p.setCaptionLabel("Tr0").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               D1p.setCaptionLabel("Tr1").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               D1p.setCaptionLabel("Tr2").setColorCaptionLabel(0);
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               D1p.setCaptionLabel("Tr3").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               D1p.setCaptionLabel("Tr4").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               D1p.setCaptionLabel("Tr-1").setColorCaptionLabel(0);
             }
           }
           if(time0Col == 2){
             if (time0Row == 0){
               D1p.setCaptionLabel("Tr-2").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               D1p.setCaptionLabel("Tr-3").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               D1p.setCaptionLabel("Tr-4").setColorCaptionLabel(0);
             }
           }
         }
         if(instPropRighty == 2){
           if(time0Col == 0){
             if (time0Row == 0){
               D1p.setCaptionLabel("D_off").setColorCaptionLabel(0);
               delayVal1 = 0.0;
             }
             if (time0Row == 1){
               D1p.setCaptionLabel("D_on").setColorCaptionLabel(0);
               delayVal1 = 0.5;
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               D1p.setCaptionLabel("B_off").setColorCaptionLabel(0);
               bitRes1 = 0;
             }
             if (time0Row == 1){
               D1p.setCaptionLabel("B_on").setColorCaptionLabel(0);
               bitRes1 = 2;
             }
           }
         }
       }
       if(instPropUpward == 1){
         if(instPropRighty == 0){
           if(time0Col == 0){
               D1p.setCaptionLabel("Sin").setColorCaptionLabel(0);
               disWave0 = Waves.SINE;
                 //sineOsc.patch( out );
           }
           if(time0Col == 1){
               D1p.setCaptionLabel("Sq").setColorCaptionLabel(0);
               //panValue = 1;
               disWave0 =  Waves.SQUARE;
                 //sineOsc.patch( out );
           }
           if(time0Col == 2){
               D1p.setCaptionLabel("Saw").setColorCaptionLabel(0);
               //panValue = 2;
               disWave0 = Waves.SAW;
           }
                 //propHighlight = 1;
         }
         if(instPropRighty == 1){
           if(time0Col == 0){
             D1p.setCaptionLabel("");
           }
           if(time0Col == 1){
             A1.setCaptionLabel("");
             B1.setCaptionLabel("");
             C1.setCaptionLabel("");
             D1.setCaptionLabel("");
             E1.setCaptionLabel("");
             F1.setCaptionLabel("");
             G1.setCaptionLabel("");
             H1.setCaptionLabel("");
             for(int i = 0; i < 8; i++){
             instList1[i] = 0.0;
             }
           }
         }
         if(instPropRighty == 2){
           if(time0Col == 0){
               D1p.setCaptionLabel("P0").setColorCaptionLabel(0);
               panValue = 0;
           }
           if(time0Col == 1){
               D1p.setCaptionLabel("P1").setColorCaptionLabel(0);
               panValue = 1;
           }
           if(time0Col == 2){
               D1p.setCaptionLabel("P-1").setColorCaptionLabel(0);
               panValue = 2;
           }
                 //propHighlight = 1;
         }
       }
     }
     
     if(propRighty == 4){
       if(instPropUpward == 0){
         if(instPropRighty == 0){
           if(time0Col == 0){
               E1p.setCaptionLabel("G0").setColorCaptionLabel(0);
               gainValue1 = 0.5f;
           }
           if(time0Col == 1){
               E1p.setCaptionLabel("G1").setColorCaptionLabel(0);
               gainValue1 = 1.0f;
           }
           if(time0Col == 2){
               E1p.setCaptionLabel("G2").setColorCaptionLabel(0);
               gainValue1 = 1.5f;
           }
           if(time0Col == 3){
               E1p.setCaptionLabel("G3").setColorCaptionLabel(0);
               gainValue1 = 2.0f;
           }
           if(time0Col == 4){
               E1p.setCaptionLabel("G4").setColorCaptionLabel(0);
               gainValue1 = 2.5f;
           }
           if(time0Col == 5){
               E1p.setCaptionLabel("G5").setColorCaptionLabel(0);
               gainValue1 = 3.0f;
           }
                 //propHighlight = 1;
         }
         if(instPropRighty == 1){
           if(time0Col == 0){
             if (time0Row == 0){
               E1p.setCaptionLabel("Tr0").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               E1p.setCaptionLabel("Tr1").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               E1p.setCaptionLabel("Tr2").setColorCaptionLabel(0);
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               E1p.setCaptionLabel("Tr3").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               E1p.setCaptionLabel("Tr4").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               E1p.setCaptionLabel("Tr-1").setColorCaptionLabel(0);
             }
           }
           if(time0Col == 2){
             if (time0Row == 0){
               E1p.setCaptionLabel("Tr-2").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               E1p.setCaptionLabel("Tr-3").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               E1p.setCaptionLabel("Tr-4").setColorCaptionLabel(0);
             }
           }
         }
         if(instPropRighty == 2){
           if(time0Col == 0){
             if (time0Row == 0){
               E1p.setCaptionLabel("D_off").setColorCaptionLabel(0);
               delayVal1 = 0.0;
             }
             if (time0Row == 1){
               E1p.setCaptionLabel("D_on").setColorCaptionLabel(0);
               delayVal1 = 0.5;
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               E1p.setCaptionLabel("B_off").setColorCaptionLabel(0);
               bitRes1 = 0;
             }
             if (time0Row == 1){
               E1p.setCaptionLabel("B_on").setColorCaptionLabel(0);
               bitRes1 = 2;
             }
           }
         }
       }
       if(instPropUpward == 1){
         if(instPropRighty == 0){
           if(time0Col == 0){
               E1p.setCaptionLabel("Sin").setColorCaptionLabel(0);
               disWave0 = Waves.SINE;
                 //sineOsc.patch( out );
           }
           if(time0Col == 1){
               E1p.setCaptionLabel("Sq").setColorCaptionLabel(0);
               //panValue = 1;
               disWave0 =  Waves.SQUARE;
                 //sineOsc.patch( out );
           }
           if(time0Col == 2){
               E1p.setCaptionLabel("Saw").setColorCaptionLabel(0);
               //panValue = 2;
               disWave0 = Waves.SAW;
           }
                 //propHighlight = 1;
         }
         if(instPropRighty == 1){
           if(time0Col == 0){
             E1p.setCaptionLabel("");
           }
           if(time0Col == 1){
             A1.setCaptionLabel("");
             B1.setCaptionLabel("");
             C1.setCaptionLabel("");
             D1.setCaptionLabel("");
             E1.setCaptionLabel("");
             F1.setCaptionLabel("");
             G1.setCaptionLabel("");
             H1.setCaptionLabel("");
             for(int i = 0; i < 8; i++){
             instList1[i] = 0.0;
             }
           }
         }
         if(instPropRighty == 2){
           if(time0Col == 0){
               E1p.setCaptionLabel("P0").setColorCaptionLabel(0);
               panValue = 0;
           }
           if(time0Col == 1){
               E1p.setCaptionLabel("P1").setColorCaptionLabel(0);
               panValue = 1;
           }
           if(time0Col == 2){
               E1p.setCaptionLabel("P-1").setColorCaptionLabel(0);
               panValue = 2;
           }
                 //propHighlight = 1;
         }
       }
     }
     
     if(propRighty == 5){
       if(instPropUpward == 0){
         if(instPropRighty == 0){
           if(time0Col == 0){
               F1p.setCaptionLabel("G0").setColorCaptionLabel(0);
               gainValue1 = 0.5f;
           }
           if(time0Col == 1){
               F1p.setCaptionLabel("G1").setColorCaptionLabel(0);
               gainValue1 = 1.0f;
           }
           if(time0Col == 2){
               F1p.setCaptionLabel("G2").setColorCaptionLabel(0);
               gainValue1 = 1.5f;
           }
           if(time0Col == 3){
               F1p.setCaptionLabel("G3").setColorCaptionLabel(0);
               gainValue1 = 2.0f;
           }
           if(time0Col == 4){
               F1p.setCaptionLabel("G4").setColorCaptionLabel(0);
               gainValue1 = 2.5f;
           }
           if(time0Col == 5){
               F1p.setCaptionLabel("G5").setColorCaptionLabel(0);
               gainValue1 = 3.0f;
           }
                 //propHighlight = 1;
         }
         if(instPropRighty == 1){
           if(time0Col == 0){
             if (time0Row == 0){
               F1p.setCaptionLabel("Tr0").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               F1p.setCaptionLabel("Tr1").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               F1p.setCaptionLabel("Tr2").setColorCaptionLabel(0);
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               F1p.setCaptionLabel("Tr3").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               F1p.setCaptionLabel("Tr4").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               F1p.setCaptionLabel("Tr-1").setColorCaptionLabel(0);
             }
           }
           if(time0Col == 2){
             if (time0Row == 0){
               F1p.setCaptionLabel("Tr-2").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               F1p.setCaptionLabel("Tr-3").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               F1p.setCaptionLabel("Tr-4").setColorCaptionLabel(0);
             }
           }
         }
         if(instPropRighty == 2){
           if(time0Col == 0){
             if (time0Row == 0){
               F1p.setCaptionLabel("D_off").setColorCaptionLabel(0);
               delayVal1 = 0.0;
             }
             if (time0Row == 1){
               F1p.setCaptionLabel("D_on").setColorCaptionLabel(0);
               delayVal1 = 0.5;
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               F1p.setCaptionLabel("B_off").setColorCaptionLabel(0);
               bitRes1 = 0;
             }
             if (time0Row == 1){
               F1p.setCaptionLabel("B_on").setColorCaptionLabel(0);
               bitRes1 = 2;
             }
           }
         }
       }
       if(instPropUpward == 1){
         if(instPropRighty == 0){
           if(time0Col == 0){
               F1p.setCaptionLabel("Sin").setColorCaptionLabel(0);
               disWave0 = Waves.SINE;
                 //sineOsc.patch( out );
           }
           if(time0Col == 1){
               F1p.setCaptionLabel("Sq").setColorCaptionLabel(0);
               //panValue = 1;
               disWave0 =  Waves.SQUARE;
                 //sineOsc.patch( out );
           }
           if(time0Col == 2){
               F1p.setCaptionLabel("Saw").setColorCaptionLabel(0);
               //panValue = 2;
               disWave0 = Waves.SAW;
           }
                 //propHighlight = 1;
         }
         if(instPropRighty == 1){
           if(time0Col == 0){
             F1p.setCaptionLabel("");
           }
           if(time0Col == 1){
             A1.setCaptionLabel("");
             B1.setCaptionLabel("");
             C1.setCaptionLabel("");
             D1.setCaptionLabel("");
             E1.setCaptionLabel("");
             F1.setCaptionLabel("");
             G1.setCaptionLabel("");
             H1.setCaptionLabel("");
             for(int i = 0; i < 8; i++){
             instList1[i] = 0.0;
             }
           }
         }
         if(instPropRighty == 2){
           if(time0Col == 0){
               F1p.setCaptionLabel("P0").setColorCaptionLabel(0);
               panValue = 0;
           }
           if(time0Col == 1){
               F1p.setCaptionLabel("P1").setColorCaptionLabel(0);
               panValue = 1;
           }
           if(time0Col == 2){
               F1p.setCaptionLabel("P-1").setColorCaptionLabel(0);
               panValue = 2;
           }
                 //propHighlight = 1;
         }
       }
     }
   }
   
   
   if(propUpward == 2){
     if(propRighty == 0){
       if(instPropUpward == 0){
         if(instPropRighty == 0){
           if(time0Col == 0){
               A2p.setCaptionLabel("G0").setColorCaptionLabel(0);
               gainValue2 = 0.5f;
           }
           if(time0Col == 1){
               A2p.setCaptionLabel("G1").setColorCaptionLabel(0);
               gainValue2 = 1.0f;
           }
           if(time0Col == 2){
               A2p.setCaptionLabel("G2").setColorCaptionLabel(0);
               gainValue2 = 1.5f;
           }
           if(time0Col == 3){
               A2p.setCaptionLabel("G3").setColorCaptionLabel(0);
               gainValue2 = 2.0f;
           }
           if(time0Col == 4){
               A2p.setCaptionLabel("G4").setColorCaptionLabel(0);
               gainValue2 = 2.5f;
           }
           if(time0Col == 5){
               A2p.setCaptionLabel("G5").setColorCaptionLabel(0);
               gainValue2 = 3.0f;
           }
                 //propHighlight = 1;
         }
         if(instPropRighty == 1){
           if(time0Col == 0){
             if (time0Row == 0){
               A2p.setCaptionLabel("Tr0").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               A2p.setCaptionLabel("Tr1").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               A2p.setCaptionLabel("Tr2").setColorCaptionLabel(0);
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               A2p.setCaptionLabel("Tr3").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               A2p.setCaptionLabel("Tr4").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               A2p.setCaptionLabel("Tr-1").setColorCaptionLabel(0);
             }
           }
           if(time0Col == 2){
             if (time0Row == 0){
               A2p.setCaptionLabel("Tr-2").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               A2p.setCaptionLabel("Tr-3").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               A2p.setCaptionLabel("Tr-4").setColorCaptionLabel(0);
             }
           }
         }
         if(instPropRighty == 2){
           if(time0Col == 0){
             if (time0Row == 0){
               A2p.setCaptionLabel("D_off").setColorCaptionLabel(0);
               delayVal2 = 0.0;
             }
             if (time0Row == 1){
               A2p.setCaptionLabel("D_on").setColorCaptionLabel(0);
               delayVal2 = 0.5;
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               A2p.setCaptionLabel("B_off").setColorCaptionLabel(0);
               bitRes2 = 0;
             }
             if (time0Row == 1){
               A2p.setCaptionLabel("B_on").setColorCaptionLabel(0);
               bitRes2 = 2;
             }
           }
         }
       }
       if(instPropUpward == 1){
         if(instPropRighty == 0){
           if(time0Col == 0){
               A2p.setCaptionLabel("Sin").setColorCaptionLabel(0);
               disWave0 = Waves.SINE;
                 //sineOsc.patch( out );
           }
           if(time0Col == 1){
               A2p.setCaptionLabel("Sq").setColorCaptionLabel(0);
               //panValue = 1;
               disWave0 =  Waves.SQUARE;
                 //sineOsc.patch( out );
           }
           if(time0Col == 2){
               A2p.setCaptionLabel("Saw").setColorCaptionLabel(0);
               //panValue = 2;
               disWave0 = Waves.SAW;
           }
                 //propHighlight = 1;
         }
         if(instPropRighty == 1){
           if(time0Col == 0){
             A2p.setCaptionLabel("");
           }
           if(time0Col == 1){
             A2.setCaptionLabel("");
             B2.setCaptionLabel("");
             C2.setCaptionLabel("");
             D2.setCaptionLabel("");
             E2.setCaptionLabel("");
             F2.setCaptionLabel("");
             G2.setCaptionLabel("");
             H2.setCaptionLabel("");
             for(int i = 0; i < 8; i++){
               instList2[i] = 0.0;
             }
           }
         }
         if(instPropRighty == 2){
           if(time0Col == 0){
               A2p.setCaptionLabel("P0").setColorCaptionLabel(0);
               panValue = 0;
           }
           if(time0Col == 1){
               A2p.setCaptionLabel("P1").setColorCaptionLabel(0);
               panValue = 1;
           }
           if(time0Col == 2){
               A2p.setCaptionLabel("P-1").setColorCaptionLabel(0);
               panValue = 2;
           }
                 //propHighlight = 1;
         }
       }
       
     }
     
     if(propRighty == 1){
       if(instPropUpward == 0){
         if(instPropRighty == 0){
           if(time0Col == 0){
               B2p.setCaptionLabel("G0").setColorCaptionLabel(0);
               gainValue2 = 0.5f;
           }
           if(time0Col == 1){
               B2p.setCaptionLabel("G1").setColorCaptionLabel(0);
               gainValue2 = 1.0f;
           }
           if(time0Col == 2){
               B2p.setCaptionLabel("G2").setColorCaptionLabel(0);
               gainValue2 = 1.5f;
           }
           if(time0Col == 3){
               B2p.setCaptionLabel("G3").setColorCaptionLabel(0);
               gainValue2 = 2.0f;
           }
           if(time0Col == 4){
               B2p.setCaptionLabel("G4").setColorCaptionLabel(0);
               gainValue2 = 2.5f;
           }
           if(time0Col == 5){
               B2p.setCaptionLabel("G5").setColorCaptionLabel(0);
               gainValue2 = 3.0f;
           }
                 //propHighlight = 1;
         }
         if(instPropRighty == 1){
           if(time0Col == 0){
             if (time0Row == 0){
               B2p.setCaptionLabel("Tr0").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               B2p.setCaptionLabel("Tr1").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               B2p.setCaptionLabel("Tr2").setColorCaptionLabel(0);
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               B2p.setCaptionLabel("Tr3").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               B2p.setCaptionLabel("Tr4").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               B2p.setCaptionLabel("Tr-1").setColorCaptionLabel(0);
             }
           }
           if(time0Col == 2){
             if (time0Row == 0){
               B2p.setCaptionLabel("Tr-2").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               B2p.setCaptionLabel("Tr-3").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               B2p.setCaptionLabel("Tr-4").setColorCaptionLabel(0);
             }
           }
         }
         if(instPropRighty == 2){
           if(time0Col == 0){
             if (time0Row == 0){
               B2p.setCaptionLabel("D_off").setColorCaptionLabel(0);
               delayVal2 = 0.0;
             }
             if (time0Row == 1){
               B2p.setCaptionLabel("D_on").setColorCaptionLabel(0);
               delayVal2 = 0.5;
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               B2p.setCaptionLabel("B_off").setColorCaptionLabel(0);
               bitRes2 = 0;
             }
             if (time0Row == 1){
               B2p.setCaptionLabel("B_on").setColorCaptionLabel(0);
               bitRes2 = 2;
             }
           }
         }
       }
       if(instPropUpward == 1){
         if(instPropRighty == 0){
           if(time0Col == 0){
               B2p.setCaptionLabel("Sin").setColorCaptionLabel(0);
               disWave0 = Waves.SINE;
                 //sineOsc.patch( out );
           }
           if(time0Col == 1){
               B2p.setCaptionLabel("Sq").setColorCaptionLabel(0);
               //panValue = 1;
               disWave0 =  Waves.SQUARE;
                 //sineOsc.patch( out );
           }
           if(time0Col == 2){
               B2p.setCaptionLabel("Saw").setColorCaptionLabel(0);
               //panValue = 2;
               disWave0 = Waves.SAW;
           }
                 //propHighlight = 1;
         }
         if(instPropRighty == 1){
           if(time0Col == 0){
             B2p.setCaptionLabel("");
           }
           if(time0Col == 1){
             A2.setCaptionLabel("");
             B2.setCaptionLabel("");
             C2.setCaptionLabel("");
             D2.setCaptionLabel("");
             E2.setCaptionLabel("");
             F2.setCaptionLabel("");
             G2.setCaptionLabel("");
             H2.setCaptionLabel("");
             for(int i = 0; i < 8; i++){
               instList2[i] = 0.0;
             }
           }
         }
         if(instPropRighty == 2){
           if(time0Col == 0){
               B2p.setCaptionLabel("P0").setColorCaptionLabel(0);
               panValue = 0;
           }
           if(time0Col == 1){
               B2p.setCaptionLabel("P1").setColorCaptionLabel(0);
               panValue = 1;
           }
           if(time0Col == 2){
               B2p.setCaptionLabel("P-1").setColorCaptionLabel(0);
               panValue = 2;
           }
                 //propHighlight = 1;
         }
       }
     }
     
     if(propRighty == 2){
       if(instPropUpward == 0){
         if(instPropRighty == 0){
           if(time0Col == 0){
               C2p.setCaptionLabel("G0").setColorCaptionLabel(0);
               gainValue2 = 0.5f;
           }
           if(time0Col == 1){
               C2p.setCaptionLabel("G1").setColorCaptionLabel(0);
               gainValue2 = 1.0f;
           }
           if(time0Col == 2){
               C2p.setCaptionLabel("G2").setColorCaptionLabel(0);
               gainValue2 = 1.5f;
           }
           if(time0Col == 3){
               C2p.setCaptionLabel("G3").setColorCaptionLabel(0);
               gainValue2 = 2.0f;
           }
           if(time0Col == 4){
               C2p.setCaptionLabel("G4").setColorCaptionLabel(0);
               gainValue2 = 2.5f;
           }
           if(time0Col == 5){
               C2p.setCaptionLabel("G5").setColorCaptionLabel(0);
               gainValue2 = 3.0f;
           }
                 //propHighlight = 1;
         }
         if(instPropRighty == 1){
           if(time0Col == 0){
             if (time0Row == 0){
               C2p.setCaptionLabel("Tr0").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               C2p.setCaptionLabel("Tr1").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               C2p.setCaptionLabel("Tr2").setColorCaptionLabel(0);
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               C2p.setCaptionLabel("Tr3").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               C2p.setCaptionLabel("Tr4").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               C2p.setCaptionLabel("Tr-1").setColorCaptionLabel(0);
             }
           }
           if(time0Col == 2){
             if (time0Row == 0){
               C2p.setCaptionLabel("Tr-2").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               C2p.setCaptionLabel("Tr-3").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               C2p.setCaptionLabel("Tr-4").setColorCaptionLabel(0);
             }
           }
         }
         if(instPropRighty == 2){
           if(time0Col == 0){
             if (time0Row == 0){
               C2p.setCaptionLabel("D_off").setColorCaptionLabel(0);
               delayVal2 = 0.0;
             }
             if (time0Row == 1){
               C2p.setCaptionLabel("D_on").setColorCaptionLabel(0);
               delayVal2 = 0.5;
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               C2p.setCaptionLabel("B_off").setColorCaptionLabel(0);
               bitRes2 = 0;
             }
             if (time0Row == 1){
               C2p.setCaptionLabel("B_on").setColorCaptionLabel(0);
               bitRes2 = 2;
             }
           }
         }
       }
       if(instPropUpward == 1){
         if(instPropRighty == 0){
           if(time0Col == 0){
               C2p.setCaptionLabel("Sin").setColorCaptionLabel(0);
               disWave0 = Waves.SINE;
                 //sineOsc.patch( out );
           }
           if(time0Col == 1){
               C2p.setCaptionLabel("Sq").setColorCaptionLabel(0);
               //panValue = 1;
               disWave0 =  Waves.SQUARE;
                 //sineOsc.patch( out );
           }
           if(time0Col == 2){
               C2p.setCaptionLabel("Saw").setColorCaptionLabel(0);
               //panValue = 2;
               disWave0 = Waves.SAW;
           }
                 //propHighlight = 1;
         }
         if(instPropRighty == 1){
           if(time0Col == 0){
             C2p.setCaptionLabel("");
           }
           if(time0Col == 1){
             A2.setCaptionLabel("");
             B2.setCaptionLabel("");
             C2.setCaptionLabel("");
             D2.setCaptionLabel("");
             E2.setCaptionLabel("");
             F2.setCaptionLabel("");
             G2.setCaptionLabel("");
             H2.setCaptionLabel("");
             for(int i = 0; i < 8; i++){
               instList2[i] = 0.0;
             }
           }
         }
         if(instPropRighty == 2){
           if(time0Col == 0){
               C2p.setCaptionLabel("P0").setColorCaptionLabel(0);
               panValue = 0;
           }
           if(time0Col == 1){
               C2p.setCaptionLabel("P1").setColorCaptionLabel(0);
               panValue = 1;
           }
           if(time0Col == 2){
               C2p.setCaptionLabel("P-1").setColorCaptionLabel(0);
               panValue = 2;
           }
                 //propHighlight = 1;
         }
       }
     }
     
     if(propRighty == 3){
       if(instPropUpward == 0){
         if(instPropRighty == 0){
           if(time0Col == 0){
               D2p.setCaptionLabel("G0").setColorCaptionLabel(0);
               gainValue2 = 0.5f;
           }
           if(time0Col == 1){
               D2p.setCaptionLabel("G1").setColorCaptionLabel(0);
               gainValue2 = 1.0f;
           }
           if(time0Col == 2){
               D2p.setCaptionLabel("G2").setColorCaptionLabel(0);
               gainValue2 = 1.5f;
           }
           if(time0Col == 3){
               D2p.setCaptionLabel("G3").setColorCaptionLabel(0);
               gainValue2 = 2.0f;
           }
           if(time0Col == 4){
               D2p.setCaptionLabel("G4").setColorCaptionLabel(0);
               gainValue2 = 2.5f;
           }
           if(time0Col == 5){
               D2p.setCaptionLabel("G5").setColorCaptionLabel(0);
               gainValue2 = 3.0f;
           }
                 //propHighlight = 1;
         }
         if(instPropRighty == 1){
           if(time0Col == 0){
             if (time0Row == 0){
               D2p.setCaptionLabel("Tr0").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               D2p.setCaptionLabel("Tr1").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               D2p.setCaptionLabel("Tr2").setColorCaptionLabel(0);
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               D2p.setCaptionLabel("Tr3").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               D2p.setCaptionLabel("Tr4").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               D2p.setCaptionLabel("Tr-1").setColorCaptionLabel(0);
             }
           }
           if(time0Col == 2){
             if (time0Row == 0){
               D2p.setCaptionLabel("Tr-2").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               D2p.setCaptionLabel("Tr-3").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               D2p.setCaptionLabel("Tr-4").setColorCaptionLabel(0);
             }
           }
         }
         if(instPropRighty == 2){
           if(time0Col == 0){
             if (time0Row == 0){
               D2p.setCaptionLabel("D_off").setColorCaptionLabel(0);
               delayVal2 = 0.0;
             }
             if (time0Row == 1){
               D2p.setCaptionLabel("D_on").setColorCaptionLabel(0);
               delayVal2 = 0.5;
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               D2p.setCaptionLabel("B_off").setColorCaptionLabel(0);
               bitRes2 = 0;
             }
             if (time0Row == 1){
               D2p.setCaptionLabel("B_on").setColorCaptionLabel(0);
               bitRes2 = 2;
             }
           }
         }
       }
       if(instPropUpward == 1){
         if(instPropRighty == 0){
           if(time0Col == 0){
               D2p.setCaptionLabel("Sin").setColorCaptionLabel(0);
               disWave0 = Waves.SINE;
                 //sineOsc.patch( out );
           }
           if(time0Col == 1){
               D2p.setCaptionLabel("Sq").setColorCaptionLabel(0);
               //panValue = 1;
               disWave0 =  Waves.SQUARE;
                 //sineOsc.patch( out );
           }
           if(time0Col == 2){
               D2p.setCaptionLabel("Saw").setColorCaptionLabel(0);
               //panValue = 2;
               disWave0 = Waves.SAW;
           }
                 //propHighlight = 1;
         }
         if(instPropRighty == 1){
           if(time0Col == 0){
             D2p.setCaptionLabel("");
           }
           if(time0Col == 1){
             A2.setCaptionLabel("");
             B2.setCaptionLabel("");
             C2.setCaptionLabel("");
             D2.setCaptionLabel("");
             E2.setCaptionLabel("");
             F2.setCaptionLabel("");
             G2.setCaptionLabel("");
             H2.setCaptionLabel("");
             for(int i = 0; i < 8; i++){
               instList2[i] = 0.0;
             }
           }
         }
         if(instPropRighty == 2){
           if(time0Col == 0){
               D2p.setCaptionLabel("P0").setColorCaptionLabel(0);
               panValue = 0;
           }
           if(time0Col == 1){
               D2p.setCaptionLabel("P1").setColorCaptionLabel(0);
               panValue = 1;
           }
           if(time0Col == 2){
               D2p.setCaptionLabel("P-1").setColorCaptionLabel(0);
               panValue = 2;
           }
                 //propHighlight = 1;
         }
       }
     }
     
     if(propRighty == 4){
       if(instPropUpward == 0){
         if(instPropRighty == 0){
           if(time0Col == 0){
               E2p.setCaptionLabel("G0").setColorCaptionLabel(0);
               gainValue2 = 0.5f;
           }
           if(time0Col == 1){
               E2p.setCaptionLabel("G1").setColorCaptionLabel(0);
               gainValue2 = 1.0f;
           }
           if(time0Col == 2){
               E2p.setCaptionLabel("G2").setColorCaptionLabel(0);
               gainValue2 = 1.5f;
           }
           if(time0Col == 3){
               E2p.setCaptionLabel("G3").setColorCaptionLabel(0);
               gainValue2 = 2.0f;
           }
           if(time0Col == 4){
               E2p.setCaptionLabel("G4").setColorCaptionLabel(0);
               gainValue2 = 2.5f;
           }
           if(time0Col == 5){
               E2p.setCaptionLabel("G5").setColorCaptionLabel(0);
               gainValue2 = 3.0f;
           }
                 //propHighlight = 1;
         }
         if(instPropRighty == 1){
           if(time0Col == 0){
             if (time0Row == 0){
               E2p.setCaptionLabel("Tr0").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               E2p.setCaptionLabel("Tr1").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               E2p.setCaptionLabel("Tr2").setColorCaptionLabel(0);
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               E2p.setCaptionLabel("Tr3").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               E2p.setCaptionLabel("Tr4").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               E2p.setCaptionLabel("Tr-1").setColorCaptionLabel(0);
             }
           }
           if(time0Col == 2){
             if (time0Row == 0){
               E2p.setCaptionLabel("Tr-2").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               E2p.setCaptionLabel("Tr-3").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               E2p.setCaptionLabel("Tr-4").setColorCaptionLabel(0);
             }
           }
         }
         if(instPropRighty == 2){
           if(time0Col == 0){
             if (time0Row == 0){
               E2p.setCaptionLabel("D_off").setColorCaptionLabel(0);
               delayVal2 = 0.0;
             }
             if (time0Row == 1){
               E2p.setCaptionLabel("D_on").setColorCaptionLabel(0);
               delayVal2 = 0.5;
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               E2p.setCaptionLabel("B_off").setColorCaptionLabel(0);
               bitRes2 = 0;
             }
             if (time0Row == 1){
               E2p.setCaptionLabel("B_on").setColorCaptionLabel(0);
               bitRes2 = 2;
             }
           }
         }
       }
       if(instPropUpward == 1){
         if(instPropRighty == 0){
           if(time0Col == 0){
               E2p.setCaptionLabel("Sin").setColorCaptionLabel(0);
               disWave0 = Waves.SINE;
                 //sineOsc.patch( out );
           }
           if(time0Col == 1){
               E2p.setCaptionLabel("Sq").setColorCaptionLabel(0);
               //panValue = 1;
               disWave0 =  Waves.SQUARE;
                 //sineOsc.patch( out );
           }
           if(time0Col == 2){
               E2p.setCaptionLabel("Saw").setColorCaptionLabel(0);
               //panValue = 2;
               disWave0 = Waves.SAW;
           }
                 //propHighlight = 1;
         }
         if(instPropRighty == 1){
           if(time0Col == 0){
             E2p.setCaptionLabel("");
           }
           if(time0Col == 1){
             A2.setCaptionLabel("");
             B2.setCaptionLabel("");
             C2.setCaptionLabel("");
             D2.setCaptionLabel("");
             E2.setCaptionLabel("");
             F2.setCaptionLabel("");
             G2.setCaptionLabel("");
             H2.setCaptionLabel("");
             for(int i = 0; i < 8; i++){
               instList2[i] = 0.0;
             }
           }
         }
         if(instPropRighty == 2){
           if(time0Col == 0){
               E2p.setCaptionLabel("P0").setColorCaptionLabel(0);
               panValue = 0;
           }
           if(time0Col == 1){
               E2p.setCaptionLabel("P1").setColorCaptionLabel(0);
               panValue = 1;
           }
           if(time0Col == 2){
               E2p.setCaptionLabel("P-1").setColorCaptionLabel(0);
               panValue = 2;
           }
                 //propHighlight = 1;
         }
       }
     }
     
     if(propRighty == 5){
       if(instPropUpward == 0){
         if(instPropRighty == 0){
           if(time0Col == 0){
               F2p.setCaptionLabel("G0").setColorCaptionLabel(0);
               gainValue2 = 0.5f;
           }
           if(time0Col == 1){
               F2p.setCaptionLabel("G1").setColorCaptionLabel(0);
               gainValue2 = 1.0f;
           }
           if(time0Col == 2){
               F2p.setCaptionLabel("G2").setColorCaptionLabel(0);
               gainValue2 = 1.5f;
           }
           if(time0Col == 3){
               F2p.setCaptionLabel("G3").setColorCaptionLabel(0);
               gainValue2 = 2.0f;
           }
           if(time0Col == 4){
               F2p.setCaptionLabel("G4").setColorCaptionLabel(0);
               gainValue2 = 2.5f;
           }
           if(time0Col == 5){
               F2p.setCaptionLabel("G5").setColorCaptionLabel(0);
               gainValue2 = 3.0f;
           }
                 //propHighlight = 1;
         }
         if(instPropRighty == 1){
           if(time0Col == 0){
             if (time0Row == 0){
               F2p.setCaptionLabel("Tr0").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               F2p.setCaptionLabel("Tr1").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               F2p.setCaptionLabel("Tr2").setColorCaptionLabel(0);
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               F2p.setCaptionLabel("Tr3").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               F2p.setCaptionLabel("Tr4").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               F2p.setCaptionLabel("Tr-1").setColorCaptionLabel(0);
             }
           }
           if(time0Col == 2){
             if (time0Row == 0){
               F2p.setCaptionLabel("Tr-2").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               F2p.setCaptionLabel("Tr-3").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               F2p.setCaptionLabel("Tr-4").setColorCaptionLabel(0);
             }
           }
         }
         if(instPropRighty == 2){
           if(time0Col == 0){
             if (time0Row == 0){
               F2p.setCaptionLabel("D_off").setColorCaptionLabel(0);
               delayVal2 = 0.0;
             }
             if (time0Row == 1){
               F2p.setCaptionLabel("D_on").setColorCaptionLabel(0);
               delayVal2 = 0.5;
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               F2p.setCaptionLabel("B_off").setColorCaptionLabel(0);
               bitRes2 = 0;
             }
             if (time0Row == 1){
               F2p.setCaptionLabel("B_on").setColorCaptionLabel(0);
               bitRes2 = 2;
             }
           }
         }
       }
       if(instPropUpward == 1){
         if(instPropRighty == 0){
           if(time0Col == 0){
               F2p.setCaptionLabel("Sin").setColorCaptionLabel(0);
               disWave0 = Waves.SINE;
                 //sineOsc.patch( out );
           }
           if(time0Col == 1){
               F2p.setCaptionLabel("Sq").setColorCaptionLabel(0);
               //panValue = 1;
               disWave0 =  Waves.SQUARE;
                 //sineOsc.patch( out );
           }
           if(time0Col == 2){
               F2p.setCaptionLabel("Saw").setColorCaptionLabel(0);
               //panValue = 2;
               disWave0 = Waves.SAW;
           }
                 //propHighlight = 1;
         }
         if(instPropRighty == 1){
           if(time0Col == 0){
             F2p.setCaptionLabel("");
           }
           if(time0Col == 1){
             A2.setCaptionLabel("");
             B2.setCaptionLabel("");
             C2.setCaptionLabel("");
             D2.setCaptionLabel("");
             E2.setCaptionLabel("");
             F2.setCaptionLabel("");
             G2.setCaptionLabel("");
             H2.setCaptionLabel("");
             for(int i = 0; i < 8; i++){
               instList2[i] = 0.0;
             }
           }
         }
         if(instPropRighty == 2){
           if(time0Col == 0){
               F2p.setCaptionLabel("P0").setColorCaptionLabel(0);
               panValue = 0;
           }
           if(time0Col == 1){
               F2p.setCaptionLabel("P1").setColorCaptionLabel(0);
               panValue = 1;
           }
           if(time0Col == 2){
               F2p.setCaptionLabel("P-1").setColorCaptionLabel(0);
               panValue = 2;
           }
                 //propHighlight = 1;
         }
       }
     }
   }
   
   
   if(propUpward == 3){
     if(propRighty == 0){
       if(instPropUpward == 0){
         if(instPropRighty == 0){
           if(time0Col == 0){
               A3p.setCaptionLabel("G0").setColorCaptionLabel(0);
               gainValue3 = 0.5f;
           }
           if(time0Col == 1){
               A3p.setCaptionLabel("G1").setColorCaptionLabel(0);
               gainValue3 = 1.0f;
           }
           if(time0Col == 2){
               A3p.setCaptionLabel("G2").setColorCaptionLabel(0);
               gainValue3 = 1.5f;
           }
           if(time0Col == 3){
               A3p.setCaptionLabel("G3").setColorCaptionLabel(0);
               gainValue3 = 2.0f;
           }
           if(time0Col == 4){
               A3p.setCaptionLabel("G4").setColorCaptionLabel(0);
               gainValue3 = 2.5f;
           }
           if(time0Col == 5){
               A3p.setCaptionLabel("G5").setColorCaptionLabel(0);
               gainValue3 = 3.0f;
           }
                 //propHighlight = 1;
         }
         if(instPropRighty == 1){
           if(time0Col == 0){
             if (time0Row == 0){
               A3p.setCaptionLabel("Tr0").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               A3p.setCaptionLabel("Tr1").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               A3p.setCaptionLabel("Tr2").setColorCaptionLabel(0);
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               A3p.setCaptionLabel("Tr3").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               A3p.setCaptionLabel("Tr4").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               A3p.setCaptionLabel("Tr-1").setColorCaptionLabel(0);
             }
           }
           if(time0Col == 2){
             if (time0Row == 0){
               A3p.setCaptionLabel("Tr-2").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               A3p.setCaptionLabel("Tr-3").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               A3p.setCaptionLabel("Tr-4").setColorCaptionLabel(0);
             }
           }
         }
         if(instPropRighty == 2){
           if(time0Col == 0){
             if (time0Row == 0){
               A3p.setCaptionLabel("D_off").setColorCaptionLabel(0);
               delayVal3 = 0.0;
             }
             if (time0Row == 1){
               A3p.setCaptionLabel("D_on").setColorCaptionLabel(0);
               delayVal3 = 0.5;
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               A3p.setCaptionLabel("B_off").setColorCaptionLabel(0);
               bitRes3 = 0;
             }
             if (time0Row == 1){
               A3p.setCaptionLabel("B_on").setColorCaptionLabel(0);
               bitRes3 = 2;
             }
           }
         }
       }
       if(instPropUpward == 1){
         if(instPropRighty == 0){
           if(time0Col == 0){
               A3p.setCaptionLabel("Sin").setColorCaptionLabel(0);
               disWave0 = Waves.SINE;
                 //sineOsc.patch( out );
           }
           if(time0Col == 1){
               A3p.setCaptionLabel("Sq").setColorCaptionLabel(0);
               //panValue = 1;
               disWave0 =  Waves.SQUARE;
                 //sineOsc.patch( out );
           }
           if(time0Col == 2){
               A3p.setCaptionLabel("Saw").setColorCaptionLabel(0);
               //panValue = 2;
               disWave0 = Waves.SAW;
           }
                 //propHighlight = 1;
         }
         if(instPropRighty == 1){
           if(time0Col == 0){
             A3p.setCaptionLabel("");
           }
           if(time0Col == 1){
             A3.setCaptionLabel("");
             B3.setCaptionLabel("");
             C3.setCaptionLabel("");
             D3.setCaptionLabel("");
             E3.setCaptionLabel("");
             F3.setCaptionLabel("");
             G3.setCaptionLabel("");
             H3.setCaptionLabel("");
             for(int i = 0; i < 8; i++){
               instList3[i] = 0.0;
             }
           }
         }
         if(instPropRighty == 2){
           if(time0Col == 0){
               A3p.setCaptionLabel("P0").setColorCaptionLabel(0);
               panValue = 0;
           }
           if(time0Col == 1){
               A3p.setCaptionLabel("P1").setColorCaptionLabel(0);
               panValue = 1;
           }
           if(time0Col == 2){
               A3p.setCaptionLabel("P-1").setColorCaptionLabel(0);
               panValue = 2;
           }
                 //propHighlight = 1;
         }
       }
       
     }
     
     if(propRighty == 1){
       if(instPropUpward == 0){
         if(instPropRighty == 0){
           if(time0Col == 0){
               B3p.setCaptionLabel("G0").setColorCaptionLabel(0);
               gainValue3 = 0.5f;
           }
           if(time0Col == 1){
               B3p.setCaptionLabel("G1").setColorCaptionLabel(0);
               gainValue3 = 1.0f;
           }
           if(time0Col == 2){
               B3p.setCaptionLabel("G2").setColorCaptionLabel(0);
               gainValue3 = 1.5f;
           }
           if(time0Col == 3){
               B3p.setCaptionLabel("G3").setColorCaptionLabel(0);
               gainValue3 = 2.0f;
           }
           if(time0Col == 4){
               B3p.setCaptionLabel("G4").setColorCaptionLabel(0);
               gainValue3 = 2.5f;
           }
           if(time0Col == 5){
               B3p.setCaptionLabel("G5").setColorCaptionLabel(0);
               gainValue3 = 3.0f;
           }
                 //propHighlight = 1;
         }
         if(instPropRighty == 1){
           if(time0Col == 0){
             if (time0Row == 0){
               B3p.setCaptionLabel("Tr0").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               B3p.setCaptionLabel("Tr1").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               B3p.setCaptionLabel("Tr2").setColorCaptionLabel(0);
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               B3p.setCaptionLabel("Tr3").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               B3p.setCaptionLabel("Tr4").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               B3p.setCaptionLabel("Tr-1").setColorCaptionLabel(0);
             }
           }
           if(time0Col == 2){
             if (time0Row == 0){
               B3p.setCaptionLabel("Tr-2").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               B3p.setCaptionLabel("Tr-3").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               B3p.setCaptionLabel("Tr-4").setColorCaptionLabel(0);
             }
           }
         }
         if(instPropRighty == 2){
           if(time0Col == 0){
             if (time0Row == 0){
               B3p.setCaptionLabel("D_off").setColorCaptionLabel(0);
               delayVal3 = 0.0;
             }
             if (time0Row == 1){
               B3p.setCaptionLabel("D_on").setColorCaptionLabel(0);
               delayVal3 = 0.5;
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               B3p.setCaptionLabel("B_off").setColorCaptionLabel(0);
               bitRes3 = 0;
             }
             if (time0Row == 1){
               B3p.setCaptionLabel("B_on").setColorCaptionLabel(0);
               bitRes3 = 2;
             }
           }
         }
       }
       if(instPropUpward == 1){
         if(instPropRighty == 0){
           if(time0Col == 0){
               B3p.setCaptionLabel("Sin").setColorCaptionLabel(0);
               disWave0 = Waves.SINE;
                 //sineOsc.patch( out );
           }
           if(time0Col == 1){
               B3p.setCaptionLabel("Sq").setColorCaptionLabel(0);
               //panValue = 1;
               disWave0 =  Waves.SQUARE;
                 //sineOsc.patch( out );
           }
           if(time0Col == 2){
               B3p.setCaptionLabel("Saw").setColorCaptionLabel(0);
               //panValue = 2;
               disWave0 = Waves.SAW;
           }
                 //propHighlight = 1;
         }
         if(instPropRighty == 1){
           if(time0Col == 0){
             B3p.setCaptionLabel("");
           }
           if(time0Col == 1){
             A3.setCaptionLabel("");
             B3.setCaptionLabel("");
             C3.setCaptionLabel("");
             D3.setCaptionLabel("");
             E3.setCaptionLabel("");
             F3.setCaptionLabel("");
             G3.setCaptionLabel("");
             H3.setCaptionLabel("");
             for(int i = 0; i < 8; i++){
               instList3[i] = 0.0;
             }
           }
         }
         if(instPropRighty == 2){
           if(time0Col == 0){
               B3p.setCaptionLabel("P0").setColorCaptionLabel(0);
               panValue = 0;
           }
           if(time0Col == 1){
               B3p.setCaptionLabel("P1").setColorCaptionLabel(0);
               panValue = 1;
           }
           if(time0Col == 2){
               B3p.setCaptionLabel("P-1").setColorCaptionLabel(0);
               panValue = 2;
           }
                 //propHighlight = 1;
         }
       }
     }
     
     if(propRighty == 2){
       if(instPropUpward == 0){
         if(instPropRighty == 0){
           if(time0Col == 0){
               C3p.setCaptionLabel("G0").setColorCaptionLabel(0);
               gainValue3 = 0.5f;
           }
           if(time0Col == 1){
               C3p.setCaptionLabel("G1").setColorCaptionLabel(0);
               gainValue3 = 1.0f;
           }
           if(time0Col == 2){
               C3p.setCaptionLabel("G2").setColorCaptionLabel(0);
               gainValue3 = 1.5f;
           }
           if(time0Col == 3){
               C3p.setCaptionLabel("G3").setColorCaptionLabel(0);
               gainValue3 = 2.0f;
           }
           if(time0Col == 4){
               C3p.setCaptionLabel("G4").setColorCaptionLabel(0);
               gainValue3 = 2.5f;
           }
           if(time0Col == 5){
               C3p.setCaptionLabel("G5").setColorCaptionLabel(0);
               gainValue3 = 3.0f;
           }
                 //propHighlight = 1;
         }
         if(instPropRighty == 1){
           if(time0Col == 0){
             if (time0Row == 0){
               C3p.setCaptionLabel("Tr0").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               C3p.setCaptionLabel("Tr1").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               C3p.setCaptionLabel("Tr2").setColorCaptionLabel(0);
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               C3p.setCaptionLabel("Tr3").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               C3p.setCaptionLabel("Tr4").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               C3p.setCaptionLabel("Tr-1").setColorCaptionLabel(0);
             }
           }
           if(time0Col == 2){
             if (time0Row == 0){
               C3p.setCaptionLabel("Tr-2").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               C3p.setCaptionLabel("Tr-3").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               C3p.setCaptionLabel("Tr-4").setColorCaptionLabel(0);
             }
           }
         }
         if(instPropRighty == 2){
           if(time0Col == 0){
             if (time0Row == 0){
               C3p.setCaptionLabel("D_off").setColorCaptionLabel(0);
               delayVal3 = 0.0;
             }
             if (time0Row == 1){
               C3p.setCaptionLabel("D_on").setColorCaptionLabel(0);
               delayVal3 = 0.5;
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               C3p.setCaptionLabel("B_off").setColorCaptionLabel(0);
               bitRes3 = 0;
             }
             if (time0Row == 1){
               C3p.setCaptionLabel("B_on").setColorCaptionLabel(0);
               bitRes3 = 2;
             }
           }
         }
       }
       if(instPropUpward == 1){
         if(instPropRighty == 0){
           if(time0Col == 0){
               C3p.setCaptionLabel("Sin").setColorCaptionLabel(0);
               disWave0 = Waves.SINE;
                 //sineOsc.patch( out );
           }
           if(time0Col == 1){
               C3p.setCaptionLabel("Sq").setColorCaptionLabel(0);
               //panValue = 1;
               disWave0 =  Waves.SQUARE;
                 //sineOsc.patch( out );
           }
           if(time0Col == 2){
               C3p.setCaptionLabel("Saw").setColorCaptionLabel(0);
               //panValue = 2;
               disWave0 = Waves.SAW;
           }
                 //propHighlight = 1;
         }
         if(instPropRighty == 1){
           if(time0Col == 0){
             C3p.setCaptionLabel("");
           }
           if(time0Col == 1){
             A3.setCaptionLabel("");
             B3.setCaptionLabel("");
             C3.setCaptionLabel("");
             D3.setCaptionLabel("");
             E3.setCaptionLabel("");
             F3.setCaptionLabel("");
             G3.setCaptionLabel("");
             H3.setCaptionLabel("");
             for(int i = 0; i < 8; i++){
               instList3[i] = 0.0;
             }
           }
         }
         if(instPropRighty == 2){
           if(time0Col == 0){
               C3p.setCaptionLabel("P0").setColorCaptionLabel(0);
               panValue = 0;
           }
           if(time0Col == 1){
               C3p.setCaptionLabel("P1").setColorCaptionLabel(0);
               panValue = 1;
           }
           if(time0Col == 2){
               C3p.setCaptionLabel("P-1").setColorCaptionLabel(0);
               panValue = 2;
           }
                 //propHighlight = 1;
         }
       }
     }
     
     if(propRighty == 3){
       if(instPropUpward == 0){
         if(instPropRighty == 0){
           if(time0Col == 0){
               D3p.setCaptionLabel("G0").setColorCaptionLabel(0);
               gainValue3 = 0.5f;
           }
           if(time0Col == 1){
               D3p.setCaptionLabel("G1").setColorCaptionLabel(0);
               gainValue3 = 1.0f;
           }
           if(time0Col == 2){
               D3p.setCaptionLabel("G2").setColorCaptionLabel(0);
               gainValue3 = 1.5f;
           }
           if(time0Col == 3){
               D3p.setCaptionLabel("G3").setColorCaptionLabel(0);
               gainValue3 = 2.0f;
           }
           if(time0Col == 4){
               D3p.setCaptionLabel("G4").setColorCaptionLabel(0);
               gainValue3 = 2.5f;
           }
           if(time0Col == 5){
               D3p.setCaptionLabel("G5").setColorCaptionLabel(0);
               gainValue3 = 3.0f;
           }
                 //propHighlight = 1;
         }
         if(instPropRighty == 1){
           if(time0Col == 0){
             if (time0Row == 0){
               D3p.setCaptionLabel("Tr0").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               D3p.setCaptionLabel("Tr1").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               D3p.setCaptionLabel("Tr2").setColorCaptionLabel(0);
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               D3p.setCaptionLabel("Tr3").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               D3p.setCaptionLabel("Tr4").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               D3p.setCaptionLabel("Tr-1").setColorCaptionLabel(0);
             }
           }
           if(time0Col == 2){
             if (time0Row == 0){
               D3p.setCaptionLabel("Tr-2").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               D3p.setCaptionLabel("Tr-3").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               D3p.setCaptionLabel("Tr-4").setColorCaptionLabel(0);
             }
           }
         }
         if(instPropRighty == 2){
           if(time0Col == 0){
             if (time0Row == 0){
               D3p.setCaptionLabel("D_off").setColorCaptionLabel(0);
               delayVal3 = 0.0;
             }
             if (time0Row == 1){
               D3p.setCaptionLabel("D_on").setColorCaptionLabel(0);
               delayVal3 = 0.5;
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               D3p.setCaptionLabel("B_off").setColorCaptionLabel(0);
               bitRes3 = 0;
             }
             if (time0Row == 1){
               D3p.setCaptionLabel("B_on").setColorCaptionLabel(0);
               bitRes3 = 2;
             }
           }
         }
       }
       if(instPropUpward == 1){
         if(instPropRighty == 0){
           if(time0Col == 0){
               D3p.setCaptionLabel("Sin").setColorCaptionLabel(0);
               disWave0 = Waves.SINE;
                 //sineOsc.patch( out );
           }
           if(time0Col == 1){
               D3p.setCaptionLabel("Sq").setColorCaptionLabel(0);
               //panValue = 1;
               disWave0 =  Waves.SQUARE;
                 //sineOsc.patch( out );
           }
           if(time0Col == 2){
               D3p.setCaptionLabel("Saw").setColorCaptionLabel(0);
               //panValue = 2;
               disWave0 = Waves.SAW;
           }
                 //propHighlight = 1;
         }
         if(instPropRighty == 1){
           if(time0Col == 0){
             D3p.setCaptionLabel("");
           }
           if(time0Col == 1){
             A3.setCaptionLabel("");
             B3.setCaptionLabel("");
             C3.setCaptionLabel("");
             D3.setCaptionLabel("");
             E3.setCaptionLabel("");
             F3.setCaptionLabel("");
             G3.setCaptionLabel("");
             H3.setCaptionLabel("");
             for(int i = 0; i < 8; i++){
               instList3[i] = 0.0;
             }
           }
         }
         if(instPropRighty == 2){
           if(time0Col == 0){
               D3p.setCaptionLabel("P0").setColorCaptionLabel(0);
               panValue = 0;
           }
           if(time0Col == 1){
               D3p.setCaptionLabel("P1").setColorCaptionLabel(0);
               panValue = 1;
           }
           if(time0Col == 2){
               D3p.setCaptionLabel("P-1").setColorCaptionLabel(0);
               panValue = 2;
           }
                 //propHighlight = 1;
         }
       }
     }
     
     if(propRighty == 4){
       if(instPropUpward == 0){
         if(instPropRighty == 0){
           if(time0Col == 0){
               E3p.setCaptionLabel("G0").setColorCaptionLabel(0);
               gainValue3 = 0.5f;
           }
           if(time0Col == 1){
               E3p.setCaptionLabel("G1").setColorCaptionLabel(0);
               gainValue3 = 1.0f;
           }
           if(time0Col == 2){
               E3p.setCaptionLabel("G2").setColorCaptionLabel(0);
               gainValue3 = 1.5f;
           }
           if(time0Col == 3){
               E3p.setCaptionLabel("G3").setColorCaptionLabel(0);
               gainValue3 = 2.0f;
           }
           if(time0Col == 4){
               E3p.setCaptionLabel("G4").setColorCaptionLabel(0);
               gainValue3 = 2.5f;
           }
           if(time0Col == 5){
               E3p.setCaptionLabel("G5").setColorCaptionLabel(0);
               gainValue3 = 3.0f;
           }
                 //propHighlight = 1;
         }
         if(instPropRighty == 1){
           if(time0Col == 0){
             if (time0Row == 0){
               E3p.setCaptionLabel("Tr0").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               E3p.setCaptionLabel("Tr1").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               E3p.setCaptionLabel("Tr2").setColorCaptionLabel(0);
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               E3p.setCaptionLabel("Tr3").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               E3p.setCaptionLabel("Tr4").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               E3p.setCaptionLabel("Tr-1").setColorCaptionLabel(0);
             }
           }
           if(time0Col == 2){
             if (time0Row == 0){
               E3p.setCaptionLabel("Tr-2").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               E3p.setCaptionLabel("Tr-3").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               E3p.setCaptionLabel("Tr-4").setColorCaptionLabel(0);
             }
           }
         }
         if(instPropRighty == 2){
           if(time0Col == 0){
             if (time0Row == 0){
               E3p.setCaptionLabel("D_off").setColorCaptionLabel(0);
               delayVal3 = 0.0;
             }
             if (time0Row == 1){
               E3p.setCaptionLabel("D_on").setColorCaptionLabel(0);
               delayVal3 = 0.5;
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               E3p.setCaptionLabel("B_off").setColorCaptionLabel(0);
               bitRes3 = 0;
             }
             if (time0Row == 1){
               E3p.setCaptionLabel("B_on").setColorCaptionLabel(0);
               bitRes3 = 2;
             }
           }
         }
       }
       if(instPropUpward == 1){
         if(instPropRighty == 0){
           if(time0Col == 0){
               E3p.setCaptionLabel("Sin").setColorCaptionLabel(0);
               disWave0 = Waves.SINE;
                 //sineOsc.patch( out );
           }
           if(time0Col == 1){
               E3p.setCaptionLabel("Sq").setColorCaptionLabel(0);
               //panValue = 1;
               disWave0 =  Waves.SQUARE;
                 //sineOsc.patch( out );
           }
           if(time0Col == 2){
               E3p.setCaptionLabel("Saw").setColorCaptionLabel(0);
               //panValue = 2;
               disWave0 = Waves.SAW;
           }
                 //propHighlight = 1;
         }
         if(instPropRighty == 1){
           if(time0Col == 0){
             E3p.setCaptionLabel("");
           }
           if(time0Col == 1){
             A3.setCaptionLabel("");
             B3.setCaptionLabel("");
             C3.setCaptionLabel("");
             D3.setCaptionLabel("");
             E3.setCaptionLabel("");
             F3.setCaptionLabel("");
             G3.setCaptionLabel("");
             H3.setCaptionLabel("");
             for(int i = 0; i < 8; i++){
               instList3[i] = 0.0;
             }
           }
         }
         if(instPropRighty == 2){
           if(time0Col == 0){
               E3p.setCaptionLabel("P0").setColorCaptionLabel(0);
               panValue = 0;
           }
           if(time0Col == 1){
               E3p.setCaptionLabel("P1").setColorCaptionLabel(0);
               panValue = 1;
           }
           if(time0Col == 2){
               E3p.setCaptionLabel("P-1").setColorCaptionLabel(0);
               panValue = 2;
           }
                 //propHighlight = 1;
         }
       }
     }
     
     if(propRighty == 5){
       if(instPropUpward == 0){
         if(instPropRighty == 0){
           if(time0Col == 0){
               F3p.setCaptionLabel("G0").setColorCaptionLabel(0);
               gainValue3 = 0.5f;
           }
           if(time0Col == 1){
               F3p.setCaptionLabel("G1").setColorCaptionLabel(0);
               gainValue3 = 1.0f;
           }
           if(time0Col == 2){
               F3p.setCaptionLabel("G2").setColorCaptionLabel(0);
               gainValue3 = 1.5f;
           }
           if(time0Col == 3){
               F3p.setCaptionLabel("G3").setColorCaptionLabel(0);
               gainValue3 = 2.0f;
           }
           if(time0Col == 4){
               F3p.setCaptionLabel("G4").setColorCaptionLabel(0);
               gainValue3 = 2.5f;
           }
           if(time0Col == 5){
               F3p.setCaptionLabel("G5").setColorCaptionLabel(0);
               gainValue3 = 3.0f;
           }
                 //propHighlight = 1;
         }
         if(instPropRighty == 1){
           if(time0Col == 0){
             if (time0Row == 0){
               F3p.setCaptionLabel("Tr0").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               F3p.setCaptionLabel("Tr1").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               F3p.setCaptionLabel("Tr2").setColorCaptionLabel(0);
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               F3p.setCaptionLabel("Tr3").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               F3p.setCaptionLabel("Tr4").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               F3p.setCaptionLabel("Tr-1").setColorCaptionLabel(0);
             }
           }
           if(time0Col == 2){
             if (time0Row == 0){
               F3p.setCaptionLabel("Tr-2").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               F3p.setCaptionLabel("Tr-3").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               F3p.setCaptionLabel("Tr-4").setColorCaptionLabel(0);
             }
           }
         }
         if(instPropRighty == 2){
           if(time0Col == 0){
             if (time0Row == 0){
               F3p.setCaptionLabel("D_off").setColorCaptionLabel(0);
               delayVal3 = 0.0;
             }
             if (time0Row == 1){
               F3p.setCaptionLabel("D_on").setColorCaptionLabel(0);
               delayVal3 = 0.5;
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               F3p.setCaptionLabel("B_off").setColorCaptionLabel(0);
               bitRes3 = 0;
             }
             if (time0Row == 1){
               F3p.setCaptionLabel("B_on").setColorCaptionLabel(0);
               bitRes3 = 2;
             }
           }
         }
       }
       if(instPropUpward == 1){
         if(instPropRighty == 0){
           if(time0Col == 0){
               F3p.setCaptionLabel("Sin").setColorCaptionLabel(0);
               disWave0 = Waves.SINE;
                 //sineOsc.patch( out );
           }
           if(time0Col == 1){
               F3p.setCaptionLabel("Sq").setColorCaptionLabel(0);
               //panValue = 1;
               disWave0 =  Waves.SQUARE;
                 //sineOsc.patch( out );
           }
           if(time0Col == 2){
               F3p.setCaptionLabel("Saw").setColorCaptionLabel(0);
               //panValue = 2;
               disWave0 = Waves.SAW;
           }
                 //propHighlight = 1;
         }
         if(instPropRighty == 1){
           if(time0Col == 0){
             F3p.setCaptionLabel("");
           }
           if(time0Col == 1){
             A3.setCaptionLabel("");
             B3.setCaptionLabel("");
             C3.setCaptionLabel("");
             D3.setCaptionLabel("");
             E3.setCaptionLabel("");
             F3.setCaptionLabel("");
             G3.setCaptionLabel("");
             H3.setCaptionLabel("");
             for(int i = 0; i < 8; i++){
               instList3[i] = 0.0;
             }
           }
         }
         if(instPropRighty == 2){
           if(time0Col == 0){
               F3p.setCaptionLabel("P0").setColorCaptionLabel(0);
               panValue = 0;
           }
           if(time0Col == 1){
               F3p.setCaptionLabel("P1").setColorCaptionLabel(0);
               panValue = 1;
           }
           if(time0Col == 2){
               F3p.setCaptionLabel("P-1").setColorCaptionLabel(0);
               panValue = 2;
           }
                 //propHighlight = 1;
         }
       }
     }
   }
   
   
   if(propUpward == 4){
     if(propRighty == 0){
       if(instPropUpward == 0){
         if(instPropRighty == 0){
           if(time0Col == 0){
               A4p.setCaptionLabel("G0").setColorCaptionLabel(0);
               gainValue4 = 0.5f;
           }
           if(time0Col == 1){
               A4p.setCaptionLabel("G1").setColorCaptionLabel(0);
               gainValue4 = 1.0f;
           }
           if(time0Col == 2){
               A4p.setCaptionLabel("G2").setColorCaptionLabel(0);
               gainValue4 = 1.5f;
           }
           if(time0Col == 3){
               A4p.setCaptionLabel("G3").setColorCaptionLabel(0);
               gainValue4 = 2.0f;
           }
           if(time0Col == 4){
               A4p.setCaptionLabel("G4").setColorCaptionLabel(0);
               gainValue4 = 2.5f;
           }
           if(time0Col == 5){
               A4p.setCaptionLabel("G5").setColorCaptionLabel(0);
               gainValue4 = 3.0f;
           }
                 //propHighlight = 1;
         }
         if(instPropRighty == 1){
           if(time0Col == 0){
             if (time0Row == 0){
               A4p.setCaptionLabel("Tr0").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               A4p.setCaptionLabel("Tr1").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               A4p.setCaptionLabel("Tr2").setColorCaptionLabel(0);
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               A4p.setCaptionLabel("Tr3").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               A4p.setCaptionLabel("Tr4").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               A4p.setCaptionLabel("Tr-1").setColorCaptionLabel(0);
             }
           }
           if(time0Col == 2){
             if (time0Row == 0){
               A4p.setCaptionLabel("Tr-2").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               A4p.setCaptionLabel("Tr-3").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               A4p.setCaptionLabel("Tr-4").setColorCaptionLabel(0);
             }
           }
         }
         if(instPropRighty == 2){
           if(time0Col == 0){
             if (time0Row == 0){
               A4p.setCaptionLabel("D_off").setColorCaptionLabel(0);
               delayVal4 = 0.0;
             }
             if (time0Row == 1){
               A4p.setCaptionLabel("D_on").setColorCaptionLabel(0);
               delayVal4 = 0.5;
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               A4p.setCaptionLabel("B_off").setColorCaptionLabel(0);
               bitRes4 = 0;
             }
             if (time0Row == 1){
               A4p.setCaptionLabel("B_on").setColorCaptionLabel(0);
               bitRes4 = 2;
             }
           }
         }
       }
       if(instPropUpward == 1){
         if(instPropRighty == 0){
           if(time0Col == 0){
               A4p.setCaptionLabel("Sin").setColorCaptionLabel(0);
               disWave0 = Waves.SINE;
                 //sineOsc.patch( out );
           }
           if(time0Col == 1){
               A4p.setCaptionLabel("Sq").setColorCaptionLabel(0);
               //panValue = 1;
               disWave0 =  Waves.SQUARE;
                 //sineOsc.patch( out );
           }
           if(time0Col == 2){
               A4p.setCaptionLabel("Saw").setColorCaptionLabel(0);
               //panValue = 2;
               disWave0 = Waves.SAW;
           }
                 //propHighlight = 1;
         }
         if(instPropRighty == 1){
           if(time0Col == 0){
             A4p.setCaptionLabel("");
           }
           if(time0Col == 1){
             A4.setCaptionLabel("");
             B4.setCaptionLabel("");
             C4.setCaptionLabel("");
             D4.setCaptionLabel("");
             E4.setCaptionLabel("");
             F4.setCaptionLabel("");
             G4.setCaptionLabel("");
             H4.setCaptionLabel("");
             for(int i = 0; i < 8; i++){
               instList4[i] = 0.0;
             }
           }
         }
         if(instPropRighty == 2){
           if(time0Col == 0){
               A4p.setCaptionLabel("P0").setColorCaptionLabel(0);
               panValue = 0;
           }
           if(time0Col == 1){
               A4p.setCaptionLabel("P1").setColorCaptionLabel(0);
               panValue = 1;
           }
           if(time0Col == 2){
               A4p.setCaptionLabel("P-1").setColorCaptionLabel(0);
               panValue = 2;
           }
                 //propHighlight = 1;
         }
       }
       
     }
     
     if(propRighty == 1){
       if(instPropUpward == 0){
         if(instPropRighty == 0){
           if(time0Col == 0){
               B4p.setCaptionLabel("G0").setColorCaptionLabel(0);
               gainValue4 = 0.5f;
           }
           if(time0Col == 1){
               B4p.setCaptionLabel("G1").setColorCaptionLabel(0);
               gainValue4 = 1.0f;
           }
           if(time0Col == 2){
               B4p.setCaptionLabel("G2").setColorCaptionLabel(0);
               gainValue4 = 1.5f;
           }
           if(time0Col == 3){
               B4p.setCaptionLabel("G3").setColorCaptionLabel(0);
               gainValue4 = 2.0f;
           }
           if(time0Col == 4){
               B4p.setCaptionLabel("G4").setColorCaptionLabel(0);
               gainValue4 = 2.5f;
           }
           if(time0Col == 5){
               B4p.setCaptionLabel("G5").setColorCaptionLabel(0);
               gainValue4 = 3.0f;
           }
                 //propHighlight = 1;
         }
         if(instPropRighty == 1){
           if(time0Col == 0){
             if (time0Row == 0){
               B4p.setCaptionLabel("Tr0").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               B4p.setCaptionLabel("Tr1").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               B4p.setCaptionLabel("Tr2").setColorCaptionLabel(0);
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               B4p.setCaptionLabel("Tr3").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               B4p.setCaptionLabel("Tr4").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               B4p.setCaptionLabel("Tr-1").setColorCaptionLabel(0);
             }
           }
           if(time0Col == 2){
             if (time0Row == 0){
               B4p.setCaptionLabel("Tr-2").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               B4p.setCaptionLabel("Tr-3").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               B4p.setCaptionLabel("Tr-4").setColorCaptionLabel(0);
             }
           }
         }
         if(instPropRighty == 2){
           if(time0Col == 0){
             if (time0Row == 0){
               B4p.setCaptionLabel("D_off").setColorCaptionLabel(0);
               delayVal4 = 0.0;
             }
             if (time0Row == 1){
               B4p.setCaptionLabel("D_on").setColorCaptionLabel(0);
               delayVal4 = 0.5;
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               B4p.setCaptionLabel("B_off").setColorCaptionLabel(0);
               bitRes4 = 0;
             }
             if (time0Row == 1){
               B4p.setCaptionLabel("B_on").setColorCaptionLabel(0);
               bitRes4 = 2;
             }
           }
         }
       }
       if(instPropUpward == 1){
         if(instPropRighty == 0){
           if(time0Col == 0){
               B4p.setCaptionLabel("Sin").setColorCaptionLabel(0);
               disWave0 = Waves.SINE;
                 //sineOsc.patch( out );
           }
           if(time0Col == 1){
               B4p.setCaptionLabel("Sq").setColorCaptionLabel(0);
               //panValue = 1;
               disWave0 =  Waves.SQUARE;
                 //sineOsc.patch( out );
           }
           if(time0Col == 2){
               B4p.setCaptionLabel("Saw").setColorCaptionLabel(0);
               //panValue = 2;
               disWave0 = Waves.SAW;
           }
                 //propHighlight = 1;
         }
         if(instPropRighty == 1){
           if(time0Col == 0){
             B4p.setCaptionLabel("");
           }
           if(time0Col == 1){
             A4.setCaptionLabel("");
             B4.setCaptionLabel("");
             C4.setCaptionLabel("");
             D4.setCaptionLabel("");
             E4.setCaptionLabel("");
             F4.setCaptionLabel("");
             G4.setCaptionLabel("");
             H4.setCaptionLabel("");
             for(int i = 0; i < 8; i++){
               instList4[i] = 0.0;
             }
           }
         }
         if(instPropRighty == 2){
           if(time0Col == 0){
               B4p.setCaptionLabel("P0").setColorCaptionLabel(0);
               panValue = 0;
           }
           if(time0Col == 1){
               B4p.setCaptionLabel("P1").setColorCaptionLabel(0);
               panValue = 1;
           }
           if(time0Col == 2){
               B4p.setCaptionLabel("P-1").setColorCaptionLabel(0);
               panValue = 2;
           }
                 //propHighlight = 1;
         }
       }
     }
     
     if(propRighty == 2){
       if(instPropUpward == 0){
         if(instPropRighty == 0){
           if(time0Col == 0){
               C4p.setCaptionLabel("G0").setColorCaptionLabel(0);
               gainValue4 = 0.5f;
           }
           if(time0Col == 1){
               C4p.setCaptionLabel("G1").setColorCaptionLabel(0);
               gainValue4 = 1.0f;
           }
           if(time0Col == 2){
               C4p.setCaptionLabel("G2").setColorCaptionLabel(0);
               gainValue4 = 1.5f;
           }
           if(time0Col == 3){
               C4p.setCaptionLabel("G3").setColorCaptionLabel(0);
               gainValue4 = 2.0f;
           }
           if(time0Col == 4){
               C4p.setCaptionLabel("G4").setColorCaptionLabel(0);
               gainValue4 = 2.5f;
           }
           if(time0Col == 5){
               C4p.setCaptionLabel("G5").setColorCaptionLabel(0);
               gainValue4 = 3.0f;
           }
                 //propHighlight = 1;
         }
         if(instPropRighty == 1){
           if(time0Col == 0){
             if (time0Row == 0){
               C4p.setCaptionLabel("Tr0").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               C4p.setCaptionLabel("Tr1").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               C4p.setCaptionLabel("Tr2").setColorCaptionLabel(0);
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               C4p.setCaptionLabel("Tr3").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               C4p.setCaptionLabel("Tr4").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               C4p.setCaptionLabel("Tr-1").setColorCaptionLabel(0);
             }
           }
           if(time0Col == 2){
             if (time0Row == 0){
               C4p.setCaptionLabel("Tr-2").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               C4p.setCaptionLabel("Tr-3").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               C4p.setCaptionLabel("Tr-4").setColorCaptionLabel(0);
             }
           }
         }
         if(instPropRighty == 2){
           if(time0Col == 0){
             if (time0Row == 0){
               C4p.setCaptionLabel("D_off").setColorCaptionLabel(0);
               delayVal4 = 0.0;
             }
             if (time0Row == 1){
               C4p.setCaptionLabel("D_on").setColorCaptionLabel(0);
               delayVal4 = 0.5;
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               C4p.setCaptionLabel("B_off").setColorCaptionLabel(0);
               bitRes4 = 0;
             }
             if (time0Row == 1){
               C4p.setCaptionLabel("B_on").setColorCaptionLabel(0);
               bitRes4 = 2;
             }
           }
         }
       }
       if(instPropUpward == 1){
         if(instPropRighty == 0){
           if(time0Col == 0){
               C4p.setCaptionLabel("Sin").setColorCaptionLabel(0);
               disWave0 = Waves.SINE;
                 //sineOsc.patch( out );
           }
           if(time0Col == 1){
               C4p.setCaptionLabel("Sq").setColorCaptionLabel(0);
               //panValue = 1;
               disWave0 =  Waves.SQUARE;
                 //sineOsc.patch( out );
           }
           if(time0Col == 2){
               C4p.setCaptionLabel("Saw").setColorCaptionLabel(0);
               //panValue = 2;
               disWave0 = Waves.SAW;
           }
                 //propHighlight = 1;
         }
         if(instPropRighty == 1){
           if(time0Col == 0){
             C4p.setCaptionLabel("");
           }
           if(time0Col == 1){
             A4.setCaptionLabel("");
             B4.setCaptionLabel("");
             C4.setCaptionLabel("");
             D4.setCaptionLabel("");
             E4.setCaptionLabel("");
             F4.setCaptionLabel("");
             G4.setCaptionLabel("");
             H4.setCaptionLabel("");
             for(int i = 0; i < 8; i++){
               instList4[i] = 0.0;
             }
           }
         }
         if(instPropRighty == 2){
           if(time0Col == 0){
               C4p.setCaptionLabel("P0").setColorCaptionLabel(0);
               panValue = 0;
           }
           if(time0Col == 1){
               C4p.setCaptionLabel("P1").setColorCaptionLabel(0);
               panValue = 1;
           }
           if(time0Col == 2){
               C4p.setCaptionLabel("P-1").setColorCaptionLabel(0);
               panValue = 2;
           }
                 //propHighlight = 1;
         }
       }
     }
     
     if(propRighty == 3){
       if(instPropUpward == 0){
         if(instPropRighty == 0){
           if(time0Col == 0){
               D4p.setCaptionLabel("G0").setColorCaptionLabel(0);
               gainValue4 = 0.5f;
           }
           if(time0Col == 1){
               D4p.setCaptionLabel("G1").setColorCaptionLabel(0);
               gainValue4 = 1.0f;
           }
           if(time0Col == 2){
               D4p.setCaptionLabel("G2").setColorCaptionLabel(0);
               gainValue4 = 1.5f;
           }
           if(time0Col == 3){
               D4p.setCaptionLabel("G3").setColorCaptionLabel(0);
               gainValue4 = 2.0f;
           }
           if(time0Col == 4){
               D4p.setCaptionLabel("G4").setColorCaptionLabel(0);
               gainValue4 = 2.5f;
           }
           if(time0Col == 5){
               D4p.setCaptionLabel("G5").setColorCaptionLabel(0);
               gainValue4 = 3.0f;
           }
                 //propHighlight = 1;
         }
         if(instPropRighty == 1){
           if(time0Col == 0){
             if (time0Row == 0){
               D4p.setCaptionLabel("Tr0").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               D4p.setCaptionLabel("Tr1").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               D4p.setCaptionLabel("Tr2").setColorCaptionLabel(0);
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               D4p.setCaptionLabel("Tr3").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               D4p.setCaptionLabel("Tr4").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               D4p.setCaptionLabel("Tr-1").setColorCaptionLabel(0);
             }
           }
           if(time0Col == 2){
             if (time0Row == 0){
               D4p.setCaptionLabel("Tr-2").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               D4p.setCaptionLabel("Tr-3").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               D4p.setCaptionLabel("Tr-4").setColorCaptionLabel(0);
             }
           }
         }
         if(instPropRighty == 2){
           if(time0Col == 0){
             if (time0Row == 0){
               D4p.setCaptionLabel("D_off").setColorCaptionLabel(0);
               delayVal4 = 0.0;
             }
             if (time0Row == 1){
               D4p.setCaptionLabel("D_on").setColorCaptionLabel(0);
               delayVal4 = 0.5;
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               D4p.setCaptionLabel("B_off").setColorCaptionLabel(0);
               bitRes4 = 0;
             }
             if (time0Row == 1){
               D4p.setCaptionLabel("B_on").setColorCaptionLabel(0);
               bitRes4 = 2;
             }
           }
         }
       }
       if(instPropUpward == 1){
         if(instPropRighty == 0){
           if(time0Col == 0){
               D4p.setCaptionLabel("Sin").setColorCaptionLabel(0);
               disWave0 = Waves.SINE;
                 //sineOsc.patch( out );
           }
           if(time0Col == 1){
               D4p.setCaptionLabel("Sq").setColorCaptionLabel(0);
               //panValue = 1;
               disWave0 =  Waves.SQUARE;
                 //sineOsc.patch( out );
           }
           if(time0Col == 2){
               D4p.setCaptionLabel("Saw").setColorCaptionLabel(0);
               //panValue = 2;
               disWave0 = Waves.SAW;
           }
                 //propHighlight = 1;
         }
         if(instPropRighty == 1){
           if(time0Col == 0){
             D4p.setCaptionLabel("");
           }
           if(time0Col == 1){
             A4.setCaptionLabel("");
             B4.setCaptionLabel("");
             C4.setCaptionLabel("");
             D4.setCaptionLabel("");
             E4.setCaptionLabel("");
             F4.setCaptionLabel("");
             G4.setCaptionLabel("");
             H4.setCaptionLabel("");
             for(int i = 0; i < 8; i++){
               instList4[i] = 0.0;
             }
           }
         }
         if(instPropRighty == 2){
           if(time0Col == 0){
               D4p.setCaptionLabel("P0").setColorCaptionLabel(0);
               panValue = 0;
           }
           if(time0Col == 1){
               D4p.setCaptionLabel("P1").setColorCaptionLabel(0);
               panValue = 1;
           }
           if(time0Col == 2){
               D4p.setCaptionLabel("P-1").setColorCaptionLabel(0);
               panValue = 2;
           }
                 //propHighlight = 1;
         }
       }
     }
     
     if(propRighty == 4){
       if(instPropUpward == 0){
         if(instPropRighty == 0){
           if(time0Col == 0){
               E4p.setCaptionLabel("G0").setColorCaptionLabel(0);
               gainValue4 = 0.5f;
           }
           if(time0Col == 1){
               E4p.setCaptionLabel("G1").setColorCaptionLabel(0);
               gainValue4 = 1.0f;
           }
           if(time0Col == 2){
               E4p.setCaptionLabel("G2").setColorCaptionLabel(0);
               gainValue4 = 1.5f;
           }
           if(time0Col == 3){
               E4p.setCaptionLabel("G3").setColorCaptionLabel(0);
               gainValue4 = 2.0f;
           }
           if(time0Col == 4){
               E4p.setCaptionLabel("G4").setColorCaptionLabel(0);
               gainValue4 = 2.5f;
           }
           if(time0Col == 5){
               E4p.setCaptionLabel("G5").setColorCaptionLabel(0);
               gainValue4 = 3.0f;
           }
                 //propHighlight = 1;
         }
         if(instPropRighty == 1){
           if(time0Col == 0){
             if (time0Row == 0){
               E4p.setCaptionLabel("Tr0").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               E4p.setCaptionLabel("Tr1").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               E4p.setCaptionLabel("Tr2").setColorCaptionLabel(0);
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               E4p.setCaptionLabel("Tr3").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               E4p.setCaptionLabel("Tr4").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               E4p.setCaptionLabel("Tr-1").setColorCaptionLabel(0);
             }
           }
           if(time0Col == 2){
             if (time0Row == 0){
               E4p.setCaptionLabel("Tr-2").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               E4p.setCaptionLabel("Tr-3").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               E4p.setCaptionLabel("Tr-4").setColorCaptionLabel(0);
             }
           }
         }
         if(instPropRighty == 2){
           if(time0Col == 0){
             if (time0Row == 0){
               E4p.setCaptionLabel("D_off").setColorCaptionLabel(0);
               delayVal4 = 0.0;
             }
             if (time0Row == 1){
               E4p.setCaptionLabel("D_on").setColorCaptionLabel(0);
               delayVal4 = 0.5;
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               E4p.setCaptionLabel("B_off").setColorCaptionLabel(0);
               bitRes4 = 0;
             }
             if (time0Row == 1){
               E4p.setCaptionLabel("B_on").setColorCaptionLabel(0);
               bitRes4 = 2;
             }
           }
         }
       }
       if(instPropUpward == 1){
         if(instPropRighty == 0){
           if(time0Col == 0){
               E4p.setCaptionLabel("Sin").setColorCaptionLabel(0);
               disWave0 = Waves.SINE;
                 //sineOsc.patch( out );
           }
           if(time0Col == 1){
               E4p.setCaptionLabel("Sq").setColorCaptionLabel(0);
               //panValue = 1;
               disWave0 =  Waves.SQUARE;
                 //sineOsc.patch( out );
           }
           if(time0Col == 2){
               E4p.setCaptionLabel("Saw").setColorCaptionLabel(0);
               //panValue = 2;
               disWave0 = Waves.SAW;
           }
                 //propHighlight = 1;
         }
         if(instPropRighty == 1){
           if(time0Col == 0){
             E4p.setCaptionLabel("");
           }
           if(time0Col == 1){
             A4.setCaptionLabel("");
             B4.setCaptionLabel("");
             C4.setCaptionLabel("");
             D4.setCaptionLabel("");
             E4.setCaptionLabel("");
             F4.setCaptionLabel("");
             G4.setCaptionLabel("");
             H4.setCaptionLabel("");
             for(int i = 0; i < 8; i++){
               instList4[i] = 0.0;
             }
           }
         }
         if(instPropRighty == 2){
           if(time0Col == 0){
               E4p.setCaptionLabel("P0").setColorCaptionLabel(0);
               panValue = 0;
           }
           if(time0Col == 1){
               E4p.setCaptionLabel("P1").setColorCaptionLabel(0);
               panValue = 1;
           }
           if(time0Col == 2){
               E4p.setCaptionLabel("P-1").setColorCaptionLabel(0);
               panValue = 2;
           }
                 //propHighlight = 1;
         }
       }
     }
     
     if(propRighty == 5){
       if(instPropUpward == 0){
         if(instPropRighty == 0){
           if(time0Col == 0){
               F4p.setCaptionLabel("G0").setColorCaptionLabel(0);
               gainValue4 = 0.5f;
           }
           if(time0Col == 1){
               F4p.setCaptionLabel("G1").setColorCaptionLabel(0);
               gainValue4 = 1.0f;
           }
           if(time0Col == 2){
               F4p.setCaptionLabel("G2").setColorCaptionLabel(0);
               gainValue4 = 1.5f;
           }
           if(time0Col == 3){
               F4p.setCaptionLabel("G3").setColorCaptionLabel(0);
               gainValue4 = 2.0f;
           }
           if(time0Col == 4){
               F4p.setCaptionLabel("G4").setColorCaptionLabel(0);
               gainValue4 = 2.5f;
           }
           if(time0Col == 5){
               F4p.setCaptionLabel("G5").setColorCaptionLabel(0);
               gainValue4 = 3.0f;
           }
                 //propHighlight = 1;
         }
         if(instPropRighty == 1){
           if(time0Col == 0){
             if (time0Row == 0){
               F4p.setCaptionLabel("Tr0").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               F4p.setCaptionLabel("Tr1").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               F4p.setCaptionLabel("Tr2").setColorCaptionLabel(0);
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               F4p.setCaptionLabel("Tr3").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               F4p.setCaptionLabel("Tr4").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               F4p.setCaptionLabel("Tr-1").setColorCaptionLabel(0);
             }
           }
           if(time0Col == 2){
             if (time0Row == 0){
               F4p.setCaptionLabel("Tr-2").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               F4p.setCaptionLabel("Tr-3").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               F4p.setCaptionLabel("Tr-4").setColorCaptionLabel(0);
             }
           }
         }
         if(instPropRighty == 2){
           if(time0Col == 0){
             if (time0Row == 0){
               F4p.setCaptionLabel("D_off").setColorCaptionLabel(0);
               delayVal4 = 0.0;
             }
             if (time0Row == 1){
               F4p.setCaptionLabel("D_on").setColorCaptionLabel(0);
               delayVal4 = 0.5;
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               F4p.setCaptionLabel("B_off").setColorCaptionLabel(0);
               bitRes4 = 0;
             }
             if (time0Row == 1){
               F4p.setCaptionLabel("B_on").setColorCaptionLabel(0);
               bitRes4 = 2;
             }
           }
         }
       }
       if(instPropUpward == 1){
         if(instPropRighty == 0){
           if(time0Col == 0){
               F4p.setCaptionLabel("Sin").setColorCaptionLabel(0);
               disWave0 = Waves.SINE;
                 //sineOsc.patch( out );
           }
           if(time0Col == 1){
               F4p.setCaptionLabel("Sq").setColorCaptionLabel(0);
               //panValue = 1;
               disWave0 =  Waves.SQUARE;
                 //sineOsc.patch( out );
           }
           if(time0Col == 2){
               F4p.setCaptionLabel("Saw").setColorCaptionLabel(0);
               //panValue = 2;
               disWave0 = Waves.SAW;
           }
                 //propHighlight = 1;
         }
         if(instPropRighty == 1){
           if(time0Col == 0){
             F4p.setCaptionLabel("");
           }
           if(time0Col == 1){
             A4.setCaptionLabel("");
             B4.setCaptionLabel("");
             C4.setCaptionLabel("");
             D4.setCaptionLabel("");
             E4.setCaptionLabel("");
             F4.setCaptionLabel("");
             G4.setCaptionLabel("");
             H4.setCaptionLabel("");
             for(int i = 0; i < 8; i++){
               instList4[i] = 0.0;
             }
           }
         }
         if(instPropRighty == 2){
           if(time0Col == 0){
               F4p.setCaptionLabel("P0").setColorCaptionLabel(0);
               panValue = 0;
           }
           if(time0Col == 1){
               F4p.setCaptionLabel("P1").setColorCaptionLabel(0);
               panValue = 1;
           }
           if(time0Col == 2){
               F4p.setCaptionLabel("P-1").setColorCaptionLabel(0);
               panValue = 2;
           }
                 //propHighlight = 1;
         }
       }
     }
   }
   
   
   if(propUpward == 5){
     if(propRighty == 0){
       if(instPropUpward == 0){
         if(instPropRighty == 0){
           if(time0Col == 0){
               A5p.setCaptionLabel("G0").setColorCaptionLabel(0);
               gainValue5 = 0.5f;
           }
           if(time0Col == 1){
               A5p.setCaptionLabel("G1").setColorCaptionLabel(0);
               gainValue5 = 1.0f;
           }
           if(time0Col == 2){
               A5p.setCaptionLabel("G2").setColorCaptionLabel(0);
               gainValue5 = 1.5f;
           }
           if(time0Col == 3){
               A5p.setCaptionLabel("G3").setColorCaptionLabel(0);
               gainValue5 = 2.0f;
           }
           if(time0Col == 4){
               A5p.setCaptionLabel("G4").setColorCaptionLabel(0);
               gainValue5 = 2.5f;
           }
           if(time0Col == 5){
               A5p.setCaptionLabel("G5").setColorCaptionLabel(0);
               gainValue5 = 3.0f;
           }
                 //propHighlight = 1;
         }
         if(instPropRighty == 1){
           if(time0Col == 0){
             if (time0Row == 0){
               A5p.setCaptionLabel("Tr0").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               A5p.setCaptionLabel("Tr1").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               A5p.setCaptionLabel("Tr2").setColorCaptionLabel(0);
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               A5p.setCaptionLabel("Tr3").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               A5p.setCaptionLabel("Tr4").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               A5p.setCaptionLabel("Tr-1").setColorCaptionLabel(0);
             }
           }
           if(time0Col == 2){
             if (time0Row == 0){
               A5p.setCaptionLabel("Tr-2").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               A5p.setCaptionLabel("Tr-3").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               A5p.setCaptionLabel("Tr-4").setColorCaptionLabel(0);
             }
           }
         }
         if(instPropRighty == 2){
           if(time0Col == 0){
             if (time0Row == 0){
               A5p.setCaptionLabel("D_off").setColorCaptionLabel(0);
               delayVal5 = 0.0;
             }
             if (time0Row == 1){
               A5p.setCaptionLabel("D_on").setColorCaptionLabel(0);
               delayVal5 = 0.5;
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               A5p.setCaptionLabel("B_off").setColorCaptionLabel(0);
               bitRes5 = 0;
             }
             if (time0Row == 1){
               A5p.setCaptionLabel("B_on").setColorCaptionLabel(0);
               bitRes5 = 2;
             }
           }
         }
       }
       if(instPropUpward == 1){
         if(instPropRighty == 0){
           if(time0Col == 0){
               A5p.setCaptionLabel("Sin").setColorCaptionLabel(0);
               disWave0 = Waves.SINE;
                 //sineOsc.patch( out );
           }
           if(time0Col == 1){
               A5p.setCaptionLabel("Sq").setColorCaptionLabel(0);
               //panValue = 1;
               disWave0 =  Waves.SQUARE;
                 //sineOsc.patch( out );
           }
           if(time0Col == 2){
               A5p.setCaptionLabel("Saw").setColorCaptionLabel(0);
               //panValue = 2;
               disWave0 = Waves.SAW;
           }
                 //propHighlight = 1;
         }
         if(instPropRighty == 1){
           if(time0Col == 0){
             A5p.setCaptionLabel("");
           }
           if(time0Col == 1){
             A5.setCaptionLabel("");
             B5.setCaptionLabel("");
             C5.setCaptionLabel("");
             D5.setCaptionLabel("");
             E5.setCaptionLabel("");
             F5.setCaptionLabel("");
             G5.setCaptionLabel("");
             H5.setCaptionLabel("");
             for(int i = 0; i < 8; i++){
               instList5[i] = 0.0;
             }
           }
         }
         if(instPropRighty == 2){
           if(time0Col == 0){
               A5p.setCaptionLabel("P0").setColorCaptionLabel(0);
               panValue = 0;
           }
           if(time0Col == 1){
               A5p.setCaptionLabel("P1").setColorCaptionLabel(0);
               panValue = 1;
           }
           if(time0Col == 2){
               A5p.setCaptionLabel("P-1").setColorCaptionLabel(0);
               panValue = 2;
           }
                 //propHighlight = 1;
         }
       }
       
     }
     
     if(propRighty == 1){
       if(instPropUpward == 0){
         if(instPropRighty == 0){
           if(time0Col == 0){
               B5p.setCaptionLabel("G0").setColorCaptionLabel(0);
               gainValue5 = 0.5f;
           }
           if(time0Col == 1){
               B5p.setCaptionLabel("G1").setColorCaptionLabel(0);
               gainValue5 = 1.0f;
           }
           if(time0Col == 2){
               B5p.setCaptionLabel("G2").setColorCaptionLabel(0);
               gainValue5 = 1.5f;
           }
           if(time0Col == 3){
               B5p.setCaptionLabel("G3").setColorCaptionLabel(0);
               gainValue5 = 2.0f;
           }
           if(time0Col == 4){
               B5p.setCaptionLabel("G4").setColorCaptionLabel(0);
               gainValue5 = 2.5f;
           }
           if(time0Col == 5){
               B5p.setCaptionLabel("G5").setColorCaptionLabel(0);
               gainValue5 = 3.0f;
           }
                 //propHighlight = 1;
         }
         if(instPropRighty == 1){
           if(time0Col == 0){
             if (time0Row == 0){
               B5p.setCaptionLabel("Tr0").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               B5p.setCaptionLabel("Tr1").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               B5p.setCaptionLabel("Tr2").setColorCaptionLabel(0);
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               B5p.setCaptionLabel("Tr3").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               B5p.setCaptionLabel("Tr4").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               B5p.setCaptionLabel("Tr-1").setColorCaptionLabel(0);
             }
           }
           if(time0Col == 2){
             if (time0Row == 0){
               B5p.setCaptionLabel("Tr-2").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               B5p.setCaptionLabel("Tr-3").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               B5p.setCaptionLabel("Tr-4").setColorCaptionLabel(0);
             }
           }
         }
         if(instPropRighty == 2){
           if(time0Col == 0){
             if (time0Row == 0){
               B5p.setCaptionLabel("D_off").setColorCaptionLabel(0);
               delayVal5 = 0.0;
             }
             if (time0Row == 1){
               B5p.setCaptionLabel("D_on").setColorCaptionLabel(0);
               delayVal5 = 0.5;
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               B5p.setCaptionLabel("B_off").setColorCaptionLabel(0);
               bitRes5 = 0;
             }
             if (time0Row == 1){
               B5p.setCaptionLabel("B_on").setColorCaptionLabel(0);
               bitRes5 = 2;
             }
           }
         }
       }
       if(instPropUpward == 1){
         if(instPropRighty == 0){
           if(time0Col == 0){
               B5p.setCaptionLabel("Sin").setColorCaptionLabel(0);
               disWave0 = Waves.SINE;
                 //sineOsc.patch( out );
           }
           if(time0Col == 1){
               B5p.setCaptionLabel("Sq").setColorCaptionLabel(0);
               //panValue = 1;
               disWave0 =  Waves.SQUARE;
                 //sineOsc.patch( out );
           }
           if(time0Col == 2){
               B5p.setCaptionLabel("Saw").setColorCaptionLabel(0);
               //panValue = 2;
               disWave0 = Waves.SAW;
           }
                 //propHighlight = 1;
         }
         if(instPropRighty == 1){
           if(time0Col == 0){
             B5p.setCaptionLabel("");
           }
           if(time0Col == 1){
             A5.setCaptionLabel("");
             B5.setCaptionLabel("");
             C5.setCaptionLabel("");
             D5.setCaptionLabel("");
             E5.setCaptionLabel("");
             F5.setCaptionLabel("");
             G5.setCaptionLabel("");
             H5.setCaptionLabel("");
             for(int i = 0; i < 8; i++){
               instList5[i] = 0.0;
             }
           }
         }
         if(instPropRighty == 2){
           if(time0Col == 0){
               B5p.setCaptionLabel("P0").setColorCaptionLabel(0);
               panValue = 0;
           }
           if(time0Col == 1){
               B5p.setCaptionLabel("P1").setColorCaptionLabel(0);
               panValue = 1;
           }
           if(time0Col == 2){
               B5p.setCaptionLabel("P-1").setColorCaptionLabel(0);
               panValue = 2;
           }
                 //propHighlight = 1;
         }
       }
     }
     
     if(propRighty == 2){
       if(instPropUpward == 0){
         if(instPropRighty == 0){
           if(time0Col == 0){
               C5p.setCaptionLabel("G0").setColorCaptionLabel(0);
               gainValue5 = 0.5f;
           }
           if(time0Col == 1){
               C5p.setCaptionLabel("G1").setColorCaptionLabel(0);
               gainValue5 = 1.0f;
           }
           if(time0Col == 2){
               C5p.setCaptionLabel("G2").setColorCaptionLabel(0);
               gainValue5 = 1.5f;
           }
           if(time0Col == 3){
               C5p.setCaptionLabel("G3").setColorCaptionLabel(0);
               gainValue5 = 2.0f;
           }
           if(time0Col == 4){
               C5p.setCaptionLabel("G4").setColorCaptionLabel(0);
               gainValue5 = 2.5f;
           }
           if(time0Col == 5){
               C5p.setCaptionLabel("G5").setColorCaptionLabel(0);
               gainValue5 = 3.0f;
           }
                 //propHighlight = 1;
         }
         if(instPropRighty == 1){
           if(time0Col == 0){
             if (time0Row == 0){
               C5p.setCaptionLabel("Tr0").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               C5p.setCaptionLabel("Tr1").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               C5p.setCaptionLabel("Tr2").setColorCaptionLabel(0);
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               C5p.setCaptionLabel("Tr3").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               C5p.setCaptionLabel("Tr4").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               C5p.setCaptionLabel("Tr-1").setColorCaptionLabel(0);
             }
           }
           if(time0Col == 2){
             if (time0Row == 0){
               C5p.setCaptionLabel("Tr-2").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               C5p.setCaptionLabel("Tr-3").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               C5p.setCaptionLabel("Tr-4").setColorCaptionLabel(0);
             }
           }
         }
         if(instPropRighty == 2){
           if(time0Col == 0){
             if (time0Row == 0){
               C5p.setCaptionLabel("D_off").setColorCaptionLabel(0);
               delayVal5 = 0.0;
             }
             if (time0Row == 1){
               C5p.setCaptionLabel("D_on").setColorCaptionLabel(0);
               delayVal5 = 0.5;
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               C5p.setCaptionLabel("B_off").setColorCaptionLabel(0);
               bitRes5 = 0;
             }
             if (time0Row == 1){
               C5p.setCaptionLabel("B_on").setColorCaptionLabel(0);
               bitRes5 = 2;
             }
           }
         }
       }
       if(instPropUpward == 1){
         if(instPropRighty == 0){
           if(time0Col == 0){
               C5p.setCaptionLabel("Sin").setColorCaptionLabel(0);
               disWave0 = Waves.SINE;
                 //sineOsc.patch( out );
           }
           if(time0Col == 1){
               C5p.setCaptionLabel("Sq").setColorCaptionLabel(0);
               //panValue = 1;
               disWave0 =  Waves.SQUARE;
                 //sineOsc.patch( out );
           }
           if(time0Col == 2){
               C5p.setCaptionLabel("Saw").setColorCaptionLabel(0);
               //panValue = 2;
               disWave0 = Waves.SAW;
           }
                 //propHighlight = 1;
         }
         
         if(instPropRighty == 1){
           if(time0Col == 0){
             C5p.setCaptionLabel("");
           }
           if(time0Col == 1){
             A5.setCaptionLabel("");
             B5.setCaptionLabel("");
             C5.setCaptionLabel("");
             D5.setCaptionLabel("");
             E5.setCaptionLabel("");
             F5.setCaptionLabel("");
             G5.setCaptionLabel("");
             H5.setCaptionLabel("");
             for(int i = 0; i < 8; i++){
               instList5[i] = 0.0;
             }
           }
         }
         if(instPropRighty == 2){
           if(time0Col == 0){
               C5p.setCaptionLabel("P0").setColorCaptionLabel(0);
               panValue = 0;
           }
           if(time0Col == 1){
               C5p.setCaptionLabel("P1").setColorCaptionLabel(0);
               panValue = 1;
           }
           if(time0Col == 2){
               C5p.setCaptionLabel("P-1").setColorCaptionLabel(0);
               panValue = 2;
           }
                 //propHighlight = 1;
         }
       }
     }
     
     if(propRighty == 3){
       if(instPropUpward == 0){
         if(instPropRighty == 0){
           if(time0Col == 0){
               D5p.setCaptionLabel("G0").setColorCaptionLabel(0);
               gainValue5 = 0.5f;
           }
           if(time0Col == 1){
               D5p.setCaptionLabel("G1").setColorCaptionLabel(0);
               gainValue5 = 1.0f;
           }
           if(time0Col == 2){
               D5p.setCaptionLabel("G2").setColorCaptionLabel(0);
               gainValue5 = 1.5f;
           }
           if(time0Col == 3){
               D5p.setCaptionLabel("G3").setColorCaptionLabel(0);
               gainValue5 = 2.0f;
           }
           if(time0Col == 4){
               D5p.setCaptionLabel("G4").setColorCaptionLabel(0);
               gainValue5 = 2.5f;
           }
           if(time0Col == 5){
               D5p.setCaptionLabel("G5").setColorCaptionLabel(0);
               gainValue5 = 3.0f;
           }
                 //propHighlight = 1;
         }
         if(instPropRighty == 1){
           if(time0Col == 0){
             if (time0Row == 0){
               D5p.setCaptionLabel("Tr0").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               D5p.setCaptionLabel("Tr1").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               D5p.setCaptionLabel("Tr2").setColorCaptionLabel(0);
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               D5p.setCaptionLabel("Tr3").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               D5p.setCaptionLabel("Tr4").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               D5p.setCaptionLabel("Tr-1").setColorCaptionLabel(0);
             }
           }
           if(time0Col == 2){
             if (time0Row == 0){
               D5p.setCaptionLabel("Tr-2").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               D5p.setCaptionLabel("Tr-3").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               D5p.setCaptionLabel("Tr-4").setColorCaptionLabel(0);
             }
           }
         }
         if(instPropRighty == 2){
           if(time0Col == 0){
             if (time0Row == 0){
               D5p.setCaptionLabel("D_off").setColorCaptionLabel(0);
               delayVal5 = 0.0;
             }
             if (time0Row == 1){
               D5p.setCaptionLabel("D_on").setColorCaptionLabel(0);
               delayVal5 = 0.5;
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               D5p.setCaptionLabel("B_off").setColorCaptionLabel(0);
               bitRes5 = 0;
             }
             if (time0Row == 1){
               D5p.setCaptionLabel("B_on").setColorCaptionLabel(0);
               bitRes5 = 2;
             }
           }
         }
       }
       if(instPropUpward == 1){
         if(instPropRighty == 0){
           if(time0Col == 0){
               D5p.setCaptionLabel("Sin").setColorCaptionLabel(0);
               disWave0 = Waves.SINE;
                 //sineOsc.patch( out );
           }
           if(time0Col == 1){
               D5p.setCaptionLabel("Sq").setColorCaptionLabel(0);
               //panValue = 1;
               disWave0 =  Waves.SQUARE;
                 //sineOsc.patch( out );
           }
           if(time0Col == 2){
               D5p.setCaptionLabel("Saw").setColorCaptionLabel(0);
               //panValue = 2;
               disWave0 = Waves.SAW;
           }
                 //propHighlight = 1;
         }
         if(instPropRighty == 1){
           if(time0Col == 0){
             D5p.setCaptionLabel("");
           }
           if(time0Col == 1){
             A5.setCaptionLabel("");
             B5.setCaptionLabel("");
             C5.setCaptionLabel("");
             D5.setCaptionLabel("");
             E5.setCaptionLabel("");
             F5.setCaptionLabel("");
             G5.setCaptionLabel("");
             H5.setCaptionLabel("");
             for(int i = 0; i < 8; i++){
               instList5[i] = 0.0;
             }
           }
         }
         if(instPropRighty == 2){
           if(time0Col == 0){
               D5p.setCaptionLabel("P0").setColorCaptionLabel(0);
               panValue = 0;
           }
           if(time0Col == 1){
               D5p.setCaptionLabel("P1").setColorCaptionLabel(0);
               panValue = 1;
           }
           if(time0Col == 2){
               D5p.setCaptionLabel("P-1").setColorCaptionLabel(0);
               panValue = 2;
           }
                 //propHighlight = 1;
         }
       }
     }
     
     if(propRighty == 4){
       if(instPropUpward == 0){
         if(instPropRighty == 0){
           if(time0Col == 0){
               E5p.setCaptionLabel("G0").setColorCaptionLabel(0);
               gainValue5 = 0.5f;
           }
           if(time0Col == 1){
               E5p.setCaptionLabel("G1").setColorCaptionLabel(0);
               gainValue5 = 1.0f;
           }
           if(time0Col == 2){
               E5p.setCaptionLabel("G2").setColorCaptionLabel(0);
               gainValue5 = 1.5f;
           }
           if(time0Col == 3){
               E5p.setCaptionLabel("G3").setColorCaptionLabel(0);
               gainValue5 = 2.0f;
           }
           if(time0Col == 4){
               E5p.setCaptionLabel("G4").setColorCaptionLabel(0);
               gainValue5 = 2.5f;
           }
           if(time0Col == 5){
               E5p.setCaptionLabel("G5").setColorCaptionLabel(0);
               gainValue5 = 3.0f;
           }
                 //propHighlight = 1;
         }
         if(instPropRighty == 1){
           if(time0Col == 0){
             if (time0Row == 0){
               E5p.setCaptionLabel("Tr0").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               E5p.setCaptionLabel("Tr1").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               E5p.setCaptionLabel("Tr2").setColorCaptionLabel(0);
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               E5p.setCaptionLabel("Tr3").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               E5p.setCaptionLabel("Tr4").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               E5p.setCaptionLabel("Tr-1").setColorCaptionLabel(0);
             }
           }
           if(time0Col == 2){
             if (time0Row == 0){
               E5p.setCaptionLabel("Tr-2").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               E5p.setCaptionLabel("Tr-3").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               E5p.setCaptionLabel("Tr-4").setColorCaptionLabel(0);
             }
           }
         }
         if(instPropRighty == 2){
           if(time0Col == 0){
             if (time0Row == 0){
               E5p.setCaptionLabel("D_off").setColorCaptionLabel(0);
               delayVal5 = 0.0;
             }
             if (time0Row == 1){
               E5p.setCaptionLabel("D_on").setColorCaptionLabel(0);
               delayVal5 = 0.5;
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               E5p.setCaptionLabel("B_off").setColorCaptionLabel(0);
               bitRes5 = 0;
             }
             if (time0Row == 1){
               E5p.setCaptionLabel("B_on").setColorCaptionLabel(0);
               bitRes5 = 2;
             }
           }
         }
       }
       if(instPropUpward == 1){
         if(instPropRighty == 0){
           if(time0Col == 0){
               E5p.setCaptionLabel("Sin").setColorCaptionLabel(0);
               disWave0 = Waves.SINE;
                 //sineOsc.patch( out );
           }
           if(time0Col == 1){
               E5p.setCaptionLabel("Sq").setColorCaptionLabel(0);
               //panValue = 1;
               disWave0 =  Waves.SQUARE;
                 //sineOsc.patch( out );
           }
           if(time0Col == 2){
               E5p.setCaptionLabel("Saw").setColorCaptionLabel(0);
               //panValue = 2;
               disWave0 = Waves.SAW;
           }
                 //propHighlight = 1;
         }
         if(instPropRighty == 1){
           if(time0Col == 0){
             E5p.setCaptionLabel("");
           }
           if(time0Col == 1){
             A5.setCaptionLabel("");
             B5.setCaptionLabel("");
             C5.setCaptionLabel("");
             D5.setCaptionLabel("");
             E5.setCaptionLabel("");
             F5.setCaptionLabel("");
             G5.setCaptionLabel("");
             H5.setCaptionLabel("");
             for(int i = 0; i < 8; i++){
               instList5[i] = 0.0;
             }
           }
         }
         if(instPropRighty == 2){
           if(time0Col == 0){
               E5p.setCaptionLabel("P0").setColorCaptionLabel(0);
               panValue = 0;
           }
           if(time0Col == 1){
               E5p.setCaptionLabel("P1").setColorCaptionLabel(0);
               panValue = 1;
           }
           if(time0Col == 2){
               E5p.setCaptionLabel("P-1").setColorCaptionLabel(0);
               panValue = 2;
           }
                 //propHighlight = 1;
         }
       }
     }
     
     if(propRighty == 5){
       if(instPropUpward == 0){
         if(instPropRighty == 0){
           if(time0Col == 0){
               F5p.setCaptionLabel("G0").setColorCaptionLabel(0);
               gainValue5 = 0.5f;
           }
           if(time0Col == 1){
               F5p.setCaptionLabel("G1").setColorCaptionLabel(0);
               gainValue5 = 1.0f;
           }
           if(time0Col == 2){
               F5p.setCaptionLabel("G2").setColorCaptionLabel(0);
               gainValue5 = 1.5f;
           }
           if(time0Col == 3){
               F5p.setCaptionLabel("G3").setColorCaptionLabel(0);
               gainValue5 = 2.0f;
           }
           if(time0Col == 4){
               F5p.setCaptionLabel("G4").setColorCaptionLabel(0);
               gainValue5 = 2.5f;
           }
           if(time0Col == 5){
               F5p.setCaptionLabel("G5").setColorCaptionLabel(0);
               gainValue5 = 3.0f;
           }
                 //propHighlight = 1;
         }
         if(instPropRighty == 1){
           if(time0Col == 0){
             if (time0Row == 0){
               F5p.setCaptionLabel("Tr0").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               F5p.setCaptionLabel("Tr1").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               F5p.setCaptionLabel("Tr2").setColorCaptionLabel(0);
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               F5p.setCaptionLabel("Tr3").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               F5p.setCaptionLabel("Tr4").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               F5p.setCaptionLabel("Tr-1").setColorCaptionLabel(0);
             }
           }
           if(time0Col == 2){
             if (time0Row == 0){
               F5p.setCaptionLabel("Tr-2").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               F5p.setCaptionLabel("Tr-3").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               F5p.setCaptionLabel("Tr-4").setColorCaptionLabel(0);
             }
           }
         }
         if(instPropRighty == 2){
           if(time0Col == 0){
             if (time0Row == 0){
               F5p.setCaptionLabel("D_off").setColorCaptionLabel(0);
               delayVal5 = 0.0;
             }
             if (time0Row == 1){
               F5p.setCaptionLabel("D_on").setColorCaptionLabel(0);
               delayVal5 = 0.5;
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               F5p.setCaptionLabel("B_off").setColorCaptionLabel(0);
               bitRes5 = 0;
             }
             if (time0Row == 1){
               F5p.setCaptionLabel("B_on").setColorCaptionLabel(0);
               bitRes5 = 2;
             }
           }
         }
       }
       if(instPropUpward == 1){
         if(instPropRighty == 0){
           if(time0Col == 0){
               F5p.setCaptionLabel("Sin").setColorCaptionLabel(0);
               disWave0 = Waves.SINE;
                 //sineOsc.patch( out );
           }
           if(time0Col == 1){
               F5p.setCaptionLabel("Sq").setColorCaptionLabel(0);
               //panValue = 1;
               disWave0 =  Waves.SQUARE;
                 //sineOsc.patch( out );
           }
           if(time0Col == 2){
               F5p.setCaptionLabel("Saw").setColorCaptionLabel(0);
               //panValue = 2;
               disWave0 = Waves.SAW;
           }
                 //propHighlight = 1;
         }
         if(instPropRighty == 1){
           if(time0Col == 0){
             F5p.setCaptionLabel("");
           }
           if(time0Col == 1){
             A5.setCaptionLabel("");
             B5.setCaptionLabel("");
             C5.setCaptionLabel("");
             D5.setCaptionLabel("");
             E5.setCaptionLabel("");
             F5.setCaptionLabel("");
             G5.setCaptionLabel("");
             H5.setCaptionLabel("");
             for(int i = 0; i < 8; i++){
               instList5[i] = 0.0;
             }
           }
         }
         if(instPropRighty == 2){
           if(time0Col == 0){
               F5p.setCaptionLabel("P0").setColorCaptionLabel(0);
               panValue = 0;
           }
           if(time0Col == 1){
               F5p.setCaptionLabel("P1").setColorCaptionLabel(0);
               panValue = 1;
           }
           if(time0Col == 2){
               F5p.setCaptionLabel("P-1").setColorCaptionLabel(0);
               panValue = 2;
           }
                 //propHighlight = 1;
         }
       }
     }
   }
   
   
   if(propUpward == 6){
     if(propRighty == 0){
       if(instPropUpward == 0){
         if(instPropRighty == 0){
           if(time0Col == 0){
               A6p.setCaptionLabel("G0").setColorCaptionLabel(0);
               gainValue6 = 0.5f;
           }
           if(time0Col == 1){
               A6p.setCaptionLabel("G1").setColorCaptionLabel(0);
               gainValue6 = 1.0f;
           }
           if(time0Col == 2){
               A6p.setCaptionLabel("G2").setColorCaptionLabel(0);
               gainValue6 = 1.5f;
           }
           if(time0Col == 3){
               A6p.setCaptionLabel("G3").setColorCaptionLabel(0);
               gainValue6 = 2.0f;
           }
           if(time0Col == 4){
               A6p.setCaptionLabel("G4").setColorCaptionLabel(0);
               gainValue6 = 2.5f;
           }
           if(time0Col == 5){
               A6p.setCaptionLabel("G5").setColorCaptionLabel(0);
               gainValue6 = 3.0f;
           }
                 //propHighlight = 1;
         }
         if(instPropRighty == 1){
           if(time0Col == 0){
             if (time0Row == 0){
               A6p.setCaptionLabel("Tr0").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               A6p.setCaptionLabel("Tr1").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               A6p.setCaptionLabel("Tr2").setColorCaptionLabel(0);
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               A6p.setCaptionLabel("Tr3").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               A6p.setCaptionLabel("Tr4").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               A6p.setCaptionLabel("Tr-1").setColorCaptionLabel(0);
             }
           }
           if(time0Col == 2){
             if (time0Row == 0){
               A6p.setCaptionLabel("Tr-2").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               A6p.setCaptionLabel("Tr-3").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               A6p.setCaptionLabel("Tr-4").setColorCaptionLabel(0);
             }
           }
         }
         if(instPropRighty == 2){
           if(time0Col == 0){
             if (time0Row == 0){
               A6p.setCaptionLabel("D_off").setColorCaptionLabel(0);
               delayVal5 = 0.0;
             }
             if (time0Row == 1){
               A6p.setCaptionLabel("D_on").setColorCaptionLabel(0);
               delayVal5 = 0.5;
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               A6p.setCaptionLabel("B_off").setColorCaptionLabel(0);
               bitRes5 = 0;
             }
             if (time0Row == 1){
               A6p.setCaptionLabel("B_on").setColorCaptionLabel(0);
               bitRes5 = 2;
             }
           }
         }
       }
       if(instPropUpward == 1){
         if(instPropRighty == 0){
           if(time0Col == 0){
               A6p.setCaptionLabel("Sin").setColorCaptionLabel(0);
               disWave0 = Waves.SINE;
                 //sineOsc.patch( out );
           }
           if(time0Col == 1){
               A6p.setCaptionLabel("Sq").setColorCaptionLabel(0);
               //panValue = 1;
               disWave0 =  Waves.SQUARE;
                 //sineOsc.patch( out );
           }
           if(time0Col == 2){
               A6p.setCaptionLabel("Saw").setColorCaptionLabel(0);
               //panValue = 2;
               disWave0 = Waves.SAW;
           }
                 //propHighlight = 1;
         }
         if(instPropRighty == 1){
           if(time0Col == 0){
             A6p.setCaptionLabel("");
           }
           if(time0Col == 1){
             A6.setCaptionLabel("");
             B6.setCaptionLabel("");
             C6.setCaptionLabel("");
             D6.setCaptionLabel("");
             E6.setCaptionLabel("");
             F6.setCaptionLabel("");
             G6.setCaptionLabel("");
             H6.setCaptionLabel("");
             for(int i = 0; i < 8; i++){
               instList6[i] = 0.0;
             }
           }
         }
         if(instPropRighty == 2){
           if(time0Col == 0){
               A6p.setCaptionLabel("P0").setColorCaptionLabel(0);
               panValue = 0;
           }
           if(time0Col == 1){
               A6p.setCaptionLabel("P1").setColorCaptionLabel(0);
               panValue = 1;
           }
           if(time0Col == 2){
               A6p.setCaptionLabel("P-1").setColorCaptionLabel(0);
               panValue = 2;
           }
                 //propHighlight = 1;
         }
       }
       
     }
     
     if(propRighty == 1){
       if(instPropUpward == 0){
         if(instPropRighty == 0){
           if(time0Col == 0){
               B6p.setCaptionLabel("G0").setColorCaptionLabel(0);
               gainValue6 = 0.5f;
           }
           if(time0Col == 1){
               B6p.setCaptionLabel("G1").setColorCaptionLabel(0);
               gainValue6 = 1.0f;
           }
           if(time0Col == 2){
               B6p.setCaptionLabel("G2").setColorCaptionLabel(0);
               gainValue6 = 1.5f;
           }
           if(time0Col == 3){
               B6p.setCaptionLabel("G3").setColorCaptionLabel(0);
               gainValue6 = 2.0f;
           }
           if(time0Col == 4){
               B6p.setCaptionLabel("G4").setColorCaptionLabel(0);
               gainValue6 = 2.5f;
           }
           if(time0Col == 5){
               B6p.setCaptionLabel("G5").setColorCaptionLabel(0);
               gainValue6 = 3.0f;
           }
                 //propHighlight = 1;
         }
         if(instPropRighty == 1){
           if(time0Col == 0){
             if (time0Row == 0){
               B6p.setCaptionLabel("Tr0").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               B6p.setCaptionLabel("Tr1").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               B6p.setCaptionLabel("Tr2").setColorCaptionLabel(0);
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               B6p.setCaptionLabel("Tr3").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               B6p.setCaptionLabel("Tr4").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               B6p.setCaptionLabel("Tr-1").setColorCaptionLabel(0);
             }
           }
           if(time0Col == 2){
             if (time0Row == 0){
               B6p.setCaptionLabel("Tr-2").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               B6p.setCaptionLabel("Tr-3").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               B6p.setCaptionLabel("Tr-4").setColorCaptionLabel(0);
             }
           }
         }
         if(instPropRighty == 2){
           if(time0Col == 0){
             if (time0Row == 0){
               B6p.setCaptionLabel("D_off").setColorCaptionLabel(0);
               delayVal6 = 0.0;
             }
             if (time0Row == 1){
               B6p.setCaptionLabel("D_on").setColorCaptionLabel(0);
               delayVal6 = 0.5;
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               B6p.setCaptionLabel("B_off").setColorCaptionLabel(0);
               bitRes6 = 0;
             }
             if (time0Row == 1){
               B6p.setCaptionLabel("B_on").setColorCaptionLabel(0);
               bitRes6 = 2;
             }
           }
         }
       }
       if(instPropUpward == 1){
         if(instPropRighty == 0){
           if(time0Col == 0){
               B6p.setCaptionLabel("Sin").setColorCaptionLabel(0);
               disWave0 = Waves.SINE;
                 //sineOsc.patch( out );
           }
           if(time0Col == 1){
               B6p.setCaptionLabel("Sq").setColorCaptionLabel(0);
               //panValue = 1;
               disWave0 =  Waves.SQUARE;
                 //sineOsc.patch( out );
           }
           if(time0Col == 2){
               B6p.setCaptionLabel("Saw").setColorCaptionLabel(0);
               //panValue = 2;
               disWave0 = Waves.SAW;
           }
                 //propHighlight = 1;
         }
         if(instPropRighty == 1){
           if(time0Col == 0){
             B6p.setCaptionLabel("");
           }
           if(time0Col == 1){
             A6.setCaptionLabel("");
             B6.setCaptionLabel("");
             C6.setCaptionLabel("");
             D6.setCaptionLabel("");
             E6.setCaptionLabel("");
             F6.setCaptionLabel("");
             G6.setCaptionLabel("");
             H6.setCaptionLabel("");
             for(int i = 0; i < 8; i++){
               instList6[i] = 0.0;
             }
           }
         }
         if(instPropRighty == 2){
           if(time0Col == 0){
               B6p.setCaptionLabel("P0").setColorCaptionLabel(0);
               panValue = 0;
           }
           if(time0Col == 1){
               B6p.setCaptionLabel("P1").setColorCaptionLabel(0);
               panValue = 1;
           }
           if(time0Col == 2){
               B6p.setCaptionLabel("P-1").setColorCaptionLabel(0);
               panValue = 2;
           }
                 //propHighlight = 1;
         }
       }
     }
     
     if(propRighty == 2){
       if(instPropUpward == 0){
         if(instPropRighty == 0){
           if(time0Col == 0){
               C6p.setCaptionLabel("G0").setColorCaptionLabel(0);
               gainValue6 = 0.5f;
           }
           if(time0Col == 1){
               C6p.setCaptionLabel("G1").setColorCaptionLabel(0);
               gainValue6 = 1.0f;
           }
           if(time0Col == 2){
               C6p.setCaptionLabel("G2").setColorCaptionLabel(0);
               gainValue6 = 1.5f;
           }
           if(time0Col == 3){
               C6p.setCaptionLabel("G3").setColorCaptionLabel(0);
               gainValue6 = 2.0f;
           }
           if(time0Col == 4){
               C6p.setCaptionLabel("G4").setColorCaptionLabel(0);
               gainValue6 = 2.5f;
           }
           if(time0Col == 5){
               C6p.setCaptionLabel("G5").setColorCaptionLabel(0);
               gainValue6 = 3.0f;
           }
                 //propHighlight = 1;
         }
         if(instPropRighty == 1){
           if(time0Col == 0){
             if (time0Row == 0){
               C6p.setCaptionLabel("Tr0").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               C6p.setCaptionLabel("Tr1").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               C6p.setCaptionLabel("Tr2").setColorCaptionLabel(0);
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               C6p.setCaptionLabel("Tr3").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               C6p.setCaptionLabel("Tr4").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               C6p.setCaptionLabel("Tr-1").setColorCaptionLabel(0);
             }
           }
           if(time0Col == 2){
             if (time0Row == 0){
               C6p.setCaptionLabel("Tr-2").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               C6p.setCaptionLabel("Tr-3").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               C6p.setCaptionLabel("Tr-4").setColorCaptionLabel(0);
             }
           }
         }
         if(instPropRighty == 2){
           if(time0Col == 0){
             if (time0Row == 0){
               C6p.setCaptionLabel("D_off").setColorCaptionLabel(0);
               delayVal6 = 0.0;
             }
             if (time0Row == 1){
               C6p.setCaptionLabel("D_on").setColorCaptionLabel(0);
               delayVal6 = 0.5;
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               C6p.setCaptionLabel("B_off").setColorCaptionLabel(0);
               bitRes6 = 0;
             }
             if (time0Row == 1){
               C6p.setCaptionLabel("B_on").setColorCaptionLabel(0);
               bitRes6 = 2;
             }
           }
         }
       }
       if(instPropUpward == 1){
         if(instPropRighty == 0){
           if(time0Col == 0){
               C6p.setCaptionLabel("Sin").setColorCaptionLabel(0);
               disWave0 = Waves.SINE;
                 //sineOsc.patch( out );
           }
           if(time0Col == 1){
               C6p.setCaptionLabel("Sq").setColorCaptionLabel(0);
               //panValue = 1;
               disWave0 =  Waves.SQUARE;
                 //sineOsc.patch( out );
           }
           if(time0Col == 2){
               C6p.setCaptionLabel("Saw").setColorCaptionLabel(0);
               //panValue = 2;
               disWave0 = Waves.SAW;
           }
                 //propHighlight = 1;
         }
         if(instPropRighty == 1){
           if(time0Col == 0){
             C6p.setCaptionLabel("");
           }
           if(time0Col == 1){
             A6.setCaptionLabel("");
             B6.setCaptionLabel("");
             C6.setCaptionLabel("");
             D6.setCaptionLabel("");
             E6.setCaptionLabel("");
             F6.setCaptionLabel("");
             G6.setCaptionLabel("");
             H6.setCaptionLabel("");
             for(int i = 0; i < 8; i++){
               instList6[i] = 0.0;
             }
           }
         }
         if(instPropRighty == 2){
           if(time0Col == 0){
               C6p.setCaptionLabel("P0").setColorCaptionLabel(0);
               panValue = 0;
           }
           if(time0Col == 1){
               C6p.setCaptionLabel("P1").setColorCaptionLabel(0);
               panValue = 1;
           }
           if(time0Col == 2){
               C6p.setCaptionLabel("P-1").setColorCaptionLabel(0);
               panValue = 2;
           }
                 //propHighlight = 1;
         }
       }
     }
     
     if(propRighty == 3){
       if(instPropUpward == 0){
         if(instPropRighty == 0){
           if(time0Col == 0){
               D6p.setCaptionLabel("G0").setColorCaptionLabel(0);
               gainValue6 = 0.5f;
           }
           if(time0Col == 1){
               D6p.setCaptionLabel("G1").setColorCaptionLabel(0);
               gainValue6 = 1.0f;
           }
           if(time0Col == 2){
               D6p.setCaptionLabel("G2").setColorCaptionLabel(0);
               gainValue6 = 1.5f;
           }
           if(time0Col == 3){
               D6p.setCaptionLabel("G3").setColorCaptionLabel(0);
               gainValue6 = 2.0f;
           }
           if(time0Col == 4){
               D6p.setCaptionLabel("G4").setColorCaptionLabel(0);
               gainValue6 = 2.5f;
           }
           if(time0Col == 5){
               D6p.setCaptionLabel("G5").setColorCaptionLabel(0);
               gainValue6 = 3.0f;
           }
                 //propHighlight = 1;
         }
         if(instPropRighty == 1){
           if(time0Col == 0){
             if (time0Row == 0){
               D6p.setCaptionLabel("Tr0").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               D6p.setCaptionLabel("Tr1").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               D6p.setCaptionLabel("Tr2").setColorCaptionLabel(0);
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               D6p.setCaptionLabel("Tr3").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               D6p.setCaptionLabel("Tr4").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               D6p.setCaptionLabel("Tr-1").setColorCaptionLabel(0);
             }
           }
           if(time0Col == 2){
             if (time0Row == 0){
               D6p.setCaptionLabel("Tr-2").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               D6p.setCaptionLabel("Tr-3").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               D6p.setCaptionLabel("Tr-4").setColorCaptionLabel(0);
             }
           }
         }
         if(instPropRighty == 2){
           if(time0Col == 0){
             if (time0Row == 0){
               D6p.setCaptionLabel("D_off").setColorCaptionLabel(0);
               delayVal6 = 0.0;
             }
             if (time0Row == 1){
               D6p.setCaptionLabel("D_on").setColorCaptionLabel(0);
               delayVal6 = 0.5;
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               D6p.setCaptionLabel("B_off").setColorCaptionLabel(0);
               bitRes6 = 0;
             }
             if (time0Row == 1){
               D6p.setCaptionLabel("B_on").setColorCaptionLabel(0);
               bitRes6 = 2;
             }
           }
         }
       }
       if(instPropUpward == 1){
         if(instPropRighty == 0){
           if(time0Col == 0){
               D6p.setCaptionLabel("Sin").setColorCaptionLabel(0);
               disWave0 = Waves.SINE;
                 //sineOsc.patch( out );
           }
           if(time0Col == 1){
               D6p.setCaptionLabel("Sq").setColorCaptionLabel(0);
               //panValue = 1;
               disWave0 =  Waves.SQUARE;
                 //sineOsc.patch( out );
           }
           if(time0Col == 2){
               D6p.setCaptionLabel("Saw").setColorCaptionLabel(0);
               //panValue = 2;
               disWave0 = Waves.SAW;
           }
                 //propHighlight = 1;
         }
         if(instPropRighty == 1){
           if(time0Col == 0){
             D6p.setCaptionLabel("");
           }
           if(time0Col == 1){
             A6.setCaptionLabel("");
             B6.setCaptionLabel("");
             C6.setCaptionLabel("");
             D6.setCaptionLabel("");
             E6.setCaptionLabel("");
             F6.setCaptionLabel("");
             G6.setCaptionLabel("");
             H6.setCaptionLabel("");
             for(int i = 0; i < 8; i++){
               instList6[i] = 0.0;
             }
           }
         }
         if(instPropRighty == 2){
           if(time0Col == 0){
               D6p.setCaptionLabel("P0").setColorCaptionLabel(0);
               panValue = 0;
           }
           if(time0Col == 1){
               D6p.setCaptionLabel("P1").setColorCaptionLabel(0);
               panValue = 1;
           }
           if(time0Col == 2){
               D6p.setCaptionLabel("P-1").setColorCaptionLabel(0);
               panValue = 2;
           }
                 //propHighlight = 1;
         }
       }
     }
     
     if(propRighty == 4){
       if(instPropUpward == 0){
         if(instPropRighty == 0){
           if(time0Col == 0){
               E6p.setCaptionLabel("G0").setColorCaptionLabel(0);
               gainValue6 = 0.5f;
           }
           if(time0Col == 1){
               E6p.setCaptionLabel("G1").setColorCaptionLabel(0);
               gainValue6 = 1.0f;
           }
           if(time0Col == 2){
               E6p.setCaptionLabel("G2").setColorCaptionLabel(0);
               gainValue6 = 1.5f;
           }
           if(time0Col == 3){
               E6p.setCaptionLabel("G3").setColorCaptionLabel(0);
               gainValue6 = 2.0f;
           }
           if(time0Col == 4){
               E6p.setCaptionLabel("G4").setColorCaptionLabel(0);
               gainValue6 = 2.5f;
           }
           if(time0Col == 5){
               E6p.setCaptionLabel("G5").setColorCaptionLabel(0);
               gainValue6 = 3.0f;
           }
                 //propHighlight = 1;
         }
         if(instPropRighty == 1){
           if(time0Col == 0){
             if (time0Row == 0){
               E6p.setCaptionLabel("Tr0").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               E6p.setCaptionLabel("Tr1").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               E6p.setCaptionLabel("Tr2").setColorCaptionLabel(0);
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               E6p.setCaptionLabel("Tr3").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               E6p.setCaptionLabel("Tr4").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               E6p.setCaptionLabel("Tr-1").setColorCaptionLabel(0);
             }
           }
           if(time0Col == 2){
             if (time0Row == 0){
               E6p.setCaptionLabel("Tr-2").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               E6p.setCaptionLabel("Tr-3").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               E6p.setCaptionLabel("Tr-4").setColorCaptionLabel(0);
             }
           }
         }
         if(instPropRighty == 2){
           if(time0Col == 0){
             if (time0Row == 0){
               E6p.setCaptionLabel("D_off").setColorCaptionLabel(0);
               delayVal6 = 0.0;
             }
             if (time0Row == 1){
               E6p.setCaptionLabel("D_on").setColorCaptionLabel(0);
               delayVal6 = 0.5;
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               E6p.setCaptionLabel("B_off").setColorCaptionLabel(0);
               bitRes6 = 0;
             }
             if (time0Row == 1){
               E6p.setCaptionLabel("B_on").setColorCaptionLabel(0);
               bitRes6 = 2;
             }
           }
         }
       }
       if(instPropUpward == 1){
         if(instPropRighty == 0){
           if(time0Col == 0){
               E6p.setCaptionLabel("Sin").setColorCaptionLabel(0);
               disWave0 = Waves.SINE;
                 //sineOsc.patch( out );
           }
           if(time0Col == 1){
               E6p.setCaptionLabel("Sq").setColorCaptionLabel(0);
               //panValue = 1;
               disWave0 =  Waves.SQUARE;
                 //sineOsc.patch( out );
           }
           if(time0Col == 2){
               E6p.setCaptionLabel("Saw").setColorCaptionLabel(0);
               //panValue = 2;
               disWave0 = Waves.SAW;
           }
                 //propHighlight = 1;
         }
         if(instPropRighty == 1){
           if(time0Col == 0){
             E6p.setCaptionLabel("");
           }
           if(time0Col == 1){
             A6.setCaptionLabel("");
             B6.setCaptionLabel("");
             C6.setCaptionLabel("");
             D6.setCaptionLabel("");
             E6.setCaptionLabel("");
             F6.setCaptionLabel("");
             G6.setCaptionLabel("");
             H6.setCaptionLabel("");
             for(int i = 0; i < 8; i++){
               instList6[i] = 0.0;
             }
           }
         }
         if(instPropRighty == 2){
           if(time0Col == 0){
               E6p.setCaptionLabel("P0").setColorCaptionLabel(0);
               panValue = 0;
           }
           if(time0Col == 1){
               E6p.setCaptionLabel("P1").setColorCaptionLabel(0);
               panValue = 1;
           }
           if(time0Col == 2){
               E6p.setCaptionLabel("P-1").setColorCaptionLabel(0);
               panValue = 2;
           }
                 //propHighlight = 1;
         }
       }
     }
     
     if(propRighty == 5){
       if(instPropUpward == 0){
         if(instPropRighty == 0){
           if(time0Col == 0){
               F6p.setCaptionLabel("G0").setColorCaptionLabel(0);
               gainValue6 = 0.5f;
           }
           if(time0Col == 1){
               F6p.setCaptionLabel("G1").setColorCaptionLabel(0);
               gainValue6 = 1.0f;
           }
           if(time0Col == 2){
               F6p.setCaptionLabel("G2").setColorCaptionLabel(0);
               gainValue6 = 1.5f;
           }
           if(time0Col == 3){
               F6p.setCaptionLabel("G3").setColorCaptionLabel(0);
               gainValue6 = 2.0f;
           }
           if(time0Col == 4){
               F6p.setCaptionLabel("G4").setColorCaptionLabel(0);
               gainValue6 = 2.5f;
           }
           if(time0Col == 5){
               F6p.setCaptionLabel("G5").setColorCaptionLabel(0);
               gainValue6 = 3.0f;
           }
                 //propHighlight = 1;
         }
         if(instPropRighty == 1){
           if(time0Col == 0){
             if (time0Row == 0){
               F6p.setCaptionLabel("Tr0").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               F6p.setCaptionLabel("Tr1").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               F6p.setCaptionLabel("Tr2").setColorCaptionLabel(0);
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               F6p.setCaptionLabel("Tr3").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               F6p.setCaptionLabel("Tr4").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               F6p.setCaptionLabel("Tr-1").setColorCaptionLabel(0);
             }
           }
           if(time0Col == 2){
             if (time0Row == 0){
               F6p.setCaptionLabel("Tr-2").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               F6p.setCaptionLabel("Tr-3").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               F6p.setCaptionLabel("Tr-4").setColorCaptionLabel(0);
             }
           }
         }
         if(instPropRighty == 2){
           if(time0Col == 0){
             if (time0Row == 0){
               F6p.setCaptionLabel("D_off").setColorCaptionLabel(0);
               delayVal6 = 0.0;
             }
             if (time0Row == 1){
               F6p.setCaptionLabel("D_on").setColorCaptionLabel(0);
               delayVal6 = 0.5;
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               F6p.setCaptionLabel("B_off").setColorCaptionLabel(0);
               bitRes6 = 0;
             }
             if (time0Row == 1){
               F6p.setCaptionLabel("B_on").setColorCaptionLabel(0);
               bitRes6 = 2;
             }
           }
         }
       }
       if(instPropUpward == 1){
         if(instPropRighty == 0){
           if(time0Col == 0){
               F6p.setCaptionLabel("Sin").setColorCaptionLabel(0);
               disWave0 = Waves.SINE;
                 //sineOsc.patch( out );
           }
           if(time0Col == 1){
               F6p.setCaptionLabel("Sq").setColorCaptionLabel(0);
               //panValue = 1;
               disWave0 =  Waves.SQUARE;
                 //sineOsc.patch( out );
           }
           if(time0Col == 2){
               F6p.setCaptionLabel("Saw").setColorCaptionLabel(0);
               //panValue = 2;
               disWave0 = Waves.SAW;
           }
                 //propHighlight = 1;
         }
         if(instPropRighty == 1){
           if(time0Col == 0){
             F6p.setCaptionLabel("");
           }
           if(time0Col == 1){
             A6.setCaptionLabel("");
             B6.setCaptionLabel("");
             C6.setCaptionLabel("");
             D6.setCaptionLabel("");
             E6.setCaptionLabel("");
             F6.setCaptionLabel("");
             G6.setCaptionLabel("");
             H6.setCaptionLabel("");
             for(int i = 0; i < 8; i++){
               instList6[i] = 0.0;
             }
           }
         }
         if(instPropRighty == 2){
           if(time0Col == 0){
               F6p.setCaptionLabel("P0").setColorCaptionLabel(0);
               panValue = 0;
           }
           if(time0Col == 1){
               F6p.setCaptionLabel("P1").setColorCaptionLabel(0);
               panValue = 1;
           }
           if(time0Col == 2){
               F6p.setCaptionLabel("P-1").setColorCaptionLabel(0);
               panValue = 2;
           }
                 //propHighlight = 1;
         }
       }
     }
   }
   
   if(propUpward == 7){
     if(propRighty == 0){
       if(instPropUpward == 0){
         if(instPropRighty == 0){
           if(time0Col == 0){
               A7p.setCaptionLabel("G0").setColorCaptionLabel(0);
               gainValue7 = 0.5f;
           }
           if(time0Col == 1){
               A7p.setCaptionLabel("G1").setColorCaptionLabel(0);
               gainValue7 = 1.0f;
           }
           if(time0Col == 2){
               A7p.setCaptionLabel("G2").setColorCaptionLabel(0);
               gainValue7 = 1.5f;
           }
           if(time0Col == 3){
               A7p.setCaptionLabel("G3").setColorCaptionLabel(0);
               gainValue7 = 2.0f;
           }
           if(time0Col == 4){
               A7p.setCaptionLabel("G4").setColorCaptionLabel(0);
               gainValue7 = 2.5f;
           }
           if(time0Col == 5){
               A7p.setCaptionLabel("G5").setColorCaptionLabel(0);
               gainValue7 = 3.0f;
           }
                 //propHighlight = 1;
         }
         if(instPropRighty == 1){
           if(time0Col == 0){
             if (time0Row == 0){
               A7p.setCaptionLabel("Tr0").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               A7p.setCaptionLabel("Tr1").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               A7p.setCaptionLabel("Tr2").setColorCaptionLabel(0);
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               A7p.setCaptionLabel("Tr3").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               A7p.setCaptionLabel("Tr4").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               A7p.setCaptionLabel("Tr-1").setColorCaptionLabel(0);
             }
           }
           if(time0Col == 2){
             if (time0Row == 0){
               A7p.setCaptionLabel("Tr-2").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               A7p.setCaptionLabel("Tr-3").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               A7p.setCaptionLabel("Tr-4").setColorCaptionLabel(0);
             }
           }
         }
         if(instPropRighty == 2){
           if(time0Col == 0){
             if (time0Row == 0){
               A7p.setCaptionLabel("D_off").setColorCaptionLabel(0);
               delayVal7 = 0.0;
             }
             if (time0Row == 1){
               A7p.setCaptionLabel("D_on").setColorCaptionLabel(0);
               delayVal7 = 0.5;
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               A7p.setCaptionLabel("B_off").setColorCaptionLabel(0);
               bitRes7 = 0;
             }
             if (time0Row == 1){
               A7p.setCaptionLabel("B_on").setColorCaptionLabel(0);
               bitRes7 = 2;
             }
           }
         }
       }
       if(instPropUpward == 1){
         if(instPropRighty == 0){
           if(time0Col == 0){
               A7p.setCaptionLabel("Sin").setColorCaptionLabel(0);
               disWave0 = Waves.SINE;
                 //sineOsc.patch( out );
           }
           if(time0Col == 1){
               A7p.setCaptionLabel("Sq").setColorCaptionLabel(0);
               //panValue = 1;
               disWave0 =  Waves.SQUARE;
                 //sineOsc.patch( out );
           }
           if(time0Col == 2){
               A7p.setCaptionLabel("Saw").setColorCaptionLabel(0);
               //panValue = 2;
               disWave0 = Waves.SAW;
           }
                 //propHighlight = 1;
         }
         if(instPropRighty == 1){
           if(time0Col == 0){
             A7p.setCaptionLabel("");
           }
           if(time0Col == 1){
             A7.setCaptionLabel("");
             B7.setCaptionLabel("");
             C7.setCaptionLabel("");
             D7.setCaptionLabel("");
             E7.setCaptionLabel("");
             F7.setCaptionLabel("");
             G7.setCaptionLabel("");
             H7.setCaptionLabel("");
             for(int i = 0; i < 8; i++){
               instList7[i] = 0.0;
             }
           }
         }
         if(instPropRighty == 2){
           if(time0Col == 0){
               A7p.setCaptionLabel("P0").setColorCaptionLabel(0);
               panValue = 0;
           }
           if(time0Col == 1){
               A7p.setCaptionLabel("P1").setColorCaptionLabel(0);
               panValue = 1;
           }
           if(time0Col == 2){
               A7p.setCaptionLabel("P-1").setColorCaptionLabel(0);
               panValue = 2;
           }
                 //propHighlight = 1;
         }
       }
       
     }
     
     if(propRighty == 1){
       if(instPropUpward == 0){
         if(instPropRighty == 0){
           if(time0Col == 0){
               B7p.setCaptionLabel("G0").setColorCaptionLabel(0);
               gainValue7 = 0.5f;
           }
           if(time0Col == 1){
               B7p.setCaptionLabel("G1").setColorCaptionLabel(0);
               gainValue7 = 1.0f;
           }
           if(time0Col == 2){
               B7p.setCaptionLabel("G2").setColorCaptionLabel(0);
               gainValue7 = 1.5f;
           }
           if(time0Col == 3){
               B7p.setCaptionLabel("G3").setColorCaptionLabel(0);
               gainValue7 = 2.0f;
           }
           if(time0Col == 4){
               B7p.setCaptionLabel("G4").setColorCaptionLabel(0);
               gainValue7 = 2.5f;
           }
           if(time0Col == 5){
               B7p.setCaptionLabel("G5").setColorCaptionLabel(0);
               gainValue7 = 3.0f;
           }
                 //propHighlight = 1;
         }
         if(instPropRighty == 1){
           if(time0Col == 0){
             if (time0Row == 0){
               B7p.setCaptionLabel("Tr0").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               B7p.setCaptionLabel("Tr1").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               B7p.setCaptionLabel("Tr2").setColorCaptionLabel(0);
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               B7p.setCaptionLabel("Tr3").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               B7p.setCaptionLabel("Tr4").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               B7p.setCaptionLabel("Tr-1").setColorCaptionLabel(0);
             }
           }
           if(time0Col == 2){
             if (time0Row == 0){
               B7p.setCaptionLabel("Tr-2").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               B7p.setCaptionLabel("Tr-3").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               B7p.setCaptionLabel("Tr-4").setColorCaptionLabel(0);
             }
           }
         }
         if(instPropRighty == 2){
           if(time0Col == 0){
             if (time0Row == 0){
               B7p.setCaptionLabel("D_off").setColorCaptionLabel(0);
               delayVal7 = 0.0;
             }
             if (time0Row == 1){
               B7p.setCaptionLabel("D_on").setColorCaptionLabel(0);
               delayVal7 = 0.5;
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               B7p.setCaptionLabel("B_off").setColorCaptionLabel(0);
               bitRes7 = 0;
             }
             if (time0Row == 1){
               B7p.setCaptionLabel("B_on").setColorCaptionLabel(0);
               bitRes7 = 2;
             }
           }
         }
       }
       if(instPropUpward == 1){
         if(instPropRighty == 0){
           if(time0Col == 0){
               B7p.setCaptionLabel("Sin").setColorCaptionLabel(0);
               disWave0 = Waves.SINE;
                 //sineOsc.patch( out );
           }
           if(time0Col == 1){
               B7p.setCaptionLabel("Sq").setColorCaptionLabel(0);
               //panValue = 1;
               disWave0 =  Waves.SQUARE;
                 //sineOsc.patch( out );
           }
           if(time0Col == 2){
               B7p.setCaptionLabel("Saw").setColorCaptionLabel(0);
               //panValue = 2;
               disWave0 = Waves.SAW;
           }
                 //propHighlight = 1;
         }
         if(instPropRighty == 1){
           if(time0Col == 0){
             B7p.setCaptionLabel("");
           }
           if(time0Col == 1){
             A7.setCaptionLabel("");
             B7.setCaptionLabel("");
             C7.setCaptionLabel("");
             D7.setCaptionLabel("");
             E7.setCaptionLabel("");
             F7.setCaptionLabel("");
             G7.setCaptionLabel("");
             H7.setCaptionLabel("");
             for(int i = 0; i < 8; i++){
               instList7[i] = 0.0;
             }
           }
         }
         if(instPropRighty == 2){
           if(time0Col == 0){
               B7p.setCaptionLabel("P0").setColorCaptionLabel(0);
               panValue = 0;
           }
           if(time0Col == 1){
               B7p.setCaptionLabel("P1").setColorCaptionLabel(0);
               panValue = 1;
           }
           if(time0Col == 2){
               B7p.setCaptionLabel("P-1").setColorCaptionLabel(0);
               panValue = 2;
           }
                 //propHighlight = 1;
         }
       }
     }
     
     if(propRighty == 2){
       if(instPropUpward == 0){
         if(instPropRighty == 0){
           if(time0Col == 0){
               C7p.setCaptionLabel("G0").setColorCaptionLabel(0);
               gainValue7 = 0.5f;
           }
           if(time0Col == 1){
               C7p.setCaptionLabel("G1").setColorCaptionLabel(0);
               gainValue7 = 1.0f;
           }
           if(time0Col == 2){
               C7p.setCaptionLabel("G2").setColorCaptionLabel(0);
               gainValue7 = 1.5f;
           }
           if(time0Col == 3){
               C7p.setCaptionLabel("G3").setColorCaptionLabel(0);
               gainValue7 = 2.0f;
           }
           if(time0Col == 4){
               C7p.setCaptionLabel("G4").setColorCaptionLabel(0);
               gainValue7 = 2.5f;
           }
           if(time0Col == 5){
               C7p.setCaptionLabel("G5").setColorCaptionLabel(0);
               gainValue7 = 3.0f;
           }
                 //propHighlight = 1;
         }
         if(instPropRighty == 1){
           if(time0Col == 0){
             if (time0Row == 0){
               C7p.setCaptionLabel("Tr0").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               C7p.setCaptionLabel("Tr1").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               C7p.setCaptionLabel("Tr2").setColorCaptionLabel(0);
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               C7p.setCaptionLabel("Tr3").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               C7p.setCaptionLabel("Tr4").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               C7p.setCaptionLabel("Tr-1").setColorCaptionLabel(0);
             }
           }
           if(time0Col == 2){
             if (time0Row == 0){
               C7p.setCaptionLabel("Tr-2").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               C7p.setCaptionLabel("Tr-3").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               C7p.setCaptionLabel("Tr-4").setColorCaptionLabel(0);
             }
           }
         }
         if(instPropRighty == 2){
           if(time0Col == 0){
             if (time0Row == 0){
               C7p.setCaptionLabel("D_off").setColorCaptionLabel(0);
               delayVal7 = 0.0;
             }
             if (time0Row == 1){
               C7p.setCaptionLabel("D_on").setColorCaptionLabel(0);
               delayVal7 = 0.5;
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               C7p.setCaptionLabel("B_off").setColorCaptionLabel(0);
               bitRes7 = 0;
             }
             if (time0Row == 1){
               C7p.setCaptionLabel("B_on").setColorCaptionLabel(0);
               bitRes7 = 2;
             }
           }
         }
       }
       if(instPropUpward == 1){
         if(instPropRighty == 0){
           if(time0Col == 0){
               C7p.setCaptionLabel("Sin").setColorCaptionLabel(0);
               disWave0 = Waves.SINE;
                 //sineOsc.patch( out );
           }
           if(time0Col == 1){
               C7p.setCaptionLabel("Sq").setColorCaptionLabel(0);
               //panValue = 1;
               disWave0 =  Waves.SQUARE;
                 //sineOsc.patch( out );
           }
           if(time0Col == 2){
               C7p.setCaptionLabel("Saw").setColorCaptionLabel(0);
               //panValue = 2;
               disWave0 = Waves.SAW;
           }
                 //propHighlight = 1;
         }
         if(instPropRighty == 1){
           if(time0Col == 0){
             C7p.setCaptionLabel("");
           }
           if(time0Col == 1){
             A7.setCaptionLabel("");
             B7.setCaptionLabel("");
             C7.setCaptionLabel("");
             D7.setCaptionLabel("");
             E7.setCaptionLabel("");
             F7.setCaptionLabel("");
             G7.setCaptionLabel("");
             H7.setCaptionLabel("");
             for(int i = 0; i < 8; i++){
               instList7[i] = 0.0;
             }
           }
         }
         if(instPropRighty == 2){
           if(time0Col == 0){
               C7p.setCaptionLabel("P0").setColorCaptionLabel(0);
               panValue = 0;
           }
           if(time0Col == 1){
               C7p.setCaptionLabel("P1").setColorCaptionLabel(0);
               panValue = 1;
           }
           if(time0Col == 2){
               C7p.setCaptionLabel("P-1").setColorCaptionLabel(0);
               panValue = 2;
           }
                 //propHighlight = 1;
         }
       }
     }
     
     if(propRighty == 3){
       if(instPropUpward == 0){
         if(instPropRighty == 0){
           if(time0Col == 0){
               D7p.setCaptionLabel("G0").setColorCaptionLabel(0);
               gainValue7 = 0.5f;
           }
           if(time0Col == 1){
               D7p.setCaptionLabel("G1").setColorCaptionLabel(0);
               gainValue7 = 1.0f;
           }
           if(time0Col == 2){
               D7p.setCaptionLabel("G2").setColorCaptionLabel(0);
               gainValue7 = 1.5f;
           }
           if(time0Col == 3){
               D7p.setCaptionLabel("G3").setColorCaptionLabel(0);
               gainValue7 = 2.0f;
           }
           if(time0Col == 4){
               D7p.setCaptionLabel("G4").setColorCaptionLabel(0);
               gainValue7 = 2.5f;
           }
           if(time0Col == 5){
               D7p.setCaptionLabel("G5").setColorCaptionLabel(0);
               gainValue7 = 3.0f;
           }
                 //propHighlight = 1;
         }
         if(instPropRighty == 1){
           if(time0Col == 0){
             if (time0Row == 0){
               D7p.setCaptionLabel("Tr0").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               D7p.setCaptionLabel("Tr1").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               D7p.setCaptionLabel("Tr2").setColorCaptionLabel(0);
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               D7p.setCaptionLabel("Tr3").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               D7p.setCaptionLabel("Tr4").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               D7p.setCaptionLabel("Tr-1").setColorCaptionLabel(0);
             }
           }
           if(time0Col == 2){
             if (time0Row == 0){
               D7p.setCaptionLabel("Tr-2").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               D7p.setCaptionLabel("Tr-3").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               D7p.setCaptionLabel("Tr-4").setColorCaptionLabel(0);
             }
           }
         }
         if(instPropRighty == 2){
           if(time0Col == 0){
             if (time0Row == 0){
               D7p.setCaptionLabel("D_off").setColorCaptionLabel(0);
               delayVal7 = 0.0;
             }
             if (time0Row == 1){
               D7p.setCaptionLabel("D_on").setColorCaptionLabel(0);
               delayVal7 = 0.5;
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               D7p.setCaptionLabel("B_off").setColorCaptionLabel(0);
               bitRes7 = 0;
             }
             if (time0Row == 1){
               D7p.setCaptionLabel("B_on").setColorCaptionLabel(0);
               bitRes7 = 2;
             }
           }
         }
       }
       if(instPropUpward == 1){
         if(instPropRighty == 0){
           if(time0Col == 0){
               D7p.setCaptionLabel("Sin").setColorCaptionLabel(0);
               disWave0 = Waves.SINE;
                 //sineOsc.patch( out );
           }
           if(time0Col == 1){
               D7p.setCaptionLabel("Sq").setColorCaptionLabel(0);
               //panValue = 1;
               disWave0 =  Waves.SQUARE;
                 //sineOsc.patch( out );
           }
           if(time0Col == 2){
               D7p.setCaptionLabel("Saw").setColorCaptionLabel(0);
               //panValue = 2;
               disWave0 = Waves.SAW;
           }
                 //propHighlight = 1;
         }
         if(instPropRighty == 1){
           if(time0Col == 0){
             D7p.setCaptionLabel("");
           }
           if(time0Col == 1){
             A7.setCaptionLabel("");
             B7.setCaptionLabel("");
             C7.setCaptionLabel("");
             D7.setCaptionLabel("");
             E7.setCaptionLabel("");
             F7.setCaptionLabel("");
             G7.setCaptionLabel("");
             H7.setCaptionLabel("");
             for(int i = 0; i < 8; i++){
               instList7[i] = 0.0;
             }
           }
         }
         if(instPropRighty == 2){
           if(time0Col == 0){
               D7p.setCaptionLabel("P0").setColorCaptionLabel(0);
               panValue = 0;
           }
           if(time0Col == 1){
               D7p.setCaptionLabel("P1").setColorCaptionLabel(0);
               panValue = 1;
           }
           if(time0Col == 2){
               D7p.setCaptionLabel("P-1").setColorCaptionLabel(0);
               panValue = 2;
           }
                 //propHighlight = 1;
         }
       }
     }
     
     if(propRighty == 4){
       if(instPropUpward == 0){
         if(instPropRighty == 0){
           if(time0Col == 0){
               E7p.setCaptionLabel("G0").setColorCaptionLabel(0);
               gainValue7 = 0.5f;
           }
           if(time0Col == 1){
               E7p.setCaptionLabel("G1").setColorCaptionLabel(0);
               gainValue7 = 1.0f;
           }
           if(time0Col == 2){
               E7p.setCaptionLabel("G2").setColorCaptionLabel(0);
               gainValue7 = 1.5f;
           }
           if(time0Col == 3){
               E7p.setCaptionLabel("G3").setColorCaptionLabel(0);
               gainValue7 = 2.0f;
           }
           if(time0Col == 4){
               E7p.setCaptionLabel("G4").setColorCaptionLabel(0);
               gainValue7 = 2.5f;
           }
           if(time0Col == 5){
               E7p.setCaptionLabel("G5").setColorCaptionLabel(0);
               gainValue7 = 3.0f;
           }
                 //propHighlight = 1;
         }
         if(instPropRighty == 1){
           if(time0Col == 0){
             if (time0Row == 0){
               E7p.setCaptionLabel("Tr0").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               E7p.setCaptionLabel("Tr1").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               E7p.setCaptionLabel("Tr2").setColorCaptionLabel(0);
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               E7p.setCaptionLabel("Tr3").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               E7p.setCaptionLabel("Tr4").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               E7p.setCaptionLabel("Tr-1").setColorCaptionLabel(0);
             }
           }
           if(time0Col == 2){
             if (time0Row == 0){
               E7p.setCaptionLabel("Tr-2").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               E7p.setCaptionLabel("Tr-3").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               E7p.setCaptionLabel("Tr-4").setColorCaptionLabel(0);
             }
           }
         }
         if(instPropRighty == 2){
           if(time0Col == 0){
             if (time0Row == 0){
               E7p.setCaptionLabel("D_off").setColorCaptionLabel(0);
               delayVal7 = 0.0;
             }
             if (time0Row == 1){
               E7p.setCaptionLabel("D_on").setColorCaptionLabel(0);
               delayVal7 = 0.5;
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               E7p.setCaptionLabel("B_off").setColorCaptionLabel(0);
               bitRes7 = 0;
             }
             if (time0Row == 1){
               E7p.setCaptionLabel("B_on").setColorCaptionLabel(0);
               bitRes7 = 2;
             }
           }
         }
       }
       if(instPropUpward == 1){
         if(instPropRighty == 0){
           if(time0Col == 0){
               E7p.setCaptionLabel("Sin").setColorCaptionLabel(0);
               disWave0 = Waves.SINE;
                 //sineOsc.patch( out );
           }
           if(time0Col == 1){
               E7p.setCaptionLabel("Sq").setColorCaptionLabel(0);
               //panValue = 1;
               disWave0 =  Waves.SQUARE;
                 //sineOsc.patch( out );
           }
           if(time0Col == 2){
               E7p.setCaptionLabel("Saw").setColorCaptionLabel(0);
               //panValue = 2;
               disWave0 = Waves.SAW;
           }
                 //propHighlight = 1;
         }
         if(instPropRighty == 1){
           if(time0Col == 0){
             E7p.setCaptionLabel("");
           }
           if(time0Col == 1){
             A7.setCaptionLabel("");
             B7.setCaptionLabel("");
             C7.setCaptionLabel("");
             D7.setCaptionLabel("");
             E7.setCaptionLabel("");
             F7.setCaptionLabel("");
             G7.setCaptionLabel("");
             H7.setCaptionLabel("");
             for(int i = 0; i < 8; i++){
               instList7[i] = 0.0;
             }
           }
         }
         if(instPropRighty == 2){
           if(time0Col == 0){
               E7p.setCaptionLabel("P0").setColorCaptionLabel(0);
               panValue = 0;
           }
           if(time0Col == 1){
               E7p.setCaptionLabel("P1").setColorCaptionLabel(0);
               panValue = 1;
           }
           if(time0Col == 2){
               E7p.setCaptionLabel("P-1").setColorCaptionLabel(0);
               panValue = 2;
           }
                 //propHighlight = 1;
         }
       }
     }
     
     if(propRighty == 5){
       if(instPropUpward == 0){
         if(instPropRighty == 0){
           if(time0Col == 0){
               F7p.setCaptionLabel("G0").setColorCaptionLabel(0);
               gainValue7 = 0.5f;
           }
           if(time0Col == 1){
               F7p.setCaptionLabel("G1").setColorCaptionLabel(0);
               gainValue7 = 1.0f;
           }
           if(time0Col == 2){
               F7p.setCaptionLabel("G2").setColorCaptionLabel(0);
               gainValue7 = 1.5f;
           }
           if(time0Col == 3){
               F7p.setCaptionLabel("G3").setColorCaptionLabel(0);
               gainValue7 = 2.0f;
           }
           if(time0Col == 4){
               F7p.setCaptionLabel("G4").setColorCaptionLabel(0);
               gainValue7 = 2.5f;
           }
           if(time0Col == 5){
               F7p.setCaptionLabel("G5").setColorCaptionLabel(0);
               gainValue7 = 3.0f;
           }
                 //propHighlight = 1;
         }
         if(instPropRighty == 1){
           if(time0Col == 0){
             if (time0Row == 0){
               F7p.setCaptionLabel("Tr0").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               F7p.setCaptionLabel("Tr1").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               F7p.setCaptionLabel("Tr2").setColorCaptionLabel(0);
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               F7p.setCaptionLabel("Tr3").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               F7p.setCaptionLabel("Tr4").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               F7p.setCaptionLabel("Tr-1").setColorCaptionLabel(0);
             }
           }
           if(time0Col == 2){
             if (time0Row == 0){
               F7p.setCaptionLabel("Tr-2").setColorCaptionLabel(0);
             }
             if (time0Row == 1){
               F7p.setCaptionLabel("Tr-3").setColorCaptionLabel(0);
             }
             if (time0Row == 2){
               F7p.setCaptionLabel("Tr-4").setColorCaptionLabel(0);
             }
           }
         }
         if(instPropRighty == 2){
           if(time0Col == 0){
             if (time0Row == 0){
               F7p.setCaptionLabel("D_off").setColorCaptionLabel(0);
               delayVal7 = 0.0;
             }
             if (time0Row == 1){
               F7p.setCaptionLabel("D_on").setColorCaptionLabel(0);
               delayVal7 = 0.5;
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               F7p.setCaptionLabel("B_off").setColorCaptionLabel(0);
               bitRes7 = 0;
             }
             if (time0Row == 1){
               F7p.setCaptionLabel("B_on").setColorCaptionLabel(0);
               bitRes7 = 2;
             }
           }
         }
       }
       if(instPropUpward == 1){
         if(instPropRighty == 0){
           if(time0Col == 0){
               F7p.setCaptionLabel("Sin").setColorCaptionLabel(0);
               disWave0 = Waves.SINE;
                 //sineOsc.patch( out );
           }
           if(time0Col == 1){
               F7p.setCaptionLabel("Sq").setColorCaptionLabel(0);
               //panValue = 1;
               disWave0 =  Waves.SQUARE;
                 //sineOsc.patch( out );
           }
           if(time0Col == 2){
               F7p.setCaptionLabel("Saw").setColorCaptionLabel(0);
               //panValue = 2;
               disWave0 = Waves.SAW;
           }
                 //propHighlight = 1;
         }
         if(instPropRighty == 1){
           if(time0Col == 0){
             F7p.setCaptionLabel("");
           }
           if(time0Col == 1){
             A7.setCaptionLabel("");
             B7.setCaptionLabel("");
             C7.setCaptionLabel("");
             D7.setCaptionLabel("");
             E7.setCaptionLabel("");
             F7.setCaptionLabel("");
             G7.setCaptionLabel("");
             H7.setCaptionLabel("");
             for(int i = 0; i < 8; i++){
               instList7[i] = 0.0;
             }
           }
         }
         if(instPropRighty == 2){
           if(time0Col == 0){
               F7p.setCaptionLabel("P0").setColorCaptionLabel(0);
               panValue = 0;
           }
           if(time0Col == 1){
               F7p.setCaptionLabel("P1").setColorCaptionLabel(0);
               panValue = 1;
           }
           if(time0Col == 2){
               F7p.setCaptionLabel("P-1").setColorCaptionLabel(0);
               panValue = 2;
           }
                 //propHighlight = 1;
         }
       }
     }
   }
 }
 
 void notesCaptionHide0(){
   if(upward == 0){
     if(righty == 0){
       if(notes0Col == 0){
         if (notes0Row == 0){
           A0.setCaptionLabel("1");
         }
         if (notes0Row == 1){
           A0.setCaptionLabel("2");
         }
         if (notes0Row == 2){
           A0.setCaptionLabel("3");
         }
       }
       if(notes0Col == 1){
         if (notes0Row == 0){
           A0.setCaptionLabel("4");
         }
         if (notes0Row == 1){
           A0.setCaptionLabel("5");
         }
         if (notes0Row == 2){
           A0.setCaptionLabel("6");
         }
       }
       if(notes0Col == 2){
         A0.setCaptionLabel("7");
       }
     }
     if(righty == 1){
       if(notes0Col == 0){
         if (notes0Row == 0){
           B0.setCaptionLabel("1");
         }
         if (notes0Row == 1){
           B0.setCaptionLabel("2");
         }
         if (notes0Row == 2){
           B0.setCaptionLabel("3");
         }
       }
       if(notes0Col == 1){
         if (notes0Row == 0){
           B0.setCaptionLabel("4");
         }
         if (notes0Row == 1){
           B0.setCaptionLabel("5");
         }
         if (notes0Row == 2){
           B0.setCaptionLabel("6");
         }
       }
       if(notes0Col == 2){
         B0.setCaptionLabel("7");
       }
     }
     if(righty == 2){
       if(notes0Col == 0){
         if (notes0Row == 0){
           C0.setCaptionLabel("1");
         }
         if (notes0Row == 1){
           C0.setCaptionLabel("2");
         }
         if (notes0Row == 2){
           C0.setCaptionLabel("3");
         }
       }
       if(notes0Col == 1){
         if (notes0Row == 0){
           C0.setCaptionLabel("4");
         }
         if (notes0Row == 1){
           C0.setCaptionLabel("5");
         }
         if (notes0Row == 2){
           C0.setCaptionLabel("6");
         }
       }
       if(notes0Col == 2){
         C0.setCaptionLabel("7");
       }
     }
     if(righty == 3){
       if(notes0Col == 0){
         if (notes0Row == 0){
           D0.setCaptionLabel("1");
         }
         if (notes0Row == 1){
           D0.setCaptionLabel("2");
         }
         if (notes0Row == 2){
           D0.setCaptionLabel("3");
         }
       }
       if(notes0Col == 1){
         if (notes0Row == 0){
           D0.setCaptionLabel("4");
         }
         if (notes0Row == 1){
           D0.setCaptionLabel("5");
         }
         if (notes0Row == 2){
           D0.setCaptionLabel("6");
         }
       }
       if(notes0Col == 2){
         D0.setCaptionLabel("7");
       }
     }
     if(righty == 4){
       if(notes0Col == 0){
         if (notes0Row == 0){
           E0.setCaptionLabel("1");
         }
         if (notes0Row == 1){
           E0.setCaptionLabel("2");
         }
         if (notes0Row == 2){
           E0.setCaptionLabel("3");
         }
       }
       if(notes0Col == 1){
         if (notes0Row == 0){
           E0.setCaptionLabel("4");
         }
         if (notes0Row == 1){
           E0.setCaptionLabel("5");
         }
         if (notes0Row == 2){
           E0.setCaptionLabel("6");
         }
       }
       if(notes0Col == 2){
         E0.setCaptionLabel("7");
       }
     }
     if(righty == 5){
       if(notes0Col == 0){
         if (notes0Row == 0){
           F0.setCaptionLabel("1");
         }
         if (notes0Row == 1){
           F0.setCaptionLabel("2");
         }
         if (notes0Row == 2){
           F0.setCaptionLabel("3");
         }
       }
       if(notes0Col == 1){
         if (notes0Row == 0){
           F0.setCaptionLabel("4");
         }
         if (notes0Row == 1){
           F0.setCaptionLabel("5");
         }
         if (notes0Row == 2){
           F0.setCaptionLabel("6");
         }
       }
       if(notes0Col == 2){
         F0.setCaptionLabel("7");
       }
     }
     if(righty == 6){
       if(notes0Col == 0){
         if (notes0Row == 0){
           G0.setCaptionLabel("1");
         }
         if (notes0Row == 1){
           G0.setCaptionLabel("2");
         }
         if (notes0Row == 2){
           G0.setCaptionLabel("3");
         }
       }
       if(notes0Col == 1){
         if (notes0Row == 0){
           G0.setCaptionLabel("4");
         }
         if (notes0Row == 1){
           G0.setCaptionLabel("5");
         }
         if (notes0Row == 2){
           G0.setCaptionLabel("6");
         }
       }
       if(notes0Col == 2){
         G0.setCaptionLabel("7");
       }
     }
     if(righty == 7){
       if(notes0Col == 0){
         if (notes0Row == 0){
           H0.setCaptionLabel("1");
         }
         if (notes0Row == 1){
           H0.setCaptionLabel("2");
         }
         if (notes0Row == 2){
           H0.setCaptionLabel("3");
         }
       }
       if(notes0Col == 1){
         if (notes0Row == 0){
           H0.setCaptionLabel("4");
         }
         if (notes0Row == 1){
           H0.setCaptionLabel("5");
         }
         if (notes0Row == 2){
           H0.setCaptionLabel("6");
         }
       }
       if(notes0Col == 2){
         H0.setCaptionLabel("7");
       }
     }
   }
 }
 void notesCaptionHide1(){
   if(upward == 1){
      if(righty == 0){
       if(notes0Col == 0){
         if (notes0Row == 0){
           A1.setCaptionLabel("1");
         }
         if (notes0Row == 1){
           A1.setCaptionLabel("2");
         }
         if (notes0Row == 2){
           A1.setCaptionLabel("3");
         }
       }
       if(notes0Col == 1){
         if (notes0Row == 0){
           A1.setCaptionLabel("4");
         }
         if (notes0Row == 1){
           A1.setCaptionLabel("5");
         }
         if (notes0Row == 2){
           A1.setCaptionLabel("6");
         }
       }
       if(notes0Col == 2){
         A1.setCaptionLabel("7");
       }
     }
     if(righty == 1){
       if(notes0Col == 0){
         if (notes0Row == 0){
           B1.setCaptionLabel("1");
         }
         if (notes0Row == 1){
           B1.setCaptionLabel("2");
         }
         if (notes0Row == 2){
           B1.setCaptionLabel("3");
         }
       }
       if(notes0Col == 1){
         if (notes0Row == 0){
           B1.setCaptionLabel("4");
         }
         if (notes0Row == 1){
           B1.setCaptionLabel("5");
         }
         if (notes0Row == 2){
           B1.setCaptionLabel("6");
         }
       }
       if(notes0Col == 2){
         B1.setCaptionLabel("7");
       }
     }
     if(righty == 2){
       if(notes0Col == 0){
         if (notes0Row == 0){
           C1.setCaptionLabel("1");
         }
         if (notes0Row == 1){
           C1.setCaptionLabel("2");
         }
         if (notes0Row == 2){
           C1.setCaptionLabel("3");
         }
       }
       if(notes0Col == 1){
         if (notes0Row == 0){
           C1.setCaptionLabel("4");
         }
         if (notes0Row == 1){
           C1.setCaptionLabel("5");
         }
         if (notes0Row == 2){
           C1.setCaptionLabel("6");
         }
       }
       if(notes0Col == 2){
         C1.setCaptionLabel("7");
       }
     }
     if(righty == 3){
       if(notes0Col == 0){
         if (notes0Row == 0){
           D1.setCaptionLabel("1");
         }
         if (notes0Row == 1){
           D1.setCaptionLabel("2");
         }
         if (notes0Row == 2){
           D1.setCaptionLabel("3");
         }
       }
       if(notes0Col == 1){
         if (notes0Row == 0){
           D1.setCaptionLabel("4");
         }
         if (notes0Row == 1){
           D1.setCaptionLabel("5");
         }
         if (notes0Row == 2){
           D1.setCaptionLabel("6");
         }
       }
       if(notes0Col == 2){
         D1.setCaptionLabel("7");
       }
     }
     if(righty == 4){
       if(notes0Col == 0){
         if (notes0Row == 0){
           E1.setCaptionLabel("1");
         }
         if (notes0Row == 1){
           E1.setCaptionLabel("2");
         }
         if (notes0Row == 2){
           E1.setCaptionLabel("3");
         }
       }
       if(notes0Col == 1){
         if (notes0Row == 0){
           E1.setCaptionLabel("4");
         }
         if (notes0Row == 1){
           E1.setCaptionLabel("5");
         }
         if (notes0Row == 2){
           E1.setCaptionLabel("6");
         }
       }
       if(notes0Col == 2){
         E1.setCaptionLabel("7");
       }
     }
     if(righty == 5){
       if(notes0Col == 0){
         if (notes0Row == 0){
           F1.setCaptionLabel("1");
         }
         if (notes0Row == 1){
           F1.setCaptionLabel("2");
         }
         if (notes0Row == 2){
           F1.setCaptionLabel("3");
         }
       }
       if(notes0Col == 1){
         if (notes0Row == 0){
           F1.setCaptionLabel("4");
         }
         if (notes0Row == 1){
           F1.setCaptionLabel("5");
         }
         if (notes0Row == 2){
           F1.setCaptionLabel("6");
         }
       }
       if(notes0Col == 2){
         F1.setCaptionLabel("7");
       }
     }
     if(righty == 6){
       if(notes0Col == 0){
         if (notes0Row == 0){
           G1.setCaptionLabel("1");
         }
         if (notes0Row == 1){
           G1.setCaptionLabel("2");
         }
         if (notes0Row == 2){
           G1.setCaptionLabel("3");
         }
       }
       if(notes0Col == 1){
         if (notes0Row == 0){
           G1.setCaptionLabel("4");
         }
         if (notes0Row == 1){
           G1.setCaptionLabel("5");
         }
         if (notes0Row == 2){
           G1.setCaptionLabel("6");
         }
       }
       if(notes0Col == 2){
         G1.setCaptionLabel("7");
       }
     }
     if(righty == 7){
       if(notes0Col == 0){
         if (notes0Row == 0){
           H1.setCaptionLabel("1");
         }
         if (notes0Row == 1){
           H1.setCaptionLabel("2");
         }
         if (notes0Row == 2){
           H1.setCaptionLabel("3");
         }
       }
       if(notes0Col == 1){
         if (notes0Row == 0){
           H1.setCaptionLabel("4");
         }
         if (notes0Row == 1){
           H1.setCaptionLabel("5");
         }
         if (notes0Row == 2){
           H1.setCaptionLabel("6");
         }
       }
       if(notes0Col == 2){
         H1.setCaptionLabel("7");
       }
     }
   }
 }
 
 void notesCaptionHide2(){
   if(upward == 2){
     if(righty == 0){
       if(notes0Col == 0){
         if (notes0Row == 0){
           A2.setCaptionLabel("1");
         }
         if (notes0Row == 1){
           A2.setCaptionLabel("2");
         }
         if (notes0Row == 2){
           A2.setCaptionLabel("3");
         }
       }
       if(notes0Col == 1){
         if (notes0Row == 0){
           A2.setCaptionLabel("4");
         }
         if (notes0Row == 1){
           A2.setCaptionLabel("5");
         }
         if (notes0Row == 2){
           A2.setCaptionLabel("6");
         }
       }
       if(notes0Col == 2){
         A2.setCaptionLabel("7");
       }
     }
     if(righty == 1){
       if(notes0Col == 0){
         if (notes0Row == 0){
           B2.setCaptionLabel("1");
         }
         if (notes0Row == 1){
           B2.setCaptionLabel("2");
         }
         if (notes0Row == 2){
           B2.setCaptionLabel("3");
         }
       }
       if(notes0Col == 1){
         if (notes0Row == 0){
           B2.setCaptionLabel("4");
         }
         if (notes0Row == 1){
           B2.setCaptionLabel("5");
         }
         if (notes0Row == 2){
           B2.setCaptionLabel("6");
         }
       }
       if(notes0Col == 2){
         B2.setCaptionLabel("7");
       }
     }
     if(righty == 2){
       if(notes0Col == 0){
         if (notes0Row == 0){
           C2.setCaptionLabel("1");
         }
         if (notes0Row == 1){
           C2.setCaptionLabel("2");
         }
         if (notes0Row == 2){
           C2.setCaptionLabel("3");
         }
       }
       if(notes0Col == 1){
         if (notes0Row == 0){
           C2.setCaptionLabel("4");
         }
         if (notes0Row == 1){
           C2.setCaptionLabel("5");
         }
         if (notes0Row == 2){
           C2.setCaptionLabel("6");
         }
       }
       if(notes0Col == 2){
         C2.setCaptionLabel("7");
       }
     }
     if(righty == 3){
       if(notes0Col == 0){
         if (notes0Row == 0){
           D2.setCaptionLabel("1");
         }
         if (notes0Row == 1){
           D2.setCaptionLabel("2");
         }
         if (notes0Row == 2){
           D2.setCaptionLabel("3");
         }
       }
       if(notes0Col == 1){
         if (notes0Row == 0){
           D2.setCaptionLabel("4");
         }
         if (notes0Row == 1){
           D2.setCaptionLabel("5");
         }
         if (notes0Row == 2){
           D2.setCaptionLabel("6");
         }
       }
       if(notes0Col == 2){
         D2.setCaptionLabel("7");
       }
     }
     if(righty == 4){
       if(notes0Col == 0){
         if (notes0Row == 0){
           E2.setCaptionLabel("1");
         }
         if (notes0Row == 1){
           E2.setCaptionLabel("2");
         }
         if (notes0Row == 2){
           E2.setCaptionLabel("3");
         }
       }
       if(notes0Col == 1){
         if (notes0Row == 0){
           E2.setCaptionLabel("4");
         }
         if (notes0Row == 1){
           E2.setCaptionLabel("5");
         }
         if (notes0Row == 2){
           E2.setCaptionLabel("6");
         }
       }
       if(notes0Col == 2){
         E2.setCaptionLabel("7");
       }
     }
     if(righty == 5){
       if(notes0Col == 0){
         if (notes0Row == 0){
           F2.setCaptionLabel("1");
         }
         if (notes0Row == 1){
           F2.setCaptionLabel("2");
         }
         if (notes0Row == 2){
           F2.setCaptionLabel("3");
         }
       }
       if(notes0Col == 1){
         if (notes0Row == 0){
           F2.setCaptionLabel("4");
         }
         if (notes0Row == 1){
           F2.setCaptionLabel("5");
         }
         if (notes0Row == 2){
           F2.setCaptionLabel("6");
         }
       }
       if(notes0Col == 2){
         F2.setCaptionLabel("7");
       }
     }
     if(righty == 6){
       if(notes0Col == 0){
         if (notes0Row == 0){
           G2.setCaptionLabel("1");
         }
         if (notes0Row == 1){
           G2.setCaptionLabel("2");
         }
         if (notes0Row == 2){
           G2.setCaptionLabel("3");
         }
       }
       if(notes0Col == 1){
         if (notes0Row == 0){
           G2.setCaptionLabel("4");
         }
         if (notes0Row == 1){
           G2.setCaptionLabel("5");
         }
         if (notes0Row == 2){
           G2.setCaptionLabel("6");
         }
       }
       if(notes0Col == 2){
         G2.setCaptionLabel("7");
       }
     }
     if(righty == 7){
       if(notes0Col == 0){
         if (notes0Row == 0){
           H2.setCaptionLabel("1");
         }
         if (notes0Row == 1){
           H2.setCaptionLabel("2");
         }
         if (notes0Row == 2){
           H2.setCaptionLabel("3");
         }
       }
       if(notes0Col == 1){
         if (notes0Row == 0){
           H2.setCaptionLabel("4");
         }
         if (notes0Row == 1){
           H2.setCaptionLabel("5");
         }
         if (notes0Row == 2){
           H2.setCaptionLabel("6");
         }
       }
       if(notes0Col == 2){
         H2.setCaptionLabel("7");
       }
     }
   }
 }
 void notesCaptionHide3(){
   if(upward == 3){
     if(righty == 0){
       if(notes0Col == 0){
         if (notes0Row == 0){
           A3.setCaptionLabel("1");
         }
         if (notes0Row == 1){
           A3.setCaptionLabel("2");
         }
         if (notes0Row == 2){
           A3.setCaptionLabel("3");
         }
       }
       if(notes0Col == 1){
         if (notes0Row == 0){
           A3.setCaptionLabel("4");
         }
         if (notes0Row == 1){
           A3.setCaptionLabel("5");
         }
         if (notes0Row == 2){
           A3.setCaptionLabel("6");
         }
       }
       if(notes0Col == 2){
         A3.setCaptionLabel("7");
       }
     }
     if(righty == 1){
       if(notes0Col == 0){
         if (notes0Row == 0){
           B3.setCaptionLabel("1");
         }
         if (notes0Row == 1){
           B3.setCaptionLabel("2");
         }
         if (notes0Row == 2){
           B3.setCaptionLabel("3");
         }
       }
       if(notes0Col == 1){
         if (notes0Row == 0){
           B3.setCaptionLabel("4");
         }
         if (notes0Row == 1){
           B3.setCaptionLabel("5");
         }
         if (notes0Row == 2){
           B3.setCaptionLabel("6");
         }
       }
       if(notes0Col == 2){
         B3.setCaptionLabel("7");
       }
     }
     if(righty == 2){
       if(notes0Col == 0){
         if (notes0Row == 0){
           C3.setCaptionLabel("1");
         }
         if (notes0Row == 1){
           C3.setCaptionLabel("2");
         }
         if (notes0Row == 2){
           C3.setCaptionLabel("3");
         }
       }
       if(notes0Col == 1){
         if (notes0Row == 0){
           C3.setCaptionLabel("4");
         }
         if (notes0Row == 1){
           C3.setCaptionLabel("5");
         }
         if (notes0Row == 2){
           C3.setCaptionLabel("6");
         }
       }
       if(notes0Col == 2){
         C3.setCaptionLabel("7");
       }
     }
     if(righty == 3){
       if(notes0Col == 0){
         if (notes0Row == 0){
           D3.setCaptionLabel("1");
         }
         if (notes0Row == 1){
           D3.setCaptionLabel("2");
         }
         if (notes0Row == 2){
           D3.setCaptionLabel("3");
         }
       }
       if(notes0Col == 1){
         if (notes0Row == 0){
           D3.setCaptionLabel("4");
         }
         if (notes0Row == 1){
           D3.setCaptionLabel("5");
         }
         if (notes0Row == 2){
           D3.setCaptionLabel("6");
         }
       }
       if(notes0Col == 2){
         D3.setCaptionLabel("7");
       }
     }
     if(righty == 4){
       if(notes0Col == 0){
         if (notes0Row == 0){
           E3.setCaptionLabel("1");
         }
         if (notes0Row == 1){
           E3.setCaptionLabel("2");
         }
         if (notes0Row == 2){
           E3.setCaptionLabel("3");
         }
       }
       if(notes0Col == 1){
         if (notes0Row == 0){
           E3.setCaptionLabel("4");
         }
         if (notes0Row == 1){
           E3.setCaptionLabel("5");
         }
         if (notes0Row == 2){
           E3.setCaptionLabel("6");
         }
       }
       if(notes0Col == 2){
         E3.setCaptionLabel("7");
       }
     }
     if(righty == 5){
       if(notes0Col == 0){
         if (notes0Row == 0){
           F3.setCaptionLabel("1");
         }
         if (notes0Row == 1){
           F3.setCaptionLabel("2");
         }
         if (notes0Row == 2){
           F3.setCaptionLabel("3");
         }
       }
       if(notes0Col == 1){
         if (notes0Row == 0){
           F3.setCaptionLabel("4");
         }
         if (notes0Row == 1){
           F3.setCaptionLabel("5");
         }
         if (notes0Row == 2){
           F3.setCaptionLabel("6");
         }
       }
       if(notes0Col == 2){
         F3.setCaptionLabel("7");
       }
     }
     if(righty == 6){
       if(notes0Col == 0){
         if (notes0Row == 0){
           G3.setCaptionLabel("1");
         }
         if (notes0Row == 1){
           G3.setCaptionLabel("2");
         }
         if (notes0Row == 2){
           G3.setCaptionLabel("3");
         }
       }
       if(notes0Col == 1){
         if (notes0Row == 0){
           G3.setCaptionLabel("4");
         }
         if (notes0Row == 1){
           G3.setCaptionLabel("5");
         }
         if (notes0Row == 2){
           G3.setCaptionLabel("6");
         }
       }
       if(notes0Col == 2){
         G3.setCaptionLabel("7");
       }
     }
     if(righty == 7){
       if(notes0Col == 0){
         if (notes0Row == 0){
           H3.setCaptionLabel("1");
         }
         if (notes0Row == 1){
           H3.setCaptionLabel("2");
         }
         if (notes0Row == 2){
           H3.setCaptionLabel("3");
         }
       }
       if(notes0Col == 1){
         if (notes0Row == 0){
           H3.setCaptionLabel("4");
         }
         if (notes0Row == 1){
           H3.setCaptionLabel("5");
         }
         if (notes0Row == 2){
           H3.setCaptionLabel("6");
         }
       }
       if(notes0Col == 2){
         H3.setCaptionLabel("7");
       }
     }
   }
 }
 void notesCaptionHide4(){
   if(upward == 4){
     if(righty == 0){
       if(notes0Col == 0){
         if (notes0Row == 0){
           A4.setCaptionLabel("1");
         }
         if (notes0Row == 1){
           A4.setCaptionLabel("2");
         }
         if (notes0Row == 2){
           A4.setCaptionLabel("3");
         }
       }
       if(notes0Col == 1){
         if (notes0Row == 0){
           A4.setCaptionLabel("4");
         }
         if (notes0Row == 1){
           A4.setCaptionLabel("5");
         }
         if (notes0Row == 2){
           A4.setCaptionLabel("6");
         }
       }
       if(notes0Col == 2){
         A4.setCaptionLabel("7");
       }
     }
     if(righty == 1){
       if(notes0Col == 0){
         if (notes0Row == 0){
           B4.setCaptionLabel("1");
         }
         if (notes0Row == 1){
           B4.setCaptionLabel("2");
         }
         if (notes0Row == 2){
           B4.setCaptionLabel("3");
         }
       }
       if(notes0Col == 1){
         if (notes0Row == 0){
           B4.setCaptionLabel("4");
         }
         if (notes0Row == 1){
           B4.setCaptionLabel("5");
         }
         if (notes0Row == 2){
           B4.setCaptionLabel("6");
         }
       }
       if(notes0Col == 2){
         B4.setCaptionLabel("7");
       }
     }
     if(righty == 2){
       if(notes0Col == 0){
         if (notes0Row == 0){
           C4.setCaptionLabel("1");
         }
         if (notes0Row == 1){
           C4.setCaptionLabel("2");
         }
         if (notes0Row == 2){
           C4.setCaptionLabel("3");
         }
       }
       if(notes0Col == 1){
         if (notes0Row == 0){
           C4.setCaptionLabel("4");
         }
         if (notes0Row == 1){
           C4.setCaptionLabel("5");
         }
         if (notes0Row == 2){
           C4.setCaptionLabel("6");
         }
       }
       if(notes0Col == 2){
         C4.setCaptionLabel("7");
       }
     }
     if(righty == 3){
       if(notes0Col == 0){
         if (notes0Row == 0){
           D4.setCaptionLabel("1");
         }
         if (notes0Row == 1){
           D4.setCaptionLabel("2");
         }
         if (notes0Row == 2){
           D4.setCaptionLabel("3");
         }
       }
       if(notes0Col == 1){
         if (notes0Row == 0){
           D4.setCaptionLabel("4");
         }
         if (notes0Row == 1){
           D4.setCaptionLabel("5");
         }
         if (notes0Row == 2){
           D4.setCaptionLabel("6");
         }
       }
       if(notes0Col == 2){
         D4.setCaptionLabel("7");
       }
     }
     if(righty == 4){
       if(notes0Col == 0){
         if (notes0Row == 0){
           E4.setCaptionLabel("1");
         }
         if (notes0Row == 1){
           E4.setCaptionLabel("2");
         }
         if (notes0Row == 2){
           E4.setCaptionLabel("3");
         }
       }
       if(notes0Col == 1){
         if (notes0Row == 0){
           E4.setCaptionLabel("4");
         }
         if (notes0Row == 1){
           E4.setCaptionLabel("5");
         }
         if (notes0Row == 2){
           E4.setCaptionLabel("6");
         }
       }
       if(notes0Col == 2){
         E4.setCaptionLabel("7");
       }
     }
     if(righty == 5){
       if(notes0Col == 0){
         if (notes0Row == 0){
           F4.setCaptionLabel("1");
         }
         if (notes0Row == 1){
           F4.setCaptionLabel("2");
         }
         if (notes0Row == 2){
           F4.setCaptionLabel("3");
         }
       }
       if(notes0Col == 1){
         if (notes0Row == 0){
           F4.setCaptionLabel("4");
         }
         if (notes0Row == 1){
           F4.setCaptionLabel("5");
         }
         if (notes0Row == 2){
           F4.setCaptionLabel("6");
         }
       }
       if(notes0Col == 2){
         F4.setCaptionLabel("7");
       }
     }
     if(righty == 6){
       if(notes0Col == 0){
         if (notes0Row == 0){
           G4.setCaptionLabel("1");
         }
         if (notes0Row == 1){
           G4.setCaptionLabel("2");
         }
         if (notes0Row == 2){
           G4.setCaptionLabel("3");
         }
       }
       if(notes0Col == 1){
         if (notes0Row == 0){
           G4.setCaptionLabel("4");
         }
         if (notes0Row == 1){
           G4.setCaptionLabel("5");
         }
         if (notes0Row == 2){
           G4.setCaptionLabel("6");
         }
       }
       if(notes0Col == 2){
         G4.setCaptionLabel("7");
       }
     }
     if(righty == 7){
       if(notes0Col == 0){
         if (notes0Row == 0){
           H4.setCaptionLabel("1");
         }
         if (notes0Row == 1){
           H4.setCaptionLabel("2");
         }
         if (notes0Row == 2){
           H4.setCaptionLabel("3");
         }
       }
       if(notes0Col == 1){
         if (notes0Row == 0){
           H4.setCaptionLabel("4");
         }
         if (notes0Row == 1){
           H4.setCaptionLabel("5");
         }
         if (notes0Row == 2){
           H4.setCaptionLabel("6");
         }
       }
       if(notes0Col == 2){
         H4.setCaptionLabel("7");
       }
     }
   }
 }
 void notesCaptionHide5(){
   if(upward == 5){
     if(righty == 0){
       if(notes0Col == 0){
         if (notes0Row == 0){
           A5.setCaptionLabel("1");
         }
         if (notes0Row == 1){
           A5.setCaptionLabel("2");
         }
         if (notes0Row == 2){
           A5.setCaptionLabel("3");
         }
       }
       if(notes0Col == 1){
         if (notes0Row == 0){
           A5.setCaptionLabel("4");
         }
         if (notes0Row == 1){
           A5.setCaptionLabel("5");
         }
         if (notes0Row == 2){
           A5.setCaptionLabel("6");
         }
       }
       if(notes0Col == 2){
         A5.setCaptionLabel("7");
       }
     }
     if(righty == 1){
       if(notes0Col == 0){
         if (notes0Row == 0){
           B5.setCaptionLabel("1");
         }
         if (notes0Row == 1){
           B5.setCaptionLabel("2");
         }
         if (notes0Row == 2){
           B5.setCaptionLabel("3");
         }
       }
       if(notes0Col == 1){
         if (notes0Row == 0){
           B5.setCaptionLabel("4");
         }
         if (notes0Row == 1){
           B5.setCaptionLabel("5");
         }
         if (notes0Row == 2){
           B5.setCaptionLabel("6");
         }
       }
       if(notes0Col == 2){
         B5.setCaptionLabel("7");
       }
     }
     if(righty == 2){
       if(notes0Col == 0){
         if (notes0Row == 0){
           C5.setCaptionLabel("1");
         }
         if (notes0Row == 1){
           C5.setCaptionLabel("2");
         }
         if (notes0Row == 2){
           C5.setCaptionLabel("3");
         }
       }
       if(notes0Col == 1){
         if (notes0Row == 0){
           C5.setCaptionLabel("4");
         }
         if (notes0Row == 1){
           C5.setCaptionLabel("5");
         }
         if (notes0Row == 2){
           C5.setCaptionLabel("6");
         }
       }
       if(notes0Col == 2){
         C5.setCaptionLabel("7");
       }
     }
     if(righty == 3){
       if(notes0Col == 0){
         if (notes0Row == 0){
           D5.setCaptionLabel("1");
         }
         if (notes0Row == 1){
           D5.setCaptionLabel("2");
         }
         if (notes0Row == 2){
           D5.setCaptionLabel("3");
         }
       }
       if(notes0Col == 1){
         if (notes0Row == 0){
           D5.setCaptionLabel("4");
         }
         if (notes0Row == 1){
           D5.setCaptionLabel("5");
         }
         if (notes0Row == 2){
           D5.setCaptionLabel("6");
         }
       }
       if(notes0Col == 2){
         D5.setCaptionLabel("7");
       }
     }
     if(righty == 4){
       if(notes0Col == 0){
         if (notes0Row == 0){
           E5.setCaptionLabel("1");
         }
         if (notes0Row == 1){
           E5.setCaptionLabel("2");
         }
         if (notes0Row == 2){
           E5.setCaptionLabel("3");
         }
       }
       if(notes0Col == 1){
         if (notes0Row == 0){
           E5.setCaptionLabel("4");
         }
         if (notes0Row == 1){
           E5.setCaptionLabel("5");
         }
         if (notes0Row == 2){
           E5.setCaptionLabel("6");
         }
       }
       if(notes0Col == 2){
         E5.setCaptionLabel("7");
       }
     }
     if(righty == 5){
       if(notes0Col == 0){
         if (notes0Row == 0){
           F5.setCaptionLabel("1");
         }
         if (notes0Row == 1){
           F5.setCaptionLabel("2");
         }
         if (notes0Row == 2){
           F5.setCaptionLabel("3");
         }
       }
       if(notes0Col == 1){
         if (notes0Row == 0){
           F5.setCaptionLabel("4");
         }
         if (notes0Row == 1){
           F5.setCaptionLabel("5");
         }
         if (notes0Row == 2){
           F5.setCaptionLabel("6");
         }
       }
       if(notes0Col == 2){
         F5.setCaptionLabel("7");
       }
     }
     if(righty == 6){
       if(notes0Col == 0){
         if (notes0Row == 0){
           G5.setCaptionLabel("1");
         }
         if (notes0Row == 1){
           G5.setCaptionLabel("2");
         }
         if (notes0Row == 2){
           G5.setCaptionLabel("3");
         }
       }
       if(notes0Col == 1){
         if (notes0Row == 0){
           G5.setCaptionLabel("4");
         }
         if (notes0Row == 1){
           G5.setCaptionLabel("5");
         }
         if (notes0Row == 2){
           G5.setCaptionLabel("6");
         }
       }
       if(notes0Col == 2){
         G5.setCaptionLabel("7");
       }
     }
     if(righty == 7){
       if(notes0Col == 0){
         if (notes0Row == 0){
           H5.setCaptionLabel("1");
         }
         if (notes0Row == 1){
           H5.setCaptionLabel("2");
         }
         if (notes0Row == 2){
           H5.setCaptionLabel("3");
         }
       }
       if(notes0Col == 1){
         if (notes0Row == 0){
           H5.setCaptionLabel("4");
         }
         if (notes0Row == 1){
           H5.setCaptionLabel("5");
         }
         if (notes0Row == 2){
           H5.setCaptionLabel("6");
         }
       }
       if(notes0Col == 2){
         H5.setCaptionLabel("7");
       }
     }
   }
 }
 void notesCaptionHide6(){
   if(upward == 6){
     if(righty == 0){
       if(notes0Col == 0){
         if (notes0Row == 0){
           A6.setCaptionLabel("1");
         }
         if (notes0Row == 1){
           A6.setCaptionLabel("2");
         }
         if (notes0Row == 2){
           A6.setCaptionLabel("3");
         }
       }
       if(notes0Col == 1){
         if (notes0Row == 0){
           A6.setCaptionLabel("4");
         }
         if (notes0Row == 1){
           A6.setCaptionLabel("5");
         }
         if (notes0Row == 2){
           A6.setCaptionLabel("6");
         }
       }
       if(notes0Col == 2){
         A6.setCaptionLabel("7");
       }
     }
     if(righty == 1){
       if(notes0Col == 0){
         if (notes0Row == 0){
           B6.setCaptionLabel("1");
         }
         if (notes0Row == 1){
           B6.setCaptionLabel("2");
         }
         if (notes0Row == 2){
           B6.setCaptionLabel("3");
         }
       }
       if(notes0Col == 1){
         if (notes0Row == 0){
           B6.setCaptionLabel("4");
         }
         if (notes0Row == 1){
           B6.setCaptionLabel("5");
         }
         if (notes0Row == 2){
           B6.setCaptionLabel("6");
         }
       }
       if(notes0Col == 2){
         B6.setCaptionLabel("7");
       }
     }
     if(righty == 2){
       if(notes0Col == 0){
         if (notes0Row == 0){
           C6.setCaptionLabel("1");
         }
         if (notes0Row == 1){
           C6.setCaptionLabel("2");
         }
         if (notes0Row == 2){
           C6.setCaptionLabel("3");
         }
       }
       if(notes0Col == 1){
         if (notes0Row == 0){
           C6.setCaptionLabel("4");
         }
         if (notes0Row == 1){
           C6.setCaptionLabel("5");
         }
         if (notes0Row == 2){
           C6.setCaptionLabel("6");
         }
       }
       if(notes0Col == 2){
         C6.setCaptionLabel("7");
       }
     }
     if(righty == 3){
       if(notes0Col == 0){
         if (notes0Row == 0){
           D6.setCaptionLabel("1");
         }
         if (notes0Row == 1){
           D6.setCaptionLabel("2");
         }
         if (notes0Row == 2){
           D6.setCaptionLabel("3");
         }
       }
       if(notes0Col == 1){
         if (notes0Row == 0){
           D6.setCaptionLabel("4");
         }
         if (notes0Row == 1){
           D6.setCaptionLabel("5");
         }
         if (notes0Row == 2){
           D6.setCaptionLabel("6");
         }
       }
       if(notes0Col == 2){
         D6.setCaptionLabel("7");
       }
     }
     if(righty == 4){
       if(notes0Col == 0){
         if (notes0Row == 0){
           E6.setCaptionLabel("1");
         }
         if (notes0Row == 1){
           E6.setCaptionLabel("2");
         }
         if (notes0Row == 2){
           E6.setCaptionLabel("3");
         }
       }
       if(notes0Col == 1){
         if (notes0Row == 0){
           E6.setCaptionLabel("4");
         }
         if (notes0Row == 1){
           E6.setCaptionLabel("5");
         }
         if (notes0Row == 2){
           E6.setCaptionLabel("6");
         }
       }
       if(notes0Col == 2){
         E6.setCaptionLabel("7");
       }
     }
     if(righty == 5){
       if(notes0Col == 0){
         if (notes0Row == 0){
           F6.setCaptionLabel("1");
         }
         if (notes0Row == 1){
           F6.setCaptionLabel("2");
         }
         if (notes0Row == 2){
           F6.setCaptionLabel("3");
         }
       }
       if(notes0Col == 1){
         if (notes0Row == 0){
           F6.setCaptionLabel("4");
         }
         if (notes0Row == 1){
           F6.setCaptionLabel("5");
         }
         if (notes0Row == 2){
           F6.setCaptionLabel("6");
         }
       }
       if(notes0Col == 2){
         F6.setCaptionLabel("7");
       }
     }
     if(righty == 6){
       if(notes0Col == 0){
         if (notes0Row == 0){
           G6.setCaptionLabel("1");
         }
         if (notes0Row == 1){
           G6.setCaptionLabel("2");
         }
         if (notes0Row == 2){
           G6.setCaptionLabel("3");
         }
       }
       if(notes0Col == 1){
         if (notes0Row == 0){
           G6.setCaptionLabel("4");
         }
         if (notes0Row == 1){
           G6.setCaptionLabel("5");
         }
         if (notes0Row == 2){
           G6.setCaptionLabel("6");
         }
       }
       if(notes0Col == 2){
         G6.setCaptionLabel("7");
       }
     }
     if(righty == 7){
       if(notes0Col == 0){
         if (notes0Row == 0){
           H6.setCaptionLabel("1");
         }
         if (notes0Row == 1){
           H6.setCaptionLabel("2");
         }
         if (notes0Row == 2){
           H6.setCaptionLabel("3");
         }
       }
       if(notes0Col == 1){
         if (notes0Row == 0){
           H6.setCaptionLabel("4");
         }
         if (notes0Row == 1){
           H6.setCaptionLabel("5");
         }
         if (notes0Row == 2){
           H6.setCaptionLabel("6");
         }
       }
       if(notes0Col == 2){
         H6.setCaptionLabel("7");
       }
     }
   }
 }
 void notesCaptionHide7(){
   if(upward == 7){
     if(righty == 0){
       if(notes0Col == 0){
         if (notes0Row == 0){
           A7.setCaptionLabel("1");
         }
         if (notes0Row == 1){
           A7.setCaptionLabel("2");
         }
         if (notes0Row == 2){
           A7.setCaptionLabel("3");
         }
       }
       if(notes0Col == 1){
         if (notes0Row == 0){
           A7.setCaptionLabel("4");
         }
         if (notes0Row == 1){
           A7.setCaptionLabel("5");
         }
         if (notes0Row == 2){
           A7.setCaptionLabel("6");
         }
       }
       if(notes0Col == 2){
         A7.setCaptionLabel("7");
       }
     }
     if(righty == 1){
       if(notes0Col == 0){
         if (notes0Row == 0){
           B7.setCaptionLabel("1");
         }
         if (notes0Row == 1){
           B7.setCaptionLabel("2");
         }
         if (notes0Row == 2){
           B7.setCaptionLabel("3");
         }
       }
       if(notes0Col == 1){
         if (notes0Row == 0){
           B7.setCaptionLabel("4");
         }
         if (notes0Row == 1){
           B7.setCaptionLabel("5");
         }
         if (notes0Row == 2){
           B7.setCaptionLabel("6");
         }
       }
       if(notes0Col == 2){
         B7.setCaptionLabel("7");
       }
     }
     if(righty == 2){
       if(notes0Col == 0){
         if (notes0Row == 0){
           C7.setCaptionLabel("1");
         }
         if (notes0Row == 1){
           C7.setCaptionLabel("2");
         }
         if (notes0Row == 2){
           C7.setCaptionLabel("3");
         }
       }
       if(notes0Col == 1){
         if (notes0Row == 0){
           C7.setCaptionLabel("4");
         }
         if (notes0Row == 1){
           C7.setCaptionLabel("5");
         }
         if (notes0Row == 2){
           C7.setCaptionLabel("6");
         }
       }
       if(notes0Col == 2){
         C7.setCaptionLabel("7");
       }
     }
     if(righty == 3){
       if(notes0Col == 0){
         if (notes0Row == 0){
           D7.setCaptionLabel("1");
         }
         if (notes0Row == 1){
           D7.setCaptionLabel("2");
         }
         if (notes0Row == 2){
           D7.setCaptionLabel("3");
         }
       }
       if(notes0Col == 1){
         if (notes0Row == 0){
           D7.setCaptionLabel("4");
         }
         if (notes0Row == 1){
           D7.setCaptionLabel("5");
         }
         if (notes0Row == 2){
           D7.setCaptionLabel("6");
         }
       }
       if(notes0Col == 2){
         D7.setCaptionLabel("7");
       }
     }
     if(righty == 4){
       if(notes0Col == 0){
         if (notes0Row == 0){
           E7.setCaptionLabel("1");
         }
         if (notes0Row == 1){
           E7.setCaptionLabel("2");
         }
         if (notes0Row == 2){
           E7.setCaptionLabel("3");
         }
       }
       if(notes0Col == 1){
         if (notes0Row == 0){
           E7.setCaptionLabel("4");
         }
         if (notes0Row == 1){
           E7.setCaptionLabel("5");
         }
         if (notes0Row == 2){
           E7.setCaptionLabel("6");
         }
       }
       if(notes0Col == 2){
         E7.setCaptionLabel("7");
       }
     }
     if(righty == 5){
       if(notes0Col == 0){
         if (notes0Row == 0){
           F7.setCaptionLabel("1");
         }
         if (notes0Row == 1){
           F7.setCaptionLabel("2");
         }
         if (notes0Row == 2){
           F7.setCaptionLabel("3");
         }
       }
       if(notes0Col == 1){
         if (notes0Row == 0){
           F7.setCaptionLabel("4");
         }
         if (notes0Row == 1){
           F7.setCaptionLabel("5");
         }
         if (notes0Row == 2){
           F7.setCaptionLabel("6");
         }
       }
       if(notes0Col == 2){
         F7.setCaptionLabel("7");
       }
     }
     if(righty == 6){
       if(notes0Col == 0){
         if (notes0Row == 0){
           G7.setCaptionLabel("1");
         }
         if (notes0Row == 1){
           G7.setCaptionLabel("2");
         }
         if (notes0Row == 2){
           G7.setCaptionLabel("3");
         }
       }
       if(notes0Col == 1){
         if (notes0Row == 0){
           G7.setCaptionLabel("4");
         }
         if (notes0Row == 1){
           G7.setCaptionLabel("5");
         }
         if (notes0Row == 2){
           G7.setCaptionLabel("6");
         }
       }
       if(notes0Col == 2){
         G7.setCaptionLabel("7");
       }
     }
     if(righty == 7){
       if(notes0Col == 0){
         if (notes0Row == 0){
           H7.setCaptionLabel("1");
         }
         if (notes0Row == 1){
           H7.setCaptionLabel("2");
         }
         if (notes0Row == 2){
           H7.setCaptionLabel("3");
         }
       }
       if(notes0Col == 1){
         if (notes0Row == 0){
           H7.setCaptionLabel("4");
         }
         if (notes0Row == 1){
           H7.setCaptionLabel("5");
         }
         if (notes0Row == 2){
           H7.setCaptionLabel("6");
         }
       }
       if(notes0Col == 2){
         H7.setCaptionLabel("7");
       }
     }
   }
 }
 

 void synthNote0(){
    if(A0.getLabel() == "1"){
      if(A0p.getLabel() == "Tr2"){
        instList0[0] = 164.81;
      }
      else if(A0p.getLabel() == "Tr1"){
        instList0[0] = 146.83;
      }
      else
      instList0[0] = 130.81;
    }
    if(A0.getLabel() == "2"){
      if(A0p.getLabel() == "Tr2"){
        out.playNote( 0.0, 0.5, "D5" );
      }
      else if(A0p.getLabel() == "Tr1"){
        //ainstList0[0] = 130.81;
        //binstList0[0] = 146.83;
        //cinstList0[0] = 164.81;
        //dinstList0[0] = 174.61;
        //einstList0[0] = fr4;
        //finstList0[0] = fr5;
        //ginstList0[0] = fr6;
      }
      else
        out.playNote( 0.0, 0.5, "D3" );
      
    }
    if(A0.getLabel() == "3"){
      if(A0p.getLabel() == "Tr2"){
        out.playNote( 0.0, 0.5, "E5" );
      }
      else if(A0p.getLabel() == "Tr1"){
        out.playNote( 0.0, 0.5, "E4" );
      }
      else
      out.playNote( 0.0, 0.5, "E3" );
    }
    if(A0.getLabel() == "4"){
      if(A0p.getLabel() == "Tr2"){
        out.playNote( 0.0, 0.5, "F5" );
      }
      else if(A0p.getLabel() == "Tr1"){
        out.playNote( 0.0, 0.5, "F4" );
      }
      else
      out.playNote( 0.0, 0.5, "F3" );
    }
    if(A0.getLabel() == "5"){
      if(A0p.getLabel() == "Tr2"){
        out.playNote( 0.0, 0.5, "G5" );
      }
      else if(A0p.getLabel() == "Tr1"){
        out.playNote( 0.0, 0.5, "G4" );
      }
      else
      out.playNote( 0.0, 0.5, "G3" );
    }
    if(A0.getLabel() == "6"){
      if(A0p.getLabel() == "Tr2"){
        out.playNote( 0.0, 0.5, "A5" );
      }
      else if(A0p.getLabel() == "Tr1"){
        out.playNote( 0.0, 0.5, "A4" );
      }
      else
      out.playNote( 0.0, 0.5, "A3" );
    }
    if(A0.getLabel() == "7"){
      if(A0p.getLabel() == "Tr2"){
        out.playNote( 0.0, 0.5, "B5" );
      }
      else if(A0p.getLabel() == "Tr1"){
        out.playNote( 0.0, 0.5, "B4" );
      }
      else
      out.playNote( 0.0, 0.5, "B3" );
    }
    if(A1.getLabel() == "1"){
      out.playNote( 0.0, 0.5, "C3" );
    }
    if(A1.getLabel() == "2"){
      out.playNote( 0.0, 0.5, "D3" );
    }
    if(A1.getLabel() == "3"){
      out.playNote( 0.0, 0.5, "E3" );
    }
    if(A1.getLabel() == "4"){
      out.playNote( 0.0, 0.5, "F3" );
    }
    if(A1.getLabel() == "5"){
      out.playNote( 0.0, 0.5, "G3" );
    }
    if(A1.getLabel() == "6"){
      out.playNote( 0.0, 0.5, "A3" );
    }
    if(A1.getLabel() == "7"){
      out.playNote( 0.0, 0.5, "B3" );
    }
    if(A2.getLabel() == "1"){
      out.playNote( 0.0, 0.5, "C3" );
    }
    if(A2.getLabel() == "2"){
      out.playNote( 0.0, 0.5, "D3" );
    }
    if(A2.getLabel() == "3"){
      out.playNote( 0.0, 0.5, "E3" );
    }
    if(A2.getLabel() == "4"){
      out.playNote( 0.0, 0.5, "F3" );
    }
    if(A2.getLabel() == "5"){
      out.playNote( 0.0, 0.5, "G3" );
    }
    if(A2.getLabel() == "6"){
      out.playNote( 0.0, 0.5, "A3" );
    }
    if(A2.getLabel() == "7"){
      out.playNote( 0.0, 0.5, "B3" );
    }
    if(A3.getLabel() == "1"){
      out.playNote( 0.0, 0.5, "C3" );
    }
    if(A3.getLabel() == "2"){
      out.playNote( 0.0, 0.5, "D3" );
    }
    if(A3.getLabel() == "3"){
      out.playNote( 0.0, 0.5, "E3" );
    }
    if(A3.getLabel() == "4"){
      out.playNote( 0.0, 0.5, "F3" );
    }
    if(A3.getLabel() == "5"){
      out.playNote( 0.0, 0.5, "G3" );
    }
    if(A3.getLabel() == "6"){
      out.playNote( 0.0, 0.5, "A3" );
    }
    if(A3.getLabel() == "7"){
      out.playNote( 0.0, 0.5, "B3" );
    }
    if(A4.getLabel() == "1"){
      out.playNote( 0.0, 0.5, "C3" );
    }
    if(A4.getLabel() == "2"){
      out.playNote( 0.0, 0.5, "D3" );
    }
    if(A4.getLabel() == "3"){
      out.playNote( 0.0, 0.5, "E3" );
    }
    if(A4.getLabel() == "4"){
      out.playNote( 0.0, 0.5, "F3" );
    }
    if(A4.getLabel() == "5"){
      out.playNote( 0.0, 0.5, "G3" );
    }
    if(A4.getLabel() == "6"){
      out.playNote( 0.0, 0.5, "A3" );
    }
    if(A4.getLabel() == "7"){
      out.playNote( 0.0, 0.5, "B3" );
    }
    if(A5.getLabel() == "1"){
      out.playNote( 0.0, 0.5, "C3" );
    }
    if(A5.getLabel() == "2"){
      out.playNote( 0.0, 0.5, "D3" );
    }
    if(A5.getLabel() == "3"){
      out.playNote( 0.0, 0.5, "E3" );
    }
    if(A5.getLabel() == "4"){
      out.playNote( 0.0, 0.5, "F3" );
    }
    if(A5.getLabel() == "5"){
      out.playNote( 0.0, 0.5, "G3" );
    }
    if(A5.getLabel() == "6"){
      out.playNote( 0.0, 0.5, "A3" );
    }
    if(A5.getLabel() == "7"){
      out.playNote( 0.0, 0.5, "B3" );
    }
    if(A6.getLabel() == "1"){
      out.playNote( 0.0, 0.5, "C3" );
    }
    if(A6.getLabel() == "2"){
      out.playNote( 0.0, 0.5, "D3" );
    }
    if(A6.getLabel() == "3"){
      out.playNote( 0.0, 0.5, "E3" );
    }
    if(A6.getLabel() == "4"){
      out.playNote( 0.0, 0.5, "F3" );
    }
    if(A6.getLabel() == "5"){
      out.playNote( 0.0, 0.5, "G3" );
    }
    if(A6.getLabel() == "6"){
      out.playNote( 0.0, 0.5, "A3" );
    }
    if(A6.getLabel() == "7"){
      out.playNote( 0.0, 0.5, "B3" );
    }
    if(A7.getLabel() == "1"){
      out.playNote( 0.0, 0.5, "C3" );
    }
    if(A7.getLabel() == "2"){
      out.playNote( 0.0, 0.5, "D3" );
    }
    if(A7.getLabel() == "3"){
      out.playNote( 0.0, 0.5, "E3" );
    }
    if(A7.getLabel() == "4"){
      out.playNote( 0.0, 0.5, "F3" );
    }
    if(A7.getLabel() == "5"){
      out.playNote( 0.0, 0.5, "G3" );
    }
    if(A7.getLabel() == "6"){
      out.playNote( 0.0, 0.5, "A3" );
    }
    if(A7.getLabel() == "7"){
      out.playNote( 0.0, 0.5, "B3" );
    }
   }
 void synthNote1(){
    if(B0.getLabel() == "1"){
      if(A0p.getLabel() == "Tr2"){
        out.playNote( 0.0, 0.5, "C5" );
      }
      else if(A0p.getLabel() == "Tr1"){
        out.playNote( 0.0, 0.5, "C4" );
      }
      else
        out.playNote( 0.0, 0.5, "C3" );
    }
    if(B0.getLabel() == "2"){
      if(A0p.getLabel() == "Tr2"){
        out.playNote( 0.0, 0.5, "D5" );
      }
      else if(A0p.getLabel() == "Tr1"){
        out.playNote( 0.0, 0.5, "D4" );
      }
      else
        out.playNote( 0.0, 0.5, "D3" );
    }
    if(B0.getLabel() == "3"){
      if(A0p.getLabel() == "Tr2"){
        out.playNote( 0.0, 0.5, "E5" );
      }
      else if(A0p.getLabel() == "Tr1"){
        out.playNote( 0.0, 0.5, "E4" );
      }
      else
      out.playNote( 0.0, 0.5, "E3" );
    }
    if(B0.getLabel() == "4"){
      
      if(A0p.getLabel() == "Tr2"){
        out.playNote( 0.0, 0.5, "F5" );
      }
      else if(A0p.getLabel() == "Tr1"){
        out.playNote( 0.0, 0.5, "F4" );
      }
      else
      out.playNote( 0.0, 0.5, "F3" );
    }
    if(B0.getLabel() == "5"){
      if(A0p.getLabel() == "Tr2"){
        out.playNote( 0.0, 0.5, "G5" );
      }
      else if(A0p.getLabel() == "Tr1"){
        out.playNote( 0.0, 0.5, "G4" );
      }
      else
      out.playNote( 0.0, 0.5, "G3" );
    }
    if(B0.getLabel() == "6"){
      if(A0p.getLabel() == "Tr2"){
        out.playNote( 0.0, 0.5, "A5" );
      }
      else if(A0p.getLabel() == "Tr1"){
        out.playNote( 0.0, 0.5, "A4" );
      }
      else
      out.playNote( 0.0, 0.5, "A3" );
    }
    if(B0.getLabel() == "7"){
      if(A0p.getLabel() == "Tr2"){
        out.playNote( 0.0, 0.5, "B5" );
      }
      else if(A0p.getLabel() == "Tr1"){
        out.playNote( 0.0, 0.5, "B4" );
      }
      else
      out.playNote( 0.0, 0.5, "B3" );
    }
    if(B1.getLabel() == "1"){
      out.playNote( 0.0, 0.5, "C3" );
    }
    if(B1.getLabel() == "2"){
      out.playNote( 0.0, 0.5, "D3" );
    }
    if(B1.getLabel() == "3"){
      out.playNote( 0.0, 0.5, "E3" );
    }
    if(B1.getLabel() == "4"){
      out.playNote( 0.0, 0.5, "F3" );
    }
    if(B1.getLabel() == "5"){
      out.playNote( 0.0, 0.5, "G3" );
    }
    if(B1.getLabel() == "6"){
      out.playNote( 0.0, 0.5, "A3" );
    }
    if(B1.getLabel() == "7"){
      out.playNote( 0.0, 0.5, "B3" );
    }
    if(B2.getLabel() == "1"){
      out.playNote( 0.0, 0.5, "C3" );
    }
    if(B2.getLabel() == "2"){
      out.playNote( 0.0, 0.5, "D3" );
    }
    if(B2.getLabel() == "3"){
      out.playNote( 0.0, 0.5, "E3" );
    }
    if(B2.getLabel() == "4"){
      out.playNote( 0.0, 0.5, "F3" );
    }
    if(B2.getLabel() == "5"){
      out.playNote( 0.0, 0.5, "G3" );
    }
    if(B2.getLabel() == "6"){
      out.playNote( 0.0, 0.5, "A3" );
    }
    if(B2.getLabel() == "7"){
      out.playNote( 0.0, 0.5, "B3" );
    }
    if(B3.getLabel() == "1"){
      out.playNote( 0.0, 0.5, "C3" );
    }
    if(B3.getLabel() == "2"){
      out.playNote( 0.0, 0.5, "D3" );
    }
    if(B3.getLabel() == "3"){
      out.playNote( 0.0, 0.5, "E3" );
    }
    if(B3.getLabel() == "4"){
      out.playNote( 0.0, 0.5, "F3" );
    }
    if(B3.getLabel() == "5"){
      out.playNote( 0.0, 0.5, "G3" );
    }
    if(B3.getLabel() == "6"){
      out.playNote( 0.0, 0.5, "A3" );
    }
    if(B3.getLabel() == "7"){
      out.playNote( 0.0, 0.5, "B3" );
    }
    if(B4.getLabel() == "1"){
      out.playNote( 0.0, 0.5, "C3" );
    }
    if(B4.getLabel() == "2"){
      out.playNote( 0.0, 0.5, "D3" );
    }
    if(B4.getLabel() == "3"){
      out.playNote( 0.0, 0.5, "E3" );
    }
    if(B4.getLabel() == "4"){
      out.playNote( 0.0, 0.5, "F3" );
    }
    if(B4.getLabel() == "5"){
      out.playNote( 0.0, 0.5, "G3" );
    }
    if(B4.getLabel() == "6"){
      out.playNote( 0.0, 0.5, "A3" );
    }
    if(B4.getLabel() == "7"){
      out.playNote( 0.0, 0.5, "B3" );
    }
    if(B5.getLabel() == "1"){
      out.playNote( 0.0, 0.5, "C3" );
    }
    if(B5.getLabel() == "2"){
      out.playNote( 0.0, 0.5, "D3" );
    }
    if(B5.getLabel() == "3"){
      out.playNote( 0.0, 0.5, "E3" );
    }
    if(B5.getLabel() == "4"){
      out.playNote( 0.0, 0.5, "F3" );
    }
    if(B5.getLabel() == "5"){
      out.playNote( 0.0, 0.5, "G3" );
    }
    if(B5.getLabel() == "6"){
      out.playNote( 0.0, 0.5, "A3" );
    }
    if(B5.getLabel() == "7"){
      out.playNote( 0.0, 0.5, "B3" );
    }
    if(B6.getLabel() == "1"){
      out.playNote( 0.0, 0.5, "C3" );
    }
    if(B6.getLabel() == "2"){
      out.playNote( 0.0, 0.5, "D3" );
    }
    if(B6.getLabel() == "3"){
      out.playNote( 0.0, 0.5, "E3" );
    }
    if(B6.getLabel() == "4"){
      out.playNote( 0.0, 0.5, "F3" );
    }
    if(B6.getLabel() == "5"){
      out.playNote( 0.0, 0.5, "G3" );
    }
    if(B6.getLabel() == "6"){
      out.playNote( 0.0, 0.5, "A3" );
    }
    if(B6.getLabel() == "7"){
      out.playNote( 0.0, 0.5, "B3" );
    }
    if(B7.getLabel() == "1"){
      out.playNote( 0.0, 0.5, "C3" );
    }
    if(B7.getLabel() == "2"){
      out.playNote( 0.0, 0.5, "D3" );
    }
    if(B7.getLabel() == "3"){
      out.playNote( 0.0, 0.5, "E3" );
    }
    if(B7.getLabel() == "4"){
      out.playNote( 0.0, 0.5, "F3" );
    }
    if(B7.getLabel() == "5"){
      out.playNote( 0.0, 0.5, "G3" );
    }
    if(B7.getLabel() == "6"){
      out.playNote( 0.0, 0.5, "A3" );
    }
    if(B7.getLabel() == "7"){
      out.playNote( 0.0, 0.5, "B3" );
    }
   }
   void synthNote2(){
    if(C0.getLabel() == "1"){
      if(A0p.getLabel() == "Tr2"){
        out.playNote( 0.0, 0.5, "C5" );
      }
      else if(A0p.getLabel() == "Tr1"){
        out.playNote( 0.0, 0.5, "C4" );
      }
      else
      out.playNote( 0.0, 0.5, "C3" );
    }
    if(C0.getLabel() == "2"){
      if(A0p.getLabel() == "Tr2"){
        out.playNote( 0.0, 0.5, "D5" );
      }
      else if(A0p.getLabel() == "Tr1"){
        out.playNote( 0.0, 0.5, "D4" );
      }
      else
      out.playNote( 0.0, 0.5, "D3" );
    }
    if(C0.getLabel() == "3"){
      if(A0p.getLabel() == "Tr2"){
        out.playNote( 0.0, 0.5, "E5" );
      }
      else if(A0p.getLabel() == "Tr1"){
        out.playNote( 0.0, 0.5, "E4" );
      }
      else
      out.playNote( 0.0, 0.5, "E3" );
    }
    if(C0.getLabel() == "4"){
      if(A0p.getLabel() == "Tr2"){
        out.playNote( 0.0, 0.5, "F5" );
      }
      else if(A0p.getLabel() == "Tr1"){
        out.playNote( 0.0, 0.5, "F4" );
      }
      else
      out.playNote( 0.0, 0.5, "F3" );
    }
    if(C0.getLabel() == "5"){
      if(A0p.getLabel() == "Tr2"){
        out.playNote( 0.0, 0.5, "G5" );
      }
      else if(A0p.getLabel() == "Tr1"){
        out.playNote( 0.0, 0.5, "G4" );
      }
      else
      out.playNote( 0.0, 0.5, "G3" );
    }
    if(C0.getLabel() == "6"){
      if(A0p.getLabel() == "Tr2"){
        out.playNote( 0.0, 0.5, "A5" );
      }
      else if(A0p.getLabel() == "Tr1"){
        out.playNote( 0.0, 0.5, "A4" );
      }
      else
      out.playNote( 0.0, 0.5, "A3" );
    }
    if(C0.getLabel() == "7"){
      if(A0p.getLabel() == "Tr2"){
        out.playNote( 0.0, 0.5, "B5" );
      }
      else if(A0p.getLabel() == "Tr1"){
        out.playNote( 0.0, 0.5, "B4" );
      }
      else
      out.playNote( 0.0, 0.5, "B3" );
    }
    if(C1.getLabel() == "1"){
      out.playNote( 0.0, 0.5, "C3" );
    }
    if(C1.getLabel() == "2"){
      out.playNote( 0.0, 0.5, "D3" );
    }
    if(C1.getLabel() == "3"){
      out.playNote( 0.0, 0.5, "E3" );
    }
    if(C1.getLabel() == "4"){
      out.playNote( 0.0, 0.5, "F3" );
    }
    if(C1.getLabel() == "5"){
      out.playNote( 0.0, 0.5, "G3" );
    }
    if(C1.getLabel() == "6"){
      out.playNote( 0.0, 0.5, "A3" );
    }
    if(C1.getLabel() == "7"){
      out.playNote( 0.0, 0.5, "B3" );
    }
    if(C2.getLabel() == "1"){
      out.playNote( 0.0, 0.5, "C3" );
    }
    if(C2.getLabel() == "2"){
      out.playNote( 0.0, 0.5, "D3" );
    }
    if(C2.getLabel() == "3"){
      out.playNote( 0.0, 0.5, "E3" );
    }
    if(C2.getLabel() == "4"){
      out.playNote( 0.0, 0.5, "F3" );
    }
    if(C2.getLabel() == "5"){
      out.playNote( 0.0, 0.5, "G3" );
    }
    if(C2.getLabel() == "6"){
      out.playNote( 0.0, 0.5, "A3" );
    }
    if(C2.getLabel() == "7"){
      out.playNote( 0.0, 0.5, "B3" );
    }
    if(C3.getLabel() == "1"){
      out.playNote( 0.0, 0.5, "C3" );
    }
    if(C3.getLabel() == "2"){
      out.playNote( 0.0, 0.5, "D3" );
    }
    if(C3.getLabel() == "3"){
      out.playNote( 0.0, 0.5, "E3" );
    }
    if(C3.getLabel() == "4"){
      out.playNote( 0.0, 0.5, "F3" );
    }
    if(C3.getLabel() == "5"){
      out.playNote( 0.0, 0.5, "G3" );
    }
    if(C3.getLabel() == "6"){
      out.playNote( 0.0, 0.5, "A3" );
    }
    if(C3.getLabel() == "7"){
      out.playNote( 0.0, 0.5, "B3" );
    }
    if(C4.getLabel() == "1"){
      out.playNote( 0.0, 0.5, "C3" );
    }
    if(C4.getLabel() == "2"){
      out.playNote( 0.0, 0.5, "D3" );
    }
    if(C4.getLabel() == "3"){
      out.playNote( 0.0, 0.5, "E3" );
    }
    if(C4.getLabel() == "4"){
      out.playNote( 0.0, 0.5, "F3" );
    }
    if(C4.getLabel() == "5"){
      out.playNote( 0.0, 0.5, "G3" );
    }
    if(C4.getLabel() == "6"){
      out.playNote( 0.0, 0.5, "A3" );
    }
    if(C4.getLabel() == "7"){
      out.playNote( 0.0, 0.5, "B3" );
    }
    if(C5.getLabel() == "1"){
      out.playNote( 0.0, 0.5, "C3" );
    }
    if(C5.getLabel() == "2"){
      out.playNote( 0.0, 0.5, "D3" );
    }
    if(C5.getLabel() == "3"){
      out.playNote( 0.0, 0.5, "E3" );
    }
    if(C5.getLabel() == "4"){
      out.playNote( 0.0, 0.5, "F3" );
    }
    if(C5.getLabel() == "5"){
      out.playNote( 0.0, 0.5, "G3" );
    }
    if(C5.getLabel() == "6"){
      out.playNote( 0.0, 0.5, "A3" );
    }
    if(C5.getLabel() == "7"){
      out.playNote( 0.0, 0.5, "B3" );
    }
    if(C6.getLabel() == "1"){
      out.playNote( 0.0, 0.5, "C3" );
    }
    if(C6.getLabel() == "2"){
      out.playNote( 0.0, 0.5, "D3" );
    }
    if(C6.getLabel() == "3"){
      out.playNote( 0.0, 0.5, "E3" );
    }
    if(C6.getLabel() == "4"){
      out.playNote( 0.0, 0.5, "F3" );
    }
    if(C6.getLabel() == "5"){
      out.playNote( 0.0, 0.5, "G3" );
    }
    if(C6.getLabel() == "6"){
      out.playNote( 0.0, 0.5, "A3" );
    }
    if(C6.getLabel() == "7"){
      out.playNote( 0.0, 0.5, "B3" );
    }
    if(C7.getLabel() == "1"){
      out.playNote( 0.0, 0.5, "C3" );
    }
    if(C7.getLabel() == "2"){
      out.playNote( 0.0, 0.5, "D3" );
    }
    if(C7.getLabel() == "3"){
      out.playNote( 0.0, 0.5, "E3" );
    }
    if(C7.getLabel() == "4"){
      out.playNote( 0.0, 0.5, "F3" );
    }
    if(C7.getLabel() == "5"){
      out.playNote( 0.0, 0.5, "G3" );
    }
    if(C7.getLabel() == "6"){
      out.playNote( 0.0, 0.5, "A3" );
    }
    if(C7.getLabel() == "7"){
      out.playNote( 0.0, 0.5, "B3" );
    }
   }
   void synthNote3(){
    if(D0.getLabel() == "1"){
      if(A0p.getLabel() == "Tr2"){
        out.playNote( 0.0, 0.5, "C5" );
      }
      else if(A0p.getLabel() == "Tr1"){
        out.playNote( 0.0, 0.5, "C4" );
      }
      else
      out.playNote( 0.0, 0.5, "C3" );
    }
    if(D0.getLabel() == "2"){
      if(A0p.getLabel() == "Tr2"){
        out.playNote( 0.0, 0.5, "D5" );
      }
      else if(A0p.getLabel() == "Tr1"){
        out.playNote( 0.0, 0.5, "D4" );
      }
      else
      out.playNote( 0.0, 0.5, "D3" );
    }
    if(D0.getLabel() == "3"){
      if(A0p.getLabel() == "Tr2"){
        out.playNote( 0.0, 0.5, "E5" );
      }
      else if(A0p.getLabel() == "Tr1"){
        out.playNote( 0.0, 0.5, "E4" );
      }
      else
      out.playNote( 0.0, 0.5, "E3" );
    }
    if(D0.getLabel() == "4"){
      if(A0p.getLabel() == "Tr2"){
        out.playNote( 0.0, 0.5, "F5" );
      }
      else if(A0p.getLabel() == "Tr1"){
        out.playNote( 0.0, 0.5, "F4" );
      }
      else
      out.playNote( 0.0, 0.5, "F3" );
    }
    if(D0.getLabel() == "5"){
      if(A0p.getLabel() == "Tr2"){
        out.playNote( 0.0, 0.5, "G5" );
      }
      else if(A0p.getLabel() == "Tr1"){
        out.playNote( 0.0, 0.5, "G4" );
      }
      else
      out.playNote( 0.0, 0.5, "G3" );
    }
    if(D0.getLabel() == "6"){
      if(A0p.getLabel() == "Tr2"){
        out.playNote( 0.0, 0.5, "A5" );
      }
      else if(A0p.getLabel() == "Tr1"){
        out.playNote( 0.0, 0.5, "A4" );
      }
      else
      out.playNote( 0.0, 0.5, "A3" );
    }
    if(D0.getLabel() == "7"){
      if(A0p.getLabel() == "Tr2"){
        out.playNote( 0.0, 0.5, "B5" );
      }
      else if(A0p.getLabel() == "Tr1"){
        out.playNote( 0.0, 0.5, "B4" );
      }
      else
      out.playNote( 0.0, 0.5, "B3" );
    }
    if(D1.getLabel() == "1"){
      out.playNote( 0.0, 0.5, "C3" );
    }
    if(D1.getLabel() == "2"){
      out.playNote( 0.0, 0.5, "D3" );
    }
    if(D1.getLabel() == "3"){
      out.playNote( 0.0, 0.5, "E3" );
    }
    if(D1.getLabel() == "4"){
      out.playNote( 0.0, 0.5, "F3" );
    }
    if(D1.getLabel() == "5"){
      out.playNote( 0.0, 0.5, "G3" );
    }
    if(D1.getLabel() == "6"){
      out.playNote( 0.0, 0.5, "A3" );
    }
    if(D1.getLabel() == "7"){
      out.playNote( 0.0, 0.5, "B3" );
    }
    if(D2.getLabel() == "1"){
      out.playNote( 0.0, 0.5, "C3" );
    }
    if(D2.getLabel() == "2"){
      out.playNote( 0.0, 0.5, "D3" );
    }
    if(D2.getLabel() == "3"){
      out.playNote( 0.0, 0.5, "E3" );
    }
    if(D2.getLabel() == "4"){
      out.playNote( 0.0, 0.5, "F3" );
    }
    if(D2.getLabel() == "5"){
      out.playNote( 0.0, 0.5, "G3" );
    }
    if(D2.getLabel() == "6"){
      out.playNote( 0.0, 0.5, "A3" );
    }
    if(D2.getLabel() == "7"){
      out.playNote( 0.0, 0.5, "B3" );
    }
    if(D3.getLabel() == "1"){
      out.playNote( 0.0, 0.5, "C3" );
    }
    if(D3.getLabel() == "2"){
      out.playNote( 0.0, 0.5, "D3" );
    }
    if(D3.getLabel() == "3"){
      out.playNote( 0.0, 0.5, "E3" );
    }
    if(D3.getLabel() == "4"){
      out.playNote( 0.0, 0.5, "F3" );
    }
    if(D3.getLabel() == "5"){
      out.playNote( 0.0, 0.5, "G3" );
    }
    if(D3.getLabel() == "6"){
      out.playNote( 0.0, 0.5, "A3" );
    }
    if(D3.getLabel() == "7"){
      out.playNote( 0.0, 0.5, "B3" );
    }
    if(D4.getLabel() == "1"){
      out.playNote( 0.0, 0.5, "C3" );
    }
    if(D4.getLabel() == "2"){
      out.playNote( 0.0, 0.5, "D3" );
    }
    if(D4.getLabel() == "3"){
      out.playNote( 0.0, 0.5, "E3" );
    }
    if(D4.getLabel() == "4"){
      out.playNote( 0.0, 0.5, "F3" );
    }
    if(D4.getLabel() == "5"){
      out.playNote( 0.0, 0.5, "G3" );
    }
    if(D4.getLabel() == "6"){
      out.playNote( 0.0, 0.5, "A3" );
    }
    if(D4.getLabel() == "7"){
      out.playNote( 0.0, 0.5, "B3" );
    }
    if(D5.getLabel() == "1"){
      out.playNote( 0.0, 0.5, "C3" );
    }
    if(D5.getLabel() == "2"){
      out.playNote( 0.0, 0.5, "D3" );
    }
    if(D5.getLabel() == "3"){
      out.playNote( 0.0, 0.5, "E3" );
    }
    if(D5.getLabel() == "4"){
      out.playNote( 0.0, 0.5, "F3" );
    }
    if(D5.getLabel() == "5"){
      out.playNote( 0.0, 0.5, "G3" );
    }
    if(D5.getLabel() == "6"){
      out.playNote( 0.0, 0.5, "A3" );
    }
    if(D5.getLabel() == "7"){
      out.playNote( 0.0, 0.5, "B3" );
    }
    if(D6.getLabel() == "1"){
      out.playNote( 0.0, 0.5, "C3" );
    }
    if(D6.getLabel() == "2"){
      out.playNote( 0.0, 0.5, "D3" );
    }
    if(D6.getLabel() == "3"){
      out.playNote( 0.0, 0.5, "E3" );
    }
    if(D6.getLabel() == "4"){
      out.playNote( 0.0, 0.5, "F3" );
    }
    if(D6.getLabel() == "5"){
      out.playNote( 0.0, 0.5, "G3" );
    }
    if(D6.getLabel() == "6"){
      out.playNote( 0.0, 0.5, "A3" );
    }
    if(D6.getLabel() == "7"){
      out.playNote( 0.0, 0.5, "B3" );
    }
    if(D7.getLabel() == "1"){
      out.playNote( 0.0, 0.5, "C3" );
    }
    if(D7.getLabel() == "2"){
      out.playNote( 0.0, 0.5, "D3" );
    }
    if(D7.getLabel() == "3"){
      out.playNote( 0.0, 0.5, "E3" );
    }
    if(D7.getLabel() == "4"){
      out.playNote( 0.0, 0.5, "F3" );
    }
    if(D7.getLabel() == "5"){
      out.playNote( 0.0, 0.5, "G3" );
    }
    if(D7.getLabel() == "6"){
      out.playNote( 0.0, 0.5, "A3" );
    }
    if(D7.getLabel() == "7"){
      out.playNote( 0.0, 0.5, "B3" );
    }
   }
 void synthNote4(){
    if(E0.getLabel() == "1"){
      if(A0p.getLabel() == "Tr2"){
        out.playNote( 0.0, 0.5, "C5" );
      }
      else if(A0p.getLabel() == "Tr1"){
        out.playNote( 0.0, 0.5, "C4" );
      }
      else
      out.playNote( 0.0, 0.5, "C3" );
    }
    if(E0.getLabel() == "2"){
      if(A0p.getLabel() == "Tr2"){
        out.playNote( 0.0, 0.5, "D5" );
      }
      else if(A0p.getLabel() == "Tr1"){
        out.playNote( 0.0, 0.5, "D4" );
      }
      else
      out.playNote( 0.0, 0.5, "D3" );
    }
    if(E0.getLabel() == "3"){
      if(A0p.getLabel() == "Tr2"){
        out.playNote( 0.0, 0.5, "E5" );
      }
      else if(A0p.getLabel() == "Tr1"){
        out.playNote( 0.0, 0.5, "E4" );
      }
      else
      out.playNote( 0.0, 0.5, "E3" );
    }
    if(E0.getLabel() == "4"){
      if(A0p.getLabel() == "Tr2"){
        out.playNote( 0.0, 0.5, "F5" );
      }
      else if(A0p.getLabel() == "Tr1"){
        out.playNote( 0.0, 0.5, "F4" );
      }
      else
      out.playNote( 0.0, 0.5, "F3" );
    }
    if(E0.getLabel() == "5"){
      if(A0p.getLabel() == "Tr2"){
        out.playNote( 0.0, 0.5, "G5" );
      }
      else if(A0p.getLabel() == "Tr1"){
        out.playNote( 0.0, 0.5, "G4" );
      }
      else
      out.playNote( 0.0, 0.5, "G3" );
    }
    if(E0.getLabel() == "6"){
      if(A0p.getLabel() == "Tr2"){
        out.playNote( 0.0, 0.5, "A5" );
      }
      else if(A0p.getLabel() == "Tr1"){
        out.playNote( 0.0, 0.5, "A4" );
      }
      else
      out.playNote( 0.0, 0.5, "A3" );
    }
    if(E0.getLabel() == "7"){
      if(A0p.getLabel() == "Tr2"){
        out.playNote( 0.0, 0.5, "B5" );
      }
      else if(A0p.getLabel() == "Tr1"){
        out.playNote( 0.0, 0.5, "B4" );
      }
      else
      out.playNote( 0.0, 0.5, "B3" );
    }
    if(E1.getLabel() == "1"){
      out.playNote( 0.0, 0.5, "C3" );
    }
    if(E1.getLabel() == "2"){
      out.playNote( 0.0, 0.5, "D3" );
    }
    if(E1.getLabel() == "3"){
      out.playNote( 0.0, 0.5, "E3" );
    }
    if(E1.getLabel() == "4"){
      out.playNote( 0.0, 0.5, "F3" );
    }
    if(E1.getLabel() == "5"){
      out.playNote( 0.0, 0.5, "G3" );
    }
    if(E1.getLabel() == "6"){
      out.playNote( 0.0, 0.5, "A3" );
    }
    if(E1.getLabel() == "7"){
      out.playNote( 0.0, 0.5, "B3" );
    }
    if(E2.getLabel() == "1"){
      out.playNote( 0.0, 0.5, "C3" );
    }
    if(E2.getLabel() == "2"){
      out.playNote( 0.0, 0.5, "D3" );
    }
    if(E2.getLabel() == "3"){
      out.playNote( 0.0, 0.5, "E3" );
    }
    if(E2.getLabel() == "4"){
      out.playNote( 0.0, 0.5, "F3" );
    }
    if(E2.getLabel() == "5"){
      out.playNote( 0.0, 0.5, "G3" );
    }
    if(E2.getLabel() == "6"){
      out.playNote( 0.0, 0.5, "A3" );
    }
    if(E2.getLabel() == "7"){
      out.playNote( 0.0, 0.5, "B3" );
    }
    if(E3.getLabel() == "1"){
      out.playNote( 0.0, 0.5, "C3" );
    }
    if(E3.getLabel() == "2"){
      out.playNote( 0.0, 0.5, "D3" );
    }
    if(E3.getLabel() == "3"){
      out.playNote( 0.0, 0.5, "E3" );
    }
    if(E3.getLabel() == "4"){
      out.playNote( 0.0, 0.5, "F3" );
    }
    if(E3.getLabel() == "5"){
      out.playNote( 0.0, 0.5, "G3" );
    }
    if(E3.getLabel() == "6"){
      out.playNote( 0.0, 0.5, "A3" );
    }
    if(E3.getLabel() == "7"){
      out.playNote( 0.0, 0.5, "B3" );
    }
    if(E4.getLabel() == "1"){
      out.playNote( 0.0, 0.5, "C3" );
    }
    if(E4.getLabel() == "2"){
      out.playNote( 0.0, 0.5, "D3" );
    }
    if(E4.getLabel() == "3"){
      out.playNote( 0.0, 0.5, "E3" );
    }
    if(E4.getLabel() == "4"){
      out.playNote( 0.0, 0.5, "F3" );
    }
    if(E4.getLabel() == "5"){
      out.playNote( 0.0, 0.5, "G3" );
    }
    if(E4.getLabel() == "6"){
      out.playNote( 0.0, 0.5, "A3" );
    }
    if(E4.getLabel() == "7"){
      out.playNote( 0.0, 0.5, "B3" );
    }
    if(E5.getLabel() == "1"){
      out.playNote( 0.0, 0.5, "C3" );
    }
    if(E5.getLabel() == "2"){
      out.playNote( 0.0, 0.5, "D3" );
    }
    if(E5.getLabel() == "3"){
      out.playNote( 0.0, 0.5, "E3" );
    }
    if(E5.getLabel() == "4"){
      out.playNote( 0.0, 0.5, "F3" );
    }
    if(E5.getLabel() == "5"){
      out.playNote( 0.0, 0.5, "G3" );
    }
    if(E5.getLabel() == "6"){
      out.playNote( 0.0, 0.5, "A3" );
    }
    if(E5.getLabel() == "7"){
      out.playNote( 0.0, 0.5, "B3" );
    }
    if(E6.getLabel() == "1"){
      out.playNote( 0.0, 0.5, "C3" );
    }
    if(E6.getLabel() == "2"){
      out.playNote( 0.0, 0.5, "D3" );
    }
    if(E6.getLabel() == "3"){
      out.playNote( 0.0, 0.5, "E3" );
    }
    if(E6.getLabel() == "4"){
      out.playNote( 0.0, 0.5, "F3" );
    }
    if(E6.getLabel() == "5"){
      out.playNote( 0.0, 0.5, "G3" );
    }
    if(E6.getLabel() == "6"){
      out.playNote( 0.0, 0.5, "A3" );
    }
    if(E6.getLabel() == "7"){
      out.playNote( 0.0, 0.5, "B3" );
    }
    if(E7.getLabel() == "1"){
      out.playNote( 0.0, 0.5, "C3" );
    }
    if(E7.getLabel() == "2"){
      out.playNote( 0.0, 0.5, "D3" );
    }
    if(E7.getLabel() == "3"){
      out.playNote( 0.0, 0.5, "E3" );
    }
    if(E7.getLabel() == "4"){
      out.playNote( 0.0, 0.5, "F3" );
    }
    if(E7.getLabel() == "5"){
      out.playNote( 0.0, 0.5, "G3" );
    }
    if(E7.getLabel() == "6"){
      out.playNote( 0.0, 0.5, "A3" );
    }
    if(E7.getLabel() == "7"){
      out.playNote( 0.0, 0.5, "B3" );
    }
   }
   void synthNote5(){
    if(F0.getLabel() == "1"){
      if(A0p.getLabel() == "Tr2"){
        out.playNote( 0.0, 0.5, "C5" );
      }
      else if(A0p.getLabel() == "Tr1"){
        out.playNote( 0.0, 0.5, "C4" );
      }
      else
      out.playNote( 0.0, 0.5, "C3" );
    }
    if(F0.getLabel() == "2"){
      if(A0p.getLabel() == "Tr2"){
        out.playNote( 0.0, 0.5, "D5" );
      }
      else if(A0p.getLabel() == "Tr1"){
        out.playNote( 0.0, 0.5, "D4" );
      }
      else
      out.playNote( 0.0, 0.5, "D3" );
    }
    if(F0.getLabel() == "3"){
      if(A0p.getLabel() == "Tr2"){
        out.playNote( 0.0, 0.5, "E5" );
      }
      else if(A0p.getLabel() == "Tr1"){
        out.playNote( 0.0, 0.5, "E4" );
      }
      else
      out.playNote( 0.0, 0.5, "E3" );
    }
    if(F0.getLabel() == "4"){
      if(A0p.getLabel() == "Tr2"){
        out.playNote( 0.0, 0.5, "F5" );
      }
      else if(A0p.getLabel() == "Tr1"){
        out.playNote( 0.0, 0.5, "F4" );
      }
      else
      out.playNote( 0.0, 0.5, "F3" );
    }
    if(F0.getLabel() == "5"){
      if(A0p.getLabel() == "Tr2"){
        out.playNote( 0.0, 0.5, "G5" );
      }
      else if(A0p.getLabel() == "Tr1"){
        out.playNote( 0.0, 0.5, "G4" );
      }
      else
      out.playNote( 0.0, 0.5, "G3" );
    }
    if(F0.getLabel() == "6"){
      if(A0p.getLabel() == "Tr2"){
        out.playNote( 0.0, 0.5, "A5" );
      }
      else if(A0p.getLabel() == "Tr1"){
        out.playNote( 0.0, 0.5, "A4" );
      }
      else
      out.playNote( 0.0, 0.5, "A3" );
    }
    if(F0.getLabel() == "7"){
      if(A0p.getLabel() == "Tr2"){
        out.playNote( 0.0, 0.5, "B5" );
      }
      else if(A0p.getLabel() == "Tr1"){
        out.playNote( 0.0, 0.5, "B4" );
      }
      else
      out.playNote( 0.0, 0.5, "B3" );
    }
    if(F1.getLabel() == "1"){
      out.playNote( 0.0, 0.5, "C3" );
    }
    if(F1.getLabel() == "2"){
      out.playNote( 0.0, 0.5, "D3" );
    }
    if(F1.getLabel() == "3"){
      out.playNote( 0.0, 0.5, "E3" );
    }
    if(F1.getLabel() == "4"){
      out.playNote( 0.0, 0.5, "F3" );
    }
    if(F1.getLabel() == "5"){
      out.playNote( 0.0, 0.5, "G3" );
    }
    if(F1.getLabel() == "6"){
      out.playNote( 0.0, 0.5, "A3" );
    }
    if(F1.getLabel() == "7"){
      out.playNote( 0.0, 0.5, "B3" );
    }
    if(F2.getLabel() == "1"){
      out.playNote( 0.0, 0.5, "C3" );
    }
    if(F2.getLabel() == "2"){
      out.playNote( 0.0, 0.5, "D3" );
    }
    if(F2.getLabel() == "3"){
      out.playNote( 0.0, 0.5, "E3" );
    }
    if(F2.getLabel() == "4"){
      out.playNote( 0.0, 0.5, "F3" );
    }
    if(F2.getLabel() == "5"){
      out.playNote( 0.0, 0.5, "G3" );
    }
    if(F2.getLabel() == "6"){
      out.playNote( 0.0, 0.5, "A3" );
    }
    if(F2.getLabel() == "7"){
      out.playNote( 0.0, 0.5, "B3" );
    }
    if(F3.getLabel() == "1"){
      out.playNote( 0.0, 0.5, "C3" );
    }
    if(F3.getLabel() == "2"){
      out.playNote( 0.0, 0.5, "D3" );
    }
    if(F3.getLabel() == "3"){
      out.playNote( 0.0, 0.5, "E3" );
    }
    if(F3.getLabel() == "4"){
      out.playNote( 0.0, 0.5, "F3" );
    }
    if(F3.getLabel() == "5"){
      out.playNote( 0.0, 0.5, "G3" );
    }
    if(F3.getLabel() == "6"){
      out.playNote( 0.0, 0.5, "A3" );
    }
    if(F3.getLabel() == "7"){
      out.playNote( 0.0, 0.5, "B3" );
    }
    if(F3.getLabel() == "1"){
      out.playNote( 0.0, 0.5, "C3" );
    }
    if(F3.getLabel() == "2"){
      out.playNote( 0.0, 0.5, "D3" );
    }
    if(F3.getLabel() == "3"){
      out.playNote( 0.0, 0.5, "E3" );
    }
    if(F3.getLabel() == "4"){
      out.playNote( 0.0, 0.5, "F3" );
    }
    if(F3.getLabel() == "5"){
      out.playNote( 0.0, 0.5, "G3" );
    }
    if(F3.getLabel() == "6"){
      out.playNote( 0.0, 0.5, "A3" );
    }
    if(F3.getLabel() == "7"){
      out.playNote( 0.0, 0.5, "B3" );
    }
    if(F4.getLabel() == "1"){
      out.playNote( 0.0, 0.5, "C3" );
    }
    if(F4.getLabel() == "2"){
      out.playNote( 0.0, 0.5, "D3" );
    }
    if(F4.getLabel() == "3"){
      out.playNote( 0.0, 0.5, "E3" );
    }
    if(F4.getLabel() == "4"){
      out.playNote( 0.0, 0.5, "F3" );
    }
    if(F4.getLabel() == "5"){
      out.playNote( 0.0, 0.5, "G3" );
    }
    if(F4.getLabel() == "6"){
      out.playNote( 0.0, 0.5, "A3" );
    }
    if(F4.getLabel() == "7"){
      out.playNote( 0.0, 0.5, "B3" );
    }
    if(F5.getLabel() == "1"){
      out.playNote( 0.0, 0.5, "C3" );
    }
    if(F5.getLabel() == "2"){
      out.playNote( 0.0, 0.5, "D3" );
    }
    if(F5.getLabel() == "3"){
      out.playNote( 0.0, 0.5, "E3" );
    }
    if(F5.getLabel() == "4"){
      out.playNote( 0.0, 0.5, "F3" );
    }
    if(F5.getLabel() == "5"){
      out.playNote( 0.0, 0.5, "G3" );
    }
    if(F5.getLabel() == "6"){
      out.playNote( 0.0, 0.5, "A3" );
    }
    if(F5.getLabel() == "7"){
      out.playNote( 0.0, 0.5, "B3" );
    }
    if(F6.getLabel() == "1"){
      out.playNote( 0.0, 0.5, "C3" );
    }
    if(F6.getLabel() == "2"){
      out.playNote( 0.0, 0.5, "D3" );
    }
    if(F6.getLabel() == "3"){
      out.playNote( 0.0, 0.5, "E3" );
    }
    if(F6.getLabel() == "4"){
      out.playNote( 0.0, 0.5, "F3" );
    }
    if(F6.getLabel() == "5"){
      out.playNote( 0.0, 0.5, "G3" );
    }
    if(F6.getLabel() == "6"){
      out.playNote( 0.0, 0.5, "A3" );
    }
    if(F6.getLabel() == "7"){
      out.playNote( 0.0, 0.5, "B3" );
    }
    if(F7.getLabel() == "1"){
      out.playNote( 0.0, 0.5, "C3" );
    }
    if(F7.getLabel() == "2"){
      out.playNote( 0.0, 0.5, "D3" );
    }
    if(F7.getLabel() == "3"){
      out.playNote( 0.0, 0.5, "E3" );
    }
    if(F7.getLabel() == "4"){
      out.playNote( 0.0, 0.5, "F3" );
    }
    if(F7.getLabel() == "5"){
      out.playNote( 0.0, 0.5, "G3" );
    }
    if(F7.getLabel() == "6"){
      out.playNote( 0.0, 0.5, "A3" );
    }
    if(F7.getLabel() == "7"){
      out.playNote( 0.0, 0.5, "B3" );
    }
   }
   void synthNote6(){
    if(G0.getLabel() == "1"){
      if(A0p.getLabel() == "Tr2"){
        out.playNote( 0.0, 0.5, "C5" );
      }
      else if(A0p.getLabel() == "Tr1"){
        out.playNote( 0.0, 0.5, "C4" );
      }
      else
      out.playNote( 0.0, 0.5, "C3" );
    }
    if(G0.getLabel() == "2"){
      if(A0p.getLabel() == "Tr2"){
        out.playNote( 0.0, 0.5, "D5" );
      }
      else if(A0p.getLabel() == "Tr1"){
        out.playNote( 0.0, 0.5, "D4" );
      }
      else
      out.playNote( 0.0, 0.5, "D3" );
    }
    if(G0.getLabel() == "3"){
      if(A0p.getLabel() == "Tr2"){
        out.playNote( 0.0, 0.5, "E5" );
      }
      else if(A0p.getLabel() == "Tr1"){
        out.playNote( 0.0, 0.5, "E4" );
      }
      else
      out.playNote( 0.0, 0.5, "E3" );
    }
    if(G0.getLabel() == "4"){
      if(A0p.getLabel() == "Tr2"){
        out.playNote( 0.0, 0.5, "F5" );
      }
      else if(A0p.getLabel() == "Tr1"){
        out.playNote( 0.0, 0.5, "F4" );
      }
      else
      out.playNote( 0.0, 0.5, "F3" );
    }
    if(G0.getLabel() == "5"){
      if(A0p.getLabel() == "Tr2"){
        out.playNote( 0.0, 0.5, "G5" );
      }
      else if(A0p.getLabel() == "Tr1"){
        out.playNote( 0.0, 0.5, "G4" );
      }
      else
      out.playNote( 0.0, 0.5, "G3" );
    }
    if(G0.getLabel() == "6"){
      if(A0p.getLabel() == "Tr2"){
        out.playNote( 0.0, 0.5, "A5" );
      }
      else if(A0p.getLabel() == "Tr1"){
        out.playNote( 0.0, 0.5, "A4" );
      }
      else
      out.playNote( 0.0, 0.5, "A3" );
    }
    if(G0.getLabel() == "7"){
      if(A0p.getLabel() == "Tr2"){
        out.playNote( 0.0, 0.5, "B5" );
      }
      else if(A0p.getLabel() == "Tr1"){
        out.playNote( 0.0, 0.5, "B4" );
      }
      else
      out.playNote( 0.0, 0.5, "B3" );
    }
    if(G1.getLabel() == "1"){
      out.playNote( 0.0, 0.5, "C3" );
    }
    if(G1.getLabel() == "2"){
      out.playNote( 0.0, 0.5, "D3" );
    }
    if(G1.getLabel() == "3"){
      out.playNote( 0.0, 0.5, "E3" );
    }
    if(G1.getLabel() == "4"){
      out.playNote( 0.0, 0.5, "F3" );
    }
    if(G1.getLabel() == "5"){
      out.playNote( 0.0, 0.5, "G3" );
    }
    if(G1.getLabel() == "6"){
      out.playNote( 0.0, 0.5, "A3" );
    }
    if(G1.getLabel() == "7"){
      out.playNote( 0.0, 0.5, "B3" );
    }
    if(G2.getLabel() == "1"){
      out.playNote( 0.0, 0.5, "C3" );
    }
    if(G2.getLabel() == "2"){
      out.playNote( 0.0, 0.5, "D3" );
    }
    if(G2.getLabel() == "3"){
      out.playNote( 0.0, 0.5, "E3" );
    }
    if(G2.getLabel() == "4"){
      out.playNote( 0.0, 0.5, "F3" );
    }
    if(G2.getLabel() == "5"){
      out.playNote( 0.0, 0.5, "G3" );
    }
    if(G2.getLabel() == "6"){
      out.playNote( 0.0, 0.5, "A3" );
    }
    if(G2.getLabel() == "7"){
      out.playNote( 0.0, 0.5, "B3" );
    }
    if(G3.getLabel() == "1"){
      out.playNote( 0.0, 0.5, "C3" );
    }
    if(G3.getLabel() == "2"){
      out.playNote( 0.0, 0.5, "D3" );
    }
    if(G3.getLabel() == "3"){
      out.playNote( 0.0, 0.5, "E3" );
    }
    if(G3.getLabel() == "4"){
      out.playNote( 0.0, 0.5, "F3" );
    }
    if(G3.getLabel() == "5"){
      out.playNote( 0.0, 0.5, "G3" );
    }
    if(G3.getLabel() == "6"){
      out.playNote( 0.0, 0.5, "A3" );
    }
    if(G3.getLabel() == "7"){
      out.playNote( 0.0, 0.5, "B3" );
    }
    if(G4.getLabel() == "1"){
      out.playNote( 0.0, 0.5, "C3" );
    }
    if(G4.getLabel() == "2"){
      out.playNote( 0.0, 0.5, "D3" );
    }
    if(G4.getLabel() == "3"){
      out.playNote( 0.0, 0.5, "E3" );
    }
    if(G4.getLabel() == "4"){
      out.playNote( 0.0, 0.5, "F3" );
    }
    if(G4.getLabel() == "5"){
      out.playNote( 0.0, 0.5, "G3" );
    }
    if(G4.getLabel() == "6"){
      out.playNote( 0.0, 0.5, "A3" );
    }
    if(G4.getLabel() == "7"){
      out.playNote( 0.0, 0.5, "B3" );
    }
    if(G5.getLabel() == "1"){
      out.playNote( 0.0, 0.5, "C3" );
    }
    if(G5.getLabel() == "2"){
      out.playNote( 0.0, 0.5, "D3" );
    }
    if(G5.getLabel() == "3"){
      out.playNote( 0.0, 0.5, "E3" );
    }
    if(G5.getLabel() == "4"){
      out.playNote( 0.0, 0.5, "F3" );
    }
    if(G5.getLabel() == "5"){
      out.playNote( 0.0, 0.5, "G3" );
    }
    if(G5.getLabel() == "6"){
      out.playNote( 0.0, 0.5, "A3" );
    }
    if(G5.getLabel() == "7"){
      out.playNote( 0.0, 0.5, "B3" );
    }
    if(G6.getLabel() == "1"){
      out.playNote( 0.0, 0.5, "C3" );
    }
    if(G6.getLabel() == "2"){
      out.playNote( 0.0, 0.5, "D3" );
    }
    if(G6.getLabel() == "3"){
      out.playNote( 0.0, 0.5, "E3" );
    }
    if(G6.getLabel() == "4"){
      out.playNote( 0.0, 0.5, "F3" );
    }
    if(G6.getLabel() == "5"){
      out.playNote( 0.0, 0.5, "G3" );
    }
    if(G6.getLabel() == "6"){
      out.playNote( 0.0, 0.5, "A3" );
    }
    if(G6.getLabel() == "7"){
      out.playNote( 0.0, 0.5, "B3" );
    }
    if(G7.getLabel() == "1"){
      out.playNote( 0.0, 0.5, "C3" );
    }
    if(G7.getLabel() == "2"){
      out.playNote( 0.0, 0.5, "D3" );
    }
    if(G7.getLabel() == "3"){
      out.playNote( 0.0, 0.5, "E3" );
    }
    if(G7.getLabel() == "4"){
      out.playNote( 0.0, 0.5, "F3" );
    }
    if(G7.getLabel() == "5"){
      out.playNote( 0.0, 0.5, "G3" );
    }
    if(G7.getLabel() == "6"){
      out.playNote( 0.0, 0.5, "A3" );
    }
    if(G7.getLabel() == "7"){
      out.playNote( 0.0, 0.5, "B3" );
    }
   }
   void synthNote7(){
    if(H0.getLabel() == "1"){
      if(A0p.getLabel() == "Tr2"){
        out.playNote( 0.0, 0.5, "C5" );
      }
      else if(A0p.getLabel() == "Tr1"){
        out.playNote( 0.0, 0.5, "C4" );
      }
      else
      out.playNote( 0.0, 0.5, "C3" );
    }
    if(H0.getLabel() == "2"){
      if(A0p.getLabel() == "Tr2"){
        out.playNote( 0.0, 0.5, "D5" );
      }
      else if(A0p.getLabel() == "Tr1"){
        out.playNote( 0.0, 0.5, "D4" );
      }
      else
      out.playNote( 0.0, 0.5, "D3" );
    }
    if(H0.getLabel() == "3"){
      if(A0p.getLabel() == "Tr2"){
        out.playNote( 0.0, 0.5, "E5" );
      }
      else if(A0p.getLabel() == "Tr1"){
        out.playNote( 0.0, 0.5, "E4" );
      }
      else
      out.playNote( 0.0, 0.5, "E3" );
    }
    if(H0.getLabel() == "4"){
      if(A0p.getLabel() == "Tr2"){
        out.playNote( 0.0, 0.5, "F5" );
      }
      else if(A0p.getLabel() == "Tr1"){
        out.playNote( 0.0, 0.5, "F4" );
      }
      else
      out.playNote( 0.0, 0.5, "F3" );
    }
    if(H0.getLabel() == "5"){
      if(A0p.getLabel() == "Tr2"){
        out.playNote( 0.0, 0.5, "G5" );
      }
      else if(A0p.getLabel() == "Tr1"){
        out.playNote( 0.0, 0.5, "G4" );
      }
      else
      out.playNote( 0.0, 0.5, "G3" );
    }
    if(H0.getLabel() == "6"){
      if(A0p.getLabel() == "Tr2"){
        out.playNote( 0.0, 0.5, "A5" );
      }
      else if(A0p.getLabel() == "Tr1"){
        out.playNote( 0.0, 0.5, "A4" );
      }
      else
      out.playNote( 0.0, 0.5, "A3" );
    }
    if(H0.getLabel() == "7"){
      if(A0p.getLabel() == "Tr2"){
        out.playNote( 0.0, 0.5, "B5" );
      }
      else if(A0p.getLabel() == "Tr1"){
        out.playNote( 0.0, 0.5, "B4" );
      }
      else
      out.playNote( 0.0, 0.5, "B3" );
    }
    if(H1.getLabel() == "1"){
      out.playNote( 0.0, 0.5, "C3" );
    }
    if(H1.getLabel() == "2"){
      out.playNote( 0.0, 0.5, "D3" );
    }
    if(H1.getLabel() == "3"){
      out.playNote( 0.0, 0.5, "E3" );
    }
    if(H1.getLabel() == "4"){
      out.playNote( 0.0, 0.5, "F3" );
    }
    if(H1.getLabel() == "5"){
      out.playNote( 0.0, 0.5, "G3" );
    }
    if(H1.getLabel() == "6"){
      out.playNote( 0.0, 0.5, "A3" );
    }
    if(H1.getLabel() == "7"){
      out.playNote( 0.0, 0.5, "B3" );
    }
    if(H2.getLabel() == "1"){
      out.playNote( 0.0, 0.5, "C3" );
    }
    if(H2.getLabel() == "2"){
      out.playNote( 0.0, 0.5, "D3" );
    }
    if(H2.getLabel() == "3"){
      out.playNote( 0.0, 0.5, "E3" );
    }
    if(H2.getLabel() == "4"){
      out.playNote( 0.0, 0.5, "F3" );
    }
    if(H2.getLabel() == "5"){
      out.playNote( 0.0, 0.5, "G3" );
    }
    if(H2.getLabel() == "6"){
      out.playNote( 0.0, 0.5, "A3" );
    }
    if(H2.getLabel() == "7"){
      out.playNote( 0.0, 0.5, "B3" );
    }
    if(H3.getLabel() == "1"){
      out.playNote( 0.0, 0.5, "C3" );
    }
    if(H3.getLabel() == "2"){
      out.playNote( 0.0, 0.5, "D3" );
    }
    if(H3.getLabel() == "3"){
      out.playNote( 0.0, 0.5, "E3" );
    }
    if(H3.getLabel() == "4"){
      out.playNote( 0.0, 0.5, "F3" );
    }
    if(H3.getLabel() == "5"){
      out.playNote( 0.0, 0.5, "G3" );
    }
    if(H3.getLabel() == "6"){
      out.playNote( 0.0, 0.5, "A3" );
    }
    if(H3.getLabel() == "7"){
      out.playNote( 0.0, 0.5, "B3" );
    }
    if(H4.getLabel() == "1"){
      out.playNote( 0.0, 0.5, "C3" );
    }
    if(H4.getLabel() == "2"){
      out.playNote( 0.0, 0.5, "D3" );
    }
    if(H4.getLabel() == "3"){
      out.playNote( 0.0, 0.5, "E3" );
    }
    if(H4.getLabel() == "4"){
      out.playNote( 0.0, 0.5, "F3" );
    }
    if(H4.getLabel() == "5"){
      out.playNote( 0.0, 0.5, "G3" );
    }
    if(H4.getLabel() == "6"){
      out.playNote( 0.0, 0.5, "A3" );
    }
    if(H4.getLabel() == "7"){
      out.playNote( 0.0, 0.5, "B3" );
    }
    if(H5.getLabel() == "1"){
      out.playNote( 0.0, 0.5, "C3" );
    }
    if(H5.getLabel() == "2"){
      out.playNote( 0.0, 0.5, "D3" );
    }
    if(H5.getLabel() == "3"){
      out.playNote( 0.0, 0.5, "E3" );
    }
    if(H5.getLabel() == "4"){
      out.playNote( 0.0, 0.5, "F3" );
    }
    if(H5.getLabel() == "5"){
      out.playNote( 0.0, 0.5, "G3" );
    }
    if(H5.getLabel() == "6"){
      out.playNote( 0.0, 0.5, "A3" );
    }
    if(H5.getLabel() == "7"){
      out.playNote( 0.0, 0.5, "B3" );
    }
    if(H6.getLabel() == "1"){
      out.playNote( 0.0, 0.5, "C3" );
    }
    if(H6.getLabel() == "2"){
      out.playNote( 0.0, 0.5, "D3" );
    }
    if(H6.getLabel() == "3"){
      out.playNote( 0.0, 0.5, "E3" );
    }
    if(H6.getLabel() == "4"){
      out.playNote( 0.0, 0.5, "F3" );
    }
    if(H6.getLabel() == "5"){
      out.playNote( 0.0, 0.5, "G3" );
    }
    if(H6.getLabel() == "6"){
      out.playNote( 0.0, 0.5, "A3" );
    }
    if(H6.getLabel() == "7"){
      out.playNote( 0.0, 0.5, "B3" );
    }
    if(H7.getLabel() == "1"){
      out.playNote( 0.0, 0.5, "C3" );
    }
    if(H7.getLabel() == "2"){
      out.playNote( 0.0, 0.5, "D3" );
    }
    if(H7.getLabel() == "3"){
      out.playNote( 0.0, 0.5, "E3" );
    }
    if(H7.getLabel() == "4"){
      out.playNote( 0.0, 0.5, "F3" );
    }
    if(H7.getLabel() == "5"){
      out.playNote( 0.0, 0.5, "G3" );
    }
    if(H7.getLabel() == "6"){
      out.playNote( 0.0, 0.5, "A3" );
    }
    if(H7.getLabel() == "7"){
      out.playNote( 0.0, 0.5, "B3" );
    }
   }
 
 //time0.setPosition(1100, height/2 + 79);
 //          time0.setSize(20,20);
 
 void notes(){
   notes0 = cp5.addRadioButton("notesRadioButton0");
   notes0.setPosition(1100, height/2 + 79);
   notes0.setSize(20,20);
   notes0.setColorForeground(color(120));
   notes0.setColorActive(color(255));
   notes0.setColorLabel(color(255));
   notes0.setItemsPerRow(3);
   notes0.setSpacingColumn(50);
   notes0.setSpacingRow(50);
   notes0.addItem("1",1);
   notes0.addItem("2",2);
   notes0.addItem("3",3);
   notes0.addItem("4",4);
   notes0.addItem("5",5);
   notes0.addItem("6",6);
   notes0.addItem("7",7);
   
   if(notes0Col == 0){
     if (notes0Row == 0){
       notes0.activate(0);
     }
     if (notes0Row == 1){
       notes0.activate(1);
     }
     if (notes0Row == 2){
       notes0.activate(2);
     }
   }
   if(notes0Col == 1){
     if (notes0Row == 0){
       notes0.activate(3);
     }
     if (notes0Row == 1){
       notes0.activate(4);
     }
     if (notes0Row == 2){
       notes0.activate(5);
     }
   }
   if(notes0Col == 2){
     notes0.activate(6);
   }
 }
 //.setPosition(575,height/2 + 79).setSize(230,90);
 void propFuncSel0(){
   if(instPropUpward == 0){
        if (instPropRighty == 0){
          //notes0Row = 0, notes0Col = 0, time0Row = 0, time0Col = 0
           time0 = cp5.addRadioButton("timeRadioButton1");
           time0.setPosition(1100, height/2 + 79);
           time0.setSize(20,20);
           time0.setColorForeground(color(120));
           time0.setColorActive(color(255));
           time0.setColorLabel(color(255));
           //time0.setItemsPerRow(3);
           //time0.setSpacingColumn(5);
           time0.setSpacingRow(5);
           time0.addItem("0.5",1);
           time0.addItem("1.0",2);
           time0.addItem("1.5",3);
           time0.addItem("2.0",4);
           time0.addItem("2.5",5);
           time0.addItem("3.0",6);
           //time0.addItem("60",7);
           //time0.addItem("70",8);
           ;
           if(time0Col == 0){
             time0.activate(0);
           }
           if(time0Col == 1){
             time0.activate(1);
           }
           if(time0Col == 2){
             time0.activate(2);
           }
           if(time0Col == 3){
             time0.activate(3);
           }
           if(time0Col == 4){
             time0.activate(4);
           }
           if(time0Col == 5){
             time0.activate(5);
           }
           if(time0Col == 6){
             time0.activate(6);
           }
      }
      
      if (instPropRighty == 1){
          //notes0Row = 0, notes0Col = 0, time0Row = 0, time0Col = 0
           transpose0 = cp5.addRadioButton("timeRadioButton1");
           transpose0.setPosition(1100, height/2 + 79);
           transpose0.setSize(20,20);
           transpose0.setColorForeground(color(120));
           transpose0.setColorActive(color(255));
           transpose0.setColorLabel(color(255));
           transpose0.setItemsPerRow(3);
           transpose0.setSpacingColumn(50);
           //transpose0.setSpacingRow(50);
           transpose0.setSpacingRow(5);
           transpose0.addItem("Tr0",1);
           transpose0.addItem("Tr1",2);
           transpose0.addItem("Tr2",3);
           transpose0.addItem("Tr3",4);
           transpose0.addItem("Tr4",5);
           transpose0.addItem("Tr-1",2);
           transpose0.addItem("Tr-2",3);
           transpose0.addItem("Tr-3",4);
           transpose0.addItem("Tr-4",5);
           ;
            if(time0Col == 0){
             if (time0Row == 0){
               transpose0.activate(0);
             }
             if (time0Row == 1){
               transpose0.activate(1);
             }
             if (time0Row == 2){
               transpose0.activate(2);
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               transpose0.activate(3);
             }
             if (time0Row == 1){
               transpose0.activate(4);
             }
             if (time0Row == 2){
               transpose0.activate(5);
             }
         }
         if(time0Col == 2){
           if (time0Row == 0){
               transpose0.activate(6);
             }
             if (time0Row == 1){
               transpose0.activate(7);
             }
             if (time0Row == 2){
               transpose0.activate(8);
             }
         }
        }
        if (instPropRighty == 2){
          //effect0, wave0
          effect0 = cp5.addRadioButton("timeRadioButton1");
           effect0.setPosition(1100, height/2 + 79);
           effect0.setSize(20,20);
           effect0.setColorForeground(color(120));
           effect0.setColorActive(color(255));
           effect0.setColorLabel(color(255));
           effect0.setItemsPerRow(2);
           effect0.setSpacingColumn(70);
           effect0.setSpacingRow(50);
           effect0.addItem("Delay Off",1);
           effect0.addItem("Delay On",2);
           effect0.addItem("BitCrush Off",3);
           effect0.addItem("BitCrush On",4);
           ;
            if(time0Col == 0){
             if (time0Row == 0){
               effect0.activate(0);
             }
             if (time0Row == 1){
               effect0.activate(1);
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               effect0.activate(2);
             }
             if (time0Row == 1){
               effect0.activate(3);
             }
         }
          
        }
      }
    if(instPropUpward == 1){
      if (instPropRighty == 0){
        //effect0, wave0
          wave0 = cp5.addRadioButton("timeRadioButton1");
           wave0.setPosition(1100, height/2 + 79);
           wave0.setSize(20,20);
           wave0.setColorForeground(color(120));
           wave0.setColorActive(color(255));
           wave0.setColorLabel(color(255));
           wave0.setItemsPerRow(1);
           //wave0.setSpacingColumn(50);
           wave0.setSpacingRow(50);
           wave0.addItem("Sine",1);
           wave0.addItem("Square",2);
           wave0.addItem("Saw",3);
           ;
            if(time0Col == 0){
               wave0.activate(0);
            }
             if (time0Col == 1){
               wave0.activate(1);
             }
             if (time0Col == 2){
               wave0.activate(2);
             }
             if (time0Col == 3){
               wave0.activate(3);
             }
             if (time0Col == 4){
               wave0.activate(4);
             }
          
      }      
      if (instPropRighty == 1){
        delete0 = cp5.addRadioButton("timeRadioButton1");
           delete0.setPosition(1100, height/2 + 79);
           delete0.setSize(20,20);
           delete0.setColorForeground(color(120));
           delete0.setColorActive(color(255));
           delete0.setColorLabel(color(255));
           //delete0.setItemsPerRow(3);
           //delete0.setSpacingColumn(5);
           delete0.setSpacingRow(50);
           delete0.addItem("Function",1);
           delete0.addItem("Pattern",2);
           ;
           if(time0Col == 0){
             delete0.activate(0);
           }
           if(time0Col == 1){
             delete0.activate(1);
           }
           
      }
      
      if (instPropRighty == 2){
       pan0 = cp5.addRadioButton("notesRadioButton8");
       pan0.setPosition(1100, height/2 + 79);
       pan0.setSize(20,20);
       pan0.setColorForeground(color(120));
       pan0.setColorActive(color(255));
       pan0.setColorLabel(color(255));
       pan0.setItemsPerRow(1);
       //pan0.setSpacingColumn(50);
       pan0.setSpacingRow(50);
       pan0.addItem("0",1);
       pan0.addItem("1",2);
       pan0.addItem("-1",3);
       ;
       if(time0Col == 0){
               pan0.activate(0);
          }
          
             if (time0Col == 1){
               pan0.activate(1);
             }
             if (time0Col == 2){
               pan0.activate(2);
             }
      }
    }
 }
 
 void propFuncSel1(){
   if(instPropUpward == 0){
        if (instPropRighty == 0){
          //notes0Row = 0, notes0Col = 0, time0Row = 0, time0Col = 0
           time0 = cp5.addRadioButton("timeRadioButton1");
           time0.setPosition(1100, height/2 + 79);
           time0.setSize(20,20);
           time0.setColorForeground(color(120));
           time0.setColorActive(color(255));
           time0.setColorLabel(color(255));
           time0.setItemsPerRow(3);
           time0.setSpacingColumn(50);
           time0.setSpacingRow(50);
           time0.addItem("1/4",1);
           time0.addItem("1/2",2);
           time0.addItem("1",3);
           time0.addItem("1/8",4);
           time0.addItem("1/16",5);
           time0.addItem("1/32",6);
           time0.addItem("1/64",7);
           ;
           if(time0Col == 0){
             if (time0Row == 0){
               time0.activate(0);
             }
             if (time0Row == 1){
               time0.activate(1);
             }
             if (time0Row == 2){
               time0.activate(2);
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               time0.activate(3);
             }
             if (time0Row == 1){
               time0.activate(4);
             }
             if (time0Row == 2){
               time0.activate(5);
             }
         }
         if(time0Col == 2){
           time0.activate(6);
         }
      }
      if (instPropRighty == 1){
          //notes0Row = 0, notes0Col = 0, time0Row = 0, time0Col = 0
           transpose0 = cp5.addRadioButton("timeRadioButton1");
           transpose0.setPosition(1100, height/2 + 79);
           transpose0.setSize(20,20);
           transpose0.setColorForeground(color(120));
           transpose0.setColorActive(color(255));
           transpose0.setColorLabel(color(255));
           transpose0.setItemsPerRow(3);
           transpose0.setSpacingColumn(50);
           //transpose0.setSpacingRow(50);
           transpose0.setSpacingRow(5);
           transpose0.addItem("0",1);
           transpose0.addItem("1",2);
           transpose0.addItem("2",3);
           transpose0.addItem("3",4);
           transpose0.addItem("4",5);
           transpose0.addItem("-1",2);
           transpose0.addItem("-2",3);
           transpose0.addItem("-3",4);
           transpose0.addItem("-4",5);
           ;
            if(time0Col == 0){
             if (time0Row == 0){
               transpose0.activate(0);
             }
             if (time0Row == 1){
               transpose0.activate(1);
             }
             if (time0Row == 2){
               transpose0.activate(2);
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               transpose0.activate(3);
             }
             if (time0Row == 1){
               transpose0.activate(4);
             }
             if (time0Row == 2){
               transpose0.activate(5);
             }
         }
         if(time0Col == 2){
           transpose0.activate(6);
         }
        }
        if (instPropRighty == 2){}
      }
    if(instPropUpward == 1){
      if (instPropRighty == 0){}
      if (instPropRighty == 1){}
      if (instPropRighty == 2){}
    }
 }
 void propFuncSel2(){
   if(instPropUpward == 0){
        if (instPropRighty == 0){
          //notes0Row = 0, notes0Col = 0, time0Row = 0, time0Col = 0
           time0 = cp5.addRadioButton("timeRadioButton1");
           time0.setPosition(1100, height/2 + 79);
           time0.setSize(20,20);
           time0.setColorForeground(color(120));
           time0.setColorActive(color(255));
           time0.setColorLabel(color(255));
           time0.setItemsPerRow(3);
           time0.setSpacingColumn(50);
           time0.setSpacingRow(50);
           time0.addItem("1/4",1);
           time0.addItem("1/2",2);
           time0.addItem("1",3);
           time0.addItem("1/8",4);
           time0.addItem("1/16",5);
           time0.addItem("1/32",6);
           time0.addItem("1/64",7);
           ;
           if(time0Col == 0){
             if (time0Row == 0){
               time0.activate(0);
             }
             if (time0Row == 1){
               time0.activate(1);
             }
             if (time0Row == 2){
               time0.activate(2);
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               time0.activate(3);
             }
             if (time0Row == 1){
               time0.activate(4);
             }
             if (time0Row == 2){
               time0.activate(5);
             }
         }
         if(time0Col == 2){
           time0.activate(6);
         }
      }
      if (instPropRighty == 1){
          //notes0Row = 0, notes0Col = 0, time0Row = 0, time0Col = 0
           transpose0 = cp5.addRadioButton("timeRadioButton1");
           transpose0.setPosition(1100, height/2 + 79);
           transpose0.setSize(20,20);
           transpose0.setColorForeground(color(120));
           transpose0.setColorActive(color(255));
           transpose0.setColorLabel(color(255));
           transpose0.setItemsPerRow(3);
           transpose0.setSpacingColumn(50);
           //transpose0.setSpacingRow(50);
           transpose0.setSpacingRow(5);
           transpose0.addItem("0",1);
           transpose0.addItem("1",2);
           transpose0.addItem("2",3);
           transpose0.addItem("3",4);
           transpose0.addItem("4",5);
           transpose0.addItem("-1",2);
           transpose0.addItem("-2",3);
           transpose0.addItem("-3",4);
           transpose0.addItem("-4",5);
           ;
            if(time0Col == 0){
             if (time0Row == 0){
               transpose0.activate(0);
             }
             if (time0Row == 1){
               transpose0.activate(1);
             }
             if (time0Row == 2){
               transpose0.activate(2);
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               transpose0.activate(3);
             }
             if (time0Row == 1){
               transpose0.activate(4);
             }
             if (time0Row == 2){
               transpose0.activate(5);
             }
         }
         if(time0Col == 2){
           transpose0.activate(6);
         }
        }
        if (instPropRighty == 2){}
      }
    if(instPropUpward == 1){
      if (instPropRighty == 0){}
      if (instPropRighty == 1){}
      if (instPropRighty == 2){}
    }
 }
 void propFuncSel3(){
   if(instPropUpward == 0){
        if (instPropRighty == 0){
          //notes0Row = 0, notes0Col = 0, time0Row = 0, time0Col = 0
           time0 = cp5.addRadioButton("timeRadioButton1");
           time0.setPosition(1100, height/2 + 79);
           time0.setSize(20,20);
           time0.setColorForeground(color(120));
           time0.setColorActive(color(255));
           time0.setColorLabel(color(255));
           time0.setItemsPerRow(3);
           time0.setSpacingColumn(50);
           time0.setSpacingRow(50);
           time0.addItem("1/4",1);
           time0.addItem("1/2",2);
           time0.addItem("1",3);
           time0.addItem("1/8",4);
           time0.addItem("1/16",5);
           time0.addItem("1/32",6);
           time0.addItem("1/64",7);
           ;
           if(time0Col == 0){
             if (time0Row == 0){
               time0.activate(0);
             }
             if (time0Row == 1){
               time0.activate(1);
             }
             if (time0Row == 2){
               time0.activate(2);
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               time0.activate(3);
             }
             if (time0Row == 1){
               time0.activate(4);
             }
             if (time0Row == 2){
               time0.activate(5);
             }
         }
         if(time0Col == 2){
           time0.activate(6);
         }
      }
      if (instPropRighty == 1){
          //notes0Row = 0, notes0Col = 0, time0Row = 0, time0Col = 0
           transpose0 = cp5.addRadioButton("timeRadioButton1");
           transpose0.setPosition(1100, height/2 + 79);
           transpose0.setSize(20,20);
           transpose0.setColorForeground(color(120));
           transpose0.setColorActive(color(255));
           transpose0.setColorLabel(color(255));
           transpose0.setItemsPerRow(3);
           transpose0.setSpacingColumn(50);
           //transpose0.setSpacingRow(50);
           transpose0.setSpacingRow(5);
           transpose0.addItem("0",1);
           transpose0.addItem("1",2);
           transpose0.addItem("2",3);
           transpose0.addItem("3",4);
           transpose0.addItem("4",5);
           transpose0.addItem("-1",2);
           transpose0.addItem("-2",3);
           transpose0.addItem("-3",4);
           transpose0.addItem("-4",5);
           ;
            if(time0Col == 0){
             if (time0Row == 0){
               transpose0.activate(0);
             }
             if (time0Row == 1){
               transpose0.activate(1);
             }
             if (time0Row == 2){
               transpose0.activate(2);
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               transpose0.activate(3);
             }
             if (time0Row == 1){
               transpose0.activate(4);
             }
             if (time0Row == 2){
               transpose0.activate(5);
             }
         }
         if(time0Col == 2){
           transpose0.activate(6);
         }
        }
        if (instPropRighty == 2){}
      }
    if(instPropUpward == 1){
      if (instPropRighty == 0){}
      if (instPropRighty == 1){}
      if (instPropRighty == 2){}
    }
 }
 void propFuncSel4(){
   if(instPropUpward == 0){
        if (instPropRighty == 0){
          //notes0Row = 0, notes0Col = 0, time0Row = 0, time0Col = 0
           time0 = cp5.addRadioButton("timeRadioButton1");
           time0.setPosition(1100, height/2 + 79);
           time0.setSize(20,20);
           time0.setColorForeground(color(120));
           time0.setColorActive(color(255));
           time0.setColorLabel(color(255));
           time0.setItemsPerRow(3);
           time0.setSpacingColumn(50);
           time0.setSpacingRow(50);
           time0.addItem("1/4",1);
           time0.addItem("1/2",2);
           time0.addItem("1",3);
           time0.addItem("1/8",4);
           time0.addItem("1/16",5);
           time0.addItem("1/32",6);
           time0.addItem("1/64",7);
           ;
           if(time0Col == 0){
             if (time0Row == 0){
               time0.activate(0);
             }
             if (time0Row == 1){
               time0.activate(1);
             }
             if (time0Row == 2){
               time0.activate(2);
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               time0.activate(3);
             }
             if (time0Row == 1){
               time0.activate(4);
             }
             if (time0Row == 2){
               time0.activate(5);
             }
         }
         if(time0Col == 2){
           time0.activate(6);
         }
      }
      if (instPropRighty == 1){
          //notes0Row = 0, notes0Col = 0, time0Row = 0, time0Col = 0
           transpose0 = cp5.addRadioButton("timeRadioButton1");
           transpose0.setPosition(1100, height/2 + 79);
           transpose0.setSize(20,20);
           transpose0.setColorForeground(color(120));
           transpose0.setColorActive(color(255));
           transpose0.setColorLabel(color(255));
           transpose0.setItemsPerRow(3);
           transpose0.setSpacingColumn(50);
           //transpose0.setSpacingRow(50);
           transpose0.setSpacingRow(5);
           transpose0.addItem("0",1);
           transpose0.addItem("1",2);
           transpose0.addItem("2",3);
           transpose0.addItem("3",4);
           transpose0.addItem("4",5);
           transpose0.addItem("-1",2);
           transpose0.addItem("-2",3);
           transpose0.addItem("-3",4);
           transpose0.addItem("-4",5);
           ;
            if(time0Col == 0){
             if (time0Row == 0){
               transpose0.activate(0);
             }
             if (time0Row == 1){
               transpose0.activate(1);
             }
             if (time0Row == 2){
               transpose0.activate(2);
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               transpose0.activate(3);
             }
             if (time0Row == 1){
               transpose0.activate(4);
             }
             if (time0Row == 2){
               transpose0.activate(5);
             }
         }
         if(time0Col == 2){
           transpose0.activate(6);
         }
        }
        if (instPropRighty == 2){}
      }
    if(instPropUpward == 1){
      if (instPropRighty == 0){}
      if (instPropRighty == 1){}
      if (instPropRighty == 2){}
    }
 }
 void propFuncSel5(){
   if(instPropUpward == 0){
        if (instPropRighty == 0){
          //notes0Row = 0, notes0Col = 0, time0Row = 0, time0Col = 0
           time0 = cp5.addRadioButton("timeRadioButton1");
           time0.setPosition(1100, height/2 + 79);
           time0.setSize(20,20);
           time0.setColorForeground(color(120));
           time0.setColorActive(color(255));
           time0.setColorLabel(color(255));
           time0.setItemsPerRow(3);
           time0.setSpacingColumn(50);
           time0.setSpacingRow(50);
           time0.addItem("1/4",1);
           time0.addItem("1/2",2);
           time0.addItem("1",3);
           time0.addItem("1/8",4);
           time0.addItem("1/16",5);
           time0.addItem("1/32",6);
           time0.addItem("1/64",7);
           ;
           if(time0Col == 0){
             if (time0Row == 0){
               time0.activate(0);
             }
             if (time0Row == 1){
               time0.activate(1);
             }
             if (time0Row == 2){
               time0.activate(2);
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               time0.activate(3);
             }
             if (time0Row == 1){
               time0.activate(4);
             }
             if (time0Row == 2){
               time0.activate(5);
             }
         }
         if(time0Col == 2){
           time0.activate(6);
         }
      }
      if (instPropRighty == 1){
          //notes0Row = 0, notes0Col = 0, time0Row = 0, time0Col = 0
           transpose0 = cp5.addRadioButton("timeRadioButton1");
           transpose0.setPosition(1100, height/2 + 79);
           transpose0.setSize(20,20);
           transpose0.setColorForeground(color(120));
           transpose0.setColorActive(color(255));
           transpose0.setColorLabel(color(255));
           transpose0.setItemsPerRow(3);
           transpose0.setSpacingColumn(50);
           //transpose0.setSpacingRow(50);
           transpose0.setSpacingRow(5);
           transpose0.addItem("0",1);
           transpose0.addItem("1",2);
           transpose0.addItem("2",3);
           transpose0.addItem("3",4);
           transpose0.addItem("4",5);
           transpose0.addItem("-1",2);
           transpose0.addItem("-2",3);
           transpose0.addItem("-3",4);
           transpose0.addItem("-4",5);
           ;
            if(time0Col == 0){
             if (time0Row == 0){
               transpose0.activate(0);
             }
             if (time0Row == 1){
               transpose0.activate(1);
             }
             if (time0Row == 2){
               transpose0.activate(2);
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               transpose0.activate(3);
             }
             if (time0Row == 1){
               transpose0.activate(4);
             }
             if (time0Row == 2){
               transpose0.activate(5);
             }
         }
         if(time0Col == 2){
           transpose0.activate(6);
         }
        }
        if (instPropRighty == 2){}
      }
    if(instPropUpward == 1){
      if (instPropRighty == 0){}
      if (instPropRighty == 1){}
      if (instPropRighty == 2){}
    }
 }
 void propFuncSel6(){
   if(instPropUpward == 0){
        if (instPropRighty == 0){
          //notes0Row = 0, notes0Col = 0, time0Row = 0, time0Col = 0
           time0 = cp5.addRadioButton("timeRadioButton1");
           time0.setPosition(1100, height/2 + 79);
           time0.setSize(20,20);
           time0.setColorForeground(color(120));
           time0.setColorActive(color(255));
           time0.setColorLabel(color(255));
           time0.setItemsPerRow(3);
           time0.setSpacingColumn(50);
           time0.setSpacingRow(50);
           time0.addItem("1/4",1);
           time0.addItem("1/2",2);
           time0.addItem("1",3);
           time0.addItem("1/8",4);
           time0.addItem("1/16",5);
           time0.addItem("1/32",6);
           time0.addItem("1/64",7);
           ;
           if(time0Col == 0){
             if (time0Row == 0){
               time0.activate(0);
             }
             if (time0Row == 1){
               time0.activate(1);
             }
             if (time0Row == 2){
               time0.activate(2);
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               time0.activate(3);
             }
             if (time0Row == 1){
               time0.activate(4);
             }
             if (time0Row == 2){
               time0.activate(5);
             }
         }
         if(time0Col == 2){
           time0.activate(6);
         }
      }
      if (instPropRighty == 1){
          //notes0Row = 0, notes0Col = 0, time0Row = 0, time0Col = 0
           transpose0 = cp5.addRadioButton("timeRadioButton1");
           transpose0.setPosition(1100, height/2 + 79);
           transpose0.setSize(20,20);
           transpose0.setColorForeground(color(120));
           transpose0.setColorActive(color(255));
           transpose0.setColorLabel(color(255));
           transpose0.setItemsPerRow(3);
           transpose0.setSpacingColumn(50);
           //transpose0.setSpacingRow(50);
           transpose0.setSpacingRow(5);
           transpose0.addItem("0",1);
           transpose0.addItem("1",2);
           transpose0.addItem("2",3);
           transpose0.addItem("3",4);
           transpose0.addItem("4",5);
           transpose0.addItem("-1",2);
           transpose0.addItem("-2",3);
           transpose0.addItem("-3",4);
           transpose0.addItem("-4",5);
           ;
            if(time0Col == 0){
             if (time0Row == 0){
               transpose0.activate(0);
             }
             if (time0Row == 1){
               transpose0.activate(1);
             }
             if (time0Row == 2){
               transpose0.activate(2);
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               transpose0.activate(3);
             }
             if (time0Row == 1){
               transpose0.activate(4);
             }
             if (time0Row == 2){
               transpose0.activate(5);
             }
         }
         if(time0Col == 2){
           transpose0.activate(6);
         }
        }
        if (instPropRighty == 2){}
      }
    if(instPropUpward == 1){
      if (instPropRighty == 0){}
      if (instPropRighty == 1){}
      if (instPropRighty == 2){}
    }
 }
 void propFuncSel7(){
   if(instPropUpward == 0){
        if (instPropRighty == 0){
          //notes0Row = 0, notes0Col = 0, time0Row = 0, time0Col = 0
           time0 = cp5.addRadioButton("timeRadioButton1");
           time0.setPosition(1100, height/2 + 79);
           time0.setSize(20,20);
           time0.setColorForeground(color(120));
           time0.setColorActive(color(255));
           time0.setColorLabel(color(255));
           time0.setItemsPerRow(3);
           time0.setSpacingColumn(50);
           time0.setSpacingRow(50);
           time0.addItem("1/4",1);
           time0.addItem("1/2",2);
           time0.addItem("1",3);
           time0.addItem("1/8",4);
           time0.addItem("1/16",5);
           time0.addItem("1/32",6);
           time0.addItem("1/64",7);
           ;
           if(time0Col == 0){
             if (time0Row == 0){
               time0.activate(0);
             }
             if (time0Row == 1){
               time0.activate(1);
             }
             if (time0Row == 2){
               time0.activate(2);
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               time0.activate(3);
             }
             if (time0Row == 1){
               time0.activate(4);
             }
             if (time0Row == 2){
               time0.activate(5);
             }
         }
         if(time0Col == 2){
           time0.activate(6);
         }
      }
      if (instPropRighty == 1){
          //notes0Row = 0, notes0Col = 0, time0Row = 0, time0Col = 0
           transpose0 = cp5.addRadioButton("timeRadioButton1");
           transpose0.setPosition(1100, height/2 + 79);
           transpose0.setSize(20,20);
           transpose0.setColorForeground(color(120));
           transpose0.setColorActive(color(255));
           transpose0.setColorLabel(color(255));
           transpose0.setItemsPerRow(3);
           transpose0.setSpacingColumn(50);
           //transpose0.setSpacingRow(50);
           transpose0.setSpacingRow(5);
           transpose0.addItem("0",1);
           transpose0.addItem("1",2);
           transpose0.addItem("2",3);
           transpose0.addItem("3",4);
           transpose0.addItem("4",5);
           transpose0.addItem("-1",2);
           transpose0.addItem("-2",3);
           transpose0.addItem("-3",4);
           transpose0.addItem("-4",5);
           ;
            if(time0Col == 0){
             if (time0Row == 0){
               transpose0.activate(0);
             }
             if (time0Row == 1){
               transpose0.activate(1);
             }
             if (time0Row == 2){
               transpose0.activate(2);
             }
           }
           if(time0Col == 1){
             if (time0Row == 0){
               transpose0.activate(3);
             }
             if (time0Row == 1){
               transpose0.activate(4);
             }
             if (time0Row == 2){
               transpose0.activate(5);
             }
         }
         if(time0Col == 2){
           transpose0.activate(6);
         }
        }
        if (instPropRighty == 2){}
      }
    if(instPropUpward == 1){
      if (instPropRighty == 0){}
      if (instPropRighty == 1){}
      if (instPropRighty == 2){}
    }
 }
 
 void propFunction0(){
             if(instPropUpward == 0){
                if(instPropRighty == 0){
                  cp5.get(controlP5.Button.class, "WAVE" + 0).setColorBackground( color(#F1C67A) );
                  cp5.get(controlP5.Button.class, "GAIN" + 0).setColorBackground( color(0, 250, 0) );
                  cp5.get(controlP5.Button.class, "TRANSPOSE" + 0).setColorBackground( color(#F1C67A) );
                }
                if(instPropRighty == 1){
                  cp5.get(controlP5.Button.class, "DELETE" + 0).setColorBackground( color(#F1C67A) );
                  cp5.get(controlP5.Button.class, "GAIN" + 0).setColorBackground( color(#F1C67A) );
                  cp5.get(controlP5.Button.class, "EFFECTS" + 0).setColorBackground( color(#F1C67A) );
                  cp5.get(controlP5.Button.class, "TRANSPOSE" + 0).setColorBackground( color(0, 250, 0) );
                }
                if(instPropRighty == 2){
                  cp5.get(controlP5.Button.class, "PAN" + 0).setColorBackground( color(#F1C67A) );
                  cp5.get(controlP5.Button.class, "TRANSPOSE" + 0).setColorBackground( color(#F1C67A) );
                  cp5.get(controlP5.Button.class, "EFFECTS" + 0).setColorBackground( color(0, 250, 0) );
                }
              }
              if(instPropUpward == 1){
                cp5.get(controlP5.Button.class, "GAIN" + 0).setColorBackground( color(#F1C67A) );
                cp5.get(controlP5.Button.class, "TRANSPOSE" + 0).setColorBackground( color(#F1C67A) );
                cp5.get(controlP5.Button.class, "EFFECTS" + 0).setColorBackground( color(#F1C67A) );
                if(instPropRighty == 0){
                cp5.get(controlP5.Button.class, "DELETE" + 0).setColorBackground( color(#F1C67A) ); 
                  cp5.get(controlP5.Button.class, "WAVE" + 0).setColorBackground( color(0, 250, 0) );
                }
                if(instPropRighty == 1){
                  cp5.get(controlP5.Button.class, "WAVE" + 0).setColorBackground( color(#F1C67A) );
                  cp5.get(controlP5.Button.class, "PAN" + 0).setColorBackground( color(#F1C67A) );
                  cp5.get(controlP5.Button.class, "DELETE" + 0).setColorBackground( color(0, 250, 0) );
                }
                if(instPropRighty == 2){
                  cp5.get(controlP5.Button.class, "DELETE" + 0).setColorBackground( color(#F1C67A) );
                  cp5.get(controlP5.Button.class, "PAN" + 0).setColorBackground( color(0, 250, 0) );
                }
              }
  }
  

 
 void property0(){
        cp5.get(controlP5.Button.class, "A" + 1 + "p").setColorBackground( color(#FFFFFF) );
        cp5.get(controlP5.Button.class, "B" + 1 + "p").setColorBackground( color(#FFFFFF) );
        cp5.get(controlP5.Button.class, "C" + 1 + "p").setColorBackground( color(#FFFFFF) );
        cp5.get(controlP5.Button.class, "D" + 1 + "p").setColorBackground( color(#FFFFFF) );
        cp5.get(controlP5.Button.class, "E" + 1 + "p").setColorBackground( color(#FFFFFF) );
        cp5.get(controlP5.Button.class, "F" + 1 + "p").setColorBackground( color(#FFFFFF) );
        cp5.get(controlP5.Button.class, "G" + 1 + "p").setColorBackground( color(#FFFFFF) );
        cp5.get(controlP5.Button.class, "H" + 1 + "p").setColorBackground( color(#FFFFFF) );
        if(propRighty == 0){
          cp5.get(controlP5.Button.class, "A" + 0 + "p").setColorBackground( color(0, 250, 0) );
          cp5.get(controlP5.Button.class, "B" + 0 + "p").setColorBackground( color(#FFFFFF) );
          cp5.get(controlP5.Button.class, "C" + 0 + "p").setColorBackground( color(#FFFFFF) );
          cp5.get(controlP5.Button.class, "D" + 0 + "p").setColorBackground( color(#FFFFFF) );
          cp5.get(controlP5.Button.class, "E" + 0 + "p").setColorBackground( color(#FFFFFF) );
          cp5.get(controlP5.Button.class, "F" + 0 + "p").setColorBackground( color(#FFFFFF) );
          cp5.get(controlP5.Button.class, "G" + 0 + "p").setColorBackground( color(#FFFFFF) );
          cp5.get(controlP5.Button.class, "H" + 0 + "p").setColorBackground( color(#FFFFFF) );
          //print("\n");
          //print("google1");
          //print("\n");
        }  
        if(propRighty == 1){
        cp5.get(controlP5.Button.class, "A" + 0 + "p").setColorBackground( color(#FFFFFF) );
        cp5.get(controlP5.Button.class, "B" + 0 + "p").setColorBackground( color(0, 250, 0) );
        cp5.get(controlP5.Button.class, "C" + 0 + "p").setColorBackground( color(#FFFFFF) );
        cp5.get(controlP5.Button.class, "D" + 0 + "p").setColorBackground( color(#FFFFFF) );
        cp5.get(controlP5.Button.class, "E" + 0 + "p").setColorBackground( color(#FFFFFF) );
        cp5.get(controlP5.Button.class, "F" + 0 + "p").setColorBackground( color(#FFFFFF) );
        cp5.get(controlP5.Button.class, "G" + 0 + "p").setColorBackground( color(#FFFFFF) );
        cp5.get(controlP5.Button.class, "H" + 0 + "p").setColorBackground( color(#FFFFFF) );
        }  
        if(propRighty == 2){
        cp5.get(controlP5.Button.class, "A" + 0 + "p").setColorBackground( color(#FFFFFF) );
        cp5.get(controlP5.Button.class, "B" + 0 + "p").setColorBackground( color(#FFFFFF) );
        cp5.get(controlP5.Button.class, "C" + 0 + "p").setColorBackground( color(0, 250, 0) );
        cp5.get(controlP5.Button.class, "D" + 0 + "p").setColorBackground( color(#FFFFFF) );
        cp5.get(controlP5.Button.class, "E" + 0 + "p").setColorBackground( color(#FFFFFF) );
        cp5.get(controlP5.Button.class, "F" + 0 + "p").setColorBackground( color(#FFFFFF) );
        cp5.get(controlP5.Button.class, "G" + 0 + "p").setColorBackground( color(#FFFFFF) );
        cp5.get(controlP5.Button.class, "H" + 0 + "p").setColorBackground( color(#FFFFFF) );
        }  
        if(propRighty == 3){
        cp5.get(controlP5.Button.class, "A" + 0 + "p").setColorBackground( color(#FFFFFF) );
        cp5.get(controlP5.Button.class, "B" + 0 + "p").setColorBackground( color(#FFFFFF) );
        cp5.get(controlP5.Button.class, "C" + 0 + "p").setColorBackground( color(#FFFFFF) );
        cp5.get(controlP5.Button.class, "D" + 0 + "p").setColorBackground( color(0, 250, 0) );
        cp5.get(controlP5.Button.class, "E" + 0 + "p").setColorBackground( color(#FFFFFF) );
        cp5.get(controlP5.Button.class, "F" + 0 + "p").setColorBackground( color(#FFFFFF) );
        cp5.get(controlP5.Button.class, "G" + 0 + "p").setColorBackground( color(#FFFFFF) );
        cp5.get(controlP5.Button.class, "H" + 0 + "p").setColorBackground( color(#FFFFFF) );
        }  
        if(propRighty == 4){
        cp5.get(controlP5.Button.class, "A" + 0 + "p").setColorBackground( color(#FFFFFF) );
        cp5.get(controlP5.Button.class, "B" + 0 + "p").setColorBackground( color(#FFFFFF) );
        cp5.get(controlP5.Button.class, "C" + 0 + "p").setColorBackground( color(#FFFFFF) );
        cp5.get(controlP5.Button.class, "D" + 0 + "p").setColorBackground( color(#FFFFFF) );
        cp5.get(controlP5.Button.class, "E" + 0 + "p").setColorBackground( color(0, 250, 0) );
        cp5.get(controlP5.Button.class, "F" + 0 + "p").setColorBackground( color(#FFFFFF) );
        cp5.get(controlP5.Button.class, "G" + 0 + "p").setColorBackground( color(#FFFFFF) );
        cp5.get(controlP5.Button.class, "H" + 0 + "p").setColorBackground( color(#FFFFFF) );
        }  
        if(propRighty == 5){
        cp5.get(controlP5.Button.class, "A" + 0 + "p").setColorBackground( color(#FFFFFF) );
        cp5.get(controlP5.Button.class, "B" + 0 + "p").setColorBackground( color(#FFFFFF) );
        cp5.get(controlP5.Button.class, "C" + 0 + "p").setColorBackground( color(#FFFFFF) );
        cp5.get(controlP5.Button.class, "D" + 0 + "p").setColorBackground( color(#FFFFFF) );
        cp5.get(controlP5.Button.class, "E" + 0 + "p").setColorBackground( color(#FFFFFF) );
        cp5.get(controlP5.Button.class, "F" + 0 + "p").setColorBackground( color(0, 250, 0) );
        cp5.get(controlP5.Button.class, "G" + 0 + "p").setColorBackground( color(#FFFFFF) );
        cp5.get(controlP5.Button.class, "H" + 0 + "p").setColorBackground( color(#FFFFFF) );
        }  
        if(propRighty == 6){
        cp5.get(controlP5.Button.class, "A" + 0 + "p").setColorBackground( color(#FFFFFF) );
        cp5.get(controlP5.Button.class, "B" + 0 + "p").setColorBackground( color(#FFFFFF) );
        cp5.get(controlP5.Button.class, "C" + 0 + "p").setColorBackground( color(#FFFFFF) );
        cp5.get(controlP5.Button.class, "D" + 0 + "p").setColorBackground( color(#FFFFFF) );
        cp5.get(controlP5.Button.class, "E" + 0 + "p").setColorBackground( color(#FFFFFF) );
        cp5.get(controlP5.Button.class, "F" + 0 + "p").setColorBackground( color(#FFFFFF) );
        cp5.get(controlP5.Button.class, "G" + 0 + "p").setColorBackground( color(0, 250, 0) );
        cp5.get(controlP5.Button.class, "H" + 0 + "p").setColorBackground( color(#FFFFFF) );
        }  
        if(propRighty == 7){
        cp5.get(controlP5.Button.class, "A" + 0 + "p").setColorBackground( color(#FFFFFF) );
        cp5.get(controlP5.Button.class, "B" + 0 + "p").setColorBackground( color(#FFFFFF) );
        cp5.get(controlP5.Button.class, "C" + 0 + "p").setColorBackground( color(#FFFFFF) );
        cp5.get(controlP5.Button.class, "D" + 0 + "p").setColorBackground( color(#FFFFFF) );
        cp5.get(controlP5.Button.class, "E" + 0 + "p").setColorBackground( color(#FFFFFF) );
        cp5.get(controlP5.Button.class, "F" + 0 + "p").setColorBackground( color(#FFFFFF) );
        cp5.get(controlP5.Button.class, "G" + 0 + "p").setColorBackground( color(#FFFFFF) );
        cp5.get(controlP5.Button.class, "H" + 0 + "p").setColorBackground( color(0, 250, 0) );
      }
 }
 void property1(){
   cp5.get(controlP5.Button.class, "A" + 0 + "p").setColorBackground( color(#FFFFFF) );
    cp5.get(controlP5.Button.class, "B" + 0 + "p").setColorBackground( color(#FFFFFF) );
    cp5.get(controlP5.Button.class, "C" + 0 + "p").setColorBackground( color(#FFFFFF) );
    cp5.get(controlP5.Button.class, "D" + 0 + "p").setColorBackground( color(#FFFFFF) );
    cp5.get(controlP5.Button.class, "E" + 0 + "p").setColorBackground( color(#FFFFFF) );
    cp5.get(controlP5.Button.class, "F" + 0 + "p").setColorBackground( color(#FFFFFF) );
    cp5.get(controlP5.Button.class, "G" + 0 + "p").setColorBackground( color(#FFFFFF) );
    cp5.get(controlP5.Button.class, "H" + 0 + "p").setColorBackground( color(#FFFFFF) );
    
    cp5.get(controlP5.Button.class, "A" + 2 + "p").setColorBackground( color(#FFFFFF) );
    cp5.get(controlP5.Button.class, "B" + 2 + "p").setColorBackground( color(#FFFFFF) );
    cp5.get(controlP5.Button.class, "C" + 2 + "p").setColorBackground( color(#FFFFFF) );
    cp5.get(controlP5.Button.class, "D" + 2 + "p").setColorBackground( color(#FFFFFF) );
    cp5.get(controlP5.Button.class, "E" + 2 + "p").setColorBackground( color(#FFFFFF) );
    cp5.get(controlP5.Button.class, "F" + 2 + "p").setColorBackground( color(#FFFFFF) );
    cp5.get(controlP5.Button.class, "G" + 2 + "p").setColorBackground( color(#FFFFFF) );
    cp5.get(controlP5.Button.class, "H" + 2 + "p").setColorBackground( color(#FFFFFF) );
      if(propRighty == 0){
        print("\n");
        print("propHighlightaaLevel = 0");
        print("\n");
        cp5.get(controlP5.Button.class, "A" + 1 + "p").setColorBackground( color(0, 250, 0) );
        cp5.get(controlP5.Button.class, "B" + 1 + "p").setColorBackground( color(#FFFFFF) );
        cp5.get(controlP5.Button.class, "C" + 1 + "p").setColorBackground( color(#FFFFFF) );
        cp5.get(controlP5.Button.class, "D" + 1 + "p").setColorBackground( color(#FFFFFF) );
        cp5.get(controlP5.Button.class, "E" + 1 + "p").setColorBackground( color(#FFFFFF) );
        cp5.get(controlP5.Button.class, "F" + 1 + "p").setColorBackground( color(#FFFFFF) );
        cp5.get(controlP5.Button.class, "G" + 1 + "p").setColorBackground( color(#FFFFFF) );
        cp5.get(controlP5.Button.class, "H" + 1 + "p").setColorBackground( color(#FFFFFF) );
      }  
      if(propRighty == 1){
        print("\n");
        print("propHighlightaaLevel = 1");
        print("\n");
      cp5.get(controlP5.Button.class, "A" + 1 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "B" + 1 + "p").setColorBackground( color(0, 250, 0) );
      cp5.get(controlP5.Button.class, "C" + 1 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "D" + 1 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "E" + 1 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "F" + 1 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "G" + 1 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "H" + 1 + "p").setColorBackground( color(#FFFFFF) );
      }  
      if(propRighty == 2){
      cp5.get(controlP5.Button.class, "A" + 1 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "B" + 1 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "C" + 1 + "p").setColorBackground( color(0, 250, 0) );
      cp5.get(controlP5.Button.class, "D" + 1 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "E" + 1 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "F" + 1 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "G" + 1 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "H" + 1 + "p").setColorBackground( color(#FFFFFF) );
      }  
      if(propRighty == 3){
      cp5.get(controlP5.Button.class, "A" + 1 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "B" + 1 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "C" + 1 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "D" + 1 + "p").setColorBackground( color(0, 250, 0) );
      cp5.get(controlP5.Button.class, "E" + 1 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "F" + 1 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "G" + 1 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "H" + 1 + "p").setColorBackground( color(#FFFFFF) );
      }  
      if(propRighty == 4){
      cp5.get(controlP5.Button.class, "A" + 1 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "B" + 1 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "C" + 1 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "D" + 1 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "E" + 1 + "p").setColorBackground( color(0, 250, 0) );
      cp5.get(controlP5.Button.class, "F" + 1 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "G" + 1 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "H" + 1 + "p").setColorBackground( color(#FFFFFF) );
      }  
      if(propRighty == 5){
      cp5.get(controlP5.Button.class, "A" + 1 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "B" + 1 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "C" + 1 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "D" + 1 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "E" + 1 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "F" + 1 + "p").setColorBackground( color(0, 250, 0) );
      cp5.get(controlP5.Button.class, "G" + 1 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "H" + 1 + "p").setColorBackground( color(#FFFFFF) );
      }  
      if(propRighty == 6){
      cp5.get(controlP5.Button.class, "A" + 1 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "B" + 1 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "C" + 1 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "D" + 1 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "E" + 1 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "F" + 1 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "G" + 1 + "p").setColorBackground( color(0, 250, 0) );
      cp5.get(controlP5.Button.class, "H" + 1 + "p").setColorBackground( color(#FFFFFF) );
      }  
      if(propRighty == 7){
      cp5.get(controlP5.Button.class, "A" + 1 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "B" + 1 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "C" + 1 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "D" + 1 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "E" + 1 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "F" + 1 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "G" + 1 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "H" + 1 + "p").setColorBackground( color(0, 250, 0) );
      }
 }
 void property2(){
    cp5.get(controlP5.Button.class, "A" + 1 + "p").setColorBackground( color(#FFFFFF) );
    cp5.get(controlP5.Button.class, "B" + 1 + "p").setColorBackground( color(#FFFFFF) );
    cp5.get(controlP5.Button.class, "C" + 1 + "p").setColorBackground( color(#FFFFFF) );
    cp5.get(controlP5.Button.class, "D" + 1 + "p").setColorBackground( color(#FFFFFF) );
    cp5.get(controlP5.Button.class, "E" + 1 + "p").setColorBackground( color(#FFFFFF) );
    cp5.get(controlP5.Button.class, "F" + 1 + "p").setColorBackground( color(#FFFFFF) );
    cp5.get(controlP5.Button.class, "G" + 1 + "p").setColorBackground( color(#FFFFFF) );
    cp5.get(controlP5.Button.class, "H" + 1 + "p").setColorBackground( color(#FFFFFF) );
    
    cp5.get(controlP5.Button.class, "A" + 3 + "p").setColorBackground( color(#FFFFFF) );
    cp5.get(controlP5.Button.class, "B" + 3 + "p").setColorBackground( color(#FFFFFF) );
    cp5.get(controlP5.Button.class, "C" + 3 + "p").setColorBackground( color(#FFFFFF) );
    cp5.get(controlP5.Button.class, "D" + 3 + "p").setColorBackground( color(#FFFFFF) );
    cp5.get(controlP5.Button.class, "E" + 3 + "p").setColorBackground( color(#FFFFFF) );
    cp5.get(controlP5.Button.class, "F" + 3 + "p").setColorBackground( color(#FFFFFF) );
    cp5.get(controlP5.Button.class, "G" + 3 + "p").setColorBackground( color(#FFFFFF) );
    cp5.get(controlP5.Button.class, "H" + 3 + "p").setColorBackground( color(#FFFFFF) );
      if(propRighty == 0){
        //print("propHighlightaa == 2");
        cp5.get(controlP5.Button.class, "A" + 2 + "p").setColorBackground( color(0, 250, 0) );
        cp5.get(controlP5.Button.class, "B" + 2 + "p").setColorBackground( color(#FFFFFF) );
        cp5.get(controlP5.Button.class, "C" + 2 + "p").setColorBackground( color(#FFFFFF) );
        cp5.get(controlP5.Button.class, "D" + 2 + "p").setColorBackground( color(#FFFFFF) );
        cp5.get(controlP5.Button.class, "E" + 2 + "p").setColorBackground( color(#FFFFFF) );
        cp5.get(controlP5.Button.class, "F" + 2 + "p").setColorBackground( color(#FFFFFF) );
        cp5.get(controlP5.Button.class, "G" + 2 + "p").setColorBackground( color(#FFFFFF) );
        cp5.get(controlP5.Button.class, "H" + 2 + "p").setColorBackground( color(#FFFFFF) );
      }  
      if(propRighty == 1){
      cp5.get(controlP5.Button.class, "A" + 2 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "B" + 2 + "p").setColorBackground( color(0, 250, 0) );
      cp5.get(controlP5.Button.class, "C" + 2 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "D" + 2 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "E" + 2 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "F" + 2 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "G" + 2 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "H" + 2 + "p").setColorBackground( color(#FFFFFF) );
      }  
      if(propRighty == 2){
      cp5.get(controlP5.Button.class, "A" + 2 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "B" + 2 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "C" + 2 + "p").setColorBackground( color(0, 250, 0) );
      cp5.get(controlP5.Button.class, "D" + 2 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "E" + 2 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "F" + 2 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "G" + 2 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "H" + 2 + "p").setColorBackground( color(#FFFFFF) );
      }  
      if(propRighty == 3){
      cp5.get(controlP5.Button.class, "A" + 2 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "B" + 2 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "C" + 2 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "D" + 2 + "p").setColorBackground( color(0, 250, 0) );
      cp5.get(controlP5.Button.class, "E" + 2 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "F" + 2 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "G" + 2 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "H" + 2 + "p").setColorBackground( color(#FFFFFF) );
      }  
      if(propRighty == 4){
      cp5.get(controlP5.Button.class, "A" + 2 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "B" + 2 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "C" + 2 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "D" + 2 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "E" + 2 + "p").setColorBackground( color(0, 250, 0) );
      cp5.get(controlP5.Button.class, "F" + 2 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "G" + 2 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "H" + 2 + "p").setColorBackground( color(#FFFFFF) );
      }  
      if(propRighty == 5){
      cp5.get(controlP5.Button.class, "A" + 2 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "B" + 2 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "C" + 2 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "D" + 2 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "E" + 2 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "F" + 2 + "p").setColorBackground( color(0, 250, 0) );
      cp5.get(controlP5.Button.class, "G" + 2 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "H" + 2 + "p").setColorBackground( color(#FFFFFF) );
      }  
      if(propRighty == 6){
      cp5.get(controlP5.Button.class, "A" + 2 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "B" + 2 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "C" + 2 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "D" + 2 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "E" + 2 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "F" + 2 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "G" + 2 + "p").setColorBackground( color(0, 250, 0) );
      cp5.get(controlP5.Button.class, "H" + 2 + "p").setColorBackground( color(#FFFFFF) );
      }  
      if(propRighty == 7){
      cp5.get(controlP5.Button.class, "A" + 2 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "B" + 2 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "C" + 2 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "D" + 2 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "E" + 2 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "F" + 2 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "G" + 2 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "H" + 2 + "p").setColorBackground( color(0, 250, 0) );
      }
 }
 void property3(){
    cp5.get(controlP5.Button.class, "A" + 2 + "p").setColorBackground( color(#FFFFFF) );
    cp5.get(controlP5.Button.class, "B" + 2 + "p").setColorBackground( color(#FFFFFF) );
    cp5.get(controlP5.Button.class, "C" + 2 + "p").setColorBackground( color(#FFFFFF) );
    cp5.get(controlP5.Button.class, "D" + 2 + "p").setColorBackground( color(#FFFFFF) );
    cp5.get(controlP5.Button.class, "E" + 2 + "p").setColorBackground( color(#FFFFFF) );
    cp5.get(controlP5.Button.class, "F" + 2 + "p").setColorBackground( color(#FFFFFF) );
    cp5.get(controlP5.Button.class, "G" + 2 + "p").setColorBackground( color(#FFFFFF) );
    cp5.get(controlP5.Button.class, "H" + 2 + "p").setColorBackground( color(#FFFFFF) );
    
    cp5.get(controlP5.Button.class, "A" + 4 + "p").setColorBackground( color(#FFFFFF) );
    cp5.get(controlP5.Button.class, "B" + 4 + "p").setColorBackground( color(#FFFFFF) );
    cp5.get(controlP5.Button.class, "C" + 4 + "p").setColorBackground( color(#FFFFFF) );
    cp5.get(controlP5.Button.class, "D" + 4 + "p").setColorBackground( color(#FFFFFF) );
    cp5.get(controlP5.Button.class, "E" + 4 + "p").setColorBackground( color(#FFFFFF) );
    cp5.get(controlP5.Button.class, "F" + 4 + "p").setColorBackground( color(#FFFFFF) );
    cp5.get(controlP5.Button.class, "G" + 4 + "p").setColorBackground( color(#FFFFFF) );
    cp5.get(controlP5.Button.class, "H" + 4 + "p").setColorBackground( color(#FFFFFF) );
      if(propRighty == 0){
        //print("propHighlightaa == 2");
        cp5.get(controlP5.Button.class, "A" + 3 + "p").setColorBackground( color(0, 250, 0) );
        cp5.get(controlP5.Button.class, "B" + 3 + "p").setColorBackground( color(#FFFFFF) );
        cp5.get(controlP5.Button.class, "C" + 3 + "p").setColorBackground( color(#FFFFFF) );
        cp5.get(controlP5.Button.class, "D" + 3 + "p").setColorBackground( color(#FFFFFF) );
        cp5.get(controlP5.Button.class, "E" + 3 + "p").setColorBackground( color(#FFFFFF) );
        cp5.get(controlP5.Button.class, "F" + 3 + "p").setColorBackground( color(#FFFFFF) );
        cp5.get(controlP5.Button.class, "G" + 3 + "p").setColorBackground( color(#FFFFFF) );
        cp5.get(controlP5.Button.class, "H" + 3 + "p").setColorBackground( color(#FFFFFF) );
      }  
      if(propRighty == 1){
      cp5.get(controlP5.Button.class, "A" + 3 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "B" + 3 + "p").setColorBackground( color(0, 250, 0) );
      cp5.get(controlP5.Button.class, "C" + 3 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "D" + 3 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "E" + 3 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "F" + 3 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "G" + 3 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "H" + 3 + "p").setColorBackground( color(#FFFFFF) );
      }  
      if(propRighty == 2){
      cp5.get(controlP5.Button.class, "A" + 3 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "B" + 3 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "C" + 3 + "p").setColorBackground( color(0, 250, 0) );
      cp5.get(controlP5.Button.class, "D" + 3 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "E" + 3 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "F" + 3 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "G" + 3 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "H" + 3 + "p").setColorBackground( color(#FFFFFF) );
      }  
      if(propRighty == 3){
      cp5.get(controlP5.Button.class, "A" + 3 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "B" + 3 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "C" + 3 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "D" + 3 + "p").setColorBackground( color(0, 250, 0) );
      cp5.get(controlP5.Button.class, "E" + 3 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "F" + 3 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "G" + 3 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "H" + 3 + "p").setColorBackground( color(#FFFFFF) );
      }  
      if(propRighty == 4){
      cp5.get(controlP5.Button.class, "A" + 3 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "B" + 3 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "C" + 3 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "D" + 3 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "E" + 3 + "p").setColorBackground( color(0, 250, 0) );
      cp5.get(controlP5.Button.class, "F" + 3 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "G" + 3 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "H" + 3 + "p").setColorBackground( color(#FFFFFF) );
      }  
      if(propRighty == 5){
      cp5.get(controlP5.Button.class, "A" + 3 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "B" + 3 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "C" + 3 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "D" + 3 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "E" + 3 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "F" + 3 + "p").setColorBackground( color(0, 250, 0) );
      cp5.get(controlP5.Button.class, "G" + 3 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "H" + 3 + "p").setColorBackground( color(#FFFFFF) );
      }  
      if(propRighty == 6){
      cp5.get(controlP5.Button.class, "A" + 3 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "B" + 3 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "C" + 3 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "D" + 3 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "E" + 3 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "F" + 3 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "G" + 3 + "p").setColorBackground( color(0, 250, 0) );
      cp5.get(controlP5.Button.class, "H" + 3 + "p").setColorBackground( color(#FFFFFF) );
      }  
      if(propRighty == 7){
      cp5.get(controlP5.Button.class, "A" + 3 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "B" + 3 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "C" + 3 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "D" + 3 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "E" + 3 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "F" + 3 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "G" + 3 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "H" + 3 + "p").setColorBackground( color(0, 250, 0) );
      }
 }
 void property4(){
    cp5.get(controlP5.Button.class, "A" + 3 + "p").setColorBackground( color(#FFFFFF) );
    cp5.get(controlP5.Button.class, "B" + 3 + "p").setColorBackground( color(#FFFFFF) );
    cp5.get(controlP5.Button.class, "C" + 3 + "p").setColorBackground( color(#FFFFFF) );
    cp5.get(controlP5.Button.class, "D" + 3 + "p").setColorBackground( color(#FFFFFF) );
    cp5.get(controlP5.Button.class, "E" + 3 + "p").setColorBackground( color(#FFFFFF) );
    cp5.get(controlP5.Button.class, "F" + 3 + "p").setColorBackground( color(#FFFFFF) );
    cp5.get(controlP5.Button.class, "G" + 3 + "p").setColorBackground( color(#FFFFFF) );
    cp5.get(controlP5.Button.class, "H" + 3 + "p").setColorBackground( color(#FFFFFF) );
    
    cp5.get(controlP5.Button.class, "A" + 5 + "p").setColorBackground( color(#FFFFFF) );
    cp5.get(controlP5.Button.class, "B" + 5 + "p").setColorBackground( color(#FFFFFF) );
    cp5.get(controlP5.Button.class, "C" + 5 + "p").setColorBackground( color(#FFFFFF) );
    cp5.get(controlP5.Button.class, "D" + 5 + "p").setColorBackground( color(#FFFFFF) );
    cp5.get(controlP5.Button.class, "E" + 5 + "p").setColorBackground( color(#FFFFFF) );
    cp5.get(controlP5.Button.class, "F" + 5 + "p").setColorBackground( color(#FFFFFF) );
    cp5.get(controlP5.Button.class, "G" + 5 + "p").setColorBackground( color(#FFFFFF) );
    cp5.get(controlP5.Button.class, "H" + 5 + "p").setColorBackground( color(#FFFFFF) );
      if(propRighty == 0){
        //print("propHighlightaa == 2");
        cp5.get(controlP5.Button.class, "A" + 4 + "p").setColorBackground( color(0, 250, 0) );
        cp5.get(controlP5.Button.class, "B" + 4 + "p").setColorBackground( color(#FFFFFF) );
        cp5.get(controlP5.Button.class, "C" + 4 + "p").setColorBackground( color(#FFFFFF) );
        cp5.get(controlP5.Button.class, "D" + 4 + "p").setColorBackground( color(#FFFFFF) );
        cp5.get(controlP5.Button.class, "E" + 4 + "p").setColorBackground( color(#FFFFFF) );
        cp5.get(controlP5.Button.class, "F" + 4 + "p").setColorBackground( color(#FFFFFF) );
        cp5.get(controlP5.Button.class, "G" + 4 + "p").setColorBackground( color(#FFFFFF) );
        cp5.get(controlP5.Button.class, "H" + 4 + "p").setColorBackground( color(#FFFFFF) );
      }  
      if(propRighty == 1){
      cp5.get(controlP5.Button.class, "A" + 4 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "B" + 4 + "p").setColorBackground( color(0, 250, 0) );
      cp5.get(controlP5.Button.class, "C" + 4 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "D" + 4 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "E" + 4 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "F" + 4 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "G" + 4 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "H" + 4 + "p").setColorBackground( color(#FFFFFF) );
      }  
      if(propRighty == 2){
      cp5.get(controlP5.Button.class, "A" + 4 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "B" + 4 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "C" + 4 + "p").setColorBackground( color(0, 250, 0) );
      cp5.get(controlP5.Button.class, "D" + 4 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "E" + 4 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "F" + 4 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "G" + 4 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "H" + 4 + "p").setColorBackground( color(#FFFFFF) );
      }  
      if(propRighty == 3){
      cp5.get(controlP5.Button.class, "A" + 4 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "B" + 4 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "C" + 4 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "D" + 4 + "p").setColorBackground( color(0, 250, 0) );
      cp5.get(controlP5.Button.class, "E" + 4 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "F" + 4 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "G" + 4 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "H" + 4 + "p").setColorBackground( color(#FFFFFF) );
      }  
      if(propRighty == 4){
      cp5.get(controlP5.Button.class, "A" + 4 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "B" + 4 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "C" + 4 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "D" + 4 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "E" + 4 + "p").setColorBackground( color(0, 250, 0) );
      cp5.get(controlP5.Button.class, "F" + 4 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "G" + 4 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "H" + 4 + "p").setColorBackground( color(#FFFFFF) );
      }  
      if(propRighty == 5){
      cp5.get(controlP5.Button.class, "A" + 4 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "B" + 4 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "C" + 4 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "D" + 4 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "E" + 4 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "F" + 4 + "p").setColorBackground( color(0, 250, 0) );
      cp5.get(controlP5.Button.class, "G" + 4 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "H" + 4 + "p").setColorBackground( color(#FFFFFF) );
      }  
      if(propRighty == 6){
      cp5.get(controlP5.Button.class, "A" + 4 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "B" + 4 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "C" + 4 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "D" + 4 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "E" + 4 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "F" + 4 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "G" + 4 + "p").setColorBackground( color(0, 250, 0) );
      cp5.get(controlP5.Button.class, "H" + 4 + "p").setColorBackground( color(#FFFFFF) );
      }  
      if(propRighty == 7){
      cp5.get(controlP5.Button.class, "A" + 4 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "B" + 4 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "C" + 4 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "D" + 4 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "E" + 4 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "F" + 4 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "G" + 4 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "H" + 4 + "p").setColorBackground( color(0, 250, 0) );
      }
 }
 void property5(){
    cp5.get(controlP5.Button.class, "A" + 4 + "p").setColorBackground( color(#FFFFFF) );
    cp5.get(controlP5.Button.class, "B" + 4 + "p").setColorBackground( color(#FFFFFF) );
    cp5.get(controlP5.Button.class, "C" + 4 + "p").setColorBackground( color(#FFFFFF) );
    cp5.get(controlP5.Button.class, "D" + 4 + "p").setColorBackground( color(#FFFFFF) );
    cp5.get(controlP5.Button.class, "E" + 4 + "p").setColorBackground( color(#FFFFFF) );
    cp5.get(controlP5.Button.class, "F" + 4 + "p").setColorBackground( color(#FFFFFF) );
    cp5.get(controlP5.Button.class, "G" + 4 + "p").setColorBackground( color(#FFFFFF) );
    cp5.get(controlP5.Button.class, "H" + 4 + "p").setColorBackground( color(#FFFFFF) );
    
    cp5.get(controlP5.Button.class, "A" + 6 + "p").setColorBackground( color(#FFFFFF) );
    cp5.get(controlP5.Button.class, "B" + 6 + "p").setColorBackground( color(#FFFFFF) );
    cp5.get(controlP5.Button.class, "C" + 6 + "p").setColorBackground( color(#FFFFFF) );
    cp5.get(controlP5.Button.class, "D" + 6 + "p").setColorBackground( color(#FFFFFF) );
    cp5.get(controlP5.Button.class, "E" + 6 + "p").setColorBackground( color(#FFFFFF) );
    cp5.get(controlP5.Button.class, "F" + 6 + "p").setColorBackground( color(#FFFFFF) );
    cp5.get(controlP5.Button.class, "G" + 6 + "p").setColorBackground( color(#FFFFFF) );
    cp5.get(controlP5.Button.class, "H" + 6 + "p").setColorBackground( color(#FFFFFF) );
      if(propRighty == 0){
        //print("propHighlightaa == 2");
        cp5.get(controlP5.Button.class, "A" + 5 + "p").setColorBackground( color(0, 250, 0) );
        cp5.get(controlP5.Button.class, "B" + 5 + "p").setColorBackground( color(#FFFFFF) );
        cp5.get(controlP5.Button.class, "C" + 5 + "p").setColorBackground( color(#FFFFFF) );
        cp5.get(controlP5.Button.class, "D" + 5 + "p").setColorBackground( color(#FFFFFF) );
        cp5.get(controlP5.Button.class, "E" + 5 + "p").setColorBackground( color(#FFFFFF) );
        cp5.get(controlP5.Button.class, "F" + 5 + "p").setColorBackground( color(#FFFFFF) );
        cp5.get(controlP5.Button.class, "G" + 5 + "p").setColorBackground( color(#FFFFFF) );
        cp5.get(controlP5.Button.class, "H" + 5 + "p").setColorBackground( color(#FFFFFF) );
      }  
      if(propRighty == 1){
      cp5.get(controlP5.Button.class, "A" + 5 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "B" + 5 + "p").setColorBackground( color(0, 250, 0) );
      cp5.get(controlP5.Button.class, "C" + 5 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "D" + 5 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "E" + 5 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "F" + 5 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "G" + 5 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "H" + 5 + "p").setColorBackground( color(#FFFFFF) );
      }  
      if(propRighty == 2){
      cp5.get(controlP5.Button.class, "A" + 5 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "B" + 5 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "C" + 5 + "p").setColorBackground( color(0, 250, 0) );
      cp5.get(controlP5.Button.class, "D" + 5 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "E" + 5 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "F" + 5 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "G" + 5 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "H" + 5 + "p").setColorBackground( color(#FFFFFF) );
      }  
      if(propRighty == 3){
      cp5.get(controlP5.Button.class, "A" + 5 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "B" + 5 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "C" + 5 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "D" + 5 + "p").setColorBackground( color(0, 250, 0) );
      cp5.get(controlP5.Button.class, "E" + 5 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "F" + 5 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "G" + 5 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "H" + 5 + "p").setColorBackground( color(#FFFFFF) );
      }  
      if(propRighty == 4){
      cp5.get(controlP5.Button.class, "A" + 5 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "B" + 5 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "C" + 5 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "D" + 5 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "E" + 5 + "p").setColorBackground( color(0, 250, 0) );
      cp5.get(controlP5.Button.class, "F" + 5 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "G" + 5 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "H" + 5 + "p").setColorBackground( color(#FFFFFF) );
      }  
      if(propRighty == 5){
      cp5.get(controlP5.Button.class, "A" + 5 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "B" + 5 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "C" + 5 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "D" + 5 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "E" + 5 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "F" + 5 + "p").setColorBackground( color(0, 250, 0) );
      cp5.get(controlP5.Button.class, "G" + 5 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "H" + 5 + "p").setColorBackground( color(#FFFFFF) );
      }  
      if(propRighty == 6){
      cp5.get(controlP5.Button.class, "A" + 5 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "B" + 5 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "C" + 5 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "D" + 5 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "E" + 5 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "F" + 5 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "G" + 5 + "p").setColorBackground( color(0, 250, 0) );
      cp5.get(controlP5.Button.class, "H" + 5 + "p").setColorBackground( color(#FFFFFF) );
      }  
      if(propRighty == 7){
      cp5.get(controlP5.Button.class, "A" + 5 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "B" + 5 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "C" + 5 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "D" + 5 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "E" + 5 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "F" + 5 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "G" + 5 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "H" + 5 + "p").setColorBackground( color(0, 250, 0) );
      }
 }
 void property6(){
    cp5.get(controlP5.Button.class, "A" + 5 + "p").setColorBackground( color(#FFFFFF) );
    cp5.get(controlP5.Button.class, "B" + 5 + "p").setColorBackground( color(#FFFFFF) );
    cp5.get(controlP5.Button.class, "C" + 5 + "p").setColorBackground( color(#FFFFFF) );
    cp5.get(controlP5.Button.class, "D" + 5 + "p").setColorBackground( color(#FFFFFF) );
    cp5.get(controlP5.Button.class, "E" + 5 + "p").setColorBackground( color(#FFFFFF) );
    cp5.get(controlP5.Button.class, "F" + 5 + "p").setColorBackground( color(#FFFFFF) );
    cp5.get(controlP5.Button.class, "G" + 5 + "p").setColorBackground( color(#FFFFFF) );
    cp5.get(controlP5.Button.class, "H" + 5 + "p").setColorBackground( color(#FFFFFF) );
    
    cp5.get(controlP5.Button.class, "A" + 7 + "p").setColorBackground( color(#FFFFFF) );
    cp5.get(controlP5.Button.class, "B" + 7 + "p").setColorBackground( color(#FFFFFF) );
    cp5.get(controlP5.Button.class, "C" + 7 + "p").setColorBackground( color(#FFFFFF) );
    cp5.get(controlP5.Button.class, "D" + 7 + "p").setColorBackground( color(#FFFFFF) );
    cp5.get(controlP5.Button.class, "E" + 7 + "p").setColorBackground( color(#FFFFFF) );
    cp5.get(controlP5.Button.class, "F" + 7 + "p").setColorBackground( color(#FFFFFF) );
    cp5.get(controlP5.Button.class, "G" + 7 + "p").setColorBackground( color(#FFFFFF) );
    cp5.get(controlP5.Button.class, "H" + 7 + "p").setColorBackground( color(#FFFFFF) );
      if(propRighty == 0){
        //print("propHighlightaa == 2");
        cp5.get(controlP5.Button.class, "A" + 6 + "p").setColorBackground( color(0, 250, 0) );
        cp5.get(controlP5.Button.class, "B" + 6 + "p").setColorBackground( color(#FFFFFF) );
        cp5.get(controlP5.Button.class, "C" + 6 + "p").setColorBackground( color(#FFFFFF) );
        cp5.get(controlP5.Button.class, "D" + 6 + "p").setColorBackground( color(#FFFFFF) );
        cp5.get(controlP5.Button.class, "E" + 6 + "p").setColorBackground( color(#FFFFFF) );
        cp5.get(controlP5.Button.class, "F" + 6 + "p").setColorBackground( color(#FFFFFF) );
        cp5.get(controlP5.Button.class, "G" + 6 + "p").setColorBackground( color(#FFFFFF) );
        cp5.get(controlP5.Button.class, "H" + 6 + "p").setColorBackground( color(#FFFFFF) );
      }  
      if(propRighty == 1){
      cp5.get(controlP5.Button.class, "A" + 6 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "B" + 6 + "p").setColorBackground( color(0, 250, 0) );
      cp5.get(controlP5.Button.class, "C" + 6 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "D" + 6 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "E" + 6 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "F" + 6 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "G" + 6 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "H" + 6 + "p").setColorBackground( color(#FFFFFF) );
      }  
      if(propRighty == 2){
      cp5.get(controlP5.Button.class, "A" + 6 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "B" + 6 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "C" + 6 + "p").setColorBackground( color(0, 250, 0) );
      cp5.get(controlP5.Button.class, "D" + 6 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "E" + 6 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "F" + 6 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "G" + 6 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "H" + 6 + "p").setColorBackground( color(#FFFFFF) );
      }  
      if(propRighty == 3){
      cp5.get(controlP5.Button.class, "A" + 6 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "B" + 6 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "C" + 6 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "D" + 6 + "p").setColorBackground( color(0, 250, 0) );
      cp5.get(controlP5.Button.class, "E" + 6 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "F" + 6 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "G" + 6 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "H" + 6 + "p").setColorBackground( color(#FFFFFF) );
      }  
      if(propRighty == 4){
      cp5.get(controlP5.Button.class, "A" + 6 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "B" + 6 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "C" + 6 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "D" + 6 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "E" + 6 + "p").setColorBackground( color(0, 250, 0) );
      cp5.get(controlP5.Button.class, "F" + 6 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "G" + 6 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "H" + 6 + "p").setColorBackground( color(#FFFFFF) );
      }  
      if(propRighty == 5){
      cp5.get(controlP5.Button.class, "A" + 6 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "B" + 6 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "C" + 6 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "D" + 6 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "E" + 6 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "F" + 6 + "p").setColorBackground( color(0, 250, 0) );
      cp5.get(controlP5.Button.class, "G" + 6 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "H" + 6 + "p").setColorBackground( color(#FFFFFF) );
      }  
      if(propRighty == 6){
      cp5.get(controlP5.Button.class, "A" + 6 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "B" + 6 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "C" + 6 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "D" + 6 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "E" + 6 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "F" + 6 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "G" + 6 + "p").setColorBackground( color(0, 250, 0) );
      cp5.get(controlP5.Button.class, "H" + 6 + "p").setColorBackground( color(#FFFFFF) );
      }  
      if(propRighty == 7){
      cp5.get(controlP5.Button.class, "A" + 6 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "B" + 6 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "C" + 6 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "D" + 6 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "E" + 6 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "F" + 6 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "G" + 6 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "H" + 6 + "p").setColorBackground( color(0, 250, 0) );
      }
 }
 void property7(){
    cp5.get(controlP5.Button.class, "A" + 6 + "p").setColorBackground( color(#FFFFFF) );
    cp5.get(controlP5.Button.class, "B" + 6 + "p").setColorBackground( color(#FFFFFF) );
    cp5.get(controlP5.Button.class, "C" + 6 + "p").setColorBackground( color(#FFFFFF) );
    cp5.get(controlP5.Button.class, "D" + 6 + "p").setColorBackground( color(#FFFFFF) );
    cp5.get(controlP5.Button.class, "E" + 6 + "p").setColorBackground( color(#FFFFFF) );
    cp5.get(controlP5.Button.class, "F" + 6 + "p").setColorBackground( color(#FFFFFF) );
    cp5.get(controlP5.Button.class, "G" + 6 + "p").setColorBackground( color(#FFFFFF) );
    cp5.get(controlP5.Button.class, "H" + 6 + "p").setColorBackground( color(#FFFFFF) );
      if(propRighty == 0){
        //print("propHighlightaa == 2");
        cp5.get(controlP5.Button.class, "A" + 7 + "p").setColorBackground( color(0, 250, 0) );
        cp5.get(controlP5.Button.class, "B" + 7 + "p").setColorBackground( color(#FFFFFF) );
        cp5.get(controlP5.Button.class, "C" + 7 + "p").setColorBackground( color(#FFFFFF) );
        cp5.get(controlP5.Button.class, "D" + 7 + "p").setColorBackground( color(#FFFFFF) );
        cp5.get(controlP5.Button.class, "E" + 7 + "p").setColorBackground( color(#FFFFFF) );
        cp5.get(controlP5.Button.class, "F" + 7 + "p").setColorBackground( color(#FFFFFF) );
        cp5.get(controlP5.Button.class, "G" + 7 + "p").setColorBackground( color(#FFFFFF) );
        cp5.get(controlP5.Button.class, "H" + 7 + "p").setColorBackground( color(#FFFFFF) );
      }  
      if(propRighty == 1){
      cp5.get(controlP5.Button.class, "A" + 7 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "B" + 7 + "p").setColorBackground( color(0, 250, 0) );
      cp5.get(controlP5.Button.class, "C" + 7 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "D" + 7 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "E" + 7 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "F" + 7 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "G" + 7 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "H" + 7 + "p").setColorBackground( color(#FFFFFF) );
      }  
      if(propRighty == 2){
      cp5.get(controlP5.Button.class, "A" + 7 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "B" + 7 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "C" + 7 + "p").setColorBackground( color(0, 250, 0) );
      cp5.get(controlP5.Button.class, "D" + 7 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "E" + 7 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "F" + 7 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "G" + 7 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "H" + 7 + "p").setColorBackground( color(#FFFFFF) );
      }  
      if(propRighty == 3){
      cp5.get(controlP5.Button.class, "A" + 7 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "B" + 7 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "C" + 7 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "D" + 7 + "p").setColorBackground( color(0, 250, 0) );
      cp5.get(controlP5.Button.class, "E" + 7 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "F" + 7 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "G" + 7 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "H" + 7 + "p").setColorBackground( color(#FFFFFF) );
      }  
      if(propRighty == 4){
      cp5.get(controlP5.Button.class, "A" + 7 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "B" + 7 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "C" + 7 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "D" + 7 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "E" + 7 + "p").setColorBackground( color(0, 250, 0) );
      cp5.get(controlP5.Button.class, "F" + 7 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "G" + 7 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "H" + 7 + "p").setColorBackground( color(#FFFFFF) );
      }  
      if(propRighty == 5){
      cp5.get(controlP5.Button.class, "A" + 7 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "B" + 7 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "C" + 7 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "D" + 7 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "E" + 7 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "F" + 7 + "p").setColorBackground( color(0, 250, 0) );
      cp5.get(controlP5.Button.class, "G" + 7 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "H" + 7 + "p").setColorBackground( color(#FFFFFF) );
      }  
      if(propRighty == 6){
      cp5.get(controlP5.Button.class, "A" + 7 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "B" + 7 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "C" + 7 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "D" + 7 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "E" + 7 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "F" + 7 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "G" + 7 + "p").setColorBackground( color(0, 250, 0) );
      cp5.get(controlP5.Button.class, "H" + 7 + "p").setColorBackground( color(#FFFFFF) );
      }  
      if(propRighty == 7){
      cp5.get(controlP5.Button.class, "A" + 7 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "B" + 7 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "C" + 7 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "D" + 7 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "E" + 7 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "F" + 7 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "G" + 7 + "p").setColorBackground( color(#FFFFFF) );
      cp5.get(controlP5.Button.class, "H" + 7 + "p").setColorBackground( color(0, 250, 0) );
      }
 }
 void movingRectangles(int k){
   int h = (int) k;
          int j = 65 + h;
          int p = 72;
          char w = char(p);
          String d = str(w);
          char t = char(j);
          String i = str(t);
          int m = j-1;
           char b = char(m);
          String a = str(b);
          //print("j =" + j);
          //print("\n");
          //int stop = 0;
          if (j == 65) {
            fill(0, 255, 255);
            rect(100 + 195, 70, 80, 40);
            rect(100 + 195, 70 + 50, 80, 40);
            rect(100 + 195, 70 + 100, 80, 40);
            rect(100 + 195, 70 + 150, 80, 40);
            rect(100 + 195, 70 + 200, 80, 40);
            rect(100 + 195, 70 + 250, 80, 40);
            rect(100 + 195, 70 + 300, 80, 40);
            rect(100 + 195, 70 + 350, 80, 40);
          }
          
            else if(j == 66){
              stroke(#1B3749);
              fill(#1B3749);
              rect(100 + 195, 70, 80, 40);
              rect(100 + 195, 70 + 50, 80, 40);
              rect(100 + 195, 70 + 100, 80, 40);
              rect(100 + 195, 70 + 150, 80, 40);
              rect(100 + 195, 70 + 200, 80, 40);
              rect(100 + 195, 70 + 250, 80, 40);
              rect(100 + 195, 70 + 300, 80, 40);
              rect(100 + 195, 70 + 350, 80, 40);
              fill(0, 255, 255);
              rect(100 + 200 + 1*95, 70, 80, 40);
              rect(100 + 200 + 1*95, 70 + 50, 80, 40);
              rect(100 + 200 + 1*95, 70 + 100, 80, 40);
              rect(100 + 200 + 1*95, 70 + 150, 80, 40);
              rect(100 + 200 + 1*95, 70 + 200, 80, 40);
              rect(100 + 200 + 1*95, 70 + 250, 80, 40);
              rect(100 + 200 + 1*95, 70 + 300, 80, 40);
              rect(100 + 200 + 1*95, 70 + 350, 80, 40);
            }
            else if(j == 67){
              stroke(#1B3749);
              fill(#1B3749);
              rect(100 + 200 + 1*95, 70, 80, 40);
              rect(100 + 200 + 1*95, 70, 80, 40);
              rect(100 + 200 + 1*95, 70 + 50, 80, 40);
              rect(100 + 200 + 1*95, 70 + 100, 80, 40);
              rect(100 + 200 + 1*95, 70 + 150, 80, 40);
              rect(100 + 200 + 1*95, 70 + 200, 80, 40);
              rect(100 + 200 + 1*95, 70 + 250, 80, 40);
              rect(100 + 200 + 1*95, 70 + 300, 80, 40);
              rect(100 + 200 + 1*95, 70 + 350, 80, 40);
              fill(0, 255, 255);
              rect(100 + 200 + 2*97, 70, 80, 40);
              rect(100 + 200 + 2*97, 70 + 50, 80, 40);
              rect(100 + 200 + 2*97, 70 + 100, 80, 40);
              rect(100 + 200 + 2*97, 70 + 150, 80, 40);
              rect(100 + 200 + 2*97, 70 + 200, 80, 40);
              rect(100 + 200 + 2*97, 70 + 250, 80, 40);
              rect(100 + 200 + 2*97, 70 + 300, 80, 40);
              rect(100 + 200 + 2*97, 70 + 350, 80, 40);
            }
            else if(j == 68){
              stroke(#1B3749);
              fill(#1B3749);
              rect(100 + 200 + 2*97, 70, 80, 40);
              rect(100 + 200 + 2*97, 70 + 50, 80, 40);
              rect(100 + 200 + 2*97, 70 + 100, 80, 40);
              rect(100 + 200 + 2*97, 70 + 150, 80, 40);
              rect(100 + 200 + 2*97, 70 + 200, 80, 40);
              rect(100 + 200 + 2*97, 70 + 250, 80, 40);
              rect(100 + 200 + 2*97, 70 + 300, 80, 40);
              rect(100 + 200 + 2*97, 70 + 350, 80, 40);
              fill(0, 255, 255);
              rect(100 + 200 + 3*98, 70, 80, 40);
              rect(100 + 200 + 3*98, 70 + 50, 80, 40);
              rect(100 + 200 + 3*98, 70 + 100, 80, 40);
              rect(100 + 200 + 3*98, 70 + 150, 80, 40);
              rect(100 + 200 + 3*98, 70 + 200, 80, 40);
              rect(100 + 200 + 3*98, 70 + 250, 80, 40);
              rect(100 + 200 + 3*98, 70 + 300, 80, 40);
              rect(100 + 200 + 3*98, 70 + 350, 80, 40);
            }
            else if(j == 69){
              stroke(#1B3749);
              fill(#1B3749);
              rect(100 + 200 + 3*98, 70, 80, 40);
              rect(100 + 200 + 3*98, 70 + 50, 80, 40);
              rect(100 + 200 + 3*98, 70 + 100, 80, 40);
              rect(100 + 200 + 3*98, 70 + 150, 80, 40);
              rect(100 + 200 + 3*98, 70 + 200, 80, 40);
              rect(100 + 200 + 3*98, 70 + 250, 80, 40);
              rect(100 + 200 + 3*98, 70 + 300, 80, 40);
              rect(100 + 200 + 3*98, 70 + 350, 80, 40);
              fill(0, 255, 255);
              rect(100 + 200 + 4*98.5, 70, 80, 40);
              rect(100 + 200 + 4*98.5, 70 + 50, 80, 40);
              rect(100 + 200 + 4*98.5, 70 + 100, 80, 40);
              rect(100 + 200 + 4*98.5, 70 + 150, 80, 40);
              rect(100 + 200 + 4*98.5, 70 + 200, 80, 40);
              rect(100 + 200 + 4*98.5, 70 + 250, 80, 40);
              rect(100 + 200 + 4*98.5, 70 + 300, 80, 40);
              rect(100 + 200 + 4*98.5, 70 + 350, 80, 40);
            }
            else if(j == 70){
              stroke(#1B3749);
              fill(#1B3749);
              rect(100 + 200 + 4*98.5, 70, 80, 40);
              rect(100 + 200 + 4*98.5, 70 + 50, 80, 40);
              rect(100 + 200 + 4*98.5, 70 + 100, 80, 40);
              rect(100 + 200 + 4*98.5, 70 + 150, 80, 40);
              rect(100 + 200 + 4*98.5, 70 + 200, 80, 40);
              rect(100 + 200 + 4*98.5, 70 + 250, 80, 40);
              rect(100 + 200 + 4*98.5, 70 + 300, 80, 40);
              rect(100 + 200 + 4*98.5, 70 + 350, 80, 40);
              fill(0, 255, 255);
              rect(100 + 200 + 5*99, 70, 80, 40);
              rect(100 + 200 + 5*99, 70 + 50, 80, 40);
              rect(100 + 200 + 5*99, 70 + 100, 80, 40);
              rect(100 + 200 + 5*99, 70 + 150, 80, 40);
              rect(100 + 200 + 5*99, 70 + 200, 80, 40);
              rect(100 + 200 + 5*99, 70 + 250, 80, 40);
              rect(100 + 200 + 5*99, 70 + 300, 80, 40);
              rect(100 + 200 + 5*99, 70 + 350, 80, 40);
            }
            else if(j == 71){
              stroke(#1B3749);
              fill(#1B3749);
              rect(100 + 200 + 5*99, 70, 80, 40);
              rect(100 + 200 + 5*99, 70 + 50, 80, 40);
              rect(100 + 200 + 5*99, 70 + 100, 80, 40);
              rect(100 + 200 + 5*99, 70 + 150, 80, 40);
              rect(100 + 200 + 5*99, 70 + 200, 80, 40);
              rect(100 + 200 + 5*99, 70 + 250, 80, 40);
              rect(100 + 200 + 5*99, 70 + 300, 80, 40);
              rect(100 + 200 + 5*99, 70 + 350, 80, 40);
              fill(0, 255, 255);
              rect(100 + 200 + 6*99, 70, 80, 40);
              rect(100 + 200 + 6*99, 70 + 50, 80, 40);
              rect(100 + 200 + 6*99, 70 + 100, 80, 40);
              rect(100 + 200 + 6*99, 70 + 150, 80, 40);
              rect(100 + 200 + 6*99, 70 + 200, 80, 40);
              rect(100 + 200 + 6*99, 70 + 250, 80, 40);
              rect(100 + 200 + 6*99, 70 + 300, 80, 40);
              rect(100 + 200 + 6*99, 70 + 350, 80, 40);
            }
            else if(j == 72){
              stroke(#1B3749);
              fill(#1B3749);
              rect(100 + 200 + 6*99, 70, 80, 40);
              rect(100 + 200 + 6*99, 70 + 50, 80, 40);
              rect(100 + 200 + 6*99, 70 + 100, 80, 40);
              rect(100 + 200 + 6*99, 70 + 150, 80, 40);
              rect(100 + 200 + 6*99, 70 + 200, 80, 40);
              rect(100 + 200 + 6*99, 70 + 250, 80, 40);
              rect(100 + 200 + 6*99, 70 + 300, 80, 40);
              rect(100 + 200 + 6*99, 70 + 350, 80, 40);
              fill(0, 255, 255);
              rect(100 + 200 + 7*99, 70, 80, 40);
              rect(100 + 200 + 7*99, 70 + 50, 80, 40);
              rect(100 + 200 + 7*99, 70 + 100, 80, 40);
              rect(100 + 200 + 7*99, 70 + 150, 80, 40);
              rect(100 + 200 + 7*99, 70 + 200, 80, 40);
              rect(100 + 200 + 7*99, 70 + 250, 80, 40);
              rect(100 + 200 + 7*99, 70 + 300, 80, 40);
              rect(100 + 200 + 7*99, 70 + 350, 80, 40);
            }
            
            
 }
 
 void gettingInstrumentValues(){
   print("\nA0p.getLabel() ==" + A0p.getLabel());
   print("\nB0p.getLabel() ==" + B0p.getLabel());
   print("\nC0p.getLabel() ==" + C0p.getLabel());
   print("\nD0p.getLabel() ==" + D0p.getLabel());
   print("\nE0p.getLabel() ==" + E0p.getLabel());
   print("\nF0p.getLabel() ==" + F0p.getLabel());
//   float fr0 = 130.81, fr1 = 146.83, fr2 = 164.81, fr3 = 174.61, fr4 = fr4, fr5 = fr5, fr6 = fr6, fr01 = 261.63, fr11 = 293.66, fr21 = 329.63, fr31 = 349.23, fr41 = 392.00, fr51 = 440.00, fr61 = 493.88, 
//fr_0 = 65.41, fr_1 = 73.42, fr_2 = 82.41, fr_3 = 87.31, fr_4 = 98.00, fr_5 = 110.00, fr_6 = 123.47;
   if(instrument0.getLabel() == "SYNTH"){
        if(A0p.getLabel() == "Tr0" || B0p.getLabel() == "Tr0" || C0p.getLabel() == "Tr0" || D0p.getLabel() == "Tr0" || E0p.getLabel() == "Tr0" || A0p.getLabel() == "" || B0p.getLabel() == "" || C0p.getLabel() == "" || 
        D0p.getLabel() == "" || E0p.getLabel() == ""){
            if(A0.getLabel() == "1"){instList0[0] = fr0;}
            if(A0.getLabel() == "2"){instList0[0] = fr1;}
            if(A0.getLabel() == "3"){instList0[0] = fr2;}
            if(A0.getLabel() == "4"){instList0[0] = fr3;}
            if(A0.getLabel() == "5"){instList0[0] = fr4;}
            if(A0.getLabel() == "6"){instList0[0] = fr5;}
            if(A0.getLabel() == "7"){instList0[0] = fr6;}
            
            if(B0.getLabel() == "1"){instList0[1] = fr0;}
            if(B0.getLabel() == "2"){instList0[1] = fr1;}
            if(B0.getLabel() == "3"){instList0[1] = fr2;}
            if(B0.getLabel() == "4"){instList0[1] = fr3;}
            if(B0.getLabel() == "5"){instList0[1] = fr4;}
            if(B0.getLabel() == "6"){instList0[1] = fr5;}
            if(B0.getLabel() == "7"){instList0[1] = fr6;}
            
            if(C0.getLabel() == "1"){instList0[2] = fr0;}
            if(C0.getLabel() == "2"){instList0[2] = fr1;}
            if(C0.getLabel() == "3"){instList0[2] = fr2;}
            if(C0.getLabel() == "4"){instList0[2] = fr3;}
            if(C0.getLabel() == "5"){instList0[2] = fr4;}
            if(C0.getLabel() == "6"){instList0[2] = fr5;}
            if(C0.getLabel() == "7"){instList0[2] = fr6;}
            
             if(D0.getLabel() == "1"){instList0[3] = fr0;}
            if(D0.getLabel() == "2"){instList0[3] = fr1;}
            if(D0.getLabel() == "3"){instList0[3] = fr2;}
            if(D0.getLabel() == "4"){instList0[3] = fr3;}
            if(D0.getLabel() == "5"){instList0[3] = fr4;}
            if(D0.getLabel() == "6"){instList0[3] = fr5;}
            if(D0.getLabel() == "7"){instList0[3] = fr6;}
            
             if(E0.getLabel() == "1"){instList0[3] = fr0;}
            if(E0.getLabel() == "2"){instList0[3] = fr1;}
            if(E0.getLabel() == "3"){instList0[3] = fr2;}
            if(E0.getLabel() == "4"){instList0[3] = fr3;}
            if(E0.getLabel() == "5"){instList0[3] = fr4;}
            if(E0.getLabel() == "6"){instList0[3] = fr5;}
            if(E0.getLabel() == "7"){instList0[3] = fr6;}
            
             if(F0.getLabel() == "1"){instList0[3] = fr0;}
            if(F0.getLabel() == "2"){instList0[3] = fr1;}
            if(F0.getLabel() == "3"){instList0[3] = fr2;}
            if(F0.getLabel() == "4"){instList0[3] = fr3;}
            if(F0.getLabel() == "5"){instList0[3] = fr4;}
            if(F0.getLabel() == "6"){instList0[3] = fr5;}
            if(F0.getLabel() == "7"){instList0[3] = fr6;}
            
             if(G0.getLabel() == "1"){instList0[3] = fr0;}
            if(G0.getLabel() == "2"){instList0[3] = fr1;}
            if(G0.getLabel() == "3"){instList0[3] = fr2;}
            if(G0.getLabel() == "4"){instList0[3] = fr3;}
            if(G0.getLabel() == "5"){instList0[3] = fr4;}
            if(G0.getLabel() == "6"){instList0[3] = fr5;}
            if(G0.getLabel() == "7"){instList0[3] = fr6;}
            
             if(H0.getLabel() == "1"){instList0[3] = fr0;}
            if(H0.getLabel() == "2"){instList0[3] = fr1;}
            if(H0.getLabel() == "3"){instList0[3] = fr2;}
            if(H0.getLabel() == "4"){instList0[3] = fr3;}
            if(H0.getLabel() == "5"){instList0[3] = fr4;}
            if(H0.getLabel() == "6"){instList0[3] = fr5;}
            if(H0.getLabel() == "7"){instList0[3] = fr6;}
          }
          if(A0p.getLabel() == "Tr-1" || B0p.getLabel() == "Tr-1" || C0p.getLabel() == "Tr-1" || D0p.getLabel() == "Tr-1" || E0p.getLabel() == "Tr-1"){
            //instList0[0] = A0.getLabel();
            if(A0.getLabel() == "1"){instList0[0] = fr_0;}
            if(A0.getLabel() == "2"){instList0[0] = fr_1;}
            if(A0.getLabel() == "3"){instList0[0] = fr_2;}
            if(A0.getLabel() == "4"){instList0[0] = fr_3;}
            if(A0.getLabel() == "5"){instList0[0] = fr_4;}
            if(A0.getLabel() == "6"){instList0[0] = fr_5;}
            if(A0.getLabel() == "7"){instList0[0] = fr_6;}
            
            if(B0.getLabel() == "1"){instList0[1] = fr_0;}
            if(B0.getLabel() == "2"){instList0[1] = fr_1;}
            if(B0.getLabel() == "3"){instList0[1] = fr_2;}
            if(B0.getLabel() == "4"){instList0[1] = fr_3;}
            if(B0.getLabel() == "5"){instList0[1] = fr_4;}
            if(B0.getLabel() == "6"){instList0[1] = fr_5;}
            if(B0.getLabel() == "7"){instList0[1] = fr_6;}
            
            if(C0.getLabel() == "1"){instList0[2] = fr_0;}
            if(C0.getLabel() == "2"){instList0[2] = fr_1;}
            if(C0.getLabel() == "3"){instList0[2] = fr_2;}
            if(C0.getLabel() == "4"){instList0[2] = fr_3;}
            if(C0.getLabel() == "5"){instList0[2] = fr_4;}
            if(C0.getLabel() == "6"){instList0[2] = fr_5;}
            if(C0.getLabel() == "7"){instList0[2] = fr_6;}
            
             if(D0.getLabel() == "1"){instList0[3] = fr_0;}
            if(D0.getLabel() == "2"){instList0[3] = fr_1;}
            if(D0.getLabel() == "3"){instList0[3] = fr_2;}
            if(D0.getLabel() == "4"){instList0[3] = fr_3;}
            if(D0.getLabel() == "5"){instList0[3] = fr_4;}
            if(D0.getLabel() == "6"){instList0[3] = fr_5;}
            if(D0.getLabel() == "7"){instList0[3] = fr_6;}
            
             if(E0.getLabel() == "1"){instList0[3] = fr_0;}
            if(E0.getLabel() == "2"){instList0[3] = fr_1;}
            if(E0.getLabel() == "3"){instList0[3] = fr_2;}
            if(E0.getLabel() == "4"){instList0[3] = fr_3;}
            if(E0.getLabel() == "5"){instList0[3] = fr_4;}
            if(E0.getLabel() == "6"){instList0[3] = fr_5;}
            if(E0.getLabel() == "7"){instList0[3] = fr_6;}
            
             if(F0.getLabel() == "1"){instList0[3] = fr_0;}
            if(F0.getLabel() == "2"){instList0[3] = fr_1;}
            if(F0.getLabel() == "3"){instList0[3] = fr_2;}
            if(F0.getLabel() == "4"){instList0[3] = fr_3;}
            if(F0.getLabel() == "5"){instList0[3] = fr_4;}
            if(F0.getLabel() == "6"){instList0[3] = fr_5;}
            if(F0.getLabel() == "7"){instList0[3] = fr_6;}
            
             if(G0.getLabel() == "1"){instList0[3] = fr_0;}
            if(G0.getLabel() == "2"){instList0[3] = fr_1;}
            if(G0.getLabel() == "3"){instList0[3] = fr_2;}
            if(G0.getLabel() == "4"){instList0[3] = fr_3;}
            if(G0.getLabel() == "5"){instList0[3] = fr_4;}
            if(G0.getLabel() == "6"){instList0[3] = fr_5;}
            if(G0.getLabel() == "7"){instList0[3] = fr_6;}
            
             if(H0.getLabel() == "1"){instList0[3] = fr_0;}
            if(H0.getLabel() == "2"){instList0[3] = fr_1;}
            if(H0.getLabel() == "3"){instList0[3] = fr_2;}
            if(H0.getLabel() == "4"){instList0[3] = fr_3;}
            if(H0.getLabel() == "5"){instList0[3] = fr_4;}
            if(H0.getLabel() == "6"){instList0[3] = fr_5;}
            if(H0.getLabel() == "7"){instList0[3] = fr_6;}
          }
          if(A0p.getLabel() == "Tr1" || B0p.getLabel() == "Tr1" || C0p.getLabel() == "Tr1" || D0p.getLabel() == "Tr1" || E0p.getLabel() == "Tr1"){
            //instList0[0] = A0.getLabel();
            if(A0.getLabel() == "1"){instList0[0] = fr01;}
            if(A0.getLabel() == "2"){instList0[0] = fr11;}
            if(A0.getLabel() == "3"){instList0[0] = fr21;}
            if(A0.getLabel() == "4"){instList0[0] = fr31;}
            if(A0.getLabel() == "5"){instList0[0] = fr41;}
            if(A0.getLabel() == "6"){instList0[0] = fr51;}
            if(A0.getLabel() == "7"){instList0[0] = fr61;}
            
            if(B0.getLabel() == "1"){instList0[1] = fr01;}
            if(B0.getLabel() == "2"){instList0[1] = fr11;}
            if(B0.getLabel() == "3"){instList0[1] = fr21;}
            if(B0.getLabel() == "4"){instList0[1] = fr31;}
            if(B0.getLabel() == "5"){instList0[1] = fr41;}
            if(B0.getLabel() == "6"){instList0[1] = fr51;}
            if(B0.getLabel() == "7"){instList0[1] = fr61;}
            
            if(C0.getLabel() == "1"){instList0[2] = fr01;}
            if(C0.getLabel() == "2"){instList0[2] = fr11;}
            if(C0.getLabel() == "3"){instList0[2] = fr21;}
            if(C0.getLabel() == "4"){instList0[2] = fr31;}
            if(C0.getLabel() == "5"){instList0[2] = fr41;}
            if(C0.getLabel() == "6"){instList0[2] = fr51;}
            if(C0.getLabel() == "7"){instList0[2] = fr61;}
            
             if(D0.getLabel() == "1"){instList0[3] = fr01;}
            if(D0.getLabel() == "2"){instList0[3] = fr11;}
            if(D0.getLabel() == "3"){instList0[3] = fr21;}
            if(D0.getLabel() == "4"){instList0[3] = fr31;}
            if(D0.getLabel() == "5"){instList0[3] = fr41;}
            if(D0.getLabel() == "6"){instList0[3] = fr51;}
            if(D0.getLabel() == "7"){instList0[3] = fr61;}
            
             if(E0.getLabel() == "1"){instList0[3] = fr01;}
            if(E0.getLabel() == "2"){instList0[3] = fr11;}
            if(E0.getLabel() == "3"){instList0[3] = fr21;}
            if(E0.getLabel() == "4"){instList0[3] = fr31;}
            if(E0.getLabel() == "5"){instList0[3] = fr41;}
            if(E0.getLabel() == "6"){instList0[3] = fr51;}
            if(E0.getLabel() == "7"){instList0[3] = fr61;}
            
             if(F0.getLabel() == "1"){instList0[3] = fr01;}
            if(F0.getLabel() == "2"){instList0[3] = fr11;}
            if(F0.getLabel() == "3"){instList0[3] = fr21;}
            if(F0.getLabel() == "4"){instList0[3] = fr31;}
            if(F0.getLabel() == "5"){instList0[3] = fr41;}
            if(F0.getLabel() == "6"){instList0[3] = fr51;}
            if(F0.getLabel() == "7"){instList0[3] = fr61;}
            
             if(G0.getLabel() == "1"){instList0[3] = fr01;}
            if(G0.getLabel() == "2"){instList0[3] = fr11;}
            if(G0.getLabel() == "3"){instList0[3] = fr21;}
            if(G0.getLabel() == "4"){instList0[3] = fr31;}
            if(G0.getLabel() == "5"){instList0[3] = fr41;}
            if(G0.getLabel() == "6"){instList0[3] = fr51;}
            if(G0.getLabel() == "7"){instList0[3] = fr61;}
            
             if(H0.getLabel() == "1"){instList0[3] = fr01;}
            if(H0.getLabel() == "2"){instList0[3] = fr11;}
            if(H0.getLabel() == "3"){instList0[3] = fr21;}
            if(H0.getLabel() == "4"){instList0[3] = fr31;}
            if(H0.getLabel() == "5"){instList0[3] = fr41;}
            if(H0.getLabel() == "6"){instList0[3] = fr51;}
            if(H0.getLabel() == "7"){instList0[3] = fr61;}
          }  
    }
    
    if(instrument1.getLabel() == "SYNTH"){
        if(A1p.getLabel() == "Tr0" || B1p.getLabel() == "Tr0" || C1p.getLabel() == "Tr0" || D1p.getLabel() == "Tr0" || E1p.getLabel() == "Tr0" || A1p.getLabel() == "" || B1p.getLabel() == "" || C1p.getLabel() == "" || 
        D1p.getLabel() == "" || E1p.getLabel() == ""){
            if(A1.getLabel() == "1"){instList1[0] = fr0;}
            if(A1.getLabel() == "2"){instList1[0] = fr1;}
            if(A1.getLabel() == "3"){instList1[0] = fr2;}
            if(A1.getLabel() == "4"){instList1[0] = fr3;}
            if(A1.getLabel() == "5"){instList1[0] = fr4;}
            if(A1.getLabel() == "6"){instList1[0] = fr5;}
            if(A1.getLabel() == "7"){instList1[0] = fr6;}
            
            if(B1.getLabel() == "1"){instList1[1] = fr0;}
            if(B1.getLabel() == "2"){instList1[1] = fr1;}
            if(B1.getLabel() == "3"){instList1[1] = fr2;}
            if(B1.getLabel() == "4"){instList1[1] = fr3;}
            if(B1.getLabel() == "5"){instList1[1] = fr4;}
            if(B1.getLabel() == "6"){instList1[1] = fr5;}
            if(B1.getLabel() == "7"){instList1[1] = fr6;}
            
            if(C1.getLabel() == "1"){instList1[2] = fr0;}
            if(C1.getLabel() == "2"){instList1[2] = fr1;}
            if(C1.getLabel() == "3"){instList1[2] = fr2;}
            if(C1.getLabel() == "4"){instList1[2] = fr3;}
            if(C1.getLabel() == "5"){instList1[2] = fr4;}
            if(C1.getLabel() == "6"){instList1[2] = fr5;}
            if(C1.getLabel() == "7"){instList1[2] = fr6;}
            
             if(D1.getLabel() == "1"){instList1[3] = fr0;}
            if(D1.getLabel() == "2"){instList1[3] = fr1;}
            if(D1.getLabel() == "3"){instList1[3] = fr2;}
            if(D1.getLabel() == "4"){instList1[3] = fr3;}
            if(D1.getLabel() == "5"){instList1[3] = fr4;}
            if(D1.getLabel() == "6"){instList1[3] = fr5;}
            if(D1.getLabel() == "7"){instList1[3] = fr6;}
            
             if(E1.getLabel() == "1"){instList1[3] = fr0;}
            if(E1.getLabel() == "2"){instList1[3] = fr1;}
            if(E1.getLabel() == "3"){instList1[3] = fr2;}
            if(E1.getLabel() == "4"){instList1[3] = fr3;}
            if(E1.getLabel() == "5"){instList1[3] = fr4;}
            if(E1.getLabel() == "6"){instList1[3] = fr5;}
            if(E1.getLabel() == "7"){instList1[3] = fr6;}
            
             if(F1.getLabel() == "1"){instList1[3] = fr0;}
            if(F1.getLabel() == "2"){instList1[3] = fr1;}
            if(F1.getLabel() == "3"){instList1[3] = fr2;}
            if(F1.getLabel() == "4"){instList1[3] = fr3;}
            if(F1.getLabel() == "5"){instList1[3] = fr4;}
            if(F1.getLabel() == "6"){instList1[3] = fr5;}
            if(F1.getLabel() == "7"){instList1[3] = fr6;}
            
             if(G1.getLabel() == "1"){instList1[3] = fr0;}
            if(G1.getLabel() == "2"){instList1[3] = fr1;}
            if(G1.getLabel() == "3"){instList1[3] = fr2;}
            if(G1.getLabel() == "4"){instList1[3] = fr3;}
            if(G1.getLabel() == "5"){instList1[3] = fr4;}
            if(G1.getLabel() == "6"){instList1[3] = fr5;}
            if(G1.getLabel() == "7"){instList1[3] = fr6;}
            
             if(H1.getLabel() == "1"){instList1[3] = fr0;}
            if(H1.getLabel() == "2"){instList1[3] = fr1;}
            if(H1.getLabel() == "3"){instList1[3] = fr2;}
            if(H1.getLabel() == "4"){instList1[3] = fr3;}
            if(H1.getLabel() == "5"){instList1[3] = fr4;}
            if(H1.getLabel() == "6"){instList1[3] = fr5;}
            if(H1.getLabel() == "7"){instList1[3] = fr6;}
          }
          if(A1p.getLabel() == "Tr-1" || B1p.getLabel() == "Tr-1" || C1p.getLabel() == "Tr-1" || D1p.getLabel() == "Tr-1" || E1p.getLabel() == "Tr-1"){
            //instList1[0] = A1.getLabel();
            if(A1.getLabel() == "1"){instList1[0] = fr_0;}
            if(A1.getLabel() == "2"){instList1[0] = fr_1;}
            if(A1.getLabel() == "3"){instList1[0] = fr_2;}
            if(A1.getLabel() == "4"){instList1[0] = fr_3;}
            if(A1.getLabel() == "5"){instList1[0] = fr_4;}
            if(A1.getLabel() == "6"){instList1[0] = fr_5;}
            if(A1.getLabel() == "7"){instList1[0] = fr_6;}
            
            if(B1.getLabel() == "1"){instList1[1] = fr_0;}
            if(B1.getLabel() == "2"){instList1[1] = fr_1;}
            if(B1.getLabel() == "3"){instList1[1] = fr_2;}
            if(B1.getLabel() == "4"){instList1[1] = fr_3;}
            if(B1.getLabel() == "5"){instList1[1] = fr_4;}
            if(B1.getLabel() == "6"){instList1[1] = fr_5;}
            if(B1.getLabel() == "7"){instList1[1] = fr_6;}
            
            if(C1.getLabel() == "1"){instList1[2] = fr_0;}
            if(C1.getLabel() == "2"){instList1[2] = fr_1;}
            if(C1.getLabel() == "3"){instList1[2] = fr_2;}
            if(C1.getLabel() == "4"){instList1[2] = fr_3;}
            if(C1.getLabel() == "5"){instList1[2] = fr_4;}
            if(C1.getLabel() == "6"){instList1[2] = fr_5;}
            if(C1.getLabel() == "7"){instList1[2] = fr_6;}
            
             if(D1.getLabel() == "1"){instList1[3] = fr_0;}
            if(D1.getLabel() == "2"){instList1[3] = fr_1;}
            if(D1.getLabel() == "3"){instList1[3] = fr_2;}
            if(D1.getLabel() == "4"){instList1[3] = fr_3;}
            if(D1.getLabel() == "5"){instList1[3] = fr_4;}
            if(D1.getLabel() == "6"){instList1[3] = fr_5;}
            if(D1.getLabel() == "7"){instList1[3] = fr_6;}
            
             if(E1.getLabel() == "1"){instList1[3] = fr_0;}
            if(E1.getLabel() == "2"){instList1[3] = fr_1;}
            if(E1.getLabel() == "3"){instList1[3] = fr_2;}
            if(E1.getLabel() == "4"){instList1[3] = fr_3;}
            if(E1.getLabel() == "5"){instList1[3] = fr_4;}
            if(E1.getLabel() == "6"){instList1[3] = fr_5;}
            if(E1.getLabel() == "7"){instList1[3] = fr_6;}
            
             if(F1.getLabel() == "1"){instList1[3] = fr_0;}
            if(F1.getLabel() == "2"){instList1[3] = fr_1;}
            if(F1.getLabel() == "3"){instList1[3] = fr_2;}
            if(F1.getLabel() == "4"){instList1[3] = fr_3;}
            if(F1.getLabel() == "5"){instList1[3] = fr_4;}
            if(F1.getLabel() == "6"){instList1[3] = fr_5;}
            if(F1.getLabel() == "7"){instList1[3] = fr_6;}
            
             if(G1.getLabel() == "1"){instList1[3] = fr_0;}
            if(G1.getLabel() == "2"){instList1[3] = fr_1;}
            if(G1.getLabel() == "3"){instList1[3] = fr_2;}
            if(G1.getLabel() == "4"){instList1[3] = fr_3;}
            if(G1.getLabel() == "5"){instList1[3] = fr_4;}
            if(G1.getLabel() == "6"){instList1[3] = fr_5;}
            if(G1.getLabel() == "7"){instList1[3] = fr_6;}
            
             if(H1.getLabel() == "1"){instList1[3] = fr_0;}
            if(H1.getLabel() == "2"){instList1[3] = fr_1;}
            if(H1.getLabel() == "3"){instList1[3] = fr_2;}
            if(H1.getLabel() == "4"){instList1[3] = fr_3;}
            if(H1.getLabel() == "5"){instList1[3] = fr_4;}
            if(H1.getLabel() == "6"){instList1[3] = fr_5;}
            if(H1.getLabel() == "7"){instList1[3] = fr_6;}
          }
          if(A1p.getLabel() == "Tr1" || B1p.getLabel() == "Tr1" || C1p.getLabel() == "Tr1" || D1p.getLabel() == "Tr1" || E1p.getLabel() == "Tr1"){
            //instList1[0] = A1.getLabel();
            if(A1.getLabel() == "1"){instList1[0] = fr01;}
            if(A1.getLabel() == "2"){instList1[0] = fr11;}
            if(A1.getLabel() == "3"){instList1[0] = fr21;}
            if(A1.getLabel() == "4"){instList1[0] = fr31;}
            if(A1.getLabel() == "5"){instList1[0] = fr41;}
            if(A1.getLabel() == "6"){instList1[0] = fr51;}
            if(A1.getLabel() == "7"){instList1[0] = fr61;}
            
            if(B1.getLabel() == "1"){instList1[1] = fr01;}
            if(B1.getLabel() == "2"){instList1[1] = fr11;}
            if(B1.getLabel() == "3"){instList1[1] = fr21;}
            if(B1.getLabel() == "4"){instList1[1] = fr31;}
            if(B1.getLabel() == "5"){instList1[1] = fr41;}
            if(B1.getLabel() == "6"){instList1[1] = fr51;}
            if(B1.getLabel() == "7"){instList1[1] = fr61;}
            
            if(C1.getLabel() == "1"){instList1[2] = fr01;}
            if(C1.getLabel() == "2"){instList1[2] = fr11;}
            if(C1.getLabel() == "3"){instList1[2] = fr21;}
            if(C1.getLabel() == "4"){instList1[2] = fr31;}
            if(C1.getLabel() == "5"){instList1[2] = fr41;}
            if(C1.getLabel() == "6"){instList1[2] = fr51;}
            if(C1.getLabel() == "7"){instList1[2] = fr61;}
            
             if(D1.getLabel() == "1"){instList1[3] = fr01;}
            if(D1.getLabel() == "2"){instList1[3] = fr11;}
            if(D1.getLabel() == "3"){instList1[3] = fr21;}
            if(D1.getLabel() == "4"){instList1[3] = fr31;}
            if(D1.getLabel() == "5"){instList1[3] = fr41;}
            if(D1.getLabel() == "6"){instList1[3] = fr51;}
            if(D1.getLabel() == "7"){instList1[3] = fr61;}
            
             if(E1.getLabel() == "1"){instList1[3] = fr01;}
            if(E1.getLabel() == "2"){instList1[3] = fr11;}
            if(E1.getLabel() == "3"){instList1[3] = fr21;}
            if(E1.getLabel() == "4"){instList1[3] = fr31;}
            if(E1.getLabel() == "5"){instList1[3] = fr41;}
            if(E1.getLabel() == "6"){instList1[3] = fr51;}
            if(E1.getLabel() == "7"){instList1[3] = fr61;}
            
             if(F1.getLabel() == "1"){instList1[3] = fr01;}
            if(F1.getLabel() == "2"){instList1[3] = fr11;}
            if(F1.getLabel() == "3"){instList1[3] = fr21;}
            if(F1.getLabel() == "4"){instList1[3] = fr31;}
            if(F1.getLabel() == "5"){instList1[3] = fr41;}
            if(F1.getLabel() == "6"){instList1[3] = fr51;}
            if(F1.getLabel() == "7"){instList1[3] = fr61;}
            
             if(G1.getLabel() == "1"){instList1[3] = fr01;}
            if(G1.getLabel() == "2"){instList1[3] = fr11;}
            if(G1.getLabel() == "3"){instList1[3] = fr21;}
            if(G1.getLabel() == "4"){instList1[3] = fr31;}
            if(G1.getLabel() == "5"){instList1[3] = fr41;}
            if(G1.getLabel() == "6"){instList1[3] = fr51;}
            if(G1.getLabel() == "7"){instList1[3] = fr61;}
            
             if(H1.getLabel() == "1"){instList1[3] = fr01;}
            if(H1.getLabel() == "2"){instList1[3] = fr11;}
            if(H1.getLabel() == "3"){instList1[3] = fr21;}
            if(H1.getLabel() == "4"){instList1[3] = fr31;}
            if(H1.getLabel() == "5"){instList1[3] = fr41;}
            if(H1.getLabel() == "6"){instList1[3] = fr51;}
            if(H1.getLabel() == "7"){instList1[3] = fr61;}
          }
    }
    
    if(instrument2.getLabel() == "SYNTH"){
        if(A2p.getLabel() == "Tr0" || B2p.getLabel() == "Tr0" || C2p.getLabel() == "Tr0" || D2p.getLabel() == "Tr0" || E2p.getLabel() == "Tr0" || A2p.getLabel() == "" || B2p.getLabel() == "" || C2p.getLabel() == "" || 
        D2p.getLabel() == "" || E2p.getLabel() == ""){
            if(A2.getLabel() == "1"){instList2[0] = fr0;}
            if(A2.getLabel() == "2"){instList2[0] = fr1;}
            if(A2.getLabel() == "3"){instList2[0] = fr2;}
            if(A2.getLabel() == "4"){instList2[0] = fr3;}
            if(A2.getLabel() == "5"){instList2[0] = fr4;}
            if(A2.getLabel() == "6"){instList2[0] = fr5;}
            if(A2.getLabel() == "7"){instList2[0] = fr6;}
            
            if(B2.getLabel() == "1"){instList2[1] = fr0;}
            if(B2.getLabel() == "2"){instList2[1] = fr1;}
            if(B2.getLabel() == "3"){instList2[1] = fr2;}
            if(B2.getLabel() == "4"){instList2[1] = fr3;}
            if(B2.getLabel() == "5"){instList2[1] = fr4;}
            if(B2.getLabel() == "6"){instList2[1] = fr5;}
            if(B2.getLabel() == "7"){instList2[1] = fr6;}
            
            if(C2.getLabel() == "1"){instList2[2] = fr0;}
            if(C2.getLabel() == "2"){instList2[2] = fr1;}
            if(C2.getLabel() == "3"){instList2[2] = fr2;}
            if(C2.getLabel() == "4"){instList2[2] = fr3;}
            if(C2.getLabel() == "5"){instList2[2] = fr4;}
            if(C2.getLabel() == "6"){instList2[2] = fr5;}
            if(C2.getLabel() == "7"){instList2[2] = fr6;}
            
             if(D2.getLabel() == "1"){instList2[3] = fr0;}
            if(D2.getLabel() == "2"){instList2[3] = fr1;}
            if(D2.getLabel() == "3"){instList2[3] = fr2;}
            if(D2.getLabel() == "4"){instList2[3] = fr3;}
            if(D2.getLabel() == "5"){instList2[3] = fr4;}
            if(D2.getLabel() == "6"){instList2[3] = fr5;}
            if(D2.getLabel() == "7"){instList2[3] = fr6;}
            
             if(E2.getLabel() == "1"){instList2[3] = fr0;}
            if(E2.getLabel() == "2"){instList2[3] = fr1;}
            if(E2.getLabel() == "3"){instList2[3] = fr2;}
            if(E2.getLabel() == "4"){instList2[3] = fr3;}
            if(E2.getLabel() == "5"){instList2[3] = fr4;}
            if(E2.getLabel() == "6"){instList2[3] = fr5;}
            if(E2.getLabel() == "7"){instList2[3] = fr6;}
            
             if(F2.getLabel() == "1"){instList2[3] = fr0;}
            if(F2.getLabel() == "2"){instList2[3] = fr1;}
            if(F2.getLabel() == "3"){instList2[3] = fr2;}
            if(F2.getLabel() == "4"){instList2[3] = fr3;}
            if(F2.getLabel() == "5"){instList2[3] = fr4;}
            if(F2.getLabel() == "6"){instList2[3] = fr5;}
            if(F2.getLabel() == "7"){instList2[3] = fr6;}
            
             if(G2.getLabel() == "1"){instList2[3] = fr0;}
            if(G2.getLabel() == "2"){instList2[3] = fr1;}
            if(G2.getLabel() == "3"){instList2[3] = fr2;}
            if(G2.getLabel() == "4"){instList2[3] = fr3;}
            if(G2.getLabel() == "5"){instList2[3] = fr4;}
            if(G2.getLabel() == "6"){instList2[3] = fr5;}
            if(G2.getLabel() == "7"){instList2[3] = fr6;}
            
             if(H2.getLabel() == "1"){instList2[3] = fr0;}
            if(H2.getLabel() == "2"){instList2[3] = fr1;}
            if(H2.getLabel() == "3"){instList2[3] = fr2;}
            if(H2.getLabel() == "4"){instList2[3] = fr3;}
            if(H2.getLabel() == "5"){instList2[3] = fr4;}
            if(H2.getLabel() == "6"){instList2[3] = fr5;}
            if(H2.getLabel() == "7"){instList2[3] = fr6;}
          }
          if(A2p.getLabel() == "Tr-1" || B2p.getLabel() == "Tr-1" || C2p.getLabel() == "Tr-1" || D2p.getLabel() == "Tr-1" || E2p.getLabel() == "Tr-1"){
            //instList2[0] = A2.getLabel();
            if(A2.getLabel() == "1"){instList2[0] = fr_0;}
            if(A2.getLabel() == "2"){instList2[0] = fr_1;}
            if(A2.getLabel() == "3"){instList2[0] = fr_2;}
            if(A2.getLabel() == "4"){instList2[0] = fr_3;}
            if(A2.getLabel() == "5"){instList2[0] = fr_4;}
            if(A2.getLabel() == "6"){instList2[0] = fr_5;}
            if(A2.getLabel() == "7"){instList2[0] = fr_6;}
            
            if(B2.getLabel() == "1"){instList2[1] = fr_0;}
            if(B2.getLabel() == "2"){instList2[1] = fr_1;}
            if(B2.getLabel() == "3"){instList2[1] = fr_2;}
            if(B2.getLabel() == "4"){instList2[1] = fr_3;}
            if(B2.getLabel() == "5"){instList2[1] = fr_4;}
            if(B2.getLabel() == "6"){instList2[1] = fr_5;}
            if(B2.getLabel() == "7"){instList2[1] = fr_6;}
            
            if(C2.getLabel() == "1"){instList2[2] = fr_0;}
            if(C2.getLabel() == "2"){instList2[2] = fr_1;}
            if(C2.getLabel() == "3"){instList2[2] = fr_2;}
            if(C2.getLabel() == "4"){instList2[2] = fr_3;}
            if(C2.getLabel() == "5"){instList2[2] = fr_4;}
            if(C2.getLabel() == "6"){instList2[2] = fr_5;}
            if(C2.getLabel() == "7"){instList2[2] = fr_6;}
            
             if(D2.getLabel() == "1"){instList2[3] = fr_0;}
            if(D2.getLabel() == "2"){instList2[3] = fr_1;}
            if(D2.getLabel() == "3"){instList2[3] = fr_2;}
            if(D2.getLabel() == "4"){instList2[3] = fr_3;}
            if(D2.getLabel() == "5"){instList2[3] = fr_4;}
            if(D2.getLabel() == "6"){instList2[3] = fr_5;}
            if(D2.getLabel() == "7"){instList2[3] = fr_6;}
            
             if(E2.getLabel() == "1"){instList2[3] = fr_0;}
            if(E2.getLabel() == "2"){instList2[3] = fr_1;}
            if(E2.getLabel() == "3"){instList2[3] = fr_2;}
            if(E2.getLabel() == "4"){instList2[3] = fr_3;}
            if(E2.getLabel() == "5"){instList2[3] = fr_4;}
            if(E2.getLabel() == "6"){instList2[3] = fr_5;}
            if(E2.getLabel() == "7"){instList2[3] = fr_6;}
            
             if(F2.getLabel() == "1"){instList2[3] = fr_0;}
            if(F2.getLabel() == "2"){instList2[3] = fr_1;}
            if(F2.getLabel() == "3"){instList2[3] = fr_2;}
            if(F2.getLabel() == "4"){instList2[3] = fr_3;}
            if(F2.getLabel() == "5"){instList2[3] = fr_4;}
            if(F2.getLabel() == "6"){instList2[3] = fr_5;}
            if(F2.getLabel() == "7"){instList2[3] = fr_6;}
            
             if(G2.getLabel() == "1"){instList2[3] = fr_0;}
            if(G2.getLabel() == "2"){instList2[3] = fr_1;}
            if(G2.getLabel() == "3"){instList2[3] = fr_2;}
            if(G2.getLabel() == "4"){instList2[3] = fr_3;}
            if(G2.getLabel() == "5"){instList2[3] = fr_4;}
            if(G2.getLabel() == "6"){instList2[3] = fr_5;}
            if(G2.getLabel() == "7"){instList2[3] = fr_6;}
            
             if(H2.getLabel() == "1"){instList2[3] = fr_0;}
            if(H2.getLabel() == "2"){instList2[3] = fr_1;}
            if(H2.getLabel() == "3"){instList2[3] = fr_2;}
            if(H2.getLabel() == "4"){instList2[3] = fr_3;}
            if(H2.getLabel() == "5"){instList2[3] = fr_4;}
            if(H2.getLabel() == "6"){instList2[3] = fr_5;}
            if(H2.getLabel() == "7"){instList2[3] = fr_6;}
          }
          if(A2p.getLabel() == "Tr1" || B2p.getLabel() == "Tr1" || C2p.getLabel() == "Tr1" || D2p.getLabel() == "Tr1" || E2p.getLabel() == "Tr1"){
            //instList2[0] = A2.getLabel();
            if(A2.getLabel() == "1"){instList2[0] = fr01;}
            if(A2.getLabel() == "2"){instList2[0] = fr11;}
            if(A2.getLabel() == "3"){instList2[0] = fr21;}
            if(A2.getLabel() == "4"){instList2[0] = fr31;}
            if(A2.getLabel() == "5"){instList2[0] = fr41;}
            if(A2.getLabel() == "6"){instList2[0] = fr51;}
            if(A2.getLabel() == "7"){instList2[0] = fr61;}
            
            if(B2.getLabel() == "1"){instList2[1] = fr01;}
            if(B2.getLabel() == "2"){instList2[1] = fr11;}
            if(B2.getLabel() == "3"){instList2[1] = fr21;}
            if(B2.getLabel() == "4"){instList2[1] = fr31;}
            if(B2.getLabel() == "5"){instList2[1] = fr41;}
            if(B2.getLabel() == "6"){instList2[1] = fr51;}
            if(B2.getLabel() == "7"){instList2[1] = fr61;}
            
            if(C2.getLabel() == "1"){instList2[2] = fr01;}
            if(C2.getLabel() == "2"){instList2[2] = fr11;}
            if(C2.getLabel() == "3"){instList2[2] = fr21;}
            if(C2.getLabel() == "4"){instList2[2] = fr31;}
            if(C2.getLabel() == "5"){instList2[2] = fr41;}
            if(C2.getLabel() == "6"){instList2[2] = fr51;}
            if(C2.getLabel() == "7"){instList2[2] = fr61;}
            
             if(D2.getLabel() == "1"){instList2[3] = fr01;}
            if(D2.getLabel() == "2"){instList2[3] = fr11;}
            if(D2.getLabel() == "3"){instList2[3] = fr21;}
            if(D2.getLabel() == "4"){instList2[3] = fr31;}
            if(D2.getLabel() == "5"){instList2[3] = fr41;}
            if(D2.getLabel() == "6"){instList2[3] = fr51;}
            if(D2.getLabel() == "7"){instList2[3] = fr61;}
            
             if(E2.getLabel() == "1"){instList2[3] = fr01;}
            if(E2.getLabel() == "2"){instList2[3] = fr11;}
            if(E2.getLabel() == "3"){instList2[3] = fr21;}
            if(E2.getLabel() == "4"){instList2[3] = fr31;}
            if(E2.getLabel() == "5"){instList2[3] = fr41;}
            if(E2.getLabel() == "6"){instList2[3] = fr51;}
            if(E2.getLabel() == "7"){instList2[3] = fr61;}
            
             if(F2.getLabel() == "1"){instList2[3] = fr01;}
            if(F2.getLabel() == "2"){instList2[3] = fr11;}
            if(F2.getLabel() == "3"){instList2[3] = fr21;}
            if(F2.getLabel() == "4"){instList2[3] = fr31;}
            if(F2.getLabel() == "5"){instList2[3] = fr41;}
            if(F2.getLabel() == "6"){instList2[3] = fr51;}
            if(F2.getLabel() == "7"){instList2[3] = fr61;}
            
             if(G2.getLabel() == "1"){instList2[3] = fr01;}
            if(G2.getLabel() == "2"){instList2[3] = fr11;}
            if(G2.getLabel() == "3"){instList2[3] = fr21;}
            if(G2.getLabel() == "4"){instList2[3] = fr31;}
            if(G2.getLabel() == "5"){instList2[3] = fr41;}
            if(G2.getLabel() == "6"){instList2[3] = fr51;}
            if(G2.getLabel() == "7"){instList2[3] = fr61;}
            
             if(H2.getLabel() == "1"){instList2[3] = fr01;}
            if(H2.getLabel() == "2"){instList2[3] = fr11;}
            if(H2.getLabel() == "3"){instList2[3] = fr21;}
            if(H2.getLabel() == "4"){instList2[3] = fr31;}
            if(H2.getLabel() == "5"){instList2[3] = fr41;}
            if(H2.getLabel() == "6"){instList2[3] = fr51;}
            if(H2.getLabel() == "7"){instList2[3] = fr61;}
          }
    }
    if(instrument3.getLabel() == "SYNTH"){
        if(A3p.getLabel() == "Tr0" || B3p.getLabel() == "Tr0" || C3p.getLabel() == "Tr0" || D3p.getLabel() == "Tr0" || E3p.getLabel() == "Tr0" || A3p.getLabel() == "" || B3p.getLabel() == "" || C3p.getLabel() == "" || 
        D3p.getLabel() == "" || E3p.getLabel() == ""){
            if(A3.getLabel() == "1"){instList3[0] = fr0;}
            if(A3.getLabel() == "2"){instList3[0] = fr1;}
            if(A3.getLabel() == "3"){instList3[0] = fr2;}
            if(A3.getLabel() == "4"){instList3[0] = fr3;}
            if(A3.getLabel() == "5"){instList3[0] = fr4;}
            if(A3.getLabel() == "6"){instList3[0] = fr5;}
            if(A3.getLabel() == "7"){instList3[0] = fr6;}
            
            if(B3.getLabel() == "1"){instList3[1] = fr0;}
            if(B3.getLabel() == "2"){instList3[1] = fr1;}
            if(B3.getLabel() == "3"){instList3[1] = fr2;}
            if(B3.getLabel() == "4"){instList3[1] = fr3;}
            if(B3.getLabel() == "5"){instList3[1] = fr4;}
            if(B3.getLabel() == "6"){instList3[1] = fr5;}
            if(B3.getLabel() == "7"){instList3[1] = fr6;}
            
            if(C3.getLabel() == "1"){instList3[2] = fr0;}
            if(C3.getLabel() == "2"){instList3[2] = fr1;}
            if(C3.getLabel() == "3"){instList3[2] = fr2;}
            if(C3.getLabel() == "4"){instList3[2] = fr3;}
            if(C3.getLabel() == "5"){instList3[2] = fr4;}
            if(C3.getLabel() == "6"){instList3[2] = fr5;}
            if(C3.getLabel() == "7"){instList3[2] = fr6;}
            
             if(D3.getLabel() == "1"){instList3[3] = fr0;}
            if(D3.getLabel() == "2"){instList3[3] = fr1;}
            if(D3.getLabel() == "3"){instList3[3] = fr2;}
            if(D3.getLabel() == "4"){instList3[3] = fr3;}
            if(D3.getLabel() == "5"){instList3[3] = fr4;}
            if(D3.getLabel() == "6"){instList3[3] = fr5;}
            if(D3.getLabel() == "7"){instList3[3] = fr6;}
            
             if(E3.getLabel() == "1"){instList3[3] = fr0;}
            if(E3.getLabel() == "2"){instList3[3] = fr1;}
            if(E3.getLabel() == "3"){instList3[3] = fr2;}
            if(E3.getLabel() == "4"){instList3[3] = fr3;}
            if(E3.getLabel() == "5"){instList3[3] = fr4;}
            if(E3.getLabel() == "6"){instList3[3] = fr5;}
            if(E3.getLabel() == "7"){instList3[3] = fr6;}
            
             if(F3.getLabel() == "1"){instList3[3] = fr0;}
            if(F3.getLabel() == "2"){instList3[3] = fr1;}
            if(F3.getLabel() == "3"){instList3[3] = fr2;}
            if(F3.getLabel() == "4"){instList3[3] = fr3;}
            if(F3.getLabel() == "5"){instList3[3] = fr4;}
            if(F3.getLabel() == "6"){instList3[3] = fr5;}
            if(F3.getLabel() == "7"){instList3[3] = fr6;}
            
             if(G3.getLabel() == "1"){instList3[3] = fr0;}
            if(G3.getLabel() == "2"){instList3[3] = fr1;}
            if(G3.getLabel() == "3"){instList3[3] = fr2;}
            if(G3.getLabel() == "4"){instList3[3] = fr3;}
            if(G3.getLabel() == "5"){instList3[3] = fr4;}
            if(G3.getLabel() == "6"){instList3[3] = fr5;}
            if(G3.getLabel() == "7"){instList3[3] = fr6;}
            
             if(H3.getLabel() == "1"){instList3[3] = fr0;}
            if(H3.getLabel() == "2"){instList3[3] = fr1;}
            if(H3.getLabel() == "3"){instList3[3] = fr2;}
            if(H3.getLabel() == "4"){instList3[3] = fr3;}
            if(H3.getLabel() == "5"){instList3[3] = fr4;}
            if(H3.getLabel() == "6"){instList3[3] = fr5;}
            if(H3.getLabel() == "7"){instList3[3] = fr6;}
          }
          if(A3p.getLabel() == "Tr-1" || B3p.getLabel() == "Tr-1" || C3p.getLabel() == "Tr-1" || D3p.getLabel() == "Tr-1" || E3p.getLabel() == "Tr-1"){
            //instList3[0] = A3.getLabel();
            if(A3.getLabel() == "1"){instList3[0] = fr_0;}
            if(A3.getLabel() == "2"){instList3[0] = fr_1;}
            if(A3.getLabel() == "3"){instList3[0] = fr_2;}
            if(A3.getLabel() == "4"){instList3[0] = fr_3;}
            if(A3.getLabel() == "5"){instList3[0] = fr_4;}
            if(A3.getLabel() == "6"){instList3[0] = fr_5;}
            if(A3.getLabel() == "7"){instList3[0] = fr_6;}
            
            if(B3.getLabel() == "1"){instList3[1] = fr_0;}
            if(B3.getLabel() == "2"){instList3[1] = fr_1;}
            if(B3.getLabel() == "3"){instList3[1] = fr_2;}
            if(B3.getLabel() == "4"){instList3[1] = fr_3;}
            if(B3.getLabel() == "5"){instList3[1] = fr_4;}
            if(B3.getLabel() == "6"){instList3[1] = fr_5;}
            if(B3.getLabel() == "7"){instList3[1] = fr_6;}
            
            if(C3.getLabel() == "1"){instList3[2] = fr_0;}
            if(C3.getLabel() == "2"){instList3[2] = fr_1;}
            if(C3.getLabel() == "3"){instList3[2] = fr_2;}
            if(C3.getLabel() == "4"){instList3[2] = fr_3;}
            if(C3.getLabel() == "5"){instList3[2] = fr_4;}
            if(C3.getLabel() == "6"){instList3[2] = fr_5;}
            if(C3.getLabel() == "7"){instList3[2] = fr_6;}
            
             if(D3.getLabel() == "1"){instList3[3] = fr_0;}
            if(D3.getLabel() == "2"){instList3[3] = fr_1;}
            if(D3.getLabel() == "3"){instList3[3] = fr_2;}
            if(D3.getLabel() == "4"){instList3[3] = fr_3;}
            if(D3.getLabel() == "5"){instList3[3] = fr_4;}
            if(D3.getLabel() == "6"){instList3[3] = fr_5;}
            if(D3.getLabel() == "7"){instList3[3] = fr_6;}
            
             if(E3.getLabel() == "1"){instList3[3] = fr_0;}
            if(E3.getLabel() == "2"){instList3[3] = fr_1;}
            if(E3.getLabel() == "3"){instList3[3] = fr_2;}
            if(E3.getLabel() == "4"){instList3[3] = fr_3;}
            if(E3.getLabel() == "5"){instList3[3] = fr_4;}
            if(E3.getLabel() == "6"){instList3[3] = fr_5;}
            if(E3.getLabel() == "7"){instList3[3] = fr_6;}
            
             if(F3.getLabel() == "1"){instList3[3] = fr_0;}
            if(F3.getLabel() == "2"){instList3[3] = fr_1;}
            if(F3.getLabel() == "3"){instList3[3] = fr_2;}
            if(F3.getLabel() == "4"){instList3[3] = fr_3;}
            if(F3.getLabel() == "5"){instList3[3] = fr_4;}
            if(F3.getLabel() == "6"){instList3[3] = fr_5;}
            if(F3.getLabel() == "7"){instList3[3] = fr_6;}
            
             if(G3.getLabel() == "1"){instList3[3] = fr_0;}
            if(G3.getLabel() == "2"){instList3[3] = fr_1;}
            if(G3.getLabel() == "3"){instList3[3] = fr_2;}
            if(G3.getLabel() == "4"){instList3[3] = fr_3;}
            if(G3.getLabel() == "5"){instList3[3] = fr_4;}
            if(G3.getLabel() == "6"){instList3[3] = fr_5;}
            if(G3.getLabel() == "7"){instList3[3] = fr_6;}
            
             if(H3.getLabel() == "1"){instList3[3] = fr_0;}
            if(H3.getLabel() == "2"){instList3[3] = fr_1;}
            if(H3.getLabel() == "3"){instList3[3] = fr_2;}
            if(H3.getLabel() == "4"){instList3[3] = fr_3;}
            if(H3.getLabel() == "5"){instList3[3] = fr_4;}
            if(H3.getLabel() == "6"){instList3[3] = fr_5;}
            if(H3.getLabel() == "7"){instList3[3] = fr_6;}
          }
          if(A3p.getLabel() == "Tr1" || B3p.getLabel() == "Tr1" || C3p.getLabel() == "Tr1" || D3p.getLabel() == "Tr1" || E3p.getLabel() == "Tr1"){
            //instList3[0] = A3.getLabel();
            if(A3.getLabel() == "1"){instList3[0] = fr01;}
            if(A3.getLabel() == "2"){instList3[0] = fr11;}
            if(A3.getLabel() == "3"){instList3[0] = fr21;}
            if(A3.getLabel() == "4"){instList3[0] = fr31;}
            if(A3.getLabel() == "5"){instList3[0] = fr41;}
            if(A3.getLabel() == "6"){instList3[0] = fr51;}
            if(A3.getLabel() == "7"){instList3[0] = fr61;}
            
            if(B3.getLabel() == "1"){instList3[1] = fr01;}
            if(B3.getLabel() == "2"){instList3[1] = fr11;}
            if(B3.getLabel() == "3"){instList3[1] = fr21;}
            if(B3.getLabel() == "4"){instList3[1] = fr31;}
            if(B3.getLabel() == "5"){instList3[1] = fr41;}
            if(B3.getLabel() == "6"){instList3[1] = fr51;}
            if(B3.getLabel() == "7"){instList3[1] = fr61;}
            
            if(C3.getLabel() == "1"){instList3[2] = fr01;}
            if(C3.getLabel() == "2"){instList3[2] = fr11;}
            if(C3.getLabel() == "3"){instList3[2] = fr21;}
            if(C3.getLabel() == "4"){instList3[2] = fr31;}
            if(C3.getLabel() == "5"){instList3[2] = fr41;}
            if(C3.getLabel() == "6"){instList3[2] = fr51;}
            if(C3.getLabel() == "7"){instList3[2] = fr61;}
            
             if(D3.getLabel() == "1"){instList3[3] = fr01;}
            if(D3.getLabel() == "2"){instList3[3] = fr11;}
            if(D3.getLabel() == "3"){instList3[3] = fr21;}
            if(D3.getLabel() == "4"){instList3[3] = fr31;}
            if(D3.getLabel() == "5"){instList3[3] = fr41;}
            if(D3.getLabel() == "6"){instList3[3] = fr51;}
            if(D3.getLabel() == "7"){instList3[3] = fr61;}
            
             if(E3.getLabel() == "1"){instList3[3] = fr01;}
            if(E3.getLabel() == "2"){instList3[3] = fr11;}
            if(E3.getLabel() == "3"){instList3[3] = fr21;}
            if(E3.getLabel() == "4"){instList3[3] = fr31;}
            if(E3.getLabel() == "5"){instList3[3] = fr41;}
            if(E3.getLabel() == "6"){instList3[3] = fr51;}
            if(E3.getLabel() == "7"){instList3[3] = fr61;}
            
             if(F3.getLabel() == "1"){instList3[3] = fr01;}
            if(F3.getLabel() == "2"){instList3[3] = fr11;}
            if(F3.getLabel() == "3"){instList3[3] = fr21;}
            if(F3.getLabel() == "4"){instList3[3] = fr31;}
            if(F3.getLabel() == "5"){instList3[3] = fr41;}
            if(F3.getLabel() == "6"){instList3[3] = fr51;}
            if(F3.getLabel() == "7"){instList3[3] = fr61;}
            
             if(G3.getLabel() == "1"){instList3[3] = fr01;}
            if(G3.getLabel() == "2"){instList3[3] = fr11;}
            if(G3.getLabel() == "3"){instList3[3] = fr21;}
            if(G3.getLabel() == "4"){instList3[3] = fr31;}
            if(G3.getLabel() == "5"){instList3[3] = fr41;}
            if(G3.getLabel() == "6"){instList3[3] = fr51;}
            if(G3.getLabel() == "7"){instList3[3] = fr61;}
            
             if(H3.getLabel() == "1"){instList3[3] = fr01;}
            if(H3.getLabel() == "2"){instList3[3] = fr11;}
            if(H3.getLabel() == "3"){instList3[3] = fr21;}
            if(H3.getLabel() == "4"){instList3[3] = fr31;}
            if(H3.getLabel() == "5"){instList3[3] = fr41;}
            if(H3.getLabel() == "6"){instList3[3] = fr51;}
            if(H3.getLabel() == "7"){instList3[3] = fr61;}
          }
    }
    if(instrument4.getLabel() == "SYNTH"){
        if(A4p.getLabel() == "Tr0" || B4p.getLabel() == "Tr0" || C4p.getLabel() == "Tr0" || D4p.getLabel() == "Tr0" || E4p.getLabel() == "Tr0" || A4p.getLabel() == "" || B4p.getLabel() == "" || C4p.getLabel() == "" || 
        D4p.getLabel() == "" || E4p.getLabel() == ""){
            if(A4.getLabel() == "1"){instList4[0] = fr0;}
            if(A4.getLabel() == "2"){instList4[0] = fr1;}
            if(A4.getLabel() == "3"){instList4[0] = fr2;}
            if(A4.getLabel() == "4"){instList4[0] = fr3;}
            if(A4.getLabel() == "5"){instList4[0] = fr4;}
            if(A4.getLabel() == "6"){instList4[0] = fr5;}
            if(A4.getLabel() == "7"){instList4[0] = fr6;}
            
            if(B4.getLabel() == "1"){instList4[1] = fr0;}
            if(B4.getLabel() == "2"){instList4[1] = fr1;}
            if(B4.getLabel() == "3"){instList4[1] = fr2;}
            if(B4.getLabel() == "4"){instList4[1] = fr3;}
            if(B4.getLabel() == "5"){instList4[1] = fr4;}
            if(B4.getLabel() == "6"){instList4[1] = fr5;}
            if(B4.getLabel() == "7"){instList4[1] = fr6;}
            
            if(C4.getLabel() == "1"){instList4[2] = fr0;}
            if(C4.getLabel() == "2"){instList4[2] = fr1;}
            if(C4.getLabel() == "3"){instList4[2] = fr2;}
            if(C4.getLabel() == "4"){instList4[2] = fr3;}
            if(C4.getLabel() == "5"){instList4[2] = fr4;}
            if(C4.getLabel() == "6"){instList4[2] = fr5;}
            if(C4.getLabel() == "7"){instList4[2] = fr6;}
            
             if(D4.getLabel() == "1"){instList4[3] = fr0;}
            if(D4.getLabel() == "2"){instList4[3] = fr1;}
            if(D4.getLabel() == "3"){instList4[3] = fr2;}
            if(D4.getLabel() == "4"){instList4[3] = fr3;}
            if(D4.getLabel() == "5"){instList4[3] = fr4;}
            if(D4.getLabel() == "6"){instList4[3] = fr5;}
            if(D4.getLabel() == "7"){instList4[3] = fr6;}
            
             if(E4.getLabel() == "1"){instList4[3] = fr0;}
            if(E4.getLabel() == "2"){instList4[3] = fr1;}
            if(E4.getLabel() == "3"){instList4[3] = fr2;}
            if(E4.getLabel() == "4"){instList4[3] = fr3;}
            if(E4.getLabel() == "5"){instList4[3] = fr4;}
            if(E4.getLabel() == "6"){instList4[3] = fr5;}
            if(E4.getLabel() == "7"){instList4[3] = fr6;}
            
             if(F4.getLabel() == "1"){instList4[3] = fr0;}
            if(F4.getLabel() == "2"){instList4[3] = fr1;}
            if(F4.getLabel() == "3"){instList4[3] = fr2;}
            if(F4.getLabel() == "4"){instList4[3] = fr3;}
            if(F4.getLabel() == "5"){instList4[3] = fr4;}
            if(F4.getLabel() == "6"){instList4[3] = fr5;}
            if(F4.getLabel() == "7"){instList4[3] = fr6;}
            
             if(G4.getLabel() == "1"){instList4[3] = fr0;}
            if(G4.getLabel() == "2"){instList4[3] = fr1;}
            if(G4.getLabel() == "3"){instList4[3] = fr2;}
            if(G4.getLabel() == "4"){instList4[3] = fr3;}
            if(G4.getLabel() == "5"){instList4[3] = fr4;}
            if(G4.getLabel() == "6"){instList4[3] = fr5;}
            if(G4.getLabel() == "7"){instList4[3] = fr6;}
            
             if(H4.getLabel() == "1"){instList4[3] = fr0;}
            if(H4.getLabel() == "2"){instList4[3] = fr1;}
            if(H4.getLabel() == "3"){instList4[3] = fr2;}
            if(H4.getLabel() == "4"){instList4[3] = fr3;}
            if(H4.getLabel() == "5"){instList4[3] = fr4;}
            if(H4.getLabel() == "6"){instList4[3] = fr5;}
            if(H4.getLabel() == "7"){instList4[3] = fr6;}
          }
          if(A4p.getLabel() == "Tr-1" || B4p.getLabel() == "Tr-1" || C4p.getLabel() == "Tr-1" || D4p.getLabel() == "Tr-1" || E4p.getLabel() == "Tr-1"){
            //instList4[0] = A4.getLabel();
            if(A4.getLabel() == "1"){instList4[0] = fr_0;}
            if(A4.getLabel() == "2"){instList4[0] = fr_1;}
            if(A4.getLabel() == "3"){instList4[0] = fr_2;}
            if(A4.getLabel() == "4"){instList4[0] = fr_3;}
            if(A4.getLabel() == "5"){instList4[0] = fr_4;}
            if(A4.getLabel() == "6"){instList4[0] = fr_5;}
            if(A4.getLabel() == "7"){instList4[0] = fr_6;}
            
            if(B4.getLabel() == "1"){instList4[1] = fr_0;}
            if(B4.getLabel() == "2"){instList4[1] = fr_1;}
            if(B4.getLabel() == "3"){instList4[1] = fr_2;}
            if(B4.getLabel() == "4"){instList4[1] = fr_3;}
            if(B4.getLabel() == "5"){instList4[1] = fr_4;}
            if(B4.getLabel() == "6"){instList4[1] = fr_5;}
            if(B4.getLabel() == "7"){instList4[1] = fr_6;}
            
            if(C4.getLabel() == "1"){instList4[2] = fr_0;}
            if(C4.getLabel() == "2"){instList4[2] = fr_1;}
            if(C4.getLabel() == "3"){instList4[2] = fr_2;}
            if(C4.getLabel() == "4"){instList4[2] = fr_3;}
            if(C4.getLabel() == "5"){instList4[2] = fr_4;}
            if(C4.getLabel() == "6"){instList4[2] = fr_5;}
            if(C4.getLabel() == "7"){instList4[2] = fr_6;}
            
             if(D4.getLabel() == "1"){instList4[3] = fr_0;}
            if(D4.getLabel() == "2"){instList4[3] = fr_1;}
            if(D4.getLabel() == "3"){instList4[3] = fr_2;}
            if(D4.getLabel() == "4"){instList4[3] = fr_3;}
            if(D4.getLabel() == "5"){instList4[3] = fr_4;}
            if(D4.getLabel() == "6"){instList4[3] = fr_5;}
            if(D4.getLabel() == "7"){instList4[3] = fr_6;}
            
             if(E4.getLabel() == "1"){instList4[3] = fr_0;}
            if(E4.getLabel() == "2"){instList4[3] = fr_1;}
            if(E4.getLabel() == "3"){instList4[3] = fr_2;}
            if(E4.getLabel() == "4"){instList4[3] = fr_3;}
            if(E4.getLabel() == "5"){instList4[3] = fr_4;}
            if(E4.getLabel() == "6"){instList4[3] = fr_5;}
            if(E4.getLabel() == "7"){instList4[3] = fr_6;}
            
             if(F4.getLabel() == "1"){instList4[3] = fr_0;}
            if(F4.getLabel() == "2"){instList4[3] = fr_1;}
            if(F4.getLabel() == "3"){instList4[3] = fr_2;}
            if(F4.getLabel() == "4"){instList4[3] = fr_3;}
            if(F4.getLabel() == "5"){instList4[3] = fr_4;}
            if(F4.getLabel() == "6"){instList4[3] = fr_5;}
            if(F4.getLabel() == "7"){instList4[3] = fr_6;}
            
             if(G4.getLabel() == "1"){instList4[3] = fr_0;}
            if(G4.getLabel() == "2"){instList4[3] = fr_1;}
            if(G4.getLabel() == "3"){instList4[3] = fr_2;}
            if(G4.getLabel() == "4"){instList4[3] = fr_3;}
            if(G4.getLabel() == "5"){instList4[3] = fr_4;}
            if(G4.getLabel() == "6"){instList4[3] = fr_5;}
            if(G4.getLabel() == "7"){instList4[3] = fr_6;}
            
             if(H4.getLabel() == "1"){instList4[3] = fr_0;}
            if(H4.getLabel() == "2"){instList4[3] = fr_1;}
            if(H4.getLabel() == "3"){instList4[3] = fr_2;}
            if(H4.getLabel() == "4"){instList4[3] = fr_3;}
            if(H4.getLabel() == "5"){instList4[3] = fr_4;}
            if(H4.getLabel() == "6"){instList4[3] = fr_5;}
            if(H4.getLabel() == "7"){instList4[3] = fr_6;}
          }
          if(A4p.getLabel() == "Tr1" || B4p.getLabel() == "Tr1" || C4p.getLabel() == "Tr1" || D4p.getLabel() == "Tr1" || E4p.getLabel() == "Tr1"){
            //instList4[0] = A4.getLabel();
            if(A4.getLabel() == "1"){instList4[0] = fr01;}
            if(A4.getLabel() == "2"){instList4[0] = fr11;}
            if(A4.getLabel() == "3"){instList4[0] = fr21;}
            if(A4.getLabel() == "4"){instList4[0] = fr31;}
            if(A4.getLabel() == "5"){instList4[0] = fr41;}
            if(A4.getLabel() == "6"){instList4[0] = fr51;}
            if(A4.getLabel() == "7"){instList4[0] = fr61;}
            
            if(B4.getLabel() == "1"){instList4[1] = fr01;}
            if(B4.getLabel() == "2"){instList4[1] = fr11;}
            if(B4.getLabel() == "3"){instList4[1] = fr21;}
            if(B4.getLabel() == "4"){instList4[1] = fr31;}
            if(B4.getLabel() == "5"){instList4[1] = fr41;}
            if(B4.getLabel() == "6"){instList4[1] = fr51;}
            if(B4.getLabel() == "7"){instList4[1] = fr61;}
            
            if(C4.getLabel() == "1"){instList4[2] = fr01;}
            if(C4.getLabel() == "2"){instList4[2] = fr11;}
            if(C4.getLabel() == "3"){instList4[2] = fr21;}
            if(C4.getLabel() == "4"){instList4[2] = fr31;}
            if(C4.getLabel() == "5"){instList4[2] = fr41;}
            if(C4.getLabel() == "6"){instList4[2] = fr51;}
            if(C4.getLabel() == "7"){instList4[2] = fr61;}
            
             if(D4.getLabel() == "1"){instList4[3] = fr01;}
            if(D4.getLabel() == "2"){instList4[3] = fr11;}
            if(D4.getLabel() == "3"){instList4[3] = fr21;}
            if(D4.getLabel() == "4"){instList4[3] = fr31;}
            if(D4.getLabel() == "5"){instList4[3] = fr41;}
            if(D4.getLabel() == "6"){instList4[3] = fr51;}
            if(D4.getLabel() == "7"){instList4[3] = fr61;}
            
             if(E4.getLabel() == "1"){instList4[3] = fr01;}
            if(E4.getLabel() == "2"){instList4[3] = fr11;}
            if(E4.getLabel() == "3"){instList4[3] = fr21;}
            if(E4.getLabel() == "4"){instList4[3] = fr31;}
            if(E4.getLabel() == "5"){instList4[3] = fr41;}
            if(E4.getLabel() == "6"){instList4[3] = fr51;}
            if(E4.getLabel() == "7"){instList4[3] = fr61;}
            
             if(F4.getLabel() == "1"){instList4[3] = fr01;}
            if(F4.getLabel() == "2"){instList4[3] = fr11;}
            if(F4.getLabel() == "3"){instList4[3] = fr21;}
            if(F4.getLabel() == "4"){instList4[3] = fr31;}
            if(F4.getLabel() == "5"){instList4[3] = fr41;}
            if(F4.getLabel() == "6"){instList4[3] = fr51;}
            if(F4.getLabel() == "7"){instList4[3] = fr61;}
            
             if(G4.getLabel() == "1"){instList4[3] = fr01;}
            if(G4.getLabel() == "2"){instList4[3] = fr11;}
            if(G4.getLabel() == "3"){instList4[3] = fr21;}
            if(G4.getLabel() == "4"){instList4[3] = fr31;}
            if(G4.getLabel() == "5"){instList4[3] = fr41;}
            if(G4.getLabel() == "6"){instList4[3] = fr51;}
            if(G4.getLabel() == "7"){instList4[3] = fr61;}
            
             if(H4.getLabel() == "1"){instList4[3] = fr01;}
            if(H4.getLabel() == "2"){instList4[3] = fr11;}
            if(H4.getLabel() == "3"){instList4[3] = fr21;}
            if(H4.getLabel() == "4"){instList4[3] = fr31;}
            if(H4.getLabel() == "5"){instList4[3] = fr41;}
            if(H4.getLabel() == "6"){instList4[3] = fr51;}
            if(H4.getLabel() == "7"){instList4[3] = fr61;}
          }
    }
    if(instrument5.getLabel() == "SYNTH"){
    if(A5p.getLabel() == "Tr0" || B5p.getLabel() == "Tr0" || C5p.getLabel() == "Tr0" || D5p.getLabel() == "Tr0" || E5p.getLabel() == "Tr0" || A5p.getLabel() == "" || B5p.getLabel() == "" || C5p.getLabel() == "" || 
        D5p.getLabel() == "" || E5p.getLabel() == ""){
            if(A5.getLabel() == "1"){instList5[0] = fr0;}
            if(A5.getLabel() == "2"){instList5[0] = fr1;}
            if(A5.getLabel() == "3"){instList5[0] = fr2;}
            if(A5.getLabel() == "4"){instList5[0] = fr3;}
            if(A5.getLabel() == "5"){instList5[0] = fr4;}
            if(A5.getLabel() == "6"){instList5[0] = fr5;}
            if(A5.getLabel() == "7"){instList5[0] = fr6;}
            
            if(B5.getLabel() == "1"){instList5[1] = fr0;}
            if(B5.getLabel() == "2"){instList5[1] = fr1;}
            if(B5.getLabel() == "3"){instList5[1] = fr2;}
            if(B5.getLabel() == "4"){instList5[1] = fr3;}
            if(B5.getLabel() == "5"){instList5[1] = fr4;}
            if(B5.getLabel() == "6"){instList5[1] = fr5;}
            if(B5.getLabel() == "7"){instList5[1] = fr6;}
            
            if(C5.getLabel() == "1"){instList5[2] = fr0;}
            if(C5.getLabel() == "2"){instList5[2] = fr1;}
            if(C5.getLabel() == "3"){instList5[2] = fr2;}
            if(C5.getLabel() == "4"){instList5[2] = fr3;}
            if(C5.getLabel() == "5"){instList5[2] = fr4;}
            if(C5.getLabel() == "6"){instList5[2] = fr5;}
            if(C5.getLabel() == "7"){instList5[2] = fr6;}
            
             if(D5.getLabel() == "1"){instList5[3] = fr0;}
            if(D5.getLabel() == "2"){instList5[3] = fr1;}
            if(D5.getLabel() == "3"){instList5[3] = fr2;}
            if(D5.getLabel() == "4"){instList5[3] = fr3;}
            if(D5.getLabel() == "5"){instList5[3] = fr4;}
            if(D5.getLabel() == "6"){instList5[3] = fr5;}
            if(D5.getLabel() == "7"){instList5[3] = fr6;}
            
             if(E5.getLabel() == "1"){instList5[3] = fr0;}
            if(E5.getLabel() == "2"){instList5[3] = fr1;}
            if(E5.getLabel() == "3"){instList5[3] = fr2;}
            if(E5.getLabel() == "4"){instList5[3] = fr3;}
            if(E5.getLabel() == "5"){instList5[3] = fr4;}
            if(E5.getLabel() == "6"){instList5[3] = fr5;}
            if(E5.getLabel() == "7"){instList5[3] = fr6;}
            
             if(F5.getLabel() == "1"){instList5[3] = fr0;}
            if(F5.getLabel() == "2"){instList5[3] = fr1;}
            if(F5.getLabel() == "3"){instList5[3] = fr2;}
            if(F5.getLabel() == "4"){instList5[3] = fr3;}
            if(F5.getLabel() == "5"){instList5[3] = fr4;}
            if(F5.getLabel() == "6"){instList5[3] = fr5;}
            if(F5.getLabel() == "7"){instList5[3] = fr6;}
            
             if(G5.getLabel() == "1"){instList5[3] = fr0;}
            if(G5.getLabel() == "2"){instList5[3] = fr1;}
            if(G5.getLabel() == "3"){instList5[3] = fr2;}
            if(G5.getLabel() == "4"){instList5[3] = fr3;}
            if(G5.getLabel() == "5"){instList5[3] = fr4;}
            if(G5.getLabel() == "6"){instList5[3] = fr5;}
            if(G5.getLabel() == "7"){instList5[3] = fr6;}
            
             if(H5.getLabel() == "1"){instList5[3] = fr0;}
            if(H5.getLabel() == "2"){instList5[3] = fr1;}
            if(H5.getLabel() == "3"){instList5[3] = fr2;}
            if(H5.getLabel() == "4"){instList5[3] = fr3;}
            if(H5.getLabel() == "5"){instList5[3] = fr4;}
            if(H5.getLabel() == "6"){instList5[3] = fr5;}
            if(H5.getLabel() == "7"){instList5[3] = fr6;}
          }
          if(A5p.getLabel() == "Tr-1" || B5p.getLabel() == "Tr-1" || C5p.getLabel() == "Tr-1" || D5p.getLabel() == "Tr-1" || E5p.getLabel() == "Tr-1"){
            //instList5[0] = A5.getLabel();
            if(A5.getLabel() == "1"){instList5[0] = fr_0;}
            if(A5.getLabel() == "2"){instList5[0] = fr_1;}
            if(A5.getLabel() == "3"){instList5[0] = fr_2;}
            if(A5.getLabel() == "4"){instList5[0] = fr_3;}
            if(A5.getLabel() == "5"){instList5[0] = fr_4;}
            if(A5.getLabel() == "6"){instList5[0] = fr_5;}
            if(A5.getLabel() == "7"){instList5[0] = fr_6;}
            
            if(B5.getLabel() == "1"){instList5[1] = fr_0;}
            if(B5.getLabel() == "2"){instList5[1] = fr_1;}
            if(B5.getLabel() == "3"){instList5[1] = fr_2;}
            if(B5.getLabel() == "4"){instList5[1] = fr_3;}
            if(B5.getLabel() == "5"){instList5[1] = fr_4;}
            if(B5.getLabel() == "6"){instList5[1] = fr_5;}
            if(B5.getLabel() == "7"){instList5[1] = fr_6;}
            
            if(C5.getLabel() == "1"){instList5[2] = fr_0;}
            if(C5.getLabel() == "2"){instList5[2] = fr_1;}
            if(C5.getLabel() == "3"){instList5[2] = fr_2;}
            if(C5.getLabel() == "4"){instList5[2] = fr_3;}
            if(C5.getLabel() == "5"){instList5[2] = fr_4;}
            if(C5.getLabel() == "6"){instList5[2] = fr_5;}
            if(C5.getLabel() == "7"){instList5[2] = fr_6;}
            
             if(D5.getLabel() == "1"){instList5[3] = fr_0;}
            if(D5.getLabel() == "2"){instList5[3] = fr_1;}
            if(D5.getLabel() == "3"){instList5[3] = fr_2;}
            if(D5.getLabel() == "4"){instList5[3] = fr_3;}
            if(D5.getLabel() == "5"){instList5[3] = fr_4;}
            if(D5.getLabel() == "6"){instList5[3] = fr_5;}
            if(D5.getLabel() == "7"){instList5[3] = fr_6;}
            
             if(E5.getLabel() == "1"){instList5[3] = fr_0;}
            if(E5.getLabel() == "2"){instList5[3] = fr_1;}
            if(E5.getLabel() == "3"){instList5[3] = fr_2;}
            if(E5.getLabel() == "4"){instList5[3] = fr_3;}
            if(E5.getLabel() == "5"){instList5[3] = fr_4;}
            if(E5.getLabel() == "6"){instList5[3] = fr_5;}
            if(E5.getLabel() == "7"){instList5[3] = fr_6;}
            
             if(F5.getLabel() == "1"){instList5[3] = fr_0;}
            if(F5.getLabel() == "2"){instList5[3] = fr_1;}
            if(F5.getLabel() == "3"){instList5[3] = fr_2;}
            if(F5.getLabel() == "4"){instList5[3] = fr_3;}
            if(F5.getLabel() == "5"){instList5[3] = fr_4;}
            if(F5.getLabel() == "6"){instList5[3] = fr_5;}
            if(F5.getLabel() == "7"){instList5[3] = fr_6;}
            
             if(G5.getLabel() == "1"){instList5[3] = fr_0;}
            if(G5.getLabel() == "2"){instList5[3] = fr_1;}
            if(G5.getLabel() == "3"){instList5[3] = fr_2;}
            if(G5.getLabel() == "4"){instList5[3] = fr_3;}
            if(G5.getLabel() == "5"){instList5[3] = fr_4;}
            if(G5.getLabel() == "6"){instList5[3] = fr_5;}
            if(G5.getLabel() == "7"){instList5[3] = fr_6;}
            
             if(H5.getLabel() == "1"){instList5[3] = fr_0;}
            if(H5.getLabel() == "2"){instList5[3] = fr_1;}
            if(H5.getLabel() == "3"){instList5[3] = fr_2;}
            if(H5.getLabel() == "4"){instList5[3] = fr_3;}
            if(H5.getLabel() == "5"){instList5[3] = fr_4;}
            if(H5.getLabel() == "6"){instList5[3] = fr_5;}
            if(H5.getLabel() == "7"){instList5[3] = fr_6;}
          }
          if(A5p.getLabel() == "Tr1" || B5p.getLabel() == "Tr1" || C5p.getLabel() == "Tr1" || D5p.getLabel() == "Tr1" || E5p.getLabel() == "Tr1"){
            //instList5[0] = A5.getLabel();
            if(A5.getLabel() == "1"){instList5[0] = fr01;}
            if(A5.getLabel() == "2"){instList5[0] = fr11;}
            if(A5.getLabel() == "3"){instList5[0] = fr21;}
            if(A5.getLabel() == "4"){instList5[0] = fr31;}
            if(A5.getLabel() == "5"){instList5[0] = fr41;}
            if(A5.getLabel() == "6"){instList5[0] = fr51;}
            if(A5.getLabel() == "7"){instList5[0] = fr61;}
            
            if(B5.getLabel() == "1"){instList5[1] = fr01;}
            if(B5.getLabel() == "2"){instList5[1] = fr11;}
            if(B5.getLabel() == "3"){instList5[1] = fr21;}
            if(B5.getLabel() == "4"){instList5[1] = fr31;}
            if(B5.getLabel() == "5"){instList5[1] = fr41;}
            if(B5.getLabel() == "6"){instList5[1] = fr51;}
            if(B5.getLabel() == "7"){instList5[1] = fr61;}
            
            if(C5.getLabel() == "1"){instList5[2] = fr01;}
            if(C5.getLabel() == "2"){instList5[2] = fr11;}
            if(C5.getLabel() == "3"){instList5[2] = fr21;}
            if(C5.getLabel() == "4"){instList5[2] = fr31;}
            if(C5.getLabel() == "5"){instList5[2] = fr41;}
            if(C5.getLabel() == "6"){instList5[2] = fr51;}
            if(C5.getLabel() == "7"){instList5[2] = fr61;}
            
             if(D5.getLabel() == "1"){instList5[3] = fr01;}
            if(D5.getLabel() == "2"){instList5[3] = fr11;}
            if(D5.getLabel() == "3"){instList5[3] = fr21;}
            if(D5.getLabel() == "4"){instList5[3] = fr31;}
            if(D5.getLabel() == "5"){instList5[3] = fr41;}
            if(D5.getLabel() == "6"){instList5[3] = fr51;}
            if(D5.getLabel() == "7"){instList5[3] = fr61;}
            
             if(E5.getLabel() == "1"){instList5[3] = fr01;}
            if(E5.getLabel() == "2"){instList5[3] = fr11;}
            if(E5.getLabel() == "3"){instList5[3] = fr21;}
            if(E5.getLabel() == "4"){instList5[3] = fr31;}
            if(E5.getLabel() == "5"){instList5[3] = fr41;}
            if(E5.getLabel() == "6"){instList5[3] = fr51;}
            if(E5.getLabel() == "7"){instList5[3] = fr61;}
            
             if(F5.getLabel() == "1"){instList5[3] = fr01;}
            if(F5.getLabel() == "2"){instList5[3] = fr11;}
            if(F5.getLabel() == "3"){instList5[3] = fr21;}
            if(F5.getLabel() == "4"){instList5[3] = fr31;}
            if(F5.getLabel() == "5"){instList5[3] = fr41;}
            if(F5.getLabel() == "6"){instList5[3] = fr51;}
            if(F5.getLabel() == "7"){instList5[3] = fr61;}
            
             if(G5.getLabel() == "1"){instList5[3] = fr01;}
            if(G5.getLabel() == "2"){instList5[3] = fr11;}
            if(G5.getLabel() == "3"){instList5[3] = fr21;}
            if(G5.getLabel() == "4"){instList5[3] = fr31;}
            if(G5.getLabel() == "5"){instList5[3] = fr41;}
            if(G5.getLabel() == "6"){instList5[3] = fr51;}
            if(G5.getLabel() == "7"){instList5[3] = fr61;}
            
             if(H5.getLabel() == "1"){instList5[3] = fr01;}
            if(H5.getLabel() == "2"){instList5[3] = fr11;}
            if(H5.getLabel() == "3"){instList5[3] = fr21;}
            if(H5.getLabel() == "4"){instList5[3] = fr31;}
            if(H5.getLabel() == "5"){instList5[3] = fr41;}
            if(H5.getLabel() == "6"){instList5[3] = fr51;}
            if(H5.getLabel() == "7"){instList5[3] = fr61;}
          }
    }
    if(instrument6.getLabel() == "SYNTH"){
      if(A6p.getLabel() == "Tr0" || B6p.getLabel() == "Tr0" || C6p.getLabel() == "Tr0" || D6p.getLabel() == "Tr0" || E6p.getLabel() == "Tr0" || A6p.getLabel() == "" || B6p.getLabel() == "" || C6p.getLabel() == "" || 
        D6p.getLabel() == "" || E6p.getLabel() == ""){
            if(A6.getLabel() == "1"){instList6[0] = fr0;}
            if(A6.getLabel() == "2"){instList6[0] = fr1;}
            if(A6.getLabel() == "3"){instList6[0] = fr2;}
            if(A6.getLabel() == "4"){instList6[0] = fr3;}
            if(A6.getLabel() == "5"){instList6[0] = fr4;}
            if(A6.getLabel() == "6"){instList6[0] = fr5;}
            if(A6.getLabel() == "7"){instList6[0] = fr6;}
            
            if(B6.getLabel() == "1"){instList6[1] = fr0;}
            if(B6.getLabel() == "2"){instList6[1] = fr1;}
            if(B6.getLabel() == "3"){instList6[1] = fr2;}
            if(B6.getLabel() == "4"){instList6[1] = fr3;}
            if(B6.getLabel() == "5"){instList6[1] = fr4;}
            if(B6.getLabel() == "6"){instList6[1] = fr5;}
            if(B6.getLabel() == "7"){instList6[1] = fr6;}
            
            if(C6.getLabel() == "1"){instList6[2] = fr0;}
            if(C6.getLabel() == "2"){instList6[2] = fr1;}
            if(C6.getLabel() == "3"){instList6[2] = fr2;}
            if(C6.getLabel() == "4"){instList6[2] = fr3;}
            if(C6.getLabel() == "5"){instList6[2] = fr4;}
            if(C6.getLabel() == "6"){instList6[2] = fr5;}
            if(C6.getLabel() == "7"){instList6[2] = fr6;}
            
             if(D6.getLabel() == "1"){instList6[3] = fr0;}
            if(D6.getLabel() == "2"){instList6[3] = fr1;}
            if(D6.getLabel() == "3"){instList6[3] = fr2;}
            if(D6.getLabel() == "4"){instList6[3] = fr3;}
            if(D6.getLabel() == "5"){instList6[3] = fr4;}
            if(D6.getLabel() == "6"){instList6[3] = fr5;}
            if(D6.getLabel() == "7"){instList6[3] = fr6;}
            
             if(E6.getLabel() == "1"){instList6[3] = fr0;}
            if(E6.getLabel() == "2"){instList6[3] = fr1;}
            if(E6.getLabel() == "3"){instList6[3] = fr2;}
            if(E6.getLabel() == "4"){instList6[3] = fr3;}
            if(E6.getLabel() == "5"){instList6[3] = fr4;}
            if(E6.getLabel() == "6"){instList6[3] = fr5;}
            if(E6.getLabel() == "7"){instList6[3] = fr6;}
            
             if(F6.getLabel() == "1"){instList6[3] = fr0;}
            if(F6.getLabel() == "2"){instList6[3] = fr1;}
            if(F6.getLabel() == "3"){instList6[3] = fr2;}
            if(F6.getLabel() == "4"){instList6[3] = fr3;}
            if(F6.getLabel() == "5"){instList6[3] = fr4;}
            if(F6.getLabel() == "6"){instList6[3] = fr5;}
            if(F6.getLabel() == "7"){instList6[3] = fr6;}
            
             if(G6.getLabel() == "1"){instList6[3] = fr0;}
            if(G6.getLabel() == "2"){instList6[3] = fr1;}
            if(G6.getLabel() == "3"){instList6[3] = fr2;}
            if(G6.getLabel() == "4"){instList6[3] = fr3;}
            if(G6.getLabel() == "5"){instList6[3] = fr4;}
            if(G6.getLabel() == "6"){instList6[3] = fr5;}
            if(G6.getLabel() == "7"){instList6[3] = fr6;}
            
             if(H6.getLabel() == "1"){instList6[3] = fr0;}
            if(H6.getLabel() == "2"){instList6[3] = fr1;}
            if(H6.getLabel() == "3"){instList6[3] = fr2;}
            if(H6.getLabel() == "4"){instList6[3] = fr3;}
            if(H6.getLabel() == "5"){instList6[3] = fr4;}
            if(H6.getLabel() == "6"){instList6[3] = fr5;}
            if(H6.getLabel() == "7"){instList6[3] = fr6;}
          }
          if(A6p.getLabel() == "Tr-1" || B6p.getLabel() == "Tr-1" || C6p.getLabel() == "Tr-1" || D6p.getLabel() == "Tr-1" || E6p.getLabel() == "Tr-1"){
            //instList6[0] = A6.getLabel();
            if(A6.getLabel() == "1"){instList6[0] = fr_0;}
            if(A6.getLabel() == "2"){instList6[0] = fr_1;}
            if(A6.getLabel() == "3"){instList6[0] = fr_2;}
            if(A6.getLabel() == "4"){instList6[0] = fr_3;}
            if(A6.getLabel() == "5"){instList6[0] = fr_4;}
            if(A6.getLabel() == "6"){instList6[0] = fr_5;}
            if(A6.getLabel() == "7"){instList6[0] = fr_6;}
            
            if(B6.getLabel() == "1"){instList6[1] = fr_0;}
            if(B6.getLabel() == "2"){instList6[1] = fr_1;}
            if(B6.getLabel() == "3"){instList6[1] = fr_2;}
            if(B6.getLabel() == "4"){instList6[1] = fr_3;}
            if(B6.getLabel() == "5"){instList6[1] = fr_4;}
            if(B6.getLabel() == "6"){instList6[1] = fr_5;}
            if(B6.getLabel() == "7"){instList6[1] = fr_6;}
            
            if(C6.getLabel() == "1"){instList6[2] = fr_0;}
            if(C6.getLabel() == "2"){instList6[2] = fr_1;}
            if(C6.getLabel() == "3"){instList6[2] = fr_2;}
            if(C6.getLabel() == "4"){instList6[2] = fr_3;}
            if(C6.getLabel() == "5"){instList6[2] = fr_4;}
            if(C6.getLabel() == "6"){instList6[2] = fr_5;}
            if(C6.getLabel() == "7"){instList6[2] = fr_6;}
            
             if(D6.getLabel() == "1"){instList6[3] = fr_0;}
            if(D6.getLabel() == "2"){instList6[3] = fr_1;}
            if(D6.getLabel() == "3"){instList6[3] = fr_2;}
            if(D6.getLabel() == "4"){instList6[3] = fr_3;}
            if(D6.getLabel() == "5"){instList6[3] = fr_4;}
            if(D6.getLabel() == "6"){instList6[3] = fr_5;}
            if(D6.getLabel() == "7"){instList6[3] = fr_6;}
            
             if(E6.getLabel() == "1"){instList6[3] = fr_0;}
            if(E6.getLabel() == "2"){instList6[3] = fr_1;}
            if(E6.getLabel() == "3"){instList6[3] = fr_2;}
            if(E6.getLabel() == "4"){instList6[3] = fr_3;}
            if(E6.getLabel() == "5"){instList6[3] = fr_4;}
            if(E6.getLabel() == "6"){instList6[3] = fr_5;}
            if(E6.getLabel() == "7"){instList6[3] = fr_6;}
            
             if(F6.getLabel() == "1"){instList6[3] = fr_0;}
            if(F6.getLabel() == "2"){instList6[3] = fr_1;}
            if(F6.getLabel() == "3"){instList6[3] = fr_2;}
            if(F6.getLabel() == "4"){instList6[3] = fr_3;}
            if(F6.getLabel() == "5"){instList6[3] = fr_4;}
            if(F6.getLabel() == "6"){instList6[3] = fr_5;}
            if(F6.getLabel() == "7"){instList6[3] = fr_6;}
            
             if(G6.getLabel() == "1"){instList6[3] = fr_0;}
            if(G6.getLabel() == "2"){instList6[3] = fr_1;}
            if(G6.getLabel() == "3"){instList6[3] = fr_2;}
            if(G6.getLabel() == "4"){instList6[3] = fr_3;}
            if(G6.getLabel() == "5"){instList6[3] = fr_4;}
            if(G6.getLabel() == "6"){instList6[3] = fr_5;}
            if(G6.getLabel() == "7"){instList6[3] = fr_6;}
            
             if(H6.getLabel() == "1"){instList6[3] = fr_0;}
            if(H6.getLabel() == "2"){instList6[3] = fr_1;}
            if(H6.getLabel() == "3"){instList6[3] = fr_2;}
            if(H6.getLabel() == "4"){instList6[3] = fr_3;}
            if(H6.getLabel() == "5"){instList6[3] = fr_4;}
            if(H6.getLabel() == "6"){instList6[3] = fr_5;}
            if(H6.getLabel() == "7"){instList6[3] = fr_6;}
          }
          if(A6p.getLabel() == "Tr1" || B6p.getLabel() == "Tr1" || C6p.getLabel() == "Tr1" || D6p.getLabel() == "Tr1" || E6p.getLabel() == "Tr1"){
            //instList6[0] = A6.getLabel();
            if(A6.getLabel() == "1"){instList6[0] = fr01;}
            if(A6.getLabel() == "2"){instList6[0] = fr11;}
            if(A6.getLabel() == "3"){instList6[0] = fr21;}
            if(A6.getLabel() == "4"){instList6[0] = fr31;}
            if(A6.getLabel() == "5"){instList6[0] = fr41;}
            if(A6.getLabel() == "6"){instList6[0] = fr51;}
            if(A6.getLabel() == "7"){instList6[0] = fr61;}
            
            if(B6.getLabel() == "1"){instList6[1] = fr01;}
            if(B6.getLabel() == "2"){instList6[1] = fr11;}
            if(B6.getLabel() == "3"){instList6[1] = fr21;}
            if(B6.getLabel() == "4"){instList6[1] = fr31;}
            if(B6.getLabel() == "5"){instList6[1] = fr41;}
            if(B6.getLabel() == "6"){instList6[1] = fr51;}
            if(B6.getLabel() == "7"){instList6[1] = fr61;}
            
            if(C6.getLabel() == "1"){instList6[2] = fr01;}
            if(C6.getLabel() == "2"){instList6[2] = fr11;}
            if(C6.getLabel() == "3"){instList6[2] = fr21;}
            if(C6.getLabel() == "4"){instList6[2] = fr31;}
            if(C6.getLabel() == "5"){instList6[2] = fr41;}
            if(C6.getLabel() == "6"){instList6[2] = fr51;}
            if(C6.getLabel() == "7"){instList6[2] = fr61;}
            
             if(D6.getLabel() == "1"){instList6[3] = fr01;}
            if(D6.getLabel() == "2"){instList6[3] = fr11;}
            if(D6.getLabel() == "3"){instList6[3] = fr21;}
            if(D6.getLabel() == "4"){instList6[3] = fr31;}
            if(D6.getLabel() == "5"){instList6[3] = fr41;}
            if(D6.getLabel() == "6"){instList6[3] = fr51;}
            if(D6.getLabel() == "7"){instList6[3] = fr61;}
            
             if(E6.getLabel() == "1"){instList6[3] = fr01;}
            if(E6.getLabel() == "2"){instList6[3] = fr11;}
            if(E6.getLabel() == "3"){instList6[3] = fr21;}
            if(E6.getLabel() == "4"){instList6[3] = fr31;}
            if(E6.getLabel() == "5"){instList6[3] = fr41;}
            if(E6.getLabel() == "6"){instList6[3] = fr51;}
            if(E6.getLabel() == "7"){instList6[3] = fr61;}
            
             if(F6.getLabel() == "1"){instList6[3] = fr01;}
            if(F6.getLabel() == "2"){instList6[3] = fr11;}
            if(F6.getLabel() == "3"){instList6[3] = fr21;}
            if(F6.getLabel() == "4"){instList6[3] = fr31;}
            if(F6.getLabel() == "5"){instList6[3] = fr41;}
            if(F6.getLabel() == "6"){instList6[3] = fr51;}
            if(F6.getLabel() == "7"){instList6[3] = fr61;}
            
             if(G6.getLabel() == "1"){instList6[3] = fr01;}
            if(G6.getLabel() == "2"){instList6[3] = fr11;}
            if(G6.getLabel() == "3"){instList6[3] = fr21;}
            if(G6.getLabel() == "4"){instList6[3] = fr31;}
            if(G6.getLabel() == "5"){instList6[3] = fr41;}
            if(G6.getLabel() == "6"){instList6[3] = fr51;}
            if(G6.getLabel() == "7"){instList6[3] = fr61;}
            
             if(H6.getLabel() == "1"){instList6[3] = fr01;}
            if(H6.getLabel() == "2"){instList6[3] = fr11;}
            if(H6.getLabel() == "3"){instList6[3] = fr21;}
            if(H6.getLabel() == "4"){instList6[3] = fr31;}
            if(H6.getLabel() == "5"){instList6[3] = fr41;}
            if(H6.getLabel() == "6"){instList6[3] = fr51;}
            if(H6.getLabel() == "7"){instList6[3] = fr61;}
          }
    }
    if(instrument7.getLabel() == "SYNTH"){
      if(A7p.getLabel() == "Tr0" || B7p.getLabel() == "Tr0" || C7p.getLabel() == "Tr0" || D7p.getLabel() == "Tr0" || E7p.getLabel() == "Tr0" || A7p.getLabel() == "" || B7p.getLabel() == "" || C7p.getLabel() == "" || 
        D7p.getLabel() == "" || E7p.getLabel() == ""){
            if(A7.getLabel() == "1"){instList7[0] = fr0;}
            if(A7.getLabel() == "2"){instList7[0] = fr1;}
            if(A7.getLabel() == "3"){instList7[0] = fr2;}
            if(A7.getLabel() == "4"){instList7[0] = fr3;}
            if(A7.getLabel() == "5"){instList7[0] = fr4;}
            if(A7.getLabel() == "6"){instList7[0] = fr5;}
            if(A7.getLabel() == "7"){instList7[0] = fr6;}
            
            if(B7.getLabel() == "1"){instList7[1] = fr0;}
            if(B7.getLabel() == "2"){instList7[1] = fr1;}
            if(B7.getLabel() == "3"){instList7[1] = fr2;}
            if(B7.getLabel() == "4"){instList7[1] = fr3;}
            if(B7.getLabel() == "5"){instList7[1] = fr4;}
            if(B7.getLabel() == "6"){instList7[1] = fr5;}
            if(B7.getLabel() == "7"){instList7[1] = fr6;}
            
            if(C7.getLabel() == "1"){instList7[2] = fr0;}
            if(C7.getLabel() == "2"){instList7[2] = fr1;}
            if(C7.getLabel() == "3"){instList7[2] = fr2;}
            if(C7.getLabel() == "4"){instList7[2] = fr3;}
            if(C7.getLabel() == "5"){instList7[2] = fr4;}
            if(C7.getLabel() == "6"){instList7[2] = fr5;}
            if(C7.getLabel() == "7"){instList7[2] = fr6;}
            
             if(D7.getLabel() == "1"){instList7[3] = fr0;}
            if(D7.getLabel() == "2"){instList7[3] = fr1;}
            if(D7.getLabel() == "3"){instList7[3] = fr2;}
            if(D7.getLabel() == "4"){instList7[3] = fr3;}
            if(D7.getLabel() == "5"){instList7[3] = fr4;}
            if(D7.getLabel() == "6"){instList7[3] = fr5;}
            if(D7.getLabel() == "7"){instList7[3] = fr6;}
            
             if(E7.getLabel() == "1"){instList7[3] = fr0;}
            if(E7.getLabel() == "2"){instList7[3] = fr1;}
            if(E7.getLabel() == "3"){instList7[3] = fr2;}
            if(E7.getLabel() == "4"){instList7[3] = fr3;}
            if(E7.getLabel() == "5"){instList7[3] = fr4;}
            if(E7.getLabel() == "6"){instList7[3] = fr5;}
            if(E7.getLabel() == "7"){instList7[3] = fr6;}
            
             if(F7.getLabel() == "1"){instList7[3] = fr0;}
            if(F7.getLabel() == "2"){instList7[3] = fr1;}
            if(F7.getLabel() == "3"){instList7[3] = fr2;}
            if(F7.getLabel() == "4"){instList7[3] = fr3;}
            if(F7.getLabel() == "5"){instList7[3] = fr4;}
            if(F7.getLabel() == "6"){instList7[3] = fr5;}
            if(F7.getLabel() == "7"){instList7[3] = fr6;}
            
             if(G7.getLabel() == "1"){instList7[3] = fr0;}
            if(G7.getLabel() == "2"){instList7[3] = fr1;}
            if(G7.getLabel() == "3"){instList7[3] = fr2;}
            if(G7.getLabel() == "4"){instList7[3] = fr3;}
            if(G7.getLabel() == "5"){instList7[3] = fr4;}
            if(G7.getLabel() == "6"){instList7[3] = fr5;}
            if(G7.getLabel() == "7"){instList7[3] = fr6;}
            
             if(H7.getLabel() == "1"){instList7[3] = fr0;}
            if(H7.getLabel() == "2"){instList7[3] = fr1;}
            if(H7.getLabel() == "3"){instList7[3] = fr2;}
            if(H7.getLabel() == "4"){instList7[3] = fr3;}
            if(H7.getLabel() == "5"){instList7[3] = fr4;}
            if(H7.getLabel() == "6"){instList7[3] = fr5;}
            if(H7.getLabel() == "7"){instList7[3] = fr6;}
          }
          if(A7p.getLabel() == "Tr-1" || B7p.getLabel() == "Tr-1" || C7p.getLabel() == "Tr-1" || D7p.getLabel() == "Tr-1" || E7p.getLabel() == "Tr-1"){
            //instList7[0] = A7.getLabel();
            if(A7.getLabel() == "1"){instList7[0] = fr_0;}
            if(A7.getLabel() == "2"){instList7[0] = fr_1;}
            if(A7.getLabel() == "3"){instList7[0] = fr_2;}
            if(A7.getLabel() == "4"){instList7[0] = fr_3;}
            if(A7.getLabel() == "5"){instList7[0] = fr_4;}
            if(A7.getLabel() == "6"){instList7[0] = fr_5;}
            if(A7.getLabel() == "7"){instList7[0] = fr_6;}
            
            if(B7.getLabel() == "1"){instList7[1] = fr_0;}
            if(B7.getLabel() == "2"){instList7[1] = fr_1;}
            if(B7.getLabel() == "3"){instList7[1] = fr_2;}
            if(B7.getLabel() == "4"){instList7[1] = fr_3;}
            if(B7.getLabel() == "5"){instList7[1] = fr_4;}
            if(B7.getLabel() == "6"){instList7[1] = fr_5;}
            if(B7.getLabel() == "7"){instList7[1] = fr_6;}
            
            if(C7.getLabel() == "1"){instList7[2] = fr_0;}
            if(C7.getLabel() == "2"){instList7[2] = fr_1;}
            if(C7.getLabel() == "3"){instList7[2] = fr_2;}
            if(C7.getLabel() == "4"){instList7[2] = fr_3;}
            if(C7.getLabel() == "5"){instList7[2] = fr_4;}
            if(C7.getLabel() == "6"){instList7[2] = fr_5;}
            if(C7.getLabel() == "7"){instList7[2] = fr_6;}
            
             if(D7.getLabel() == "1"){instList7[3] = fr_0;}
            if(D7.getLabel() == "2"){instList7[3] = fr_1;}
            if(D7.getLabel() == "3"){instList7[3] = fr_2;}
            if(D7.getLabel() == "4"){instList7[3] = fr_3;}
            if(D7.getLabel() == "5"){instList7[3] = fr_4;}
            if(D7.getLabel() == "6"){instList7[3] = fr_5;}
            if(D7.getLabel() == "7"){instList7[3] = fr_6;}
            
             if(E7.getLabel() == "1"){instList7[3] = fr_0;}
            if(E7.getLabel() == "2"){instList7[3] = fr_1;}
            if(E7.getLabel() == "3"){instList7[3] = fr_2;}
            if(E7.getLabel() == "4"){instList7[3] = fr_3;}
            if(E7.getLabel() == "5"){instList7[3] = fr_4;}
            if(E7.getLabel() == "6"){instList7[3] = fr_5;}
            if(E7.getLabel() == "7"){instList7[3] = fr_6;}
            
             if(F7.getLabel() == "1"){instList7[3] = fr_0;}
            if(F7.getLabel() == "2"){instList7[3] = fr_1;}
            if(F7.getLabel() == "3"){instList7[3] = fr_2;}
            if(F7.getLabel() == "4"){instList7[3] = fr_3;}
            if(F7.getLabel() == "5"){instList7[3] = fr_4;}
            if(F7.getLabel() == "6"){instList7[3] = fr_5;}
            if(F7.getLabel() == "7"){instList7[3] = fr_6;}
            
             if(G7.getLabel() == "1"){instList7[3] = fr_0;}
            if(G7.getLabel() == "2"){instList7[3] = fr_1;}
            if(G7.getLabel() == "3"){instList7[3] = fr_2;}
            if(G7.getLabel() == "4"){instList7[3] = fr_3;}
            if(G7.getLabel() == "5"){instList7[3] = fr_4;}
            if(G7.getLabel() == "6"){instList7[3] = fr_5;}
            if(G7.getLabel() == "7"){instList7[3] = fr_6;}
            
             if(H7.getLabel() == "1"){instList7[3] = fr_0;}
            if(H7.getLabel() == "2"){instList7[3] = fr_1;}
            if(H7.getLabel() == "3"){instList7[3] = fr_2;}
            if(H7.getLabel() == "4"){instList7[3] = fr_3;}
            if(H7.getLabel() == "5"){instList7[3] = fr_4;}
            if(H7.getLabel() == "6"){instList7[3] = fr_5;}
            if(H7.getLabel() == "7"){instList7[3] = fr_6;}
          }
          if(A7p.getLabel() == "Tr1" || B7p.getLabel() == "Tr1" || C7p.getLabel() == "Tr1" || D7p.getLabel() == "Tr1" || E7p.getLabel() == "Tr1"){
            //instList7[0] = A7.getLabel();
            if(A7.getLabel() == "1"){instList7[0] = fr01;}
            if(A7.getLabel() == "2"){instList7[0] = fr11;}
            if(A7.getLabel() == "3"){instList7[0] = fr21;}
            if(A7.getLabel() == "4"){instList7[0] = fr31;}
            if(A7.getLabel() == "5"){instList7[0] = fr41;}
            if(A7.getLabel() == "6"){instList7[0] = fr51;}
            if(A7.getLabel() == "7"){instList7[0] = fr61;}
            
            if(B7.getLabel() == "1"){instList7[1] = fr01;}
            if(B7.getLabel() == "2"){instList7[1] = fr11;}
            if(B7.getLabel() == "3"){instList7[1] = fr21;}
            if(B7.getLabel() == "4"){instList7[1] = fr31;}
            if(B7.getLabel() == "5"){instList7[1] = fr41;}
            if(B7.getLabel() == "6"){instList7[1] = fr51;}
            if(B7.getLabel() == "7"){instList7[1] = fr61;}
            
            if(C7.getLabel() == "1"){instList7[2] = fr01;}
            if(C7.getLabel() == "2"){instList7[2] = fr11;}
            if(C7.getLabel() == "3"){instList7[2] = fr21;}
            if(C7.getLabel() == "4"){instList7[2] = fr31;}
            if(C7.getLabel() == "5"){instList7[2] = fr41;}
            if(C7.getLabel() == "6"){instList7[2] = fr51;}
            if(C7.getLabel() == "7"){instList7[2] = fr61;}
            
             if(D7.getLabel() == "1"){instList7[3] = fr01;}
            if(D7.getLabel() == "2"){instList7[3] = fr11;}
            if(D7.getLabel() == "3"){instList7[3] = fr21;}
            if(D7.getLabel() == "4"){instList7[3] = fr31;}
            if(D7.getLabel() == "5"){instList7[3] = fr41;}
            if(D7.getLabel() == "6"){instList7[3] = fr51;}
            if(D7.getLabel() == "7"){instList7[3] = fr61;}
            
             if(E7.getLabel() == "1"){instList7[3] = fr01;}
            if(E7.getLabel() == "2"){instList7[3] = fr11;}
            if(E7.getLabel() == "3"){instList7[3] = fr21;}
            if(E7.getLabel() == "4"){instList7[3] = fr31;}
            if(E7.getLabel() == "5"){instList7[3] = fr41;}
            if(E7.getLabel() == "6"){instList7[3] = fr51;}
            if(E7.getLabel() == "7"){instList7[3] = fr61;}
            
             if(F7.getLabel() == "1"){instList7[3] = fr01;}
            if(F7.getLabel() == "2"){instList7[3] = fr11;}
            if(F7.getLabel() == "3"){instList7[3] = fr21;}
            if(F7.getLabel() == "4"){instList7[3] = fr31;}
            if(F7.getLabel() == "5"){instList7[3] = fr41;}
            if(F7.getLabel() == "6"){instList7[3] = fr51;}
            if(F7.getLabel() == "7"){instList7[3] = fr61;}
            
             if(G7.getLabel() == "1"){instList7[3] = fr01;}
            if(G7.getLabel() == "2"){instList7[3] = fr11;}
            if(G7.getLabel() == "3"){instList7[3] = fr21;}
            if(G7.getLabel() == "4"){instList7[3] = fr31;}
            if(G7.getLabel() == "5"){instList7[3] = fr41;}
            if(G7.getLabel() == "6"){instList7[3] = fr51;}
            if(G7.getLabel() == "7"){instList7[3] = fr61;}
            
             if(H7.getLabel() == "1"){instList7[3] = fr01;}
            if(H7.getLabel() == "2"){instList7[3] = fr11;}
            if(H7.getLabel() == "3"){instList7[3] = fr21;}
            if(H7.getLabel() == "4"){instList7[3] = fr31;}
            if(H7.getLabel() == "5"){instList7[3] = fr41;}
            if(H7.getLabel() == "6"){instList7[3] = fr51;}
            if(H7.getLabel() == "7"){instList7[3] = fr61;}
          }
    }
 }
 
 void runningthrough(){

    if(patList1 == 0){
       if(upward == 0){
         currentNotePosition = 0;
            cp5.get(controlP5.Button.class, "instrument" + 0).setColorBackground( color(255) );
            cp5.get(controlP5.Button.class, "instrument" + 1).setColorBackground( color(255) );
            cp5.get(controlP5.Button.class, "instrument" + 2).setColorBackground( color(255) );
            cp5.get(controlP5.Button.class, "instrument" + 3).setColorBackground( color(255) );
            cp5.get(controlP5.Button.class, "instrument" + 4).setColorBackground( color(255) );
            cp5.get(controlP5.Button.class, "instrument" + 5).setColorBackground( color(255) );
            cp5.get(controlP5.Button.class, "instrument" + 6).setColorBackground( color(255) );
            cp5.get(controlP5.Button.class, "instrument" + 7).setColorBackground( color(255) );
            
            cp5.get(controlP5.Button.class, "A" + 1).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "B" + 1).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "C" + 1).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "D" + 1).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "E" + 1).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "F" + 1).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "G" + 1).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "H" + 1).setColorBackground( color(#C6C6C6) );
          
           if (righty == -1){
            if( entVal_instrument == 2 && highlight == 1 ){
              patList2 = 0;
              instSelect[0] = 1;
            }
            else{
              //cp5.get(controlP5.Button.class, "instrument" + 0).setColorBackground( color(0, 255, 0) );
              cp5.get(controlP5.Button.class, "instrument" + 0).setColorBackground( color(0, 255, 0) );
              cp5.get(controlP5.Button.class, "A" + 0).setColorBackground( color(#C6C6C6) );
            }
          }
          if (righty == 0){
            instSelect[0] = 0;
            if(entVal_pattern == 1 && highlight == 1){
              if(instrument0.getLabel() == "SYNTH"){
                
                if ( synthSel == 1){
                    
                     notes();
                }
              }
              else {
                if(decision0[0] == 1){
                  decision0[0] = 0;
                }
                else
                  decision0[0] = 1;
                entVal_pattern = 0;
              }
              
          }
          else{
            cp5.get(controlP5.Button.class, "A" + 0).setColorBackground( color(0, 255, 0) );
            cp5.get(controlP5.Button.class, "B" + 0).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "instrument" + 0).setColorBackground( color(255) );
          }
        }
          if (righty == 1){
            if(entVal_pattern == 1 && highlight == 1){
              if(instrument0.getLabel() == "SYNTH"){
                if ( synthSel == 1){
                  currentNotePosition = 1;   
                  notes();
                }
              }
              else {
                if(decision0[1] == 1){
                  decision0[1] = 0;
                }
                else
                  decision0[1] = 1;
                entVal_pattern = 0;
              }
          }
          else{
            cp5.get(controlP5.Button.class, "B" + 0).setColorBackground( color(0, 255, 0) );
            cp5.get(controlP5.Button.class, "A" + 0).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "C" + 0).setColorBackground( color(#C6C6C6) );
          }
          }
          if (righty == 2){
            if(entVal_pattern == 1 && highlight == 1){
              if(instrument0.getLabel() == "SYNTH"){
                if ( synthSel == 1){
                     notes();
                }
              }
              else {
                if(decision0[2] == 1){
                  decision0[2] = 0;
                }
                else
                  decision0[2] = 1;
                entVal_pattern = 0;
              }
          }
          else{
            cp5.get(controlP5.Button.class, "C" + 0).setColorBackground( color(0, 255, 0) );
            cp5.get(controlP5.Button.class, "B" + 0).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "D" + 0).setColorBackground( color(#C6C6C6) );
          }
          }
          if (righty == 3){
            if(entVal_pattern == 1 && highlight == 1){
              if(instrument0.getLabel() == "SYNTH"){
                if ( synthSel == 1){
                     notes();
                }
              }
              else {
                if(decision0[3] == 1){
                  decision0[3] = 0;
                }
                else
                  decision0[3] = 1;
                entVal_pattern = 0;
              }
          }
          else{
            cp5.get(controlP5.Button.class, "D" + 0).setColorBackground( color(0, 255, 0) );
            cp5.get(controlP5.Button.class, "C" + 0).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "E" + 0).setColorBackground( color(#C6C6C6) );
            }
          }
          if (righty == 4){
            if(entVal_pattern == 1 && highlight == 1){
              if(instrument0.getLabel() == "SYNTH"){
                if ( synthSel == 1){
                      notes();
                }
              }
              else {
                if(decision0[4] == 1){
                  decision0[4] = 0;
                }
                else
                  decision0[4] = 1;
                entVal_pattern = 0;
              }
          }
          else{
            cp5.get(controlP5.Button.class, "E" + 0).setColorBackground( color(0, 255, 0) );
            cp5.get(controlP5.Button.class, "D" + 0).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "F" + 0).setColorBackground( color(#C6C6C6) );
          }
          }
          if (righty == 5){
            if(entVal_pattern == 1 && highlight == 1){
              if(instrument0.getLabel() == "SYNTH"){
                if ( synthSel == 1){
                     notes();
                }
              }
              else {
                if(decision0[5] == 1){
                  decision0[5] = 0;
                }
                else
                  decision0[5] = 1;
                entVal_pattern = 0;
              }
          }
          else{
            cp5.get(controlP5.Button.class, "F" + 0).setColorBackground( color(0, 255, 0) );
            cp5.get(controlP5.Button.class, "E" + 0).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "G" + 0).setColorBackground( color(#C6C6C6) );
          }
          }
          if (righty == 6){
            if(entVal_pattern == 1 && highlight == 1){
              if(instrument0.getLabel() == "SYNTH"){
                if ( synthSel == 1){
                     notes();
                }
              }
              else {
                if(decision0[6] == 1){
                  decision0[6] = 0;
                }
                else
                  decision0[6] = 1;
                entVal_pattern = 0;
              }
          }
          else{
            cp5.get(controlP5.Button.class, "G" + 0).setColorBackground( color(0, 255, 0) );
            cp5.get(controlP5.Button.class, "F" + 0).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "H" + 0).setColorBackground( color(#C6C6C6) );
          }
          }
          if (righty == 7){
            if(entVal_pattern == 1 && highlight == 1){
              if(instrument0.getLabel() == "SYNTH"){
                if ( synthSel == 1){
                     notes();
                }
              }
              else {
                if(decision0[7] == 1){
                  decision0[7] = 0;
                }
                else
                  decision0[7] = 1;
                entVal_pattern = 0;
              }
          }
          else{
            cp5.get(controlP5.Button.class, "H" + 0).setColorBackground( color(0, 255, 0) );
            cp5.get(controlP5.Button.class, "G" + 0).setColorBackground( color(#C6C6C6) );
          }
          }
        }
       

        
        if(upward == 1){
          currentNotePosition = 1;
            cp5.get(controlP5.Button.class, "instrument" + 0).setColorBackground( color(255) );
            cp5.get(controlP5.Button.class, "A" + 0).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "B" + 0).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "C" + 0).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "D" + 0).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "E" + 0).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "F" + 0).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "G" + 0).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "H" + 0).setColorBackground( color(#C6C6C6) );
            
            cp5.get(controlP5.Button.class, "instrument" + 2).setColorBackground( color(255) );
            cp5.get(controlP5.Button.class, "A" + 2).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "B" + 2).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "C" + 2).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "D" + 2).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "E" + 2).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "F" + 2).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "G" + 2).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "H" + 2).setColorBackground( color(#C6C6C6) );
          
    
          if (righty == -1){
            if(entVal_instrument == 2 && highlight == 1){
              patList2 = 0;
              instSelect[1] = 1;
            }
            else{
              cp5.get(controlP5.Button.class, "instrument" + 1).setColorBackground( color(0, 255, 0) );
              cp5.get(controlP5.Button.class, "A" + 1).setColorBackground( color(#C6C6C6) );
            }
          }
          if (righty == 0){
            instSelect[1] = 0;
            if(entVal_pattern == 1 && highlight == 1){
              if(instrument1.getLabel() == "SYNTH"){
                if ( synthSel == 1){
                     notes();
                }
              }
              else {
                if(decision1[0] == 1){
                  decision1[0] = 0;
                }
                else
                  decision1[0] = 1;
                entVal_pattern = 0;
              }
          }
          else{
            cp5.get(controlP5.Button.class, "A" + 1).setColorBackground( color(0, 255, 0) );
            cp5.get(controlP5.Button.class, "B" + 1).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "instrument" + 1).setColorBackground( color(255) );
          }
          }
          if (righty == 1){
            if(entVal_pattern == 1 && highlight == 1){
              if(instrument1.getLabel() == "SYNTH"){
                if ( synthSel == 1){
                     notes();
                }
              }
              else {
                if(decision1[1] == 1){
                  decision1[1] = 0;
                }
                else
                  decision1[1] = 1;
                entVal_pattern = 0;
              }
          }
          else{
            cp5.get(controlP5.Button.class, "B" + 1).setColorBackground( color(0, 255, 0) );
            cp5.get(controlP5.Button.class, "A" + 1).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "C" + 1).setColorBackground( color(#C6C6C6) );
          }
          }
          if (righty == 2){
            if(entVal_pattern == 1 && highlight == 1){
              if(instrument1.getLabel() == "SYNTH"){
                if ( synthSel == 1){
                     notes();
                }
              }
              else {
                if(decision1[2] == 1){
                  decision1[2] = 0;
                }
                else
                  decision1[2] = 1;
                entVal_pattern = 0;
              }
          }
          else{
            cp5.get(controlP5.Button.class, "C" + 1).setColorBackground( color(0, 255, 0) );
            cp5.get(controlP5.Button.class, "B" + 1).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "D" + 1).setColorBackground( color(#C6C6C6) );
          }
          }
          if (righty == 3){
            if(entVal_pattern == 1 && highlight == 1){
              if(instrument1.getLabel() == "SYNTH"){
                if ( synthSel == 1){
                      notes();
                }
              }
              else {
                if(decision1[3] == 1){
                  decision1[3] = 0;
                }
                else
                  decision1[3] = 1;
                entVal_pattern = 0;
              }
          }
          else{
            cp5.get(controlP5.Button.class, "D" + 1).setColorBackground( color(0, 255, 0) );
            cp5.get(controlP5.Button.class, "C" + 1).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "E" + 1).setColorBackground( color(#C6C6C6) );
          }
          }
          if (righty == 4){
            if(entVal_pattern == 1 && highlight == 1){
              if(instrument1.getLabel() == "SYNTH"){
                if ( synthSel == 1){
                      notes();
                }
              }
              else {
                if(decision1[4] == 1){
                  decision1[4] = 0;
                }
                else
                  decision1[4] = 1;
                entVal_pattern = 0;
              }
          }
          else{
            cp5.get(controlP5.Button.class, "E" + 1).setColorBackground( color(0, 255, 0) );
            cp5.get(controlP5.Button.class, "D" + 1).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "F" + 1).setColorBackground( color(#C6C6C6) );
          }
          }
          if (righty == 5){
            if(entVal_pattern == 1 && highlight == 1){
              if(instrument1.getLabel() == "SYNTH"){
                if ( synthSel == 1){
                      notes();
                }
              }
              else {
                if(decision1[5] == 1){
                  decision1[5] = 0;
                }
                else
                  decision1[5] = 1;
                entVal_pattern = 0;
              }
          }
          else{
            cp5.get(controlP5.Button.class, "F" + 1).setColorBackground( color(0, 255, 0) );
            cp5.get(controlP5.Button.class, "E" + 1).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "G" + 1).setColorBackground( color(#C6C6C6) );
          }
          }
          if (righty == 6){
            if(entVal_pattern == 1 && highlight == 1){
              if(instrument1.getLabel() == "SYNTH"){
                if ( synthSel == 1){
                      notes();
                }
              }
              else {
                if(decision1[6] == 1){
                  decision1[6] = 0;
                }
                else
                  decision1[6] = 1;
                entVal_pattern = 0;
              }
          }
          else{
            cp5.get(controlP5.Button.class, "G" + 1).setColorBackground( color(0, 255, 0) );
            cp5.get(controlP5.Button.class, "F" + 1).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "H" + 1).setColorBackground( color(#C6C6C6) );
          }
          }
          if (righty == 7){
            if(entVal_pattern == 1 && highlight == 1){
              if(instrument1.getLabel() == "SYNTH"){
                if ( synthSel == 1){
                      notes();
                }
              }
              else {
                if(decision1[7] == 1){
                  decision1[7] = 0;
                }
                else
                  decision1[7] = 1;
                entVal_pattern = 0;
              }
          }
          else{
            cp5.get(controlP5.Button.class, "H" + 1).setColorBackground( color(0, 255, 0) );
            cp5.get(controlP5.Button.class, "G" + 1).setColorBackground( color(#C6C6C6) );
          }
          }
        }
        
        if(upward == 2){
            cp5.get(controlP5.Button.class, "instrument" + 1).setColorBackground( color(255) );
            cp5.get(controlP5.Button.class, "A" + 1).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "B" + 1).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "C" + 1).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "D" + 1).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "E" + 1).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "F" + 1).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "G" + 1).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "H" + 1).setColorBackground( color(#C6C6C6) );
            
            cp5.get(controlP5.Button.class, "instrument" + 3).setColorBackground( color(255) );
            cp5.get(controlP5.Button.class, "A" + 3).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "B" + 3).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "C" + 3).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "D" + 3).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "E" + 3).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "F" + 3).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "G" + 3).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "H" + 3).setColorBackground( color(#C6C6C6) );
            
           if (righty == -1){
            if(entVal_instrument == 2 && highlight == 1){
              patList2 = 0;
              instSelect[2] = 1;
            }
            else{
            cp5.get(controlP5.Button.class, "instrument" + 2).setColorBackground( color(0, 255, 0) );
            cp5.get(controlP5.Button.class, "A" + 2).setColorBackground( color(#C6C6C6) );
            }
           }
          if (righty == 0){
            instSelect[2] = 0;
            if(entVal_pattern == 1 && highlight == 1){
              if(instrument2.getLabel() == "SYNTH"){
                if ( synthSel == 1){
                     notes();
                }
              }
              else {
                //decision2[0] = 1;
                //entVal_pattern = 0;
                if(decision2[0] == 1){
                  decision2[0] = 0;
                }
                else
                  decision2[0] = 1;
                entVal_pattern = 0;
              }
          }
          else{
            cp5.get(controlP5.Button.class, "A" + 2).setColorBackground( color(0, 255, 0) );
            cp5.get(controlP5.Button.class, "B" + 2).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "instrument" + 2).setColorBackground( color(255) );
          }
          }
          if (righty == 1){
            if(entVal_pattern == 1 && highlight == 1){
              if(instrument2.getLabel() == "SYNTH"){
                if ( synthSel == 1){
                      notes();
                }
              }
              else {
                //decision2[1] = 1;
                //entVal_pattern = 0;
                if(decision2[1] == 1){
                  decision2[1] = 0;
                }
                else
                  decision2[1] = 1;
                entVal_pattern = 0;
              }
          }
          else{
            cp5.get(controlP5.Button.class, "B" + 2).setColorBackground( color(0, 255, 0) );
            cp5.get(controlP5.Button.class, "A" + 2).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "C" + 2).setColorBackground( color(#C6C6C6) );
          }
          }
          if (righty == 2){
            if(entVal_pattern == 1 && highlight == 1){
              if(instrument2.getLabel() == "SYNTH"){
                if ( synthSel == 1){
                      notes();
                }
              }
              else {
                //decision2[2] = 1;
                //entVal_pattern = 0;
                if(decision2[2] == 1){
                  decision2[2] = 0;
                }
                else
                  decision2[2] = 1;
                entVal_pattern = 0;
              }
          }
          else{
            cp5.get(controlP5.Button.class, "C" + 2).setColorBackground( color(0, 255, 0) );
            cp5.get(controlP5.Button.class, "B" + 2).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "D" + 2).setColorBackground( color(#C6C6C6) );
          }
          }
          if (righty == 3){
            if(entVal_pattern == 1 && highlight == 1){
              if(instrument2.getLabel() == "SYNTH"){
                if ( synthSel == 1){
                      notes();
                }
              }
              else {
                //decision2[3] = 1;
                //entVal_pattern = 0;
                if(decision2[3] == 1){
                  decision2[3] = 0;
                }
                else
                  decision2[3] = 1;
                entVal_pattern = 0;
              }
          }
          else{
            cp5.get(controlP5.Button.class, "D" + 2).setColorBackground( color(0, 255, 0) );
            cp5.get(controlP5.Button.class, "C" + 2).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "E" + 2).setColorBackground( color(#C6C6C6) );
          }
          }
          if (righty == 4){
            if(entVal_pattern == 1 && highlight == 1){
              if(instrument2.getLabel() == "SYNTH"){
                if ( synthSel == 1){
                     notes();
                }
              }
              else {
                //decision2[4] = 1;
                //entVal_pattern = 0;
                if(decision2[4] == 1){
                  decision2[4] = 0;
                }
                else
                  decision2[4] = 1;
                entVal_pattern = 0;
              }
          }
          else{
            cp5.get(controlP5.Button.class, "E" + 2).setColorBackground( color(0, 255, 0) );
            cp5.get(controlP5.Button.class, "D" + 2).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "F" + 2).setColorBackground( color(#C6C6C6) );
          }
          }
          if (righty == 5){
            if(entVal_pattern == 1 && highlight == 1){
              if(instrument2.getLabel() == "SYNTH"){
                if ( synthSel == 1){
                       notes();
                }
              }
              else {
                //decision2[5] = 1;
                //entVal_pattern = 0;
                if(decision2[5] == 1){
                  decision2[5] = 0;
                }
                else
                  decision2[5] = 1;
                entVal_pattern = 0;
              }
          }
          else{
            cp5.get(controlP5.Button.class, "F" + 2).setColorBackground( color(0, 255, 0) );
            cp5.get(controlP5.Button.class, "E" + 2).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "G" + 2).setColorBackground( color(#C6C6C6) );
          }
          }
          if (righty == 6){
            if(entVal_pattern == 1 && highlight == 1){
              if(instrument2.getLabel() == "SYNTH"){
                if ( synthSel == 1){
                      notes();
                }
              }
              else {
                //decision2[6] = 1;
                //entVal_pattern = 0;
                if(decision2[6] == 1){
                  decision2[6] = 0;
                }
                else
                  decision2[6] = 1;
                entVal_pattern = 0;
              }
          }
          else{
            cp5.get(controlP5.Button.class, "G" + 2).setColorBackground( color(0, 255, 0) );
            cp5.get(controlP5.Button.class, "F" + 2).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "H" + 2).setColorBackground( color(#C6C6C6) );
          }
          }
          if (righty == 7){
            if(entVal_pattern == 1 && highlight == 1){
              if(instrument2.getLabel() == "SYNTH"){
                if ( synthSel == 1){
                      notes();
                }
              }
              else {
                //decision2[7] = 1;
                //entVal_pattern = 0;
                if(decision2[7] == 1){
                  decision2[7] = 0;
                }
                else
                  decision2[7] = 1;
                entVal_pattern = 0;
              }
          }
          else{
            cp5.get(controlP5.Button.class, "H" + 2).setColorBackground( color(0, 255, 0) );
            cp5.get(controlP5.Button.class, "G" + 2).setColorBackground( color(#C6C6C6) );
          }
          }
        }
        
        if(upward == 3){
            cp5.get(controlP5.Button.class, "instrument" + 2).setColorBackground( color(255) );
            cp5.get(controlP5.Button.class, "A" + 2).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "B" + 2).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "C" + 2).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "D" + 2).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "E" + 2).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "F" + 2).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "G" + 2).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "H" + 2).setColorBackground( color(#C6C6C6) );
            
            cp5.get(controlP5.Button.class, "instrument" + 4).setColorBackground( color(255) );
            cp5.get(controlP5.Button.class, "A" + 4).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "B" + 4).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "C" + 4).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "D" + 4).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "E" + 4).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "F" + 4).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "G" + 4).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "H" + 4).setColorBackground( color(#C6C6C6) );
            
          
           if (righty == -1){
            if(entVal_instrument == 2 && highlight == 1){
              patList2 = 0;
              instSelect[3] = 1;
          }
          else{
            cp5.get(controlP5.Button.class, "instrument" + 3).setColorBackground( color(0, 255, 0) );
            cp5.get(controlP5.Button.class, "A" + 3).setColorBackground( color(#C6C6C6) );
          }
           }
          if (righty == 0){
            instSelect[3] = 0;
            if(entVal_pattern == 1 && highlight == 1){
              if(instrument3.getLabel() == "SYNTH"){
                if ( synthSel == 1){
                      notes();
                }
              }
              else {
                //decision3[0] = 1;
                //entVal_pattern = 0;
                if(decision3[0] == 1){
                  decision3[0] = 0;
                }
                else
                  decision3[0] = 1;
                entVal_pattern = 0;
              }
          }
          else{
            cp5.get(controlP5.Button.class, "A" + 3).setColorBackground( color(0, 255, 0) );
            cp5.get(controlP5.Button.class, "B" + 3).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "instrument" + 3).setColorBackground( color(255) );
          }
          }
          if (righty == 1){
            if(entVal_pattern == 1 && highlight == 1){
              if(instrument3.getLabel() == "SYNTH"){
                if ( synthSel == 1){
                      notes();
                }
              }
              else {
                //decision3[1] = 1;
                //entVal_pattern = 0;
                if(decision3[1] == 1){
                  decision3[1] = 0;
                }
                else
                  decision3[1] = 1;
                entVal_pattern = 0;
              }
          }
          else{
            cp5.get(controlP5.Button.class, "B" + 3).setColorBackground( color(0, 255, 0) );
            cp5.get(controlP5.Button.class, "A" + 3).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "C" + 3).setColorBackground( color(#C6C6C6) );
          }
          }
          if (righty == 2){
            if(entVal_pattern == 1 && highlight == 1){
              if(instrument3.getLabel() == "SYNTH"){
                if ( synthSel == 1){
                       notes();
                }
              }
              else {
                //decision3[2] = 1;
                //entVal_pattern = 0;
                if(decision3[2] == 1){
                  decision3[2] = 0;
                }
                else
                  decision3[2] = 1;
                entVal_pattern = 0;
              }
          }
          else{
            cp5.get(controlP5.Button.class, "C" + 3).setColorBackground( color(0, 255, 0) );
            cp5.get(controlP5.Button.class, "B" + 3).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "D" + 3).setColorBackground( color(#C6C6C6) );
          }
          }
          if (righty == 3){
            if(entVal_pattern == 1 && highlight == 1){
              if(instrument3.getLabel() == "SYNTH"){
                if ( synthSel == 1){
                      notes();
                }
              }
              else {
                //decision3[3] = 1;
                //entVal_pattern = 0;
                if(decision3[3] == 1){
                  decision3[3] = 0;
                }
                else
                  decision3[3] = 1;
                entVal_pattern = 0;
              }
          }
          else{
            cp5.get(controlP5.Button.class, "D" + 3).setColorBackground( color(0, 255, 0) );
            cp5.get(controlP5.Button.class, "C" + 3).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "E" + 3).setColorBackground( color(#C6C6C6) );
          }
          }
          if (righty == 4){
            if(entVal_pattern == 1 && highlight == 1){
              if(instrument3.getLabel() == "SYNTH"){
                if ( synthSel == 1){
                      notes();
                }
              }
              else {
                //decision3[4] = 1;
                //entVal_pattern = 0;
                if(decision3[4] == 1){
                  decision3[4] = 0;
                }
                else
                  decision3[4] = 1;
                entVal_pattern = 0;
              }
          }
          else{
            cp5.get(controlP5.Button.class, "E" + 3).setColorBackground( color(0, 255, 0) );
            cp5.get(controlP5.Button.class, "D" + 3).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "F" + 3).setColorBackground( color(#C6C6C6) );
          }
          }
          if (righty == 5){
            if(entVal_pattern == 1 && highlight == 1){
              if(instrument3.getLabel() == "SYNTH"){
                if ( synthSel == 1){
                      notes();
                }
              }
              else {
                //decision3[5] = 1;
                //entVal_pattern = 0;
                if(decision3[5] == 1){
                  decision3[5] = 0;
                }
                else
                  decision3[5] = 1;
                entVal_pattern = 0;
              }
          }
          else{
            cp5.get(controlP5.Button.class, "F" + 3).setColorBackground( color(0, 255, 0) );
            cp5.get(controlP5.Button.class, "E" + 3).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "G" + 3).setColorBackground( color(#C6C6C6) );
          }
          }
          if (righty == 6){
            if(entVal_pattern == 1 && highlight == 1){
              if(instrument3.getLabel() == "SYNTH"){
                if ( synthSel == 1){
                      notes();
                }
              }
              else {
                //decision3[6] = 1;
                //entVal_pattern = 0;
                if(decision3[6] == 1){
                  decision3[6] = 0;
                }
                else
                  decision3[6] = 1;
                entVal_pattern = 0;
              }
          }
          else{
            cp5.get(controlP5.Button.class, "G" + 3).setColorBackground( color(0, 255, 0) );
            cp5.get(controlP5.Button.class, "F" + 3).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "H" + 3).setColorBackground( color(#C6C6C6) );
          }
          }
          if (righty == 7){
            if(entVal_pattern == 1 && highlight == 1){
              if(instrument3.getLabel() == "SYNTH"){
                if ( synthSel == 1){
                       notes();
                }
              }
              else {
                //decision3[7] = 1;
                //entVal_pattern = 0;
                if(decision3[7] == 1){
                  decision3[7] = 0;
                }
                else
                  decision3[7] = 1;
                entVal_pattern = 0;
              }
          }
          else{
            cp5.get(controlP5.Button.class, "H" + 3).setColorBackground( color(0, 255, 0) );
            cp5.get(controlP5.Button.class, "G" + 3).setColorBackground( color(#C6C6C6) );
          }
          }
        }
        
        if(upward == 4){
            cp5.get(controlP5.Button.class, "instrument" + 3).setColorBackground( color(255) );
            cp5.get(controlP5.Button.class, "A" + 3).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "B" + 3).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "C" + 3).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "D" + 3).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "E" + 3).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "F" + 3).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "G" + 3).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "H" + 3).setColorBackground( color(#C6C6C6) );
            
            cp5.get(controlP5.Button.class, "instrument" + 5).setColorBackground( color(255) );
            cp5.get(controlP5.Button.class, "A" + 5).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "B" + 5).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "C" + 5).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "D" + 5).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "E" + 5).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "F" + 5).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "G" + 5).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "H" + 5).setColorBackground( color(#C6C6C6) );
          
          
          if (righty == -1){
            if(entVal_instrument == 2 && highlight == 1){
              patList2 = 0;
              instSelect[4] = 1;
          }
          else{
            cp5.get(controlP5.Button.class, "instrument" + 4).setColorBackground( color(0, 255, 0) );
            cp5.get(controlP5.Button.class, "A" + 4).setColorBackground( color(#C6C6C6) );
          }
          }
          if (righty == 0){
            instSelect[4] = 0;
            if(entVal_pattern == 1 && highlight == 1){
              if(instrument4.getLabel() == "SYNTH"){
                if ( synthSel == 1){
                      notes();
                }
              }
              else {
                //decision4[0] = 1;
                //entVal_pattern = 0;
                if(decision4[0] == 1){
                  decision4[0] = 0;
                }
                else
                  decision4[0] = 1;
                entVal_pattern = 0;
              }
          }
          else{
            cp5.get(controlP5.Button.class, "A" + 4).setColorBackground( color(0, 255, 0) );
            cp5.get(controlP5.Button.class, "B" + 4).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "instrument" + 4).setColorBackground( color(255) );
          }
          }
          if (righty == 1){
            if(entVal_pattern == 1 && highlight == 1){
              if(instrument4.getLabel() == "SYNTH"){
                if ( synthSel == 1){
                      notes();
                }
              }
              else {
                //decision4[1] = 1;
                //entVal_pattern = 0;
                if(decision4[1] == 1){
                  decision4[1] = 0;
                }
                else
                  decision4[1] = 1;
                entVal_pattern = 0;
              }
          }
          else{
            cp5.get(controlP5.Button.class, "B" + 4).setColorBackground( color(0, 255, 0) );
            cp5.get(controlP5.Button.class, "A" + 4).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "C" + 4).setColorBackground( color(#C6C6C6) );
          }
          }
          if (righty == 2){
            if(entVal_pattern == 1 && highlight == 1){
              if(instrument4.getLabel() == "SYNTH"){
                if ( synthSel == 1){
                      notes();
                }
              }
              else {
                //decision4[2] = 1;
                //entVal_pattern = 0;
                if(decision4[2] == 1){
                  decision4[2] = 0;
                }
                else
                  decision4[2] = 1;
                entVal_pattern = 0;
              }
          }
          else{
            cp5.get(controlP5.Button.class, "C" + 4).setColorBackground( color(0, 255, 0) );
            cp5.get(controlP5.Button.class, "B" + 4).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "D" + 4).setColorBackground( color(#C6C6C6) );
          }
          }
          if (righty == 3){
            if(entVal_pattern == 1 && highlight == 1){
              if(instrument4.getLabel() == "SYNTH"){
                if ( synthSel == 1){
                      notes();
                }
              }
              else {
                //decision4[3] = 1;
                //entVal_pattern = 0;
                if(decision4[3] == 1){
                  decision4[3] = 0;
                }
                else
                  decision4[3] = 1;
                entVal_pattern = 0;
              }
          }
          else{
            cp5.get(controlP5.Button.class, "D" + 4).setColorBackground( color(0, 255, 0) );
            cp5.get(controlP5.Button.class, "C" + 4).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "E" + 4).setColorBackground( color(#C6C6C6) );
          }
          }
          if (righty == 4){
            if(entVal_pattern == 1 && highlight == 1){
              if(instrument4.getLabel() == "SYNTH"){
                if ( synthSel == 1){
                       notes();
                }
              }
              else {
                //decision4[4] = 1;
                //entVal_pattern = 0;
                if(decision4[4] == 1){
                  decision4[4] = 0;
                }
                else
                  decision4[4] = 1;
                entVal_pattern = 0;
              }
          }
          else{
            cp5.get(controlP5.Button.class, "E" + 4).setColorBackground( color(0, 255, 0) );
            cp5.get(controlP5.Button.class, "D" + 4).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "F" + 4).setColorBackground( color(#C6C6C6) );
          }
          }
          if (righty == 5){
            if(entVal_pattern == 1 && highlight == 1){
              if(instrument4.getLabel() == "SYNTH"){
                if ( synthSel == 1){
                      notes();
                }
              }
              else {
                //decision4[5] = 1;
                //entVal_pattern = 0;
                if(decision4[5] == 1){
                  decision4[5] = 0;
                }
                else
                  decision4[5] = 1;
                entVal_pattern = 0;
              }
          }
          else{
            cp5.get(controlP5.Button.class, "F" + 4).setColorBackground( color(0, 255, 0) );
            cp5.get(controlP5.Button.class, "E" + 4).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "G" + 4).setColorBackground( color(#C6C6C6) );
          }
          }
          if (righty == 6){
            if(entVal_pattern == 1 && highlight == 1){
              if(instrument4.getLabel() == "SYNTH"){
                if ( synthSel == 1){
                      notes();
                }
              }
              else {
                //decision4[6] = 1;
                //entVal_pattern = 0;
                if(decision4[6] == 1){
                  decision4[6] = 0;
                }
                else
                  decision4[6] = 1;
                entVal_pattern = 0;
              }
          }
          else{
            cp5.get(controlP5.Button.class, "G" + 4).setColorBackground( color(0, 255, 0) );
            cp5.get(controlP5.Button.class, "F" + 4).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "H" + 4).setColorBackground( color(#C6C6C6) );
          }
          }
          if (righty == 7){
            if(entVal_pattern == 1 && highlight == 1){
              if(instrument4.getLabel() == "SYNTH"){
                if ( synthSel == 1){
                      notes();
                }
              }
              else {
                //decision4[7] = 1;
                //entVal_pattern = 0;
                if(decision4[7] == 1){
                  decision4[7] = 0;
                }
                else
                  decision4[7] = 1;
                entVal_pattern = 0;
              }
          }
          else{
            cp5.get(controlP5.Button.class, "H" + 4).setColorBackground( color(0, 255, 0) );
            cp5.get(controlP5.Button.class, "G" + 4).setColorBackground( color(#C6C6C6) );
          }
          }
        }
        
        if(upward == 5){
            cp5.get(controlP5.Button.class, "instrument" + 4).setColorBackground( color(255) );
            cp5.get(controlP5.Button.class, "A" + 4).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "B" + 4).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "C" + 4).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "D" + 4).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "E" + 4).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "F" + 4).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "G" + 4).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "H" + 4).setColorBackground( color(#C6C6C6) );
            
            cp5.get(controlP5.Button.class, "instrument" + 6).setColorBackground( color(255) );
            cp5.get(controlP5.Button.class, "A" + 6).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "B" + 6).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "C" + 6).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "D" + 6).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "E" + 6).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "F" + 6).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "G" + 6).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "H" + 6).setColorBackground( color(#C6C6C6) );
          
          if (righty == -1){
            if(entVal_instrument == 2 && highlight == 1){
              patList2 = 0;
              instSelect[5] = 1;
          }
          else{
            cp5.get(controlP5.Button.class, "instrument" + 5).setColorBackground( color(0, 255, 0) );
            cp5.get(controlP5.Button.class, "A" + 5).setColorBackground( color(#C6C6C6) );
          }
          }
          if (righty == 0){
            instSelect[5] = 0;
            if(entVal_pattern == 1 && highlight == 1){
              if(instrument5.getLabel() == "SYNTH"){
                if ( synthSel == 1){
                      notes();
                }
              }
              else {
                //decision5[0] = 1;
                //entVal_pattern = 0;
                if(decision5[0] == 1){
                  decision5[0] = 0;
                }
                else
                  decision5[0] = 1;
                entVal_pattern = 0;
              }
          }
          else{
            cp5.get(controlP5.Button.class, "A" + 5).setColorBackground( color(0, 255, 0) );
            cp5.get(controlP5.Button.class, "B" + 5).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "instrument" + 5).setColorBackground( color(255) );
          }
          }
          if (righty == 1){
            if(entVal_pattern == 1 && highlight == 1){
              if(instrument5.getLabel() == "SYNTH"){
                if ( synthSel == 1){
                      notes();
                }
              }
              else {
                //decision5[1] = 1;
                //entVal_pattern = 0;
                if(decision5[1] == 1){
                  decision5[1] = 0;
                }
                else
                  decision5[1] = 1;
                entVal_pattern = 0;
              }
          }
          else{
            cp5.get(controlP5.Button.class, "B" + 5).setColorBackground( color(0, 255, 0) );
            cp5.get(controlP5.Button.class, "A" + 5).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "C" + 5).setColorBackground( color(#C6C6C6) );
          }
          }
          if (righty == 2){
            if(entVal_pattern == 1 && highlight == 1){
              if(instrument5.getLabel() == "SYNTH"){
                if ( synthSel == 1){
                      notes();
                }
              }
              else {
                //decision5[2] = 1;
                //entVal_pattern = 0;
                if(decision5[2] == 1){
                  decision5[2] = 0;
                }
                else
                  decision5[2] = 1;
                entVal_pattern = 0;
              }
          }
          else{
            cp5.get(controlP5.Button.class, "C" + 5).setColorBackground( color(0, 255, 0) );
            cp5.get(controlP5.Button.class, "B" + 5).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "D" + 5).setColorBackground( color(#C6C6C6) );
          }
          }
          if (righty == 3){
            if(entVal_pattern == 1 && highlight == 1){
              if(instrument5.getLabel() == "SYNTH"){
                if ( synthSel == 1){
                      notes();
                }
              }
              else {
                //decision5[3] = 1;
                //entVal_pattern = 0;
                if(decision5[3] == 1){
                  decision5[3] = 0;
                }
                else
                  decision5[3] = 1;
                entVal_pattern = 0;
              }
          }
          else{
            cp5.get(controlP5.Button.class, "D" + 5).setColorBackground( color(0, 255, 0) );
            cp5.get(controlP5.Button.class, "C" + 5).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "E" + 5).setColorBackground( color(#C6C6C6) );
          }
          }
          if (righty == 4){
            if(entVal_pattern == 1 && highlight == 1){
              if(instrument5.getLabel() == "SYNTH"){
                if ( synthSel == 1){
                      notes();
                }
              }
              else {
                //decision5[4] = 1;
                //entVal_pattern = 0;
                if(decision5[4] == 1){
                  decision5[4] = 0;
                }
                else
                  decision5[4] = 1;
                entVal_pattern = 0;
              }
          }
          else{
            cp5.get(controlP5.Button.class, "E" + 5).setColorBackground( color(0, 255, 0) );
            cp5.get(controlP5.Button.class, "D" + 5).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "F" + 5).setColorBackground( color(#C6C6C6) );
          }
          }
          if (righty == 5){
            if(entVal_pattern == 1 && highlight == 1){
              if(instrument5.getLabel() == "SYNTH"){
                if ( synthSel == 1){
                      notes();
                }
              }
              else {
                //decision5[5] = 1;
                //entVal_pattern = 0;
                if(decision5[5] == 1){
                  decision5[5] = 0;
                }
                else
                  decision5[5] = 1;
                entVal_pattern = 0;
              }
          }
          else{
            cp5.get(controlP5.Button.class, "F" + 5).setColorBackground( color(0, 255, 0) );
            cp5.get(controlP5.Button.class, "E" + 5).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "G" + 5).setColorBackground( color(#C6C6C6) );
          }
          }
          if (righty == 6){
            if(entVal_pattern == 1 && highlight == 1){
              if(instrument5.getLabel() == "SYNTH"){
                if ( synthSel == 1){
                      notes();
                }
              }
              else {
                //decision5[6] = 1;
                //entVal_pattern = 0;
                if(decision5[6] == 1){
                  decision5[6] = 0;
                }
                else
                  decision5[6] = 1;
                entVal_pattern = 0;
              }
          }
          else{
            cp5.get(controlP5.Button.class, "G" + 5).setColorBackground( color(0, 255, 0) );
            cp5.get(controlP5.Button.class, "F" + 5).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "H" + 5).setColorBackground( color(#C6C6C6) );
          }
          }
          if (righty == 7){
            if(entVal_pattern == 1 && highlight == 1){
              if(instrument5.getLabel() == "SYNTH"){
                if ( synthSel == 1){
                      notes();
                }
              }
              else {
                //decision5[7] = 1;
                //entVal_pattern = 0;
                if(decision5[7] == 1){
                  decision5[7] = 0;
                }
                else
                  decision5[7] = 1;
                entVal_pattern = 0;
              }
          }
          else{
            cp5.get(controlP5.Button.class, "H" + 5).setColorBackground( color(0, 255, 0) );
            cp5.get(controlP5.Button.class, "G" + 5).setColorBackground( color(#C6C6C6) );
          }
          }
        }
        
        if(upward == 6){
            cp5.get(controlP5.Button.class, "instrument" + 5).setColorBackground( color(255) );
            cp5.get(controlP5.Button.class, "A" + 5).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "B" + 5).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "C" + 5).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "D" + 5).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "E" + 5).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "F" + 5).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "G" + 5).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "H" + 5).setColorBackground( color(#C6C6C6) );  
            
            cp5.get(controlP5.Button.class, "instrument" + 7).setColorBackground( color(255) );
            cp5.get(controlP5.Button.class, "A" + 7).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "B" + 7).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "C" + 7).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "D" + 7).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "E" + 7).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "F" + 7).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "G" + 7).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "H" + 7).setColorBackground( color(#C6C6C6) );
            //cp5.get(ScrollableList.class, "Instrument" + 7).setColorBackground( color(0,45, 90) );
          
          if (righty == -1){
            if(entVal_instrument == 2 && highlight == 1){
              patList2 = 0;
              instSelect[6] = 1;
          }
          else{
            cp5.get(controlP5.Button.class, "instrument" + 6).setColorBackground( color(0, 255, 0) );
            cp5.get(controlP5.Button.class, "A" + 6).setColorBackground( color(#C6C6C6) );
          }
          }
          if (righty == 0){
            instSelect[6] = 0;
            if(entVal_pattern == 1 && highlight == 1){
              if(instrument6.getLabel() == "SYNTH"){
                if ( synthSel == 1){
                      notes();
                }
              }
              else {
                //decision6[0] = 1;
                //entVal_pattern = 0;
                if(decision6[0] == 1){
                  decision6[0] = 0;
                }
                else
                  decision6[0] = 1;
                entVal_pattern = 0;
              }
          }
          else{
            cp5.get(controlP5.Button.class, "A" + 6).setColorBackground( color(0, 255, 0) );
            cp5.get(controlP5.Button.class, "B" + 6).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "instrument" + 6).setColorBackground( color(255) );
          }
          }
          if (righty == 1){
            if(entVal_pattern == 1 && highlight == 1){
              if(instrument6.getLabel() == "SYNTH"){
                if ( synthSel == 1){
                      notes();
                }
              }
              else {
                //decision6[1] = 1;
                //entVal_pattern = 0;
                if(decision6[1] == 1){
                  decision6[1] = 0;
                }
                else
                  decision6[1] = 1;
                entVal_pattern = 0;
              
              }
          }
          else{
            cp5.get(controlP5.Button.class, "B" + 6).setColorBackground( color(0, 255, 0) );
            cp5.get(controlP5.Button.class, "A" + 6).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "C" + 6).setColorBackground( color(#C6C6C6) );
          }
          }
          if (righty == 2){
            if(entVal_pattern == 1 && highlight == 1){
              if(instrument6.getLabel() == "SYNTH"){
                if ( synthSel == 1){
                      notes();
                }
              }
              else {
                //decision6[2] = 1;
                //entVal_pattern = 0;
                if(decision6[2] == 1){
                  decision6[2] = 0;
                }
                else
                  decision6[2] = 1;
                entVal_pattern = 0;
              
              }
          }
          else{
            cp5.get(controlP5.Button.class, "C" + 6).setColorBackground( color(0, 255, 0) );
            cp5.get(controlP5.Button.class, "B" + 6).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "D" + 6).setColorBackground( color(#C6C6C6) );
          }
          }
          if (righty == 3){
            if(entVal_pattern == 1 && highlight == 1){
              if(instrument6.getLabel() == "SYNTH"){
                if ( synthSel == 1){
                      notes();
                }
              }
              else {
                //decision6[3] = 1;
                //entVal_pattern = 0;
                if(decision6[3] == 1){
                  decision6[3] = 0;
                }
                else
                  decision6[3] = 1;
                entVal_pattern = 0;
              }
          }
          else{
            cp5.get(controlP5.Button.class, "D" + 6).setColorBackground( color(0, 255, 0) );
            cp5.get(controlP5.Button.class, "C" + 6).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "E" + 6).setColorBackground( color(#C6C6C6) );
          }
          }
          if (righty == 4){
            if(entVal_pattern == 1 && highlight == 1){
              if(instrument6.getLabel() == "SYNTH"){
                if ( synthSel == 1){
                      notes();
                }
              }
              else {
                //decision6[4] = 1;
                //entVal_pattern = 0;
              }
          }
          else{
            cp5.get(controlP5.Button.class, "E" + 6).setColorBackground( color(0, 255, 0) );
            cp5.get(controlP5.Button.class, "D" + 6).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "F" + 6).setColorBackground( color(#C6C6C6) );
          }
          }
          if (righty == 5){
            if(entVal_pattern == 1 && highlight == 1){
              if(instrument6.getLabel() == "SYNTH"){
                if ( synthSel == 1){
                      notes();
                }
              }
              else {
                //decision6[5] = 1;
                //entVal_pattern = 0;
                if(decision6[5] == 1){
                  decision6[5] = 0;
                }
                else
                  decision6[5] = 1;
                entVal_pattern = 0;
              }
          }
          else{
            cp5.get(controlP5.Button.class, "F" + 6).setColorBackground( color(0, 255, 0) );
            cp5.get(controlP5.Button.class, "E" + 6).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "G" + 6).setColorBackground( color(#C6C6C6) );
          }
          }
          if (righty == 6){
            if(entVal_pattern == 1 && highlight == 1){
              if(instrument6.getLabel() == "SYNTH"){
                if ( synthSel == 1){
                      notes();
                }
              }
              else {
                //decision6[6] = 1;
                //entVal_pattern = 0;
                if(decision6[6] == 1){
                  decision6[6] = 0;
                }
                else
                  decision6[6] = 1;
                entVal_pattern = 0;
              }
          }
          else{
            cp5.get(controlP5.Button.class, "G" + 6).setColorBackground( color(0, 255, 0) );
            cp5.get(controlP5.Button.class, "F" + 6).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "H" + 6).setColorBackground( color(#C6C6C6) );
          }
          }
          if (righty == 7){
            if(entVal_pattern == 1 && highlight == 1){
              if(instrument6.getLabel() == "SYNTH"){
                if ( synthSel == 1){
                      notes();
                }
              }
              else {
                //decision6[7] = 1;
                //entVal_pattern = 0;
                if(decision6[7] == 1){
                  decision6[7] = 0;
                }
                else
                  decision6[7] = 1;
                entVal_pattern = 0;
              }
          }
          else{
            cp5.get(controlP5.Button.class, "H" + 6).setColorBackground( color(0, 255, 0) );
            cp5.get(controlP5.Button.class, "G" + 6).setColorBackground( color(#C6C6C6) );
          }
          }
        }
        
        if(upward == 7){
            cp5.get(controlP5.Button.class, "instrument" + 6).setColorBackground( color(255) );
            cp5.get(controlP5.Button.class, "A" + 6).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "B" + 6).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "C" + 6).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "D" + 6).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "E" + 6).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "F" + 6).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "G" + 6).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "H" + 6).setColorBackground( color(#C6C6C6) );
          
          if (righty == -1){
            if(entVal_instrument == 2 && highlight == 1){
              patList2 = 0;
              instSelect[7] = 1;
          }
          else{
            cp5.get(controlP5.Button.class, "instrument" + 7).setColorBackground( color(0, 255, 0) );
            cp5.get(controlP5.Button.class, "A" + 7).setColorBackground( color(#C6C6C6) );
          }
          }
          if (righty == 0){
            
            instSelect[6] = 0;
            //close = 1;
            if(entVal_pattern == 1 && highlight == 1){
              if(instrument7.getLabel() == "SYNTH"){
                if ( synthSel == 1){
                       notes();
                }
              }
              else {
                //decision7[0] = 1;
                //entVal_pattern = 0;
                if(decision7[0] == 1){
                  decision7[0] = 0;
                }
                else
                  decision7[0] = 1;
                entVal_pattern = 0;
              }
          }
          else{
            cp5.get(controlP5.Button.class, "A" + 7).setColorBackground( color(0, 255, 0) );
            cp5.get(controlP5.Button.class, "B" + 7).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "instrument" + 7).setColorBackground( color(255) );
          }
          }
          if (righty == 1){
            if(entVal_pattern == 1 && highlight == 1){
              if(instrument7.getLabel() == "SYNTH"){
                if ( synthSel == 1){
                      notes();
                }
              }
              else {
                //decision7[1] = 1;
                //entVal_pattern = 0;
                if(decision7[1] == 1){
                  decision7[1] = 0;
                }
                else
                  decision7[1] = 1;
                entVal_pattern = 0;
              }
          }
          else{
            cp5.get(controlP5.Button.class, "B" + 7).setColorBackground( color(0, 255, 0) );
            cp5.get(controlP5.Button.class, "A" + 7).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "C" + 7).setColorBackground( color(#C6C6C6) );
          }
          }
          if (righty == 2){
            if(entVal_pattern == 1  && highlight == 1){
              if(instrument7.getLabel() == "SYNTH"){
                if ( synthSel == 1){
                      notes();
                }
              }
              else {
                //decision7[2] = 1;
                //entVal_pattern = 0;
                if(decision7[2] == 1){
                  decision7[2] = 0;
                }
                else
                  decision7[2] = 1;
                entVal_pattern = 0;
              }
          }
          else{
            cp5.get(controlP5.Button.class, "C" + 7).setColorBackground( color(0, 255, 0) );
            cp5.get(controlP5.Button.class, "B" + 7).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "D" + 7).setColorBackground( color(#C6C6C6) );
          }
          }
          if (righty == 3){
            if(entVal_pattern == 1 && highlight == 1){
              if(instrument7.getLabel() == "SYNTH"){
                if ( synthSel == 1){
                      notes();
                }
              }
              else {
                //decision7[3] = 1;
                //entVal_pattern = 0;
                if(decision7[3] == 1){
                  decision7[3] = 0;
                }
                else
                  decision7[3] = 1;
                entVal_pattern = 0;
              }
          }
          else{
            cp5.get(controlP5.Button.class, "D" + 7).setColorBackground( color(0, 255, 0) );
            cp5.get(controlP5.Button.class, "C" + 7).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "E" + 7).setColorBackground( color(#C6C6C6) );
          }
          }
          if (righty == 4){
            if(entVal_pattern == 1 && highlight == 1){
              if(instrument7.getLabel() == "SYNTH"){
                if ( synthSel == 1){
                      notes();
                }
              }
              else {
                //decision7[4] = 1;
                //entVal_pattern = 0;
                if(decision7[4] == 1){
                  decision7[4] = 0;
                }
                else
                  decision7[4] = 1;
                entVal_pattern = 0;
              }
          }
          else{
            cp5.get(controlP5.Button.class, "E" + 7).setColorBackground( color(0, 255, 0) );
            cp5.get(controlP5.Button.class, "D" + 7).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "F" + 7).setColorBackground( color(#C6C6C6) );
          }
          }
          if (righty == 5){
            if(entVal_pattern == 1 && highlight == 1){
              if(instrument7.getLabel() == "SYNTH"){
                if ( synthSel == 1){
                      notes();
                }
              }
              else {
                //decision7[5] = 1;
                //entVal_pattern = 0;
                if(decision7[5] == 1){
                  decision7[5] = 0;
                }
                else
                  decision7[5] = 1;
                entVal_pattern = 0;
              }
          }
          else{
            cp5.get(controlP5.Button.class, "F" + 7).setColorBackground( color(0, 255, 0) );
            cp5.get(controlP5.Button.class, "E" + 7).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "G" + 7).setColorBackground( color(#C6C6C6) );
          }
          }
          if (righty == 6){
            if(entVal_pattern == 1 && highlight == 1){
              if(instrument7.getLabel() == "SYNTH"){
                if ( synthSel == 1){
                       notes();
                }
              }
              else {
                //decision7[6] = 1;
                //entVal_pattern = 0;
                if(decision7[6] == 1){
                  decision7[6] = 0;
                }
                else
                  decision7[6] = 1;
                entVal_pattern = 0;
              }
          }
          else{
            cp5.get(controlP5.Button.class, "G" + 7).setColorBackground( color(0, 255, 0) );
            cp5.get(controlP5.Button.class, "F" + 7).setColorBackground( color(#C6C6C6) );
            cp5.get(controlP5.Button.class, "H" + 7).setColorBackground( color(#C6C6C6) );
          }
          }
          if (righty == 7){
            if(entVal_pattern == 1 && highlight == 1){
              if(instrument7.getLabel() == "SYNTH"){
                if ( synthSel == 1){
                      notes();
                }
              }
              else {
                //decision7[7] = 1;
                //entVal_pattern = 0;
                if(decision7[7] == 1){
                  decision7[7] = 0;
                }
                else
                  decision7[7] = 1;
                entVal_pattern = 0;
              }
          }
          else{
            cp5.get(controlP5.Button.class, "H" + 7).setColorBackground( color(0, 255, 0) );
            cp5.get(controlP5.Button.class, "G" + 7).setColorBackground( color(#C6C6C6) );
          }
          }
        }
       }
 
 }
 
 //========================================================================================== Pattern Property functions ========================================================================================================
 


//void KICK0() {
//  //val = 3;
//  sineDrum.play();
//  sineDrum.freq(50);
//  env.play(sineDrum, attackTimeDrum, sustainTimeDrum, sustainLevelDrum, releaseTimeDrum);
//}

//void SYNTH0() {
//    sinePiano.play();
//    sinePiano.freq(65.40639 * octave);
//    env.play(sinePiano, attackTimePiano, sustainTimePiano, sustainLevelPiano, releaseTimePiano);
//}



//void Bass_synth() {
//  val = 2;
//  sineBass.play();
//  sineBass.freq(100);
//  env.play(sineBass, attackTimeBass, sustainTimeBass, sustainLevelBass, releaseTimeBass);
//}


void PLAY(){
playALL = 1;
}
void PAUSE(){
playALL = 0;
}
//void  toBeUbesd(){
  //if (j == 65) {
  //          //cp5.get(controlP5.Button.class, i + 0).setColorBackground( color(0, 0, 255) );
  //          //cp5.get(controlP5.Button.class, d + 0).setColorBackground( color(#C6C6C6) );
  //          fill(0, 255, 255);
  //          rect(100 + 195, 70, 80, 40);
  //          rect(100 + 195, 70 + 50, 80, 40);
  //          rect(100 + 195, 70 + 100, 80, 40);
  //          rect(100 + 195, 70 + 150, 80, 40);
  //          rect(100 + 195, 70 + 200, 80, 40);
  //          rect(100 + 195, 70 + 250, 80, 40);
  //          rect(100 + 195, 70 + 300, 80, 40);
  //          rect(100 + 195, 70 + 350, 80, 40);
  //          //cp5.get(controlP5.Button.class, i + 1).setColorBackground( color(0, 0, 255) );
  //          //cp5.get(controlP5.Button.class, d + 1).setColorBackground( color(#C6C6C6) );
  //          //cp5.get(controlP5.Button.class, i + 2).setColorBackground( color(0, 0, 255) );
  //          //cp5.get(controlP5.Button.class, d + 2).setColorBackground( color(#C6C6C6) );
  //          //cp5.get(controlP5.Button.class, i + 3).setColorBackground( color(0, 0, 255) );
  //          //cp5.get(controlP5.Button.class, d + 3).setColorBackground( color(#C6C6C6) );
  //          //cp5.get(controlP5.Button.class, i + 4).setColorBackground( color(0, 0, 255) );
  //          //cp5.get(controlP5.Button.class, d + 4).setColorBackground( color(#C6C6C6) );
  //          //cp5.get(controlP5.Button.class, i + 5).setColorBackground( color(0, 0, 255) );
  //          //cp5.get(controlP5.Button.class, d + 5).setColorBackground( color(#C6C6C6) );
  //          //cp5.get(controlP5.Button.class, i + 6).setColorBackground( color(0, 0, 255) );
  //          //cp5.get(controlP5.Button.class, d + 6).setColorBackground( color(#C6C6C6) );
  //          //cp5.get(controlP5.Button.class, i + 7).setColorBackground( color(0, 0, 255) );
  //          //cp5.get(controlP5.Button.class, d + 7).setColorBackground( color(#C6C6C6) );
  //        }
//  //else if (j > 65 && j < 73){
            //cp5.get(controlP5.Button.class, i + 0).setColorBackground( color(0, 0, 255) );
            //cp5.get(controlP5.Button.class, a + 0).setColorBackground( color(#C6C6C6) );
            //cp5.get(controlP5.Button.class, i + 1).setColorBackground( color(0, 0, 255) );
            //cp5.get(controlP5.Button.class, a + 1).setColorBackground( color(#C6C6C6) );
            //cp5.get(controlP5.Button.class, i + 2).setColorBackground( color(0, 0, 255) );
            //cp5.get(controlP5.Button.class, a + 2).setColorBackground( color(#C6C6C6) );
            //cp5.get(controlP5.Button.class, i + 3).setColorBackground( color(0, 0, 255) );
            //cp5.get(controlP5.Button.class, a + 3).setColorBackground( color(#C6C6C6) );
            //cp5.get(controlP5.Button.class, i + 4).setColorBackground( color(0, 0, 255) );
            //cp5.get(controlP5.Button.class, a + 4).setColorBackground( color(#C6C6C6) );
            //cp5.get(controlP5.Button.class, i + 5).setColorBackground( color(0, 0, 255) );
            //cp5.get(controlP5.Button.class, a + 5).setColorBackground( color(#C6C6C6) );
            //cp5.get(controlP5.Button.class, i + 6).setColorBackground( color(0, 0, 255) );
            //cp5.get(controlP5.Button.class, a + 6).setColorBackground( color(#C6C6C6) );
            //cp5.get(controlP5.Button.class, i + 7).setColorBackground( color(0, 0, 255) );
            //cp5.get(controlP5.Button.class, a + 7).setColorBackground( color(#C6C6C6) );
          //}
          //print("k =" + k);
          //print("\n"); 
            //k = k + 1;
          //print("k =" + k);
          //print("\n"); 
          //constrain(k, 0, 7);
//}
