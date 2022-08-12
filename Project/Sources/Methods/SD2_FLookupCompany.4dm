//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_FLookupCompany
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
	C_TEXT:C284($_t_oldMethodName; $0)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_FLookupCompany")

//SD2_FLookupCompany
If ([DIARY:12]Company_Code:1#"")
	QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[DIARY:12]Company_Code:1)
Else 
	UNLOAD RECORD:C212([COMPANIES:2])
	
End if 
If ([COMPANIES:2]Company_Name:2="")
	If ([COMPANIES:2]Address_Line_one:3#"")
		$0:="("+[COMPANIES:2]Address_Line_one:3+")"
	Else 
		If ([COMPANIES:2]Deleted:61=1)
			$0:="("+"Company Deleted"+")"
		Else 
			If ([COMPANIES:2]Company_Code:1#"")
				$0:="("+"Unknown"+")"
			End if 
		End if 
	End if 
	
Else 
	$0:=[COMPANIES:2]Company_Name:2
End if 
UNLOAD RECORD:C212([COMPANIES:2])
ERR_MethodTrackerReturn("SD2_FLookupCompany"; $_t_oldMethodName)
