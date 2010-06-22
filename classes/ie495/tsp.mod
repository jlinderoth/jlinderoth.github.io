set CITIES;
param c{CITIES,CITIES} default 0;

var x{CITIES,CITIES} >= 0, <= 1;

#for {i in CITIES} {
#  for {j in CITIES} {
#    if  c[i,j] == 0 then {
#      let c[i,j] := c[j,i]
#    }
#   }
#}

minimize Distance:
	 sum{i in CITIES, j in CITIES} c[i,j] * x[i,j];

subject to EnterEach{j in CITIES}:
	sum{i in CITIES} x[i,j] = 1;

subject to LeaveEach{i in CITIES}:
	sum{j in CITIES} x[i,j] = 1;

subject to NoLoops{i in CITIES}:
	x[i,i] = 0;

# Adding subtour elimination...

