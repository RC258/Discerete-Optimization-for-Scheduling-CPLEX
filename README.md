# Introduction
This repository provides multiple scheduling models. The required softare is ["IBM ILOG CPLEX Optimization Studio"](https://www.ibm.com/products/ilog-cplex-optimization-studio).  which is a fancy optimization solver.

# Tutorial for using CPLEX
#### Example: Aviation Scheduling
- Download Required Files: Begin by downloading the necessary files for the example. These files include MOD, dat and excel file.
- Open CPLEX and navigate to the top left corner of the window. Click on 'New' → 'OPL' → 'OPL Project' to create a new project at your custorice location.
- Open your created folder and put all downloaded files in it, refresh your CPLEX.
- Open your project folder left window of CPLEX, right click 'Run Configurations' and 'new' → 'Run Configurations' with your custorice name.
- Drag the MOD file and DAT files into your created Configurations.
- Right click your created Configurations and click 'Run this'. The optimization results will presented at left concer of the window. The 'result' shows the optimal scheduling results.

## Aviation Trainee Scheduling
#### Objectives:
- Provide the optimial weekly shceduling plan for simulators and trainees.

#### Schedluing Information:
- Number of Trainees: 30
- Number of Sessions: 14

#### Constraints:
- Each session must be assigned one simulator and one trainee.
- Each simulator is associated with a specific aviation type. Each trainee is only registered into simulators that match their driving certification. Trainees can only be scheduled in simulators for which they have the appropriate certification.
- Each trainee will provide their unavailable time blocks during which they cannot be scheduled.
- Each trainee will provide their preferred time blocks, which should be maximized to align with their preferences.

