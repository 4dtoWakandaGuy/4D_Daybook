//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Comp SupUp
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 18/01/2010 16:23
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_RecordNumber; vCM; vCT; vNo)
	C_TEXT:C284($_t_oldMethodName; vButtDisCom; vCompCode)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Comp SupUp")
//Comp SupUp
If (vCM=0)
	If ([COMPANIES:2]Superior:34#"")
		DB_SaveRecord(->[COMPANIES:2])
		AA_CheckFileUnlocked(->[COMPANIES:2]x_ID:63)
		DB_SaveRecord(->[CONTACTS_COMPANIES:145])
		DB_SaveRecord(->[CONTACTS:1])
		AA_CheckFileUnlocked(->[CONTACTS:1]x_ID:33)
		$_l_RecordNumber:=Record number:C243([COMPANIES:2])
		vCompCode:=[COMPANIES:2]Superior:34
		QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=vCompCode)
		vNo:=Records in selection:C76([COMPANIES:2])
		If (vNo=0)
			Gen_Alert("Superior not found"; "OK")
			GOTO RECORD:C242([COMPANIES:2]; $_l_RecordNumber)
			vNo:=Records in selection:C76([COMPANIES:2])
		End if 
		vCT:=0
		Companies_InB2
		In_ButtNextPrev(->[COMPANIES:2]; ->vButtDisCom)
		In_ButtChkDis(->vButtDisCom)
		Companies_InLPß("S1")
	End if 
Else 
	Gen_Alert("This cannot be used when creating Companies from other files"; "Cancel")
End if 
ERR_MethodTrackerReturn("Comp SupUp"; $_t_oldMethodName)