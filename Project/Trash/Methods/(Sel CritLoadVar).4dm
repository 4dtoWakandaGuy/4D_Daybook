//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Sel_CritLoadVar
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
	C_BOOLEAN:C305($_bo_OK)
	C_LONGINT:C283($_l_CharPosition; $2)
	C_POINTER:C301($_ptr_Variable)
	C_TEXT:C284($_t_IncomingText; $_t_oldMethodName; $_t_Tab; $1; vT)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Sel_CritLoadVar")
//Sel_CritLoadVar
$_t_Tab:=Char:C90(9)
While ($1#"")
	IDLE:C311  // 7/04/03 pb
	$_bo_OK:=True:C214
	$_l_CharPosition:=Position:C15("+"; $1)
	If ($_l_CharPosition=0)
		$_t_IncomingText:=$1
		$1:=""
	Else 
		$_t_IncomingText:=Substring:C12($1; 1; $_l_CharPosition-1)
		$1:=Substring:C12($1; $_l_CharPosition+1; 32000)
	End if 
	If ($_t_IncomingText#"")
		If ($_t_IncomingText="_FileState")
			Sel_CritArrL
		Else 
			$_ptr_Variable:=Get pointer:C304($_t_IncomingText)
			$_l_CharPosition:=Type:C295($_ptr_Variable->)
			Case of 
				: (($_l_CharPosition=0) | ($_l_CharPosition=2) | ($_l_CharPosition=24))
					$_ptr_Variable->:=First_Field(->vT; $_t_Tab)
				: (($_l_CharPosition=1) | ($_l_CharPosition=8) | ($_l_CharPosition=9))
					$_ptr_Variable->:=Num:C11(First_Field(->vT; $_t_Tab))
				: ($_l_CharPosition=4)
					$_ptr_Variable->:=Date:C102(First_Field(->vT; $_t_Tab))
				: ($_l_CharPosition=11)
					$_ptr_Variable->:=Time:C179(First_Field(->vT; $_t_Tab))
				: ($_l_CharPosition=6)
					$_ptr_Variable->:=(First_Field(->vT; $_t_Tab)="1")
			End case 
		End if 
	End if 
End while 
ERR_MethodTrackerReturn("Sel_CritLoadVar"; $_t_oldMethodName)
