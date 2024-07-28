# Introduction
This repository provides multiple scheduling models. The software solver used is ["IBM ILOG CPLEX Optimization Studio"](https://www.ibm.com/products/ilog-cplex-optimization-studio).  which is a fableous optimization solver.

# Tutorial for using CPLEX
- Download Required Files: Begin by downloading the necessary files for the example. These files include the MOD, DAT, and Excel files.
- Launch CPLEX and navigate to the top-left corner of the window. Click on 'New' → 'OPL' → 'OPL Project' to create a new project in your desired location.
- Open the folder you created and place all downloaded files into it. Then, refresh/restart your CPLEX.
- In the project folder window on the left side of CPLEX, right-click on 'Run Configurations' and select 'New' → 'Run Configurations' with your chosen name.
- Drag the MOD and DAT files into your created configuration.
- Right-click on your created configuration and select 'Run'. The optimization results will be presented in the bottom left corner of the window. The 'result' section will display the optimal scheduling outcomes.

## Aviation Trainee Scheduling
#### Remark:
- Considering data ethics and privacy, traniees information have been anonymized.

#### Objectives:
- Provide the optimal weekly scheduling plan for simulators and trainees that maximizes the trainees' preferred slots and fulfills all constraints.
  
#### Schedluing Information:
- Number of Trainees: 30
- Number of Sessions: 14
- Aviation Type: Boeing 737, 747, 787

#### Constraints:
- Each session must be assigned one simulator and one trainee.
- Each simulator is associated with a specific aviation type. Trainees are only registered for simulators that match their certification. They can only be scheduled in simulators for which they have the appropriate certification.
- Trainees will provide their unavailable time blocks, during which they cannot be scheduled.
- Trainees will provide their preferred time blocks, which should be maximized to align with their preferences.
- Trainees will provide their certification expiry times, with emergency trainees given priority.
- Trainees will provide their seniority certification, senior trainees given priority.
- Each trainee has an upper bound on their weekly training hours, which cannot be exceeded.


  
## Comining Tea Beverage Bar Shift Scheduling
#### Remark:
- Considering data ethics and privacy, students information have been anonymized.

#### Objective: 
-Ensure that all part-time students employees are fully scheduled while balancing the number of shifts between international students and local workers.

#### Constraints:
- Each employee can work only one shift per time period, and every shift must be assigned exactly one employee.
- Each international part-time employee must be scheduled for 10 shifts per week.
- Each international part-time can work at most 2 shifts per day (4 hrs).
- Each Local student must be scheduled for exactly 14 shifts per week.
- Each local student can work at most 4 shifts peer day(8 hrs).
- Each worker's daily shifts must be scheduled consecutively.
- For any staff is scheduled for a night shift, they cannot be scheduled for the morning shift of the following day.
- The students' employee academic timetable must take priority and cannot conflict with any shift scheduling.
