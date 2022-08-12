If (False:C215)
	//Table Form Method Name: [COMPANIES]Company_In
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/09/2012 17:47
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(CO_at_SearchConstructs;0)
	//ARRAY TEXT(CO_at_SearchConstructs2;0)
	//ARRAY TEXT(CO_at_SearchOptions;0)
	//ARRAY TEXT(CO_at_SearchOptions2;0)
	C_BOOLEAN:C305(<>SYS_bo_CompanyStatusSeperate; Co_bo_FurthersSetup; COM_bo_ContactShowAnalysis; COM_bo_ContactShowRelated; DB_bo_NoLoad)
	C_LONGINT:C283($_l_ClickedButtonFunction; $_l_event; $_l_ProcessState; CON_l_IPcall; CON_l_SubInfoProcess; DB_l_ButtonClickedFunction)
	C_PICTURE:C286(COM_Pi_EditMode)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("FM [COMPANIES]Company_In"; Form event code:C388)
$_l_event:=Form event code:C388
If ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
	//TRACE
	DB_SetnewToolBar
	OpenHelp(Table:C252(->[COMPANIES:2]); "Company_In")
	ARRAY TEXT:C222(CO_at_SearchOptions; 0)
	ARRAY TEXT:C222(CO_at_SearchConstructs; 0)
	CO_LoadWebsearchPrefs
	//So we never add in to the prefs the following
	ARRAY TEXT:C222(CO_at_SearchOptions2; 0)
	ARRAY TEXT:C222(CO_at_SearchConstructs2; 0)
	COPY ARRAY:C226(CO_at_SearchOptions; CO_at_SearchOptions2)
	COPY ARRAY:C226(CO_at_SearchConstructs; CO_at_SearchConstructs2)
	If (User in group:C338(Current user:C182; "Administrator")) | (User in group:C338(Current user:C182; "Designer")) | (Current user:C182="Designer")
		APPEND TO ARRAY:C911(CO_at_SearchConstructs2; "")
		APPEND TO ARRAY:C911(CO_at_SearchOptions2; "-")
		APPEND TO ARRAY:C911(CO_at_SearchConstructs2; "")
		APPEND TO ARRAY:C911(CO_at_SearchOptions2; "Edit Websearch Settings")
	End if 
End if 
//TRACE
If (FORM Get current page:C276#5)
	$_l_ClickedButtonFunction:=DB_l_ButtonClickedFunction
	If ($_l_ClickedButtonFunction=DB_GetButtonFunction("Cancel"))
		Co_bo_FurthersSetup:=False:C215
		Reports_PrefsCancel  //Added 01/12/08 v631b120i -kmw
		
		DB_l_ButtonClickedFunction:=0
		CANCEL:C270
		DB_CloseRelatedProcesses(Current process:C322; $_l_ClickedButtonFunction)
		If (CON_l_SubInfoProcess>0)  //This is so if it is a Company_Now it will close
			
			$_l_ProcessState:=Process state:C330(CON_l_SubInfoProcess)
			If ($_l_ProcessState>=0)
				SET PROCESS VARIABLE:C370(CON_l_SubInfoProcess; CON_l_IPcall; 300)
				POST OUTSIDE CALL:C329(CON_l_SubInfoProcess)
			End if 
			
		End if 
		DB_l_ButtonClickedFunction:=0
	Else 
		
		
		Companies_InLP($_l_event)
		
	End if 
Else 
	//TRACE
	If ($_l_event=On Outside Call:K2:11)
		
		If (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Last")) | (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Next")) | (DB_l_ButtonClickedFunction=DB_GetButtonFunction("First")) | (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Previous")) | (DB_l_buttonClickedFunction=DB_GetButtonFunction("Plus")) | (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Previous")) | (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Delete")) | (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Tel")) | (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Find")) | (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Count"))
			If (FORM Get current page:C276=5) & ((DB_l_ButtonClickedFunction=DB_GetButtonFunction("Plus")) | (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Delete")))
				
				
				Contacts_InLP(False:C215; False:C215)
			Else 
				If (CON_l_SubInfoProcess>0)  //This is so if it is a Company_Now it will close
					
					$_l_ProcessState:=Process state:C330(CON_l_SubInfoProcess)
					If ($_l_ProcessState>=0)
						SET PROCESS VARIABLE:C370(CON_l_SubInfoProcess; CON_l_IPcall; 300)
						POST OUTSIDE CALL:C329(CON_l_SubInfoProcess)
					End if 
					
				End if 
				
				Companies_InLP
				
				Case of 
					: ($_l_event=On Load:K2:1)
						
						OBJECT SET VISIBLE:C603(*; "oContactsP2@"; False:C215)
						OBJECT SET VISIBLE:C603(*; "oContactsP1@"; True:C214)
						OBJECT SET VISIBLE:C603(*; "oContactsRelated"; True:C214)
						
				End case 
			End if 
		Else 
			$_l_ClickedButtonFunction:=DB_l_ButtonClickedFunction
			Contacts_InLP(False:C215; False:C215)
			If ($_l_ClickedButtonFunction=DB_GetButtonFunction("Cancel"))
				// | `($_l_ClickedButtonFunction="Next") | ($_l_ClickedButtonFunction="First") | ($_l_ClickedButtonFunction="Previous")
				FORM GOTO PAGE:C247(1)
				//DB_t_ButtonClickedFunction:=$_l_ClickedButtonFunction
				DB_l_ButtonClickedFunction:=0
				POST OUTSIDE CALL:C329(Current process:C322)
			End if 
		End if 
		
	Else 
		Contacts_InLP(False:C215; False:C215)
		If (Not:C34(COM_bo_ContactShowAnalysis))
			OBJECT SET VISIBLE:C603(*; "oCOntactsP1Tabs"; True:C214)
			OBJECT SET VISIBLE:C603(*; "oContactsRelated"; True:C214)
			OBJECT SET VISIBLE:C603(*; "oContactsP2Label"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oContactsP2CommentsField"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oContactFurtherAnalButton"; False:C215)
			OBJECT SET VISIBLE:C603(*; "OCOntactsP2FALabel"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oContactsP2FA"; False:C215)
		Else 
			OBJECT SET VISIBLE:C603(*; "oCOntactsP1Tabs"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oContactsRelated"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oContactsP2Label"; True:C214)
			OBJECT SET VISIBLE:C603(*; "oContactsP2CommentsField"; True:C214)
			OBJECT SET VISIBLE:C603(*; "oContactFurtherAnalButton"; True:C214)
			OBJECT SET VISIBLE:C603(*; "OCOntactsP2FALabel"; True:C214)
			OBJECT SET VISIBLE:C603(*; "oContactsP2FA"; True:C214)
		End if 
		
		If (Not:C34(<>SYS_bo_CompanyStatusSeperate))
			//update the company data
			//status
			[COMPANIES:2]Status:12:=[CONTACTS:1]Status:14
			//type
			[COMPANIES:2]Company_Type:13:=[CONTACTS:1]Contact_Type:15
			//source
			[COMPANIES:2]Source:14:=[CONTACTS:1]Source:16
			//last mod
			[COMPANIES:2]Modified_Date:32:=[CONTACTS:1]Modified_Date:28
			//sales person
			[COMPANIES:2]Sales_Person:29:=[CONTACTS:1]Sales_Person:25
			//taken by
			[COMPANIES:2]Taken_By:26:=[CONTACTS:1]Taken_by:29
			
		End if 
		
	End if 
End if 
ERR_MethodTrackerReturn("FM:Company_In"; $_t_oldMethodName)
