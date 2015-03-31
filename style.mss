/*
* Colors
*/

@water: #e6d9b8;
@rivers: #74C6D6 ;
@forest: #70A73A;
@building:#678;
@wooded: #e6d9b8;
@roads: #8F3D38;
@rails: #ADADAD;


Map { background-color: @water; }

/*
* Styled layers
*/
#countries {
  ::outline1, ::outline2, ::outline3 {
    line-color: @water;
    line-width: 1;
    line-join: round;
    line-opacity: 0.5;
    line-comp-op: multiply;
  }
  ::outline1 { line-smooth: 12; }
  ::outline2 { line-smooth: 24; }
  ::outline3 { line-smooth: 48; }
  polygon-fill: lighten(@water,10);
  polygon-opacity: 0.6;
}


/* ---- BUILDINGS ---- */
#buildings[zoom>=12][zoom<=16] {
  ::outline1{
    line-color: @building;
    line-width: 1;
    line-join: round;
    line-opacity: 0.5;
    line-comp-op: multiply;
  }
  polygon-fill:@building;
  [zoom>=14] {
    line-color:darken(@building,5);
    line-width:0.2;
  }
  [zoom>=16] {
    line-color:darken(@building,10);
    line-width:0.4;
  }
  ::outline1 { line-smooth: 12; }
  polygon-opacity: 0.6;
}
// At the highest zoom levels, render buildings in fancy pseudo-3D.
// Ordering polygons by their Y-position is necessary for this effect
// so we use a separate layer that does this for us.
#buildings[zoom>=17][type != 'hedge'] {
  building-fill:@building;
  building-height:1.25;
}

#buildings[zoom>=17][type = 'hedge'] {
  building-fill:@wooded;
  building-height:1.25;
}

#nature_reserve {
  ::outline1, ::outline2, ::outline3 {
    line-color: @forest;
    line-width: 1;
    line-join: round;
    line-opacity: 0.5;
    line-comp-op: multiply;
  }
  ::outline1 { line-smooth: 12; }
  ::outline2 { line-smooth: 24; }
  ::outline3 { line-smooth: 48; }
  polygon-fill: lighten(@forest,10);
  polygon-opacity: 0.6;
}
#forest {
  ::outline1, ::outline2, ::outline3 {
    line-color: @forest;
    line-width: 1;
    line-join: round;
    line-opacity: 0.5;
    line-comp-op: multiply;
  }
  ::outline1 { line-smooth: 12; }
  ::outline2 { line-smooth: 24; }
  ::outline3 { line-smooth: 48; }
  polygon-fill: lighten(@forest,10);
  polygon-opacity: 0.6;
}

#roads [type !='rail']{
  line-color: @roads;
  line-width: 2;
  line-join: round;
  line-opacity: 0.5;
  line-comp-op: multiply;
}

#roads [type ='motorway']{
  line-color: @roads;
  line-width: 5;
  line-join: round;
  line-opacity: 0.5;
  line-comp-op: multiply;
}
#roads [type='rail']{
  line-color: @rails;
  line-width: 2;
  line-join: round;
  line-opacity: 0.5;
  line-comp-op: multiply;
}
#water {
  ::outline1, ::outline2, ::outline3 {
    line-color: @rivers;
    line-width: 1;
    line-join: round;
    line-opacity: 0.5;
    line-comp-op: multiply;
  }
  ::outline1 { line-smooth: 12; }
  ::outline2 { line-smooth: 24; }
  ::outline3 { line-smooth: 48; }
  polygon-fill: lighten(@rivers,10);
  polygon-opacity: 0.6;
}

#provinces {
  ::outline1, ::outline2, ::outline3 {
    line-color: @water;
    line-width: 1;
    line-join: round;
    line-opacity: 0.5;
    line-comp-op: multiply;
  }
  ::outline1 { line-smooth: 12; }
  ::outline2 { line-smooth: 24; }
  ::outline3 { line-smooth: 48; }
  polygon-fill: lighten(@water,10);
  polygon-opacity: 0.6;
}

#bath {
  ::outline1, ::outline2, ::outline3 {
    line-color: darken(@water,10);
    line-width: 1;
    line-join: round;
    line-opacity: 0.05;
    line-comp-op: multiply;
  }
  ::outline1 { line-smooth: 12; }
  ::outline2 { line-smooth: 24; }
  ::outline3 { line-smooth: 48; }
  polygon-fill: #367;
  polygon-opacity: 0.05;
  polygon-comp-op: color-burn;
}

#grat[zoom>2],#grat10 {
  line-color: #ddd;
  line-comp-op: color-burn;
}

#paper::grain {
  polygon-pattern-file: url(img/noise512.png);
  polygon-pattern-comp-op: soft-light;
}
#paper::folds {
  polygon-pattern-file: url(img/paperfolds_512.png);
  polygon-pattern-comp-op: color-burn;
}

