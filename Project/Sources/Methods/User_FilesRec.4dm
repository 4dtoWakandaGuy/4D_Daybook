//%attributes = {}
If (False:C215)
	//Project Method Name:      User_FilesRec
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
	C_LONGINT:C283($No)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("User_FilesRec")
Gen_Confirm("This function will clear all existing File Nos and recreate them"; ""; "")
If (OK=1)
	Gen_Confirm("Use it only to replace damaged or lost numbers"; ""; "")
	If (OK=1)
		Gen_Confirm("Use it only when no other users are logged on to Daybook"; ""; "")
		If (OK=1)
			Gen_Confirm("You will need to reset the numbers manually to prevent duplicates"; ""; "")
			If (OK=1)
				Are_You_Sure
				If (OK=1)
					QUERY:C277([IDENTIFIERS:16]; [IDENTIFIERS:16]Table_Number:1=14)
					$No:=[IDENTIFIERS:16]Number:2
					READ WRITE:C146([IDENTIFIERS:16])
					QUERY:C277([IDENTIFIERS:16]; [IDENTIFIERS:16]Table_Number:1<=999)
					DELETE SELECTION:C66([IDENTIFIERS:16])
					READ WRITE:C146([IDENTIFIERS_MULTI_NUMBERS:94])
					QUERY:C277([IDENTIFIERS_MULTI_NUMBERS:94]; [IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1<=999)
					DELETE SELECTION:C66([IDENTIFIERS_MULTI_NUMBERS:94])
					Start_Files
					QUERY:C277([IDENTIFIERS:16]; [IDENTIFIERS:16]Table_Number:1=14)
					[IDENTIFIERS:16]Number:2:=$No
					DB_SaveRecord(->[IDENTIFIERS:16])
					User_FilesSrch
				End if 
			End if 
		End if 
	End if 
End if 
READ WRITE:C146([IDENTIFIERS:16])
ERR_MethodTrackerReturn("User_FilesRec"; $_t_oldMethodName)