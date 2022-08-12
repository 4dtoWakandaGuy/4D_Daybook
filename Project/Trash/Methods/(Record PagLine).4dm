//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Record PagLine
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
	C_LONGINT:C283($_l_CharPosition; $_l_CharPosition2)
	C_TEXT:C284($_t_oldMethodName; $0; Macro_F2; vMT; vMTitle2; vMTitle3)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Record PagLine")
//Record PagLine
First_FieldPtr(->vMT; Char:C90(13); ->vMTitle2)
RemoveLeadTr(vMTitle2; ->vMTitle2)
vMTitle3:=vMTitle2

$_l_CharPosition:=Position:C15("`"; vMTitle2)
If ($_l_CharPosition#0)
	If ($_l_CharPosition<6)
		vMTitle3:=Substring:C12(vMTitle3; $_l_CharPosition; 32000)
		RemoveLeadTr(vMTitle3; ->vMTitle3)
		//vMTitle3:=vMTitle3+"     "+Substring(vMTitle3;$_l_CharPosition;32000)
	Else 
		If (Substring:C12(vMTitle3; $_l_CharPosition-5; 4)#"     `")
			vMTitle3:=Substring:C12(vMTitle3; $_l_CharPosition; 32000)
			RemoveLeadTr(vMTitle3; ->vMTitle3)
			//     vMTitle3:=vMTitle3+"     "+Substring(vMTitle3;$_l_CharPosition;32000)
		End if 
	End if 
End if 

$_l_CharPosition2:=Position:C15(" ("; vMTitle2)
If ($_l_CharPosition2=0)
	$_l_CharPosition2:=Position:C15("("; vMTitle2)
	If ($_l_CharPosition2=0)
		If ($_l_CharPosition=0)
			$0:=vMTitle2
		Else 
			Macro_F2:=""
			RemoveLeadTr(Substring:C12(vMTitle2; 1; $_l_CharPosition-1); ->Macro_F2)
			$0:=Macro_F2
		End if 
	Else 
		$0:=Substring:C12(vMTitle2; 1; $_l_CharPosition2-1)
	End if 
Else 
	$0:=Substring:C12(vMTitle2; 1; $_l_CharPosition2-1)
End if 
Macro_F2:=""
RemoveLeadTr($0; ->Macro_F2)
$0:=Macro_F2
ERR_MethodTrackerReturn("Record PagLine"; $_t_oldMethodName)
