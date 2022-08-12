//%attributes = {}
If (False:C215)
	//Project Method Name:      DBWS_SmartCreate
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:   07/09/2011 09:52 v7.0.0/1
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DBWS_bo_isget)
	C_TEXT:C284($_t_CompanyFormName; $_t_oldMethodName; $_t_TableNumber; $1; DBWS_T_message; VcompCode)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DBWS_SmartCreate")
If (Count parameters:C259>=1)
	$_t_TableNumber:=DBWS_ContexttoTable($1)
	Case of 
		: ($_t_TableNumber="Companies")
			
			DBWS_T_message:=""
			
			If (DBWS_bo_isget)
				$_t_CompanyFormName:=DBWS_GetWSForm("New_Company")
				DBWS_SetPage(""; $_t_CompanyFormName)
				
			Else 
				//get all the data using get input value
				
				VcompCode:=DBWS_GetInputValue("Code")
				//etc
				
				//here validate the data(see existing code
				If (DBWS_T_message#"")
					$_t_CompanyFormName:=DBWS_GetWSForm("New_Company")
					DBWS_SetPage(""; $_t_CompanyFormName)
				Else 
					CREATE RECORD:C68([COMPANIES:2])
					//as field are populated run macros.
					//have to intercept interactions and message up on the browser via script Using DBWS_Message, DBWS_Alert, DBWS_Confirm, DBWS_Request
					//probably blob with additional info-contacts-analysis etc. SOME script handling will ahve happened on screen.
					
					
					DBWS_Message("Company Created")
				End if 
				
			End if 
			
	End case 
	
	
End if 
ERR_MethodTrackerReturn("DBWS_SmartCreate"; $_t_oldMethodName)