If (False:C215)
	//object Name: [USER]SET_VERSION.obInternalRelease
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
	C_LONGINT:C283($_l_Number)
	C_TEXT:C284($_t_oldMethodName; VER_t_LicVerSection4)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SET_VERSION.obInternalRelease"; Form event code:C388)
Gen_Confirm("Increment Structure build number for compile?"; "Yes"; "No")
If (OK=1)
	$_l_Number:=(Num:C11(VER_t_LicVerSection4))+1
	VER_t_LicVerSection4:=String:C10($_l_Number; "000")
	
End if 
ERR_MethodTrackerReturn("OBJ [USER].SET_VERSION.obInternalRelease"; $_t_oldMethodName)
