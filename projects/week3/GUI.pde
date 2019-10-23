import peasy.*;
import controlP5.*;

// for mouse controlled view
PeasyCam cam;
ControlP5 cp5;

Controller ringResSlider;
Controller freqSlider;
Controller amplitudeSlider;
Controller heightSlider;
Controller phaseSlider;

float res_min = 3, res_max = 50;
float freq_min = 0.1, freq_max = 1;
float amp_min = 1, amp_max = 6;
float h_min = 500, h_max = 4000;
float phase_min = 0, phase_max = 2*PI;

void setupGUI() {
  cam = new PeasyCam(this, 2000);
  cp5 = new ControlP5(this);
  
  cp5.setAutoDraw(false);
  
  ringResSlider =  cp5.addSlider("resolution")
    .setPosition(25, 25)
    .setRange(res_min, res_max)
    ;
  freqSlider = cp5.addSlider("frequency")
    .setPosition(25, 25*2)
    .setRange(freq_min, freq_max)
    ;
  amplitudeSlider =  cp5.addSlider("amplitude")
    .setPosition(25, 25*3)
    .setRange(amp_min, amp_max);
    ;
  heightSlider = cp5.addSlider("vaseHeight")
    .setPosition(25, 25*4)
    .setRange(h_min, h_max)
    ;
  phaseSlider = cp5.addSlider("phase")
    .setPosition(25, 25*5)
    .setRange(phase_min, phase_max)
    ;
}

//void controlEvent(ControlEvent theEvent) {
//  //println("got a control event from controller with id "+theEvent.getController().getId());
  
//  //update
//}
