//%attributes = {}
If (False:C215)
	//Project Method Name:      AA_GetPRoperty
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/03/2010 15:37
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_EOLPOsition; $_l_PropertyPosition)
	C_TEXT:C284($_t_attributes; $_t_oldMethodName; $_t_Property; $_t_PropertyItem; $_t_Seperator; $0; $1; $2; $3)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("AA_GetPRoperty")

If (Count parameters:C259>=3)
	$_t_Seperator:=$3
	If ($_t_Seperator="")
		$_t_Seperator:=":"
	End if 
Else 
	$_t_Seperator:=":"
End if 
$0:=""
If (Count parameters:C259>=2)
	$_t_Property:=$1
	$_t_attributes:=$2
	$_l_PropertyPosition:=Position:C15($_t_Property+$_t_Seperator; $_t_attributes)
	If ($_l_PropertyPosition>0)
		$_t_PropertyItem:=Substring:C12($_t_attributes; $_l_PropertyPosition+Length:C16($_t_Property+$_t_Seperator); Length:C16($_t_attributes))
		$_l_EOLPOsition:=Position:C15(Char:C90(13); $_t_PropertyItem)
		If ($_l_EOLPOsition>0)
			$_t_PropertyItem:=Substring:C12($_t_PropertyItem; 1; $_l_EOLPOsition-1)
		End if 
		$0:=$_t_PropertyItem
		
	Else 
		$0:=""
		
	End if 
	
	
End if 
ERR_MethodTrackerReturn("AA_GetPRoperty"; $_t_oldMethodName)
