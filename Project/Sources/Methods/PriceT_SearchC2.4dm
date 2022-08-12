//%attributes = {}
If (False:C215)
	//Project Method Name:      PriceT_SearchC2
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
	C_TEXT:C284($_t_oldMethodName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PriceT_SearchC2")
//Check that is for this co or for none
QUERY SELECTION:C341([PRICE_TABLE:28]; [PRICE_TABLE:28]Company_Code:8=""; *)
QUERY SELECTION:C341([PRICE_TABLE:28];  | ; [PRICE_TABLE:28]Company_Code:8=$1)
ERR_MethodTrackerReturn("PriceT_SearchC2"; $_t_oldMethodName)