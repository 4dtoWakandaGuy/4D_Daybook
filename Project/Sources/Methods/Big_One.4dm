//%attributes = {}
If (False:C215)
	//Project Method Name:      Big_One
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/06/2010 18:12
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(SRCH_l_And; SRCH_l_Not; SRCH_l_or; vAny; vButt)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Big_One")
//Big One
Case of 
	: (vButt=1)
		If (Records in set:C195("Big One")=0)
			If ((Records in set:C195("Master")=0) & (vAny=0))
				If (Count parameters:C259>=1)
					ALL RECORDS:C47($1->)
					CREATE SET:C116($1->; "Big One")
				Else 
					
					Gen_Alert("This method(big one) has been modified and now requires a parameter")
				End if 
				
			Else 
				UNION:C120("Master"; "Big One"; "Big One")
			End if 
		Else 
			INTERSECTION:C121("Master"; "Big One"; "Big One")
		End if 
		
	: (vButt=2)
		UNION:C120("Master"; "Big One"; "Big One")
	: (vButt=3)
		DIFFERENCE:C122("Big One"; "Master"; "Big One")
End case 
Case of 
	: (SRCH_l_And=1)
		vButt:=1
		Vany:=0
	: (SRCH_l_or=1)
		vButt:=2
		Vany:=0
	: (SRCH_l_Not=1)
		vButt:=3
		Vany:=0
	Else 
		vButt:=0
End case 
ERR_MethodTrackerReturn("Big One"; $_t_oldMethodName)
