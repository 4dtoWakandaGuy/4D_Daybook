//%attributes = {}
If (False:C215)
	//Project Method Name:      Qualities_InLPB
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 10/09/2009 13:29
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(vCP)
	C_TEXT:C284($_t_oldMethodName; vCompName; vContName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Qualities_InLPB")


If (([INFORMATION:55]Company_Code:7="") & (vCP=1))
	[INFORMATION:55]Company_Code:7:=[COMPANIES:2]Company_Code:1
	// SET CHOICE LIST([QUALITIES]Group;"Quality Groups")
	//  SET CHOICE LIST([QUALITIES]SubGroup;"")
End if 
If ([INFORMATION:55]Contact_Code:1#"")
	If ([CONTACTS:1]Contact_Code:2#[INFORMATION:55]Contact_Code:1)
		RELATE ONE:C42([INFORMATION:55]Contact_Code:1)
		
		vContName:=[CONTACTS:1]Contact_Name:31
		
	End if 
Else 
	vContName:=""
End if 
If ([COMPANIES:2]Company_Code:1#[INFORMATION:55]Company_Code:7)
	RELATE ONE:C42([INFORMATION:55]Company_Code:7)
End if 
vCompName:=[COMPANIES:2]Company_Name:2
If ([INFORMATION:55]Information_Code:9="")
	Qual_Code
End if 
ERR_MethodTrackerReturn("Qualities_InLPB"; $_t_oldMethodName)