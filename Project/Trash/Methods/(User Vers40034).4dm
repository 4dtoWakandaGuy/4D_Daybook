//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      User Vers40034
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/09/2009 09:10
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_LastTableNumber; $_l_TableIndex)
	C_TEXT:C284($_t_oldMethodName; $_t_ScripttableName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("User Vers40034")

READ WRITE:C146([SCRIPTS:80])
QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1="²@")
If (Records in selection:C76([SCRIPTS:80])>0)
	User_Message(Char:C90(13)+"      Converting Accept Macros"+Char:C90(13))
	$_l_LastTableNumber:=Get last table number:C254
	While (Not:C34(End selection:C36([SCRIPTS:80])))
		$_t_ScripttableName:=Substring:C12([SCRIPTS:80]Script_Code:1; 2; 31)
		For ($_l_TableIndex; 1; $_l_LastTableNumber)
			If (Is table number valid:C999($_l_TableIndex))
				If ($_t_ScripttableName=Table name:C256($_l_TableIndex))
					[SCRIPTS:80]Script_Code:1:="Accept "+String:C10($_l_TableIndex)
					[SCRIPTS:80]Table_Number:8:=$_l_TableIndex
					[SCRIPTS:80]Script_Name:2:="Run on Accepting a ["+Table name:C256($_l_TableIndex)+"] record"
					[SCRIPTS:80]Same_Process:6:=True:C214
					DB_SaveRecord(->[SCRIPTS:80])
				End if 
			End if 
		End for 
		NEXT RECORD:C51([SCRIPTS:80])
	End while 
End if 
READ ONLY:C145([SCRIPTS:80])
UNLOAD RECORD:C212([SCRIPTS:80])
ERR_MethodTrackerReturn("User Vers40034"; $_t_oldMethodName)
