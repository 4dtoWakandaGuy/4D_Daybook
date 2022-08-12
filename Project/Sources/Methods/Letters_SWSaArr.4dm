//%attributes = {}
If (False:C215)
	//Project Method Name:      Letters_SWSaArr
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/08/2009 10:14
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//Array TEXT(GEN_at_Identity;0)
	//Array TEXT(GEN_at_Name;0)
	C_TEXT:C284($_t_oldMethodName; vTitle4)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Letters_SWSaArr")
If (Records in selection:C76([DOCUMENTS:7])>50)
	MESSAGES OFF:C175
	ORDER BY:C49([DOCUMENTS:7]; [DOCUMENTS:7]Standard:9; <)
	REDUCE SELECTION:C351([DOCUMENTS:7]; 50)
	MESSAGES ON:C181
	vTitle4:="(Last 50 only)"
Else 
	vTitle4:=""
End if 
SELECTION TO ARRAY:C260([DOCUMENTS:7]Document_Code:1; GEN_at_Identity; [DOCUMENTS:7]Heading:2; GEN_at_Name)
SORT ARRAY:C229(GEN_at_Identity; GEN_at_Name; >)
If (Size of array:C274(GEN_at_Identity)=0)
	INSERT IN ARRAY:C227(GEN_at_Identity; 1; 1)
	INSERT IN ARRAY:C227(GEN_at_Name; 1; 1)
	GEN_at_Identity{1}:="Not Defined"
End if 
GEN_at_Identity:=0
GEN_at_Name:=0
ERR_MethodTrackerReturn("Letters_SWSaArr"; $_t_oldMethodName)