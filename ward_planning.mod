/*********************************************
 * OPL 12.9.0.0 Model
 * Author: Think
 * Email:lihuajlu@jlu.edu.cn
 * Creation Date: 2020-8-1 at PM 10:21:26
 *********************************************/
dvar int+ num_obs;
dvar int+ num_ces;
dvar int+ num_nat;
dvar int+ num_ward_obs;
dvar int+ num_ward_ces;
dvar int+ num_ward_nat;

int total_num_ward=100;
float day_obs=1.5;
float day_ces=3;
float day_nat=2;

int plan_days=30;

int cap_obs_ward=2;
int cap_ces_ward=1;
int cap_nat_ward=1;

int cap_gen_ward=1;
float ratio_ces=0.3;

maximize num_obs;
subject to
  {
    num_ward_obs+num_ward_ces+num_ward_nat<=total_num_ward;
    num_obs<=total_num_ward*cap_gen_ward*plan_days/day_obs;
    day_obs*num_obs<=num_ward_obs*cap_obs_ward*plan_days;
    day_ces*num_ces<=num_ward_ces*cap_ces_ward*plan_days;
    day_nat*num_nat<=num_ward_nat*cap_nat_ward*plan_days;
    num_ces>=ratio_ces*num_obs;
    num_nat>=(1-ratio_ces)*num_obs;  

}