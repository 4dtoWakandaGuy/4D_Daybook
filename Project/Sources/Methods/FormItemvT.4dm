//%attributes = {}
If (False:C215)
	//Project Method Name:      FormItemvT
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
	C_TEXT:C284($_t_oldMethodName; $0; vT)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FormItemvT")
$_l_Length:=62
$0:=Substring:C12(vT; 1; $_l_Length-2)
$_l_CharacterPosition:=Position:C15(Char:C90(13); $0)
If ($_l_CharacterPosition>0)
	$0:=Substring:C12($0; 1; $_l_CharacterPosition-1)+" "
	vT:=Substring:C12(vT; $_l_CharacterPosition+1; 32000)
Else 
	vT:=Substring:C12(vT; $_l_Length-1; 32000)
End if 
While ((Substring:C12(vT; 1; 1)#" ") & (Substring:C12($0; Length:C16($0); 1)#" ") & (Substring:C12(vT; 1; 1)#(Char:C90(13))) & (Substring:C12($0; Length:C16($0); 1)#(Char:C90(13))) & (Length:C16($0)>5) & (vT#""))
	IDLE:C311  // 03/04/03 pb
	vT:=Substring:C12($0; Length:C16($0); 1)+vT
	$0:=Substring:C12($0; 1; Length:C16($0)-1)
End while 
vT:=RemoveLead(vT)
ERR_MethodTrackerReturn("FormItemvT"; $_t_oldMethodName)