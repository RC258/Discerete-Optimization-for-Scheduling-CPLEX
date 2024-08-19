
 int nbtrainees = ...; //totally 20 trainess;
 int nbsessions = ...; //weekly 14 sessions;
 
 range trainees = 1..nbtrainees;
 range sessions = 1..nbsessions;
 
 //seniority for each trainee 
 int s[trainees] = ...; 
 
 //capability for each trainee
 int e[trainees] = ...; 	
 

 
 //Trainee Preference 
 tuple pr{
   int trainee;
   int session;
 }

////Set preference for trainees;
{pr} preference with trainee in trainees, session  in sessions = ...;  

///set not preference for trainees；
{pr} notpreference = {<i,t>|i in trainees, t in sessions: <i,t> not in preference};  

{int} eOfTrainees[k in 1..3] = {i | i in trainees : e[i] == k};

{pr} Rsets1[i in eOfTrainees[2]] = { <j,t>| <j,t> in notpreference : s[j]>s[i] && e[j]==2 };
{pr} Rsets2[i in eOfTrainees[3]] = { <j,t>| <j,t> in notpreference : s[j]>s[i] && e[j]==3 };
{pr} Rsets3[i in eOfTrainees[3]] = { <j,t>| <j,t> in notpreference : s[j]>s[i] && e[j]==3 };

int R1[i in eOfTrainees[2]] = card(Rsets1[i]);
int R2[i in eOfTrainees[3]] = card(Rsets2[i]);
int R3[i in eOfTrainees[3]] = card(Rsets3[i]);
 
//The decision variable for the trainee can be successfully assigned in session or not?
 dvar int+ x[trainees][sessions] in 0..1; 

//The decision variable for the trainee to be assigned or not?
 dvar int+ y[trainees] in 0..1; 
 
 // cost 
 dvar int+ cost[trainees][sessions];
 dvar int+ ycost[trainees]; 

//Object function 
minimize sum(i in eOfTrainees[1], t in sessions) (x[i][t]*cost[i][t]+ycost[i]*y[i]) +
		 sum(i in eOfTrainees[2], t in sessions) (x[i][t]*cost[i][t]+ycost[i]*y[i]) +
		 sum(i in eOfTrainees[3], t in sessions) (x[i][t]*cost[i][t]+ycost[i]*y[i]);



subject to{

//the total assigned sessions cannot exceed the total sessions
forall(t in sessions) sum(i in trainees) x[i][t] <= 1;


//the trainees whose capability will expire this week must be assigned to sessions
	forall(i in trainees){
		if (e[i]==1) {
   			sum(t in sessions) x[i][t] ==1;
			}
  		}

//the trainees whose capability will expire further week can be assigned to sessions not
	forall(i in trainees){
		if (e[i]>1) {
   			sum(t in sessions) x[i][t] + y[i] == 1;
			}
  		}




//reverse capability constraint
forall(i in eOfTrainees[3], t in sessions : R3[i] != 0, <i,t> in notpreference)
  {
    sum(<j,t> in Rsets3[i]) x[j][t]<= R3[i] * (1-y[i]);
  }    


forall(i in eOfTrainees[2], t in sessions : R1[i] != 0 && R2[i] != 0, <i,t> in notpreference)
  {
    ((sum(<j,t> in Rsets1[i]) x[j][t]) +  (sum(<j,t> in Rsets2[i]) x[j][t]) ) / (R1[i]+R2[i]) <=  (1-y[i]);
  }    

/////cost for not prefereence
forall(i in eOfTrainees[1], t in sessions : <i,t> in notpreference)
  {
    cost[i][t] == 4;
  }

forall(i in eOfTrainees[2], t in sessions : <i,t> in notpreference)
  {
    cost[i][t] == 20;
  }

forall(i in eOfTrainees[3], t in sessions : <i,t> in notpreference)
  {
    cost[i][t] == 50;
  }


//////cost for preference
forall(i in trainees, t in sessions : <i,t> in preference)
  {
    cost[i][t] == 0;
  }
  
//unassigned cost
forall(i in eOfTrainees[1])
  {
    ycost[i] == 3;
  }
  
  forall(i in eOfTrainees[2])
  {
    ycost[i] == 10;
  }
  
  forall(i in eOfTrainees[3])
  {
    ycost[i] == 30;
  }
   
} 




int Se[t in sessions]=
 first({se | se in trainees: x[se][t]==1}); 
 
execute display{
for(var t in sessions){
 writeln("Session ",t," : " ,Se[t]);
}
}

/*
main{
  thisOplModel.generate();
cplex.exportModel("Math590.lp");
}
*/














