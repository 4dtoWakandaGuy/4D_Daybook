//%attributes = {}
If (False:C215)
	//Project Method Name:      Gen_PoundsPence
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:42If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($i1; $i2)
	C_POINTER:C301($1; $2)
	C_REAL:C285($3)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_PoundsPence")
//Gen_PoundsPence
//returns two strings of the figures before and after the decimal place

If ($3<0)
	$i1:=Int:C8(0-$3)
	$i2:=Round:C94((((0-$3)-$i1)*100); 0)
	$1->:="-"+String:C10($i1)
Else 
	$i1:=Int:C8($3)
	$i2:=Round:C94((($3-$i1)*100); 0)
	$1->:=String:C10($i1)
End if 
If ($i2<10)
	$2->:="0"+String:C10($i2)
Else 
	$2->:=String:C10($i2)
End if 
ERR_MethodTrackerReturn("Gen_PoundsPence"; $_t_oldMethodName)