//%attributes = {}
If (False:C215)
	//Project Method Name:      Menu_Record
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
	C_LONGINT:C283(<>RecBarUp)
	C_TEXT:C284(<>RECTEXT; $_t_oldMethodName; $1; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Menu_Record")
//Menu_Record

If (<>RecBarUp#0)
	If (<>RecRecord)
		
		If (Substring:C12(<>RecText; Length:C16(<>RecText)-5; 6)="Menu (")
			<>RecText:=<>RecText+Char:C90(34)+$1+Char:C90(34)+";-1;"+Char:C90(34)+$2+Char:C90(34)+")"+Char:C90(13)
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Menu_Record"; $_t_oldMethodName)