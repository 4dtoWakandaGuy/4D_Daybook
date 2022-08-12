If (False:C215)
	//object Method Name: Object Name:      [USER].ORDERITEMLABELADMIN.Variable2
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
	//ARRAY INTEGER(LAB_ai_IncludeLine;0)
	C_LONGINT:C283($_l_Index; LAB_l_Continue)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].ORDERITEMLABELADMIN.Variable2"; Form event code:C388)
For ($_l_Index; 1; Size of array:C274(LAB_ai_IncludeLine))
	If (LAB_ai_IncludeLine{$_l_Index}>0)
		LAB_l_Continue:=1
		$_l_Index:=Size of array:C274(LAB_ai_IncludeLine)
		CANCEL:C270
	End if 
End for 
If (LAB_l_Continue=0)
	//  ALERT("You must select at least one item to include on the printout")
	Gen_Alert("You must select at least one item to include on the printout")
End if 
ERR_MethodTrackerReturn("OBJ [USER].ORDERITEMLABELADMIN.Variable2"; $_t_oldMethodName)
