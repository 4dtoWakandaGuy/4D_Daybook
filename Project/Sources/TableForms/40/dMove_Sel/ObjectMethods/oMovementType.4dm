If (False:C215)
	//object Name: [STOCK_MOVEMENTS]dMove Sel.Variable10
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(cNAL)
	C_TEXT:C284($_t_oldMethodName; vType)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [STOCK_MOVEMENTS].dMove Sel.Variable10"; Form event code:C388)
If (cNAL=0)
	Check_MinorNC(->vType; ""; ->[MOVEMENT_TYPES:60]; ->[MOVEMENT_TYPES:60]Type_Code:1; ->[MOVEMENT_TYPES:60]Type_Name:2; "Movement Type")
End if 
ERR_MethodTrackerReturn("OBJ [STOCK_MOVEMENTS].dMove Sel.Variable10"; $_t_oldMethodName)
