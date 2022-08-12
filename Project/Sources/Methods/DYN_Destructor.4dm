//%attributes = {}

//Database Method Name:      DYN_Destructor
//------------------ Method Notes ------------------
//------------------ Revision Control ----------------
//Date Created:  26/10/2017
//Created BY:  Unknown
//Date Modified: 
//Modified By: DefaultUser
//Modification notes
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_CharacterPosition; $_l_Position)
	C_TEXT:C284($_t_CurrentCode; $_t_FirstLine; $_t_Header; $_t_oldMethodName; $_t_SubHeader; $_t_SubHeaderStyle2; DB_t_MethodText)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("DYN_Destructor")

//""
$_l_Position:=Position:C15($_t_Header; DB_t_MethodText)
If ($_l_Position>0)
	DB_t_MethodText:=Substring:C12(DB_t_MethodText; $_l_Position+Length:C16($_t_Header))
End if 
$_t_SubHeader:="comment added and reserved by 4D.\r"
$_l_Position:=Position:C15($_t_SubHeader; DB_t_MethodText)
If ($_l_Position>0)
	DB_t_MethodText:=Substring:C12(DB_t_MethodText; $_l_Position+Length:C16($_t_SubHeader))
End if 
$_t_SubHeaderStyle2:="•••comment added and reserved by 4D.•••\r"
$_l_Position:=Position:C15($_t_SubHeaderStyle2; DB_t_MethodText)
If ($_l_Position>1)
	DB_t_MethodText:=Replace string:C233(DB_t_MethodText; "•••comment added and reserved by 4D.•••\r"; "")
End if 
If ($_l_Position=1)
	DB_t_MethodText:=Substring:C12(DB_t_MethodText; $_l_Position+Length:C16($_t_SubHeaderStyle2))
End if 
$_t_CurrentCode:=DB_t_MethodText
$_l_CharacterPosition:=Position:C15("$_t_oldMethodName:=ERR_MethodTracker"; $_t_CurrentCode)
If ($_l_CharacterPosition>0)
	$_t_CurrentCode:=Substring:C12($_t_CurrentCode; $_l_CharacterPosition)
	$_l_CharacterPosition:=Position:C15(Char:C90(13); $_t_CurrentCode)
	If ($_l_CharacterPosition>0)
		$_t_CurrentCode:=Substring:C12($_t_CurrentCode; $_l_CharacterPosition+1)
	End if 
	$_l_CharacterPosition:=Position:C15("ERR_MethodTrackerReturn "; $_t_CurrentCode)
	If ($_l_CharacterPosition>0)
		$_t_CurrentCode:=Substring:C12($_t_CurrentCode; 1; $_l_CharacterPosition-1)
	End if 
End if 
$_l_CharacterPosition:=Position:C15("//"; $_t_CurrentCode)
If ($_l_CharacterPosition>1)
	$_t_CurrentCode:=Substring:C12($_t_CurrentCode; $_l_CharacterPosition)
End if 
$_l_CharacterPosition:=Position:C15(Char:C90(13); $_t_CurrentCode)
If ($_l_CharacterPosition>0)
	$_t_FirstLine:=Substring:C12($_t_CurrentCode; 1; $_l_CharacterPosition-1)
	$_t_FirstLine:=Replace string:C233($_t_FirstLine; "//"; "")
	
	QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1=$_t_FirstLine)
	[SCRIPTS:80]Recording_Text:4:=$_t_CurrentCode
	SAVE RECORD:C53([SCRIPTS:80])
	
End if 




//End for 
//End if 

//End if
ERR_MethodTrackerReturn("DYN_Destructor"; $_t_oldMethodName)