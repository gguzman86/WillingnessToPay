/*import excel "C:\Users\qproject-hp\Desktop\Proyectos\El Piojo\ANEXO N°2 Encuestas\Análisis\DataDAP.xlsx", sheet("DataDAP_Stata") firstrow clear*/

/*list Experiment Project Choice Cost Satisfaction turista ingreso sexo in 1/791, sepby(Experiment)*/
/*
asmprobit Choice Cost Satisfaction, case(Experiment) alternatives (Project) noconstant
set more off*/

/*
mlogit Project Cost Satisfaction

/*asclogit Choice Cost, case(Experiment) alternatives (Project) noconstant casevar(Satisfaction) basealternative(0)*/

asclogit Choice Cost Satisfaction, case(Experiment) alternatives (Project) noconstant

/*asclogit Choice Satisfaction, case(Experiment) alternatives (Project) noconstant casevar(Cost)*/
asclogit Choice Cost Satisfaction, case(Experiment) alternatives (Project) noconstant casevar(turista)
*/
/*
mlogit proyecto Cost Satisfaction, baseoutcome(0)
asclogit Choice Cost Satisfaction, case(Experiment) alternatives (proyecto) noconstant basealternative(0)
asclogit Choice Cost Satisfaction, case(Experiment) alternatives (proyecto) noconstant casevar(turista) basealternative(0)
*/


/*
asclogit Choice Cost Satisfaction, case(Experiment) alternatives (Project) noconstant
mlogit Project Cost Satisfaction if (Choice==1 & (Project!=1)), noconstant baseoutcome(0)
*/

clogit Choice Cost Satisfaction, group(Experiment)
probit Choice Cost Satisfaction

asclogit Choice Cost Satisfaction, case(Experiment) alternatives (Project) noconstant
gen b1= _b[Cost]
gen b2= _b[Satisfaction]
mean Satisfaction, over (Project)


asmprobit Choice Cost Satisfaction, case(Experiment) alternatives (Project) noconstant technique(bhhh)
