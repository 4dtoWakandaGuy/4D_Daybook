//%attributes = {}
If (False:C215)
	//Project Method Name:      Menu_RecordPop
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
	C_BOOLEAN:C305(<>RecRecord)
	C_LONGINT:C283($2)
	C_TEXT:C284(<>RECTEXT; $_t_oldMethodName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Menu_RecordPop")
If (<>RecRecord)
	<>RecText:=<>RecText+"Menu ("+Char:C90(34)+$1+Char:C90(34)+";-1;"+Char:C90(34)+"PopUp Item "+("0"*(Num:C11($2<9)))+String:C10($2)+Char:C90(34)+")"+Char:C90(13)
End if 
ERR_MethodTrackerReturn("Menu_RecordPop"; $_t_oldMethodName)