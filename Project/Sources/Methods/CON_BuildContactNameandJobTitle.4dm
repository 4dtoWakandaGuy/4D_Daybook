//%attributes = {}
If (False:C215)
	//Project Method Name:      CON_BuildContactNameandJobTitle
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
	C_TEXT:C284($_t_oldMethodName; $0; SYS_t_AccessType; vExtn)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CON_BuildContactNameandJobTitle")
$0:=""
If ([CONTACTS:1]Contact_Code:2#"")
	If (([CONTACTS:1]Title:3="") & ([CONTACTS:1]Surname:5="") & ([CONTACTS:1]Forename:4=""))
		If ([CONTACTS:1]Job_Title:6#"")
			$0:=[CONTACTS:1]Job_Title:6
		Else 
			If ([CONTACTS:1]Dept:8#"")
				$0:=[CONTACTS:1]Dept:8
			Else 
				$0:="No Contact_Details"
			End if 
		End if 
	Else 
		If ([CONTACTS:1]Contact_Name:31="")
			If ([CONTACTS:1]Title:3#"")
				$0:=[CONTACTS:1]Title:3+" "
			End if 
			If ([CONTACTS:1]Forename:4#"")
				$0:=$0+[CONTACTS:1]Forename:4+" "
			End if 
			$0:=$0+[CONTACTS:1]Surname:5
			//If (([CONTACTS]Job Title#"") & (SYS_t_AccessType#"Q"))
			//  $0:=$0+" ("+FirstLetterWord ([CONTACTS]Job Title)+")"
			// End if
		Else 
			$0:=[CONTACTS:1]Contact_Name:31
		End if 
		
	End if 
End if 
vExtn:=[CONTACTS:1]Extn:9
ERR_MethodTrackerReturn("CON_BuildContactNameandJobTitle"; $_t_oldMethodName)