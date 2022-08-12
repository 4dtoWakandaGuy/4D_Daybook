//%attributes = {}
If (False:C215)
	//Project Method Name:      Companies_InBIn
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
	C_BOOLEAN:C305(<>SYS_bo_CapitaliseTown)
	C_LONGINT:C283(r1)
	C_TEXT:C284($_t_oldMethodName; vCompName; vPostcode; vTown)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Companies_InBIn")
[COMPANIES:2]Company_Name:2:=Uppers2(vCompName)
If (<>SYS_bo_CapitaliseTown)
	If ((Substring:C12(vTown; 1; 1))="!")
		[COMPANIES:2]Town_or_City:5:=Substring:C12(vTown; 2; 32000)
	Else 
		[COMPANIES:2]Town_or_City:5:=Uppercase:C13(vTown)
	End if 
Else 
	[COMPANIES:2]Town_or_City:5:=Uppers2(vTown)
End if 
If (vPostcode#"")
	[COMPANIES:2]Postal_Code:7:=Uppercase:C13(vPostcode)
	If (Companies_InPCC)
		Companies_InPC
	Else 
		[COMPANIES:2]Postal_Code:7:=""
	End if 
Else 
	[COMPANIES:2]Mailsort_OFN:50:="N"
End if 
If (r1=1)
	[COMPANIES:2]Private:37:=True:C214
End if 
ERR_MethodTrackerReturn("Companies_InBIn"; $_t_oldMethodName)