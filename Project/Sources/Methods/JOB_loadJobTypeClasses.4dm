//%attributes = {}
If (False:C215)
	//Project Method Name:      JOB_loadJobTypeClasses
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/09/2009 20:16
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(JOB_al_JobClassINT;0)
	//ARRAY TEXT(JOB_at_JobClass;0)
	//ARRAY TEXT(JOB_at_JobClassName;0)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("JOB_loadJobTypeClasses")
//OK so here is what we are doing. Because JOBS can mean multiple thing(part of a project, job costing, agency manager and now service calls)
//and we may have people using more than one of these areas of the system we need to 'filter' the Jobs_Into classes so that only the correct types appear in each of those places
ARRAY LONGINT:C221(JOB_al_JobClassINT; 0)
ARRAY TEXT:C222(JOB_at_JobClassName; 0)
ARRAY TEXT:C222(JOB_at_JobClass; 0)
ARRAY LONGINT:C221(JOB_al_JobClassINT; 3)
ARRAY TEXT:C222(JOB_at_JobClassName; 3)
ARRAY TEXT:C222(JOB_at_JobClass; 3)
JOB_at_JobClassName{1}:="Job Costing"
JOB_at_JobClassName{2}:="Project Management"
JOB_at_JobClassName{3}:="Service Call Management"
//Note that the settings are not exlusive so items can appear in project management and service call management
JOB_al_JobClassINT{1}:=1
JOB_al_JobClassINT{2}:=2
JOB_al_JobClassINT{3}:=4

//now the interesting bit. This last one actually will be used to control whether the view is temp(stages/bookings) or Perm(job spec) so actually has two values
//only the first will be displayed on screen as a selectable option
//the other one will be  radio button active when that selection is made(when i have made a new entry screen for perm jobs). This is because with agency manager it cannot be both-it must be one or tuther
//So the Following array is used for on screen
JOB_at_JobClass{1}:="Job Costing"
JOB_at_JobClass{2}:="Project Management"
JOB_at_JobClass{3}:="Service Call Management"
ERR_MethodTrackerReturn("JOB_loadJobTypeClasses"; $_t_oldMethodName)