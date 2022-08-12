//%attributes = {}
If (False:C215)
	//Project Method Name:      Comp_SelPifs
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
	C_TEXT:C284($_t_oldMethodName; vArea; vCountry; vcounty; vPostcode; vProdCode; vSales; vSource; vStatus; vSuperior; vTele)
	C_TEXT:C284(vTown; vType)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Comp_SelPifs")
//Comp_SelPifs
Sel_S(->[COMPANIES:2]; ->[COMPANIES:2]Postal_Code:7; vPostcode)
Sel_S(->[COMPANIES:2]; ->[COMPANIES:2]Area:11; vArea)
Sel_S(->[COMPANIES:2]; ->[COMPANIES:2]Sales_Person:29; vSales)
Sel_S(->[COMPANIES:2]; ->[COMPANIES:2]Taken_By:26; vTele)
Sel_S(->[COMPANIES:2]; ->[COMPANIES:2]Status:12; vStatus)
Sel_S(->[COMPANIES:2]; ->[COMPANIES:2]Company_Type:13; vType)
Sel_S(->[COMPANIES:2]; ->[COMPANIES:2]Source:14; vSource)
Sel_S(->[COMPANIES:2]; ->[COMPANIES:2]Superior:34; vSuperior)

Sel_SSUB(->[COMPANIES:2]; ->[COMPANIES:2]Company_Code:1; vProdCode; ->[COMPANIES_RECORD_ANALYSIS:146]; ->[COMPANIES_RECORD_ANALYSIS:146]Analysis_Code:1)
Sel_S(->[COMPANIES:2]; ->[COMPANIES:2]Country:8; vCountry)
Sel_S(->[COMPANIES:2]; ->[COMPANIES:2]Town_or_City:5; vTown)
Sel_S(->[COMPANIES:2]; ->[COMPANIES:2]County_or_State:6; vcounty)
Comp_SelPName
ERR_MethodTrackerReturn("Comp_SelPifs"; $_t_oldMethodName)