//%attributes = {}
If (False:C215)
	//Project Method Name:      Sel_AtOp
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
	C_LONGINT:C283($_l_CharacterCode; cNAA)
	C_TEXT:C284($_t_FirstCharacter; $_t_oldMethodName; $0; $1; $2; vRec)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Sel_AtOp")
If (Count parameters:C259>=1)
	$0:=$1
	$_l_CharacterCode:=Character code:C91(Substring:C12($0; 1; 1))
	$_t_FirstCharacter:=Substring:C12($0; 2; 1)
	Case of 
		: ($_l_CharacterCode=60)
			If ($_t_FirstCharacter="=")
				vRec:="<="
				$0:=Substring:C12($0; 3; 32000)
			Else 
				vRec:="<"
				$0:=Substring:C12($0; 2; 32000)
			End if 
		: ($_l_CharacterCode=62)
			If ($_t_FirstCharacter="=")
				vRec:=">="
				$0:=Substring:C12($0; 3; 32000)
			Else 
				vRec:=">"
				$0:=Substring:C12($0; 2; 32000)
			End if 
		: ($_l_CharacterCode=61)
			vRec:="="
			$0:=Substring:C12($0; 2; 32000)
		: ($_l_CharacterCode=35)
			vRec:="#"
			$0:=Substring:C12($0; 2; 32000)
		Else 
			vRec:=$2
	End case 
	If (cNAA=0)
		$0:=Sel_AtSign($0)
	End if 
Else 
	$0:=""
End if 
ERR_MethodTrackerReturn("Sel_AtOp"; $_t_oldMethodName)