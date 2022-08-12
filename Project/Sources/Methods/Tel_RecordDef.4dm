//%attributes = {}
If (False:C215)
	//Project Method Name:      Tel_RecordDef
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
	C_BOOLEAN:C305(<>TelStartup; vTelActive; vTelOnline)
	C_LONGINT:C283($_l_Return; VTELTASK)
	C_TEXT:C284($_t_oldMethodName; $_t_Path; $0; $1; $2; $3; $4; $5)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Tel_RecordDef")
//tm_Record - Tel_RecordDef - with defaults
//this routine allows abortion by DTMF digits

$0:=""
If (<>TelStartup)
	//make sure the file exists
Else 
	If ($1="")
		$_t_Path:=""
	Else 
		$_t_Path:=Tel_PictFind($1)
	End if 
	If ($_t_Path="")
		$_t_Path:=Tel_PictCreat($1)
	End if 
	If ((vTelActive) & (vTelOnline) & ($_t_Path#""))
		//Make Preferences of 5 & 6 = Timeout & Silence
		PLUGCALL_Telephony("RecordFile"; 1)
		
		If ($_l_Return=0)
			PLUGCALL_Telephony("Pic2File"; 3)
			
			DB_SaveRecord(->[PICTURES:85])
			AA_CheckFileUnlocked(->[PICTURES:85]x_ID:5)
			If (Count parameters:C259=5)
				Tel_DiaryCreat($2; $3; $4; $5)
			End if 
			Tel_SrvrDel($_t_Path)
			$0:=[PICTURES:85]Picture_Code:1
		Else 
			BEEP:C151
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Tel_RecordDef"; $_t_oldMethodName)
