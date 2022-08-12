//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Transact SttLck
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
	ARRAY LONGINT:C221($_al_Long; 0)
	ARRAY TEXT:C222($_at_TextData; 0)
	C_BOOLEAN:C305($0)
	C_LONGINT:C283($2)
	C_POINTER:C301($_ptr_Table; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Transact SttLck")
//Trans SttLck - Start & Lock
If (Count parameters:C259>=1)
	$_ptr_Table:=Table:C252(Table:C252($1))
	READ WRITE:C146($_ptr_Table->)
	//  START TRANSACTION
	StartTransaction  // 13/05/02 pb
	
	If (Type:C295($1->)=9)
		ARRAY LONGINT:C221($_al_Long; 0)
		SELECTION TO ARRAY:C260($1->; $_al_Long)
		ARRAY TO SELECTION:C261($_al_Long; $1->)
	Else 
		ARRAY TEXT:C222($_at_TextData; 0)
		SELECTION TO ARRAY:C260($1->; $_at_TextData)
		ARRAY TO SELECTION:C261($_at_TextData; $1->)
	End if 
	$0:=(Records in set:C195("LockedSet")=0)
	If ($0=False:C215)
		If (Count parameters:C259=1)
			Gen_Alert("The Function has to be cancelled because one or more Records are locked by "+"another Process or User"; "Cancel")
		End if 
		//  CANCEL TRANSACTION
		OK:=0
		Transact_End  // 13/05/02 pb
	End if 
Else 
	$0:=False:C215
End if 
ERR_MethodTrackerReturn("Transact SttLck"; $_t_oldMethodName)