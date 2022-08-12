//%attributes = {}
If (False:C215)
	//Project Method Name:      Companies_DelO
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 18/01/2010 16:23
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SYS_bo_ContactJustDeleteMC)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283(MOD_l_CurrentModuleAccess)
	C_TEXT:C284($_t_oldMethodName; CON_t_CompanyCode; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; $_t_CurrentFormUsage; $_t_oldMethodName; DB_t_CurrentFormUsage)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Companies_DelO")
//Companies_DelO
If (MOD_l_CurrentModuleAccess<3)
	If ([CONTACTS:1]Contact_Code:2#"")
		If (([CONTACTS:1]Entry_Date:17=<>DB_d_CurrentDate) & ([CONTACTS:1]Surname:5="") & ([CONTACTS:1]Forename:4=""))
			CREATE SET:C116([CONTACTS:1]; "OMaster")
			Minor_DeleteSingleRecord(->[CONTACTS:1]; ->[CONTACTS:1]Contact_Code:2; "Contacts")
			DB_DeletionControl(->[CONTACTS:1])
			
			DELETE RECORD:C58([CONTACTS:1])
			USE SET:C118("OMaster")
		Else 
			If (<>SYS_bo_ContactJustDeleteMC)
				QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Contact_Code:4=[CONTACTS:1]Contact_Code:2; *)
				QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
				QUERY SELECTION:C341([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Company_Code:1=[COMPANIES:2]Company_Code:1)
				[CONTACTS_COMPANIES:145]Address_DateDeleted:7:=Current date:C33(*)
				[CONTACTS_COMPANIES:145]Address_Status:5:=-1
				If ([CONTACTS:1]Company_Code:1=[CONTACTS_COMPANIES:145]Company_Code:1)
					[CONTACTS:1]Company_Code:1:=""
					
					
				End if 
				
				[CONTACTS:1]Export:18:=Export_Stamp2([CONTACTS:1]Export:18)
				
				DB_SaveRecord(->[CONTACTS:1])
				AA_CheckFileUnlocked(->[CONTACTS:1]x_ID:33)
				CompCont_Srch
				OK:=1
			Else 
				$_t_CurrentFormUsage:=DB_t_CurrentFormUsage
				DB_t_CurrentFormUsage:="OneIncl"
				If (Modified record:C314([COMPANIES:2]))
					DB_SaveRecord(->[COMPANIES:2])
					AA_CheckFileUnlocked(->[COMPANIES:2]x_ID:63)
				End if 
				CUT NAMED SELECTION:C334([COMPANIES:2]; "$CompDelO")
				Contacts_Del
				USE NAMED SELECTION:C332("$CompDelO")
				DB_t_CurrentFormUsage:=$_t_CurrentFormUsage
			End if 
		End if 
	End if 
Else 
	Gen_AlertAcc("Delete Contacts"; "")
	OK:=0
End if 
ERR_MethodTrackerReturn("Companies_DelO"; $_t_oldMethodName)
