[top]
components : ForestFire
in : in1 in2 in3
link : in1 in1@ForestFire
link : in2 in2@ForestFire
link : in3 in3@ForestFire

[ForestFire]
type : cell
dim : (30,30)
delay : Inertial
defaultDelayTime  : 0
border : nowrapped
neighbors : superficie(-1,-1) superficie(-1,0) superficie(-1,1)
neighbors : superficie(0,-1)  superficie(0,0)  superficie(0,1)
neighbors : superficie(1,-1)  superficie(1,0)  superficie(1,1)
initialvalue : 0
initialCellsValue : Fire.val
in : in1 in2 in3
link : in1 in@ForestFire(0,14)
link : in2 in@ForestFire(0,15)
link : in3 in@ForestFire(0,16)
localtransition : FireBehavior

[FireBehavior]
% Comportamiento del fuego
rule : {(1,-1)+(21.552615/17.967136)} {(21.552615/17.967136)*60000} {(0,0)=0 and (1,-1)!=? and 0<(1,-1)}
rule : {(1,0)+(15.24/5.106976)} {(15.24/5.106976)*60000} {(0,0)=0 and (1,0)!=? and 0<(1,0)}
rule : {(0,-1)+(15.24/5.106976)} {(15.24/5.106976)*60000} {(0,0)=0 and (0,-1)!=? and 0<(0,-1)}
rule : {(-1,-1)+(21.552615/1.872060)} {(21.552615/1.872060)*60000} {(0,0)=0 and (-1,-1)!=? and 0<(-1,-1)}
rule : {(1,1)+(21.552615/1.872060)} {(21.552615/1.872060)*60000} {(0,0)=0 and (1,1)!=? and 0<(1,1)}
rule : {(-1,0)+(15.24/1.146091)} {(15.24/1.146091)*60000} {(0,0)=0 and (-1,0)!=? and 0<(-1,0)}
rule : {(0,1)+(15.24/1.146091)} {(15.24/1.146091)*60000} {(0,0)=0 and (0,1)!=? and 0<(0,1)}
rule : {(-1,1)+(21.552615/0.987474)} {(21.552615/0.987474)*60000} {(0,0)=0 and (-1,1)!=? and 0<(-1,1)}

% Comportamiento de los bomberos
rule : -1 60000 {(0,0)=0 and (-1,0)=-1}

rule : -2 {60000*7} {(0,0)>0 and ((-1,1)=-1 or (-1,1)=-4) }
rule : -3 {60000*9} {(0,0)=-2}
rule : -4 {60000*9} {(0,0)=-3}

rule : {(0,0)} 0 { t }
