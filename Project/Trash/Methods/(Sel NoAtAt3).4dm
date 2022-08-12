//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Sel_NoAtAt3
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
	C_POINTER:C301($1; $2; $3; $4)
	C_TEXT:C284($_t_oldMethodName; $5; $6)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Sel_NoAtAt3")

QUERY:C277($1->; $2->=$5)
If (Records in selection:C76($1->)=0)
	QUERY:C277($1->; $3->=$5)
	If (Records in selection:C76($1->)=0)
		QUERY:C277($1->; $4->=$5)
		If (Records in selection:C76($1->)=0)
			QUERY:C277($1->; $2->=$6)
			If (Records in selection:C76($1->)=0)
				QUERY:C277($1->; $3->=$6)
				If (Records in selection:C76($1->)=0)
					QUERY:C277($1->; $4->=$6)
				End if 
			End if 
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Sel_NoAtAt3"; $_t_oldMethodName)