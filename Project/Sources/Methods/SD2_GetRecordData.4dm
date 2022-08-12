//%attributes = {}

If (False:C215)
	//Database Method Name:      SD2_GetRecordData
	//------------------ Method Notes ------------------
	//This method with gather important data for a diary record-based on the record in the table at $1
	
	//------------------ Revision Control ----------------
	//Date Created:  26/09/2019
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_TableNumber; $1)
	C_OBJECT:C1216($_obj_ActionData; $0)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("SD2_GetRecordData")
//
$_l_TableNumber:=$1
Case of 
	: ($_l_TableNumber=Table:C252(->[COMPANIES:2]))
		OB SET:C1220($_obj_ActionData; "Related_To"; $_l_TableNumber)  // what table is the record to be related to
		OB SET:C1220($_obj_ActionData; "Company_Code"; [COMPANIES:2]Company_Code:1)
		
End case 
$0:=$_obj_ActionData
ERR_MethodTrackerReturn("SD2_GetRecordData"; $_t_oldMethodName)
