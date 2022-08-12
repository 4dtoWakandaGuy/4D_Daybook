//%attributes = {}
If (False:C215)
	//Project Method Name:      OrderI_NoBase
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
	C_LONGINT:C283(<>OINo; $No)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OrderI_NoBase")
//`OrderINo Base
DB_SaveRecord(->[IDENTIFIERS:16])
If (<>OINo=0)
	READ ONLY:C145([IDENTIFIERS:16])
	QUERY:C277([IDENTIFIERS:16]; [IDENTIFIERS:16]Table_Number:1=14)
	<>OINo:=[IDENTIFIERS:16]Number:2
	UNLOAD RECORD:C212([IDENTIFIERS:16])
End if 

Gen_Confirm("The Order Item base No. is "+String:C10(<>OINo)+".  Change it?"; "Yes"; "No")
If (OK=1)
	$No:=Num:C11(Gen_Request("Change to:"; String:C10(<>OINo)))
	If (OK=1)
		READ WRITE:C146([IDENTIFIERS:16])
		QUERY:C277([IDENTIFIERS:16]; [IDENTIFIERS:16]Table_Number:1=14)
		[IDENTIFIERS:16]Number:2:=$No
		<>OINo:=$No
		DB_SaveRecord(->[IDENTIFIERS:16])
		READ ONLY:C145([IDENTIFIERS:16])
		UNLOAD RECORD:C212([IDENTIFIERS:16])
	End if 
End if 
User_FilesSrch
ERR_MethodTrackerReturn("OrderI_NoBase"; $_t_oldMethodName)