/*********************************************
 * OPL 22.1.0.0 Model
 * Author: CHOU
 * Creation Date: Dec. 20, 2022 at 3:05:36 p.m.
 *********************************************/

 int nbstudents = ...; //totally number of students;
 int nbsections = ...; //weekly 14 sections;
 
 range students = 1..nbstudents;
 range sections = 1..nbsections;
 
 //Certificates of each trainee 
 int Cst[students] = ...; 
 
 //Certificates of each simulatorsection 
 int Cse[sections] = ...; 
 
 //Trainee Preference 
 tuple pr{
   int st;
   int se;
 }
 
 ////Set timeconflict for trainees;
{pr} timeconflict with st in students,se  in sections = ...; 

//The decision variable for the students can be successfully assigned in sections or not?
 dvar int+ x[sections][students] in 0..1; 
 
 
//Object function 
maximize sum(t in sections, i in students) x[t][i];

subject to{
  
 //the total assigned sections cannot exceed the total sections
 forall(t in sections) sum(i in students) x[t][i] <= 1;
 
 //each student can only assign 1 section
 forall(i in students) sum(t in sections) x[t][i] <= 1;
 
 //If the student's certificate does not match the simulator's simulator, the assignment does not work.
 forall(t in sections, i in students){
  if(Cst[i] != Cse[t]){
   x[t][i] == 0; 
  }
}
  
 //Students can not be assign in his/her conflict sections
  forall(t in sections, i in students: <i,t> in timeconflict){
  x[t][i] == 0;
}
  
}




int Se[t in sections]=
 first({se | se in students: x[t][se]==1}); 
 
execute display{
for(var t in sections){
 writeln("Sections ",t," : " ,Se[t]);
}
}
 

 
 
 
 
 
