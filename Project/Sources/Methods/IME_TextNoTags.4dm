//%attributes = {}
If (False:C215)
	//Project Method Name:      IME_TextNoTags
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
	C_LONGINT:C283($Pos1; $Pos2)
	C_TEXT:C284($_t_oldMethodName; $0; $1; $_t_Text)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IME_TextNoTags")
//IME_TextNoTags - remove <>s so that cannot harm things!

$_t_Text:=$1

$Pos1:=Position:C15("<"; $_t_Text)
$Pos2:=Position:C15(">"; $_t_Text)
While (($Pos1>0) & ($Pos2>$Pos1))
	$_t_Text:=Substring:C12($_t_Text; 1; $Pos1-1)+""+Substring:C12($_t_Text; $Pos2+1; Length:C16($_t_Text))
	$Pos1:=Position:C15("<"; $_t_Text)
	$Pos2:=Position:C15(">"; $_t_Text)
End while 

$0:=$_t_Text
ERR_MethodTrackerReturn("IME_TextNoTags"; $_t_oldMethodName)