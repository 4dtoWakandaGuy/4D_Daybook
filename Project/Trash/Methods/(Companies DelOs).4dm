//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Companies_DelOs
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
	C_BOOLEAN:C305(<>SYS_bo_ContactJustDeleteMC)
	C_LONGINT:C283(MOD_l_CurrentModuleAccess)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; $_t_CurrentFormUsage; $_t_oldMethodName; DB_t_CurrentFormUsage)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Companies_DelOs")
//Companies_DelOs - ie multiple
If (MOD_l_CurrentModuleAccess<3)
	If (<>SYS_bo_ContactJustDeleteMC)
		FIRST RECORD:C50([CONTACTS:1])
		QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Contact_Code:4=[CONTACTS:1]Contact_Code:2; *)
		QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
		
		While (Not:C34(End selection:C36([CONTACTS:1])))
			QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Contact_Code:4=[CONTACTS:1]Contact_Code:2; *)
			QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
			If (Records in selection:C76([CONTACTS_COMPANIES:145])=0)
				QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Contact_Code:4=[CONTACTS:1]Contact_Code:2)
			End if 
			
			
			
			QUERY SELECTION:C341([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Company_Code:1=[COMPANIES:2]Company_Code:1)
			If (Records in selection:C76([CONTACTS_COMPANIES:145])=0)
				CREATE RECORD:C68([CONTACTS_COMPANIES:145])
				[CONTACTS_COMPANIES:145]Company_Code:1:=[COMPANIES:2]Company_Code:1
				[CONTACTS_COMPANIES:145]Contact_Code:4:=[CONTACTS:1]Contact_Code:2
			End if 
			[CONTACTS_COMPANIES:145]Address_DateDeleted:7:=Current date:C33(*)
			[CONTACTS_COMPANIES:145]Address_Status:5:=-1
			DB_SaveRecord(->[CONTACTS_COMPANIES:145])
			If ([CONTACTS:1]Company_Code:1=[CONTACTS_COMPANIES:145]Company_Code:1)
				[CONTACTS:1]Company_Code:1:=""
				//CON_t_CompanyCode:=""
			End if   //DELETE RECORD([CONTACTS_COMPANIES])
			[CONTACTS:1]Export:18:=Export_Stamp2([CONTACTS:1]Export:18)
			DB_SaveRecord(->[CONTACTS:1])
			AA_CheckFileUnlocked(->[CONTACTS:1]x_ID:33)
			NEXT RECORD:C51([CONTACTS:1])
		End while 
		CompCont_Srch
		OK:=1
	Else 
		$_t_CurrentFormUsage:=DB_t_CurrentFormUsage
		DB_t_CurrentFormUsage:="ManyIncl"
		If (Modified record:C314([COMPANIES:2]))
			DB_SaveRecord(->[COMPANIES:2])
			AA_CheckFileUnlocked(->[COMPANIES:2]x_ID:63)
		End if 
		CUT NAMED SELECTION:C334([COMPANIES:2]; "$CompDelO")
		Contacts_Del
		USE NAMED SELECTION:C332("$CompDelO")
		DB_t_CurrentFormUsage:=$_t_CurrentFormUsage
	End if 
Else 
	Gen_AlertAcc("Delete Contacts"; "")
	OK:=0
End if 
ERR_MethodTrackerReturn("Companies_DelOs"; $_t_oldMethodName)
