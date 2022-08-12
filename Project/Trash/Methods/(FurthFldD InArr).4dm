//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      FurthFldD InArr
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/08/2009 12:09:55If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//Array Text(<>DB_at_TableNames;0)
	//Array LONGINT(<>DB_al_TableNums;0)
	C_BOOLEAN:C305(vMod3; DB_bo_RecordModified)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FurthFldD InArr")
If (DB_bo_RecordModified)
	vMod3:=True:C214
End if 
MESSAGES OFF:C175
DB_bo_RecordModified:=False:C215
QUERY:C277([CUSTOM_FIELD_DEFINITiONS:99]; [CUSTOM_FIELD_DEFINITiONS:99]Table_Number:3=<>DB_al_TableNums{<>DB_at_TableNames})
ORDER BY:C49([CUSTOM_FIELD_DEFINITiONS:99]; [CUSTOM_FIELD_DEFINITiONS:99]Sort_Order:4; >)
FurthFldD_InLPß("S")
MESSAGES ON:C181
ERR_MethodTrackerReturn("FurthFldD InArr"; $_t_oldMethodName)