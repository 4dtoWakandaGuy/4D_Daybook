//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      StatsView UpdS
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 04/05/2011 05:54
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//Array TEXT(aSV1;0)
	C_BOOLEAN:C305($4; $eq)
	C_LONGINT:C283($1; $3)
	C_POINTER:C301($2; vFilePtr)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StatsView UpdS")
//StatsView Update Search
//see also StatsView UpdSF

If (Count parameters:C259=3)
	$eq:=True:C214
Else 
	$eq:=$4
End if 
MESSAGES OFF:C175
CREATE SET:C116(vFilePtr->; "$Temp")

If ($eq)
	Case of 
		: (($3=1) | ($3=8) | ($3=9))
			QUERY:C277(vFilePtr->; $2->=Num:C11(aSV1{$1}))
		: ($3=4)
			QUERY:C277(vFilePtr->; $2->=Date:C102(aSV1{$1}))
		: ($3=6)
			QUERY:C277(vFilePtr->; $2->=(aSV1{$1}="True"))
		Else 
			QUERY:C277(vFilePtr->; $2->=aSV1{$1})
	End case 
Else 
	Case of 
		: (($3=1) | ($3=8) | ($3=9))
			QUERY:C277(vFilePtr->; $2->#Num:C11(aSV1{$1}))
		: ($3=4)
			QUERY:C277(vFilePtr->; $2->#Date:C102(aSV1{$1}))
		: ($3=6)
			QUERY:C277(vFilePtr->; $2->#(aSV1{$1}="True"))
		Else 
			QUERY:C277(vFilePtr->; $2->#aSV1{$1})
	End case 
End if 
CREATE SET:C116(vFilePtr->; "$temp2")
INTERSECTION:C121("$Temp"; "$temp2"; "$temp")
USE SET:C118("$temp")
MESSAGES ON:C181
ERR_MethodTrackerReturn("StatsView UpdS"; $_t_oldMethodName)