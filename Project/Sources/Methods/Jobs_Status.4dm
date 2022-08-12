//%attributes = {}
If (False:C215)
	//Project Method Name:      Jobs_Status
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

$_t_oldMethodName:=ERR_MethodTracker("Jobs_Status")
//Case of
// : ([JOBS]State=-1)
//   vStatus:="Cancelled"
// : ([JOBS]State=0)
//   vStatus:="Provisional"
//  : ([JOBS]State=1)
//    vStatus:="Current"
// : ([JOBS]State=2)
//   vStatus:="Completed"
//  Else
//   vStatus:=""
//End case
ERR_MethodTrackerReturn("Jobs_Status"; $_t_oldMethodName)