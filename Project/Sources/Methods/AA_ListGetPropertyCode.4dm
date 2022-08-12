//%attributes = {}
If (False:C215)
	//Project Method Name: 
	//------------------ Method Notes ------------------
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:39
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_CodeNumber; $0; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("AA_ListGetPropertyCode")
//this is passed an ID of a list item
//we will get that list item(dont need to know which list in here)
//we get the properties of that item and extract the CODE
//then we act on that code

$0:=0
If (Count parameters:C259>=1)  //1
	READ ONLY:C145([LIST_ITEMS:95])
	QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ID:3=$1)
	If (Records in selection:C76([LIST_ITEMS:95])>0)  //2
		$_l_CodeNumber:=0
		AA_GetListItemProperty("CODE"; ->$_l_CodeNumber)
	Else 
		$0:=0
		Gen_Alert("ERROR")
		
	End if   //2
	
Else 
	$0:=0
End if   //end 1
ERR_MethodTrackerReturn("AA_ListGetPropertyCode"; $_t_oldMethodName)
