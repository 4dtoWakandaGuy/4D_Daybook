//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Orders_InLPM
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 29/10/2009 19:30
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_RecordModified)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


//29/10/2009
$_t_oldMethodName:=ERR_MethodTracker("Orders_InLPM")
[ORDERS:24]Export:24:=Export_Stamp3([ORDERS:24]Export:24)
//29/10/2009
DB_bo_RecordModified:=True:C214
Gen_FindVars
//29/10/2009
ERR_MethodTrackerReturn("Orders_InLPM"; $_t_oldMethodName)