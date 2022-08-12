//%attributes = {}
If (False:C215)
	//Project Method Name:      Jobs_TitUp
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Jobs_TitUp")
//Jobs_TitUp
States_Up(->[JOBS:26]State:9)

//If ([JOBS]State)
//End if

//26/10/07 -kmw...starting writing the above commented out lines...

//lance and Steve had requested code to be put in here that would for example grey out "actual" checkbox if this was a provisional job which at first glance seems sensbile....actually upon reflection this doesn't...
//...make sense to me and possibly misunderstands whatt actual and budget checkboxes are meant to do...
//...These boxes ARE NOT meant to control if actual or budget figures are stored on this job...
//...They DO however control HOW actual or budget figures are entered on the job...either directly into the job (if unchecked) or via time entry (if checked)

//however, the point was taken that the state should be taken into account in some way...I believe the state should instead be used (in combination with the actual and budget checkboxes) to effect enterability (of direct entry against job and entry via time screen).
ERR_MethodTrackerReturn("Jobs_TitUp"; $_t_oldMethodName)