If (False:C215)
	//object Name: [SALES_PROJECTION]SalesProjectionEntry.Invisible Button3
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 08/03/2013 15:56
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>AutoFind)
	C_TEXT:C284(<>ContCode; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [SALES_PROJECTION].SalesProjectionEntry.Invisible Button3"; Form event code:C388)
//SDiary_MenV: WT-13/08/01

READ ONLY:C145([CONTACTS:1])
If ([SALES_PROJECTION:113]ContactID:7>0)
	QUERY:C277([CONTACTS:1]; [CONTACTS:1]x_ID:33=[SALES_PROJECTION:113]ContactID:7)
	<>ContCode:=[COMPANIES:2]Company_Code:1
	<>AutoFind:=True:C214
	
	DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[CONTACTS:1])))
	
Else 
	Gen_Alert("This Pipeline is not related to a contact")
End if 
ERR_MethodTrackerReturn("OBJ:SalesProjectionEntry,BSourceC"; $_t_oldMethodName)
