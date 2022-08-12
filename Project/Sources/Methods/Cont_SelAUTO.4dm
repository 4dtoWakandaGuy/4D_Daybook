//%attributes = {}

If (False:C215)
	//Project Method Name:      Cont_SelAUTO
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(vO)
	C_TEXT:C284($_t_oldMethodName; $_t_Search; $1; vSelPrev)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cont_SelAUTO")

//THis is the same as Cont_Sel..expect it does not display the search box
$_t_oldMethodName:=ERR_MethodTracker("Cont_SelAUTO")
//Cont_Sel


vO:=1
If (vSelPrev="•FSC")
	Cont_SelP  //display the more choices search
Else 
	If (Count parameters:C259>=1)
		$_t_Search:=$1
		
		Cont_Sel2($_t_Search)
	End if 
	
	
End if 
ERR_MethodTrackerReturn("Cont_SelAUTO"; $_t_oldMethodName)