//%attributes = {}
If (False:C215)
	//Project Method Name:      Address_Lines
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:40
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_EndOfLine; $_l_Index)
	C_POINTER:C301($_Ptr_toVariable)
	C_TEXT:C284($_t_oldMethodName; $1; vDetails1; vDetails2; vDetails3; vDetails4; vDetails5; vDetails6; vDetails7; vDetails8)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Address_Lines")
//Address_Lines
vDetails1:=""
vDetails2:=""
vDetails3:=""
vDetails4:=""
vDetails5:=""
vDetails6:=""
vDetails7:=""
vDetails8:=""
$_l_EndOfLine:=Position:C15(Char:C90(13); $1)
If ($_l_EndOfLine=0)
	$_l_EndOfLine:=Position:C15(Char:C90(10); $1)
End if 
$_l_Index:=1
While (($_l_EndOfLine>0) & ($_l_Index<9))
	IDLE:C311  // 03/04/03 pb
	$_Ptr_toVariable:=Get pointer:C304("vDetails"+String:C10($_l_Index))
	$_Ptr_toVariable->:=Substring:C12($1; 1; $_l_EndOfLine-1)
	$1:=Substring:C12($1; $_l_EndOfLine+1; 32000)
	$_l_EndOfLine:=Position:C15(Char:C90(13); $1)
	If ($_l_EndOfLine=0)
		$_l_EndOfLine:=Position:C15(Char:C90(10); $1)
	End if 
	$_l_Index:=$_l_Index+1
End while 
If ($_l_Index<9)
	$_Ptr_toVariable:=Get pointer:C304("vDetails"+String:C10($_l_Index))
	$_Ptr_toVariable->:=Substring:C12($1; 1; 32000)
End if 
ERR_MethodTrackerReturn("Address_Lines"; $_t_oldMethodName)
