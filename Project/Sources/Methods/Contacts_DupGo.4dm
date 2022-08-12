//%attributes = {}
If (False:C215)
	//Project Method Name:      Contacts_DupGo
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:43
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_CharPosition)
	C_TEXT:C284($_t_Comments; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Contacts_DupGo")
Menu_Record("Contacts_DupGo"; "Go to Duplicate")
$_t_Comments:=Substring:C12([CONTACTS:1]Comments:10; Length:C16([CONTACTS:1]Comments:10)-14; 32000)
$_l_CharPosition:=Position:C15(" of "; $_t_Comments)
If ($_l_CharPosition=0)
	Gen_Alert("No Duplicate Text found in the Comments field"; "Cancel")
Else 
	DB_SaveRecord(->[CONTACTS:1])
	AA_CheckFileUnlocked(->[CONTACTS:1]x_ID:33)
	$_t_Comments:=Substring:C12($_t_Comments; $_l_CharPosition+4; 32000)
	CUT NAMED SELECTION:C334([CONTACTS:1]; "$Sel")
	QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=$_t_Comments)
	If (Records in selection:C76([CONTACTS:1])=0)
		Gen_Alert("The Duplicate Contact record no longer exists"; "Cancel")
		USE NAMED SELECTION:C332("$Sel")
	Else 
		CLEAR NAMED SELECTION:C333("$Sel")
		PUSH RECORD:C176([CONTACTS:1])
		ADD TO SET:C119([CONTACTS:1]; "OMaster")
		USE SET:C118("OMaster")
		POP RECORD:C177([CONTACTS:1])
		Contacts_InLPB
	End if 
End if 
ERR_MethodTrackerReturn("Contacts_DupGo"; $_t_oldMethodName)