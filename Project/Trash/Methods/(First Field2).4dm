//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      First_Field2
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
	C_LONGINT:C283($_l_IndexChar; $_l_Length)
	C_TEXT:C284($_l_SubString; $_t_oldMethodName; $0; $1; $2; $3; $4; vT)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("First_Field2")
//First_Field2

$_l_IndexChar:=1
$_l_Length:=Length:C16($1)
$_l_SubString:=Substring:C12($1; $_l_IndexChar; 2)
While (($_l_IndexChar<$_l_Length) & ($_l_SubString#$2) & ($_l_SubString#$3) & ($_l_SubString#$4))
	IDLE:C311  // 03/04/03 pb
	$_l_IndexChar:=$_l_IndexChar+1
	$_l_SubString:=Substring:C12($1; $_l_IndexChar; 2)
End while 
If ($_l_IndexChar>=$_l_Length)
	$0:=Substring:C12($1; 1; Length:C16($1))
Else 
	$0:=Substring:C12($1; 1; $_l_IndexChar-1)
End if 
vT:=Substring:C12(vT; Length:C16($0)+Length:C16($2)+Num:C11($_l_SubString#$2); 32000)
ERR_MethodTrackerReturn("First_Field2"; $_t_oldMethodName)