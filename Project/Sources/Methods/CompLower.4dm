//%attributes = {}
If (False:C215)
	//Project Method Name:      CompLower
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:42
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

$_t_oldMethodName:=ERR_MethodTracker("CompLower")
[COMPANIES:2]Company_Name:2:=Uppers3(Lowercase:C14([COMPANIES:2]Company_Name:2))
[COMPANIES:2]Address_Line_one:3:=Uppers3(Lowercase:C14([COMPANIES:2]Address_Line_one:3))
[COMPANIES:2]Address_Line_two:4:=Uppers3(Lowercase:C14([COMPANIES:2]Address_Line_two:4))
[COMPANIES:2]Town_or_City:5:=Uppers3(Lowercase:C14([COMPANIES:2]Town_or_City:5))
[COMPANIES:2]County_or_State:6:=Uppers3(Lowercase:C14([COMPANIES:2]County_or_State:6))
[COMPANIES:2]Country:8:=Uppers3(Lowercase:C14([COMPANIES:2]Country:8))
ERR_MethodTrackerReturn("CompLower"; $_t_oldMethodName)