//%attributes = {}
If (False:C215)
	//Project Method Name:      Comp_Sel3
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:42
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_CompanyAbbreviated; $_t_oldMethodName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Comp_Sel3")
QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=$1)
If (Records in selection:C76([COMPANIES:2])=0)
	QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Name:2=$1; *)
	QUERY:C277([COMPANIES:2];  | ; [COMPANIES:2]Also_Known_As:43=$1; *)
	$_t_CompanyAbbreviated:=Companies_Abbr($1)+"@"
	QUERY:C277([COMPANIES:2];  | ; [COMPANIES:2]Company_Abbreviated_Name:52=$_t_CompanyAbbreviated)
	If (Records in selection:C76([COMPANIES:2])=0)
		QUERY:C277([COMPANIES:2]; [COMPANIES:2]Postal_Code:7=$1)
		If (Records in selection:C76([COMPANIES:2])=0)
			QUERY:C277([COMPANIES:2]; [COMPANIES:2]Telephone:9=$1)
		End if 
	End if 
End if 
Sel_FindMy(->[COMPANIES:2]; ->[COMPANIES:2]Sales_Person:29; ->[COMPANIES:2]Taken_By:26)
ERR_MethodTrackerReturn("Comp_Sel3"; $_t_oldMethodName)