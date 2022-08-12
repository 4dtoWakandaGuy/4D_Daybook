If (False:C215)
	//object Name: [SALES_PROJECTION]SalesProjectionEntry.Invisible Button2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/09/2010 22:47
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_CompaniesProcess)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [SALES_PROJECTION].SalesProjectionEntry.Invisible Button2"; Form event code:C388)
//SDiary_MenV: WT-13/08/01

READ ONLY:C145([COMPANIES:2])
If ([SALES_PROJECTION:113]CompanyID:6>0)
	QUERY:C277([COMPANIES:2]; [COMPANIES:2]x_ID:63=[SALES_PROJECTION:113]CompanyID:6)
	//◊CompCode:=[COMPANIES]Company Code
	//◊AutoFind:=True
	//DBI_MenuDisplayRecords ("Companies")
	
	$_l_CompaniesProcess:=New process:C317("DBI_DisplayRecord"; 64000; "View Company"; Current process:C322; Table:C252(->[COMPANIES:2]); ""; [SALES_PROJECTION:113]CompanyID:6)
	
	//ZCompanies_Mod
Else 
	Gen_Alert("This Pipeline is not related to a company")
End if 
ERR_MethodTrackerReturn("OBJ:SalesProjectionEntry,BSourceC"; $_t_oldMethodName)
