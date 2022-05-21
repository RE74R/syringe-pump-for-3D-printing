metrica=4;

/****  Pieza A *****/
xA=7; // espesor
yA=75;
zA=45;// alto a ajustar
distanciaPasantesMotor=32.5;
radioHusillo=4.25;
radioGuias=radioHusillo+1;
longHusillo=200;
ajusteMotor=13-xA;
distanciaGuias=29;
ajuste=5;

/****  Pieza B *****/
xB=190; // longitud total pieza

/****  Pieza C *****/
xC=220;

/****  Pieza D *****/
xD=80;
tuercaX=7;
tuercaY=15.5;
tuercaZ=13.5;

/**** Jeringuilla ****/
diametroJeringuilla=30.2;
rJ=diametroJeringuilla/2;
rJ2=26;//tope de la jeringa
aJ=zA-13; //alto Jeringa
rJ3=15.5;



//--PIEZA D

difference(){
translate([xD,0,7.5])
minkowski(){
cube ([xA*4-ajuste, yA-ajuste, zA], center=true);  
sphere(2);
}
//tuerca
translate([xD,0,tuercaY*1.3])
cube([tuercaX, tuercaZ, tuercaY*4], center=true);

//husillos
rotate([0,90,0])
cylinder(h=longHusillo, r=radioHusillo, center=true);
rotate([0,90,0])
translate([0,-distanciaGuias,0])
cylinder(h=longHusillo, r=radioGuias, center=true);
rotate([0,90,0])
translate([0,distanciaGuias,0])
cylinder(h=longHusillo, r=radioGuias, center=true);

// porta jerniga
translate([xD+8,0,aJ])
rotate([0,90,0])
cylinder (h=3,r=15.5, center=true);
translate([xD+15,0,26])
cube ([13, 3, 13], center=true);
}

//--PIEZA A

color("blue"){
    difference(){
    cube ([xA,yA,zA], center=true);

        //tornillos pasantes motor

        union(){
        translate([0, distanciaPasantesMotor/2, distanciaPasantesMotor/2])
        rotate([0,90,0])
        cylinder(h=xA*5,r=metrica/2, center=true);    

        translate([0, -distanciaPasantesMotor/2, distanciaPasantesMotor/2])
        rotate([0,90,0])
        cylinder(h=xA*5,r=metrica/2, center=true);

        translate([0, distanciaPasantesMotor/2, -distanciaPasantesMotor/2])
        rotate([0,90,0])
        cylinder(h=xA*5,r=metrica/2, center=true);

        translate([0, -distanciaPasantesMotor/2, -distanciaPasantesMotor/2])
        rotate([0,90,0])
        cylinder(h=xA*5,r=metrica/2, center=true);

        // encaje guias
        rotate([0,90,0])
        translate([0,-distanciaGuias,0])
        cylinder(h=longHusillo, r=radioGuias);

        rotate([0,90,0])
        translate([0,distanciaGuias,0])
        cylinder(h=longHusillo, r=radioGuias);
 
        // agujero pasante motor
        rotate([0,90,0])
        cylinder(h=xA*2, r=13, center=true);
        }
    }
}

//--PIEZA B
color("red")
translate([xB/2-xA/2,0,-zA/2-xA/2])
cube ([xB,yA,xA], center=true);

//--PIEZA C y D
color("gray"){
translate([xB/2-xA/2,yA/2+xA/4,-xA/2])
cube ([xB,xA/2,zA+xA], center=true);

translate([xB/2-xA/2,-yA/2-xA/4,-xA/2])
cube ([xB,xA/2,zA+xA], center=true);
}
//--PIEZA E
color("green"){
    difference(){
        translate([xB-xA*2-xA/2,-yA/2,-zA/2])
        cube ([xA*2,yA,aJ+zA/2]);
    
        //husillo y guias
        rotate([0,90,0])
        cylinder(h=longHusillo, r=radioHusillo);
        rotate([0,90,0])
        translate([0,-distanciaGuias,0])
        cylinder(h=longHusillo, r=radioGuias);
        rotate([0,90,0])
        translate([0,distanciaGuias,0])
        cylinder(h=longHusillo, r=radioGuias);
    
        // sujeción guias
        translate([xB-xA*2+metrica/2,-distanciaGuias-0.5,0])
        cylinder(h=aJ+zA/2, r=metrica/2);
        translate([xB-xA*2+metrica/2,distanciaGuias+0.5,0])
        cylinder(h=aJ+zA/2, r=metrica/2);
        translate([xB-xA*2+metrica/2,distanciaGuias+0.5,15])
        cube([xA*4,6,3.5], center=true);
        translate([xB-xA*2+metrica/2,-distanciaGuias-0.5,15])
        cube([xA*4,6,3.5], center=true);

        //-- acople jeringa
        translate([xB-xA*0.6,0,aJ])
        rotate([0,90,0])
        cylinder (h=30,r=rJ, center=true);
        translate([xB-xA-xA*0.5,0,aJ])
        rotate([0,90,0])
        cylinder (h=3,r=rJ2, center=true);
    }
}