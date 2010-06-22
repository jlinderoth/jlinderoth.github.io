
param n := 20;
set S := 1 .. n;
param p{s in S} default 1/card(S);
param w1{S} := Uniform(1,4);
param w2{S} := Uniform(1/3,1);

param PENALTY := 5;

var x1 >= 0;
var x2 >= 0;

var y1{S} >= 0;
var y2{S} >= 0;

minimize ObjPlusRecourse:
	 x1 + x2 + sum{s in S} p[s] * PENALTY * (y1[s] + y2[s]);

subject to c1{s in S}:
	w1[s] * x1 + x2 + y1[s] >= 7;

subject to c2{s in S}:
	w2[s] * x1 + x2 + y2[s] >= 4;
	