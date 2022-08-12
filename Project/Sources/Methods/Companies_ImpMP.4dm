//%attributes = {}
If (False:C215)
	//Project Method Name:      Companies_ImpMP
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

$_t_oldMethodName:=ERR_MethodTracker("Companies_ImpMP")
If ([COMPANIES:2]Postal_Code:7="")
	If ([COMPANIES:2]County_or_State:6#"")
		If (Num:C11(FirstWord([COMPANIES:2]County_or_State:6))>0)
			[COMPANIES:2]Postal_Code:7:=[COMPANIES:2]County_or_State:6
			[COMPANIES:2]County_or_State:6:=""
		End if 
	Else 
		If ([COMPANIES:2]Town_or_City:5#"")
			If (Num:C11(FirstWord([COMPANIES:2]Town_or_City:5))>0)
				[COMPANIES:2]Postal_Code:7:=[COMPANIES:2]Town_or_City:5
				[COMPANIES:2]Town_or_City:5:=""
			End if 
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Companies_ImpMP"; $_t_oldMethodName)