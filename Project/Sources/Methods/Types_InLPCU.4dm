//%attributes = {}
If (False:C215)
	//Project Method Name:      Types_InLPCU
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 17/03/2010 12:27
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_CodeNumbers; 0)
	C_TEXT:C284($_t_oldMethodName; vPOPriceName; vPriceName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Types_InLPCU")
RELATE ONE:C42([TYPES:5]SO_Price_Group:4)
vPriceName:=[PRICE_GROUPS:18]Price_Name:2
RELATE ONE:C42([TYPES:5]SO_Price_Group:4)
vPOPriceName:=[PRICE_GROUPS:18]Price_Name:2
ARRAY LONGINT:C221($_al_CodeNumbers; 3)
$_al_CodeNumbers{1}:=1
$_al_CodeNumbers{2}:=2
$_al_CodeNumbers{3}:=4
Gen_CULPB(->[TYPES:5]Type_Code:1; 4; ->$_al_CodeNumbers; "Contacts"; "Companies"; "Contact Cos")
ERR_MethodTrackerReturn("Types_InLPCU"; $_t_oldMethodName)