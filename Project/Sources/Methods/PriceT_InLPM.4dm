//%attributes = {}
If (False:C215)
	//Project Method Name:      PriceT_InLPM
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
	C_BOOLEAN:C305(DB_bo_RecordModified)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PriceT_InLPM")
[PRICE_TABLE:28]Export:11:=Export_Stamp
DB_bo_RecordModified:=True:C214
ERR_MethodTrackerReturn("PriceT_InLPM"; $_t_oldMethodName)