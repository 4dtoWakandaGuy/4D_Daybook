If (False:C215)
	//object Name: [CONTACTS]Contact_In.oCON_CompanyArea
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:04
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; CON_t_CoAreaCode; CON_t_CompanyArea)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [CONTACTS].Contact_In.oCON_CompanyArea"; Form event code:C388)
CON_t_CoAreaCode:=""
Check_Minor(->CON_t_CompanyArea; "Area"; ->[AREAS:3]; ->[AREAS:3]Area_Code:1; ->[AREAS:3]Area_Name:2; "Areas In")
If (CON_t_CompanyArea#"")
	QUERY:C277([AREAS:3]; [AREAS:3]Area_Code:1=CON_t_CompanyArea)
	CON_t_CoAreaCode:=[AREAS:3]Area_Code:1
	CON_t_CompanyArea:=[AREAS:3]Area_Name:2
	UNLOAD RECORD:C212([AREAS:3])
	
End if 
ERR_MethodTrackerReturn("OBJ [CONTACTS].Contact_In.oCON_CompanyArea"; $_t_oldMethodName)
