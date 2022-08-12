//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Comp_RenumAppCT
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
	C_BOOLEAN:C305(<>MultiCo)
	C_LONGINT:C283($_l_RecordsinSelection)
	C_TEXT:C284($_t_oldMethodName; $_t_Search; $1; $2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Comp_RenumAppCT")
If (<>MultiCo)
	FIRST RECORD:C50([CONTACTS:1])
	While (Not:C34(End selection:C36([CONTACTS:1])))
		$_t_Search:=$1
		QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Contact_Code:4=[CONTACTS:1]Contact_Code:2; *)
		QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
		QUERY SELECTION:C341([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Company_Code:1=$_t_Search)
		$_l_RecordsinSelection:=Records in selection:C76([CONTACTS_COMPANIES:145])
		$_t_Search:=$2
		
		QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Contact_Code:4=[CONTACTS:1]Contact_Code:2; *)
		QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
		QUERY SELECTION:C341([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Company_Code:1=$_t_Search)
		
		If ($_l_RecordsinSelection=0)
			[CONTACTS_COMPANIES:145]Company_Code:1:=$1
		Else 
			[CONTACTS_COMPANIES:145]Address_DateDeleted:7:=Current date:C33(*)
			[CONTACTS_COMPANIES:145]Address_Status:5:=-1
			//DELETE RECORD([CONTACTS_COMPANIES])
			If ([CONTACTS:1]Company_Code:1=[CONTACTS_COMPANIES:145]Company_Code:1)
				[CONTACTS:1]Company_Code:1:=""
				
			End if 
		End if 
		If ([CONTACTS:1]Company_Code:1=$_t_Search)
			[CONTACTS:1]Company_Code:1:=$1
		End if 
		[CONTACTS:1]Export:18:=Export_Stamp2([CONTACTS:1]Export:18)
		DB_SaveRecord(->[CONTACTS_COMPANIES:145])
		DB_SaveRecord(->[CONTACTS:1])
		AA_CheckFileUnlocked(->[CONTACTS:1]x_ID:33)
		NEXT RECORD:C51([CONTACTS:1])
	End while 
	UNLOAD RECORD:C212([CONTACTS:1])
Else 
	Gen_AppToSelEx(->[CONTACTS:1]; ->[CONTACTS:1]Company_Code:1; $1; ->[CONTACTS:1]Export:18)
End if 
ERR_MethodTrackerReturn("Comp_RenumAppCT"; $_t_oldMethodName)
