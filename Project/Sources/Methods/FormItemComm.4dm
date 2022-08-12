//%attributes = {}
If (False:C215)
	//Project Method Name:      FormItemComm
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_CharacterPosition; $_l_Length)
	C_TEXT:C284($_t_oldMethodName; $0; vComments; vDesc)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FormItemComm")
If (vDesc="LENGTH:@")
	$_l_Length:=Num:C11(Substring:C12(vDesc; 8; 32000))
Else 
	$_l_Length:=62
End if 
$0:=Substring:C12(vComments; 1; $_l_Length-2)
$_l_CharacterPosition:=Position:C15(Char:C90(13); $0)
If ($_l_CharacterPosition>0)
	$0:=Substring:C12($0; 1; $_l_CharacterPosition-1)+" "
	vComments:=Substring:C12(vComments; $_l_CharacterPosition+1; 32000)
Else 
	vComments:=Substring:C12(vComments; $_l_Length-1; 32000)
End if 
While ((Substring:C12(vComments; 1; 1)#" ") & (Substring:C12($0; Length:C16($0); 1)#" ") & (Substring:C12(vComments; 1; 1)#(Char:C90(13))) & (Substring:C12($0; Length:C16($0); 1)#(Char:C90(13))) & (Length:C16($0)>5) & (vComments#""))
	IDLE:C311  // 03/04/03 pb
	vComments:=Substring:C12($0; Length:C16($0); 1)+vComments
	$0:=Substring:C12($0; 1; Length:C16($0)-1)
End while 
vComments:=RemoveLead(vComments)
ERR_MethodTrackerReturn("FormItemComm"; $_t_oldMethodName)