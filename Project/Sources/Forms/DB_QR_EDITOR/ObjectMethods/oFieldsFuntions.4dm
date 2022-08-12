If (False:C215)
	//object Name: Object Name:      DB_QR_EDITOR.oFieldsFuntions
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/11/2011 23:02
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(BD_at_FldsFunctions;0)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ DB_QR_EDITOR.oFieldsFuntions"; Form event code:C388)

Case of 
	: (BD_at_FldsFunctions=1)
		OBJECT SET VISIBLE:C603(*; "oLBFunctionNames@"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oLBFIeldNames"; True:C214)
	Else 
		OBJECT SET VISIBLE:C603(*; "oLBFunctionNames@"; True:C214)
		OBJECT SET VISIBLE:C603(*; "oLBFIeldNames"; False:C215)
		
End case 
ERR_MethodTrackerReturn("OBJ DB_QR_EDITOR.oFieldsFuntions"; $_t_oldMethodName)
