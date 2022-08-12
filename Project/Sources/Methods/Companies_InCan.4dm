//%attributes = {}
If (False:C215)
	//Project Method Name:      Companies_InCan
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/11/2009 10:34`Method: Companies_InCan
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_ContactCodes; 0)
	C_BOOLEAN:C305(<>MultiCo; <>OneEntry; Co_bo_FurthersSetup; COM_bo_AddingFurther)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283(vAdd; vCP; vCT)
	C_TEXT:C284($_t_oldMethodName; COM_t_OpenCompanyName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Companies_InCan")
COM_bo_AddingFurther:=False:C215
Co_bo_FurthersSetup:=False:C215

If ((vAdd=1) & (DB_t_CurrentFormUsage2#"NoCan"))
	DB_SaveRecord(->[CONTACTS:1])
	AA_CheckFileUnlocked(->[CONTACTS:1]x_ID:33)
	If (([COMPANIES:2]Company_Code:1#"") & (Character code:C91(Substring:C12([COMPANIES:2]Company_Code:1; Length:C16([COMPANIES:2]Company_Code:1); 1))#64))
		If (<>MultiCo)
			QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Company_Code:1=[COMPANIES:2]Company_Code:1; *)
			QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
			SELECTION TO ARRAY:C260([CONTACTS_COMPANIES:145]Contact_Code:4; $_at_ContactCodes)
			QUERY WITH ARRAY:C644([CONTACTS:1]Contact_Code:2; $_at_ContactCodes)
			//DELETE SELECTION([CONTACTS_COMPANIES])
			APPLY TO SELECTION:C70([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Address_DateDeleted:7:=Current date:C33(*))
			APPLY TO SELECTION:C70([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Address_Status:5:=-1)
			
			
		Else 
			QUERY:C277([CONTACTS:1]; [CONTACTS:1]Company_Code:1=[COMPANIES:2]Company_Code:1)
		End if 
		QUERY SELECTION:C341([CONTACTS:1]; [CONTACTS:1]Entry_Date:17=<>DB_d_CurrentDate)
		SELECTION TO ARRAY:C260([CONTACTS:1]Contact_Code:2; $_at_ContactCodes)
		QUERY WITH ARRAY:C644([CONTACTS_COMPANIES:145]Contact_Code:4; $_at_ContactCodes)
		QUERY SELECTION:C341([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
		
		APPLY TO SELECTION:C70([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Address_DateDeleted:7:=Current date:C33(*))
		APPLY TO SELECTION:C70([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Address_Status:5:=-1)
		
		//DELETE SELECTION([CONTACTS_COMPANIES])
		DELETE SELECTION:C66([CONTACTS:1])
	End if 
End if 

Reports_PrefsCancel  //Added 01/12/08 v631b120i -kmw

vCT:=0
vCP:=0
OK:=0
If (COM_t_OpenCompanyName="")  // this will be set if we are adding a company and selected one from the de-dup
	// if it is then we are not ending the batch process if it not set then the user pressed cancel so end the batch
	
	
	
	<>OneEntry:=True:C214
	
End if 
ERR_MethodTrackerReturn("Companies_InCan"; $_t_oldMethodName)
