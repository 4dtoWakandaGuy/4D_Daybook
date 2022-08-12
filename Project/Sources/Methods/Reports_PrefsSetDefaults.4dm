//%attributes = {}
If (False:C215)
	//Project Method Name:      Reports_PrefsSetDefaults
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/11/2009`Method: Reports_PrefsSetDefaults
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(EMail_at_DocEmailTo;0)
	//ARRAY TEXT(SR_at_EmailPrintOption1;0)
	//ARRAY TEXT(SR_at_EmailPrintOption2;0)
	//ARRAY TEXT(SR_at_EmailPrintOption2Val;0)
	//ARRAY TEXT(SR_at_EmailPrintOption3;0)
	//ARRAY TEXT(SR_at_EmailPrintOption3Val;0)
	//ARRAY TEXT(SR_at_EmailPrintOption4;0)
	C_BOOLEAN:C305(DOC_bo_CopyToprinter)
	C_LONGINT:C283(DOC_l_docDoEmail; DOC_l_docDoEmail_copy; DOC_l_docDoPdf; DOC_l_DocDoPDFcopy; DOC_l_DocDoPrint; l_docDoPrint_copy; SR_l_CompSettingsOverrideSR; SR_l_CompSettingsUseStandardSR)
	C_POINTER:C301($_ptr_VarToSetToDefault; $1)
	C_TEXT:C284($_t_oldMethodName; email_t_Role; SR_t_EmailPrintOption2Cont; SR_t_EmailPrintOption2Email; SR_t_EmailPrintOption2Pers; SR_t_EmailPrintOption2Role; SR_t_EmailPrintOption3Cont; SR_t_EmailPrintOption3Email; SR_t_EmailPrintOption3Pers; SR_t_EmailPrintOption3Role)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Reports_PrefsSetDefaults")


//Added 13/11/08 v631b120g -kmw


//NOTE - kmw 03/03/09 v631b120o - Just a point that if we are here because...
//... we are tryign to load prefs in order to USE them (as opposed to loading...
//...them in order to DISPLAY or SET them) then when the this method tries to...
//...base the defaults on the old style preferences and it currently fails at this and thus...
//...reverts to system default default values. - Could be improved by loading old style...
//...prefs but would need testing.



Reports_PrefsDeclareDefaults  //added 26/11/08 v631b120i -kmw



//************************* added 21/11/08 v631b120i -kmw *************************
Case of 
	: (Undefined:C82(EMail_at_DocEmailTo))
		ARRAY TEXT:C222(EMail_at_DocEmailTo; 0)
		
	: (Type:C295(EMail_at_DocEmailTo)#String array:K8:15)
		ARRAY TEXT:C222(EMail_at_DocEmailTo; 0)
	Else 
End case 
//***************************************************************************************

If (Count parameters:C259>0)
	
	$_ptr_VarToSetToDefault:=$1
	Case of 
		: ($_ptr_VarToSetToDefault=(->SR_l_CompSettingsUseStandardSR))  //Added 17/11/08 v631b120i -kmw
			//Whether company level settings override report level settings is meaningless if setting defaults at the report level but defaults functionality (as with other functionality) is shared by report and company level and no harm in having them in setting them at the report level (they're just not used for anything)
			//If ((SR_l_CompSettingsUseStandardSR=0) & (SR_l_CompSettingsOverrideSR=0)) | ((SR_l_CompSettingsUseStandardSR=1) & (SR_l_CompSettingsOverrideSR=1))
			SR_l_CompSettingsUseStandardSR:=1
			SR_l_CompSettingsOverrideSR:=0
			//End if
			
		: ($_ptr_VarToSetToDefault=(->SR_l_CompSettingsOverrideSR))  //Added 17/11/08 v631b120i -kmw
			//Whether company level settings override report level settings is meaningless if setting defaults at the report level but defaults functionality (as with other functionality) is shared by report and company level and no harm in having them in setting them at  report level (they're just not used for anything)
			//If ((SR_l_CompSettingsUseStandardSR=0) & (SR_l_CompSettingsOverrideSR=0)) | ((SR_l_CompSettingsUseStandardSR=1) & (SR_l_CompSettingsOverrideSR=1))
			SR_l_CompSettingsUseStandardSR:=1
			SR_l_CompSettingsOverrideSR:=0
			//End if
			
		: ($_ptr_VarToSetToDefault=(->SR_at_EmailPrintOption1))
			ARRAY TEXT:C222(SR_at_EmailPrintOption1; 4)
			SR_at_EmailPrintOption1{1}:="Print"
			SR_at_EmailPrintOption1{2}:="Email"
			SR_at_EmailPrintOption1{3}:="Print AND email"
			SR_at_EmailPrintOption1{4}:="Ask user at the time report generated."
			//**************** 14/11/08 v631b120g -kmw ****************
			//Pick up defaults from any lingering old style email/print settings if possible.
			//Should only have one type of old style print/email setting set at one time (Internal or SR). NOTE: To ensure this we will need to make sure these values are always set back to zero whenever we are about to load old and new style print/email settings (which should be being loaded at about the same time because the we still use some of the old settings)
			If (DOC_l_DocDoPrint=1) | (l_docDoPrint_copy=1)
				SR_at_EmailPrintOption1:=1
			Else 
				If (DOC_l_docDoPdf=1) | (DOC_l_DocDoPDFcopy=1)
					If (DOC_l_docDoEmail=1) | (DOC_l_docDoEmail_copy=1)
						If (DOC_bo_CopyToprinter)  //ie old style setting "send copy to printer" (only available on SR settings)
							SR_at_EmailPrintOption1:=3  //our equiv will therefore be "Print AND Email"
						Else   //ie old style setting standard email option will therefore be "Email"
							SR_at_EmailPrintOption1:=2  //our
						End if 
					Else   //I think this must mean something like "automatically print striaght to pdf (but don't email)"....new settings don't really have this option yet so allow for this with the following option.
						SR_at_EmailPrintOption1:=4
					End if 
				Else   //This is just weird (no print and no pdf selected) but just in case it can happen allow for it with this
					SR_at_EmailPrintOption1:=4
				End if 
			End if 
			SR_at_EmailPrintOption1:=4  //Changed kmw 20/02/09 - rethought this and probably safer to have it behave as before in that i think it always asks "print or email" for super reports regardless of what user had in setup
			//**************************************************************
			
		: ($_ptr_VarToSetToDefault=(->SR_at_EmailPrintOption2))
			ARRAY TEXT:C222(SR_at_EmailPrintOption2; 8)  //5)  `Added new options kmw 20/02/09 v631b120o
			SR_at_EmailPrintOption2{1}:="Supply 'To Address' at the time report generated."
			SR_at_EmailPrintOption2{2}:="Use default Contact_Email."
			SR_at_EmailPrintOption2{3}:="Use Company_Contact_Email where role is..."
			SR_at_EmailPrintOption2{4}:="Use company 'Accounts Payable' email."
			SR_at_EmailPrintOption2{5}:="Use company 'Accounts Receivable' email."
			SR_at_EmailPrintOption2{6}:="Use specific Contact_Email where contact code is..."  //Added kmw 20/02/09 v631b120o
			SR_at_EmailPrintOption2{7}:="Use specific personnel email where person ID is..."  //Added kmw 20/02/09 v631b120o
			SR_at_EmailPrintOption2{8}:="Use specific email address..."  //Added kmw 23/02/09 v631b120o
			//**************** 14/11/08 v631b120g -kmw ****************
			//Pick up defaults from any lingering old style email/print settings if possible.
			If (SR_at_EmailPrintOption1>1)
				Case of   //I think in old style settings EMail_at_DocEmailTo was obnly available for super reports but check it.
					: (EMail_at_DocEmailTo=1)  //contact
						SR_at_EmailPrintOption2:=2  //current contact
					: (EMail_at_DocEmailTo=2)  //contact where role is
						SR_at_EmailPrintOption2:=3  //contact where role is
					: (EMail_at_DocEmailTo=3)  //accounts payable
						SR_at_EmailPrintOption2:=4  //accounts payable
					: (EMail_at_DocEmailTo=4)  //accounts receivable
						SR_at_EmailPrintOption2:=5  //accounts receivable
					Else 
						SR_at_EmailPrintOption2:=2  //default to use current contact
				End case 
			Else 
				SR_at_EmailPrintOption2:=1  //emailing not being used anyway but this will be default if they switch emailing on
			End if 
			//**************************************************************
			
			//************ Changed to array of values 20/02/09 -kmw ************
			//: ($_ptr_VarToSetToDefault=(->SR_t_EmailPrintOption2Role))
			///
		: ($_ptr_VarToSetToDefault=(->SR_t_EmailPrintOption2Email))
		: ($_ptr_VarToSetToDefault=(->SR_t_EmailPrintOption2Cont))
			
		: ($_ptr_VarToSetToDefault=(->SR_t_EmailPrintOption2Pers))
			
			
		: ($_ptr_VarToSetToDefault=(->SR_t_EmailPrintOption2Role))
			//C_TEXT(SR_t_EmailPrintOption2Role)
			C_TEXT:C284(SR_t_EmailPrintOption2Role; 0)
			If (email_t_Role#"")  //14/11/08 v631b120g -kmw (Pick up defaults from any lingering old style email/print settings if possible.)
				//SR_t_EmailPrintOption2Role:=email_t_Role  `14/11/08 v631b120g -kmw (Pick up defaults from any lingering old style email/print settings if possible.)
				SR_t_EmailPrintOption2Role:=email_t_Role  //14/11/08 v631b120g -kmw (Pick up defaults from any lingering old style email/print settings if possible.)
			Else   //14/11/08 v631b120g -kmw (Pick up defaults from any lingering old style email/print settings if possible.)
				QUERY:C277([ROLES:87]; [ROLES:87]Role_Name:2="@account@")
				If (Records in selection:C76([ROLES:87])<1)
					QUERY:C277([ROLES:87]; [ROLES:87]Role_Name:2="@decision@")
					If (Records in selection:C76([ROLES:87])<1)
						QUERY:C277([ROLES:87]; [ROLES:87]Role_Name:2#"")
						If (Records in selection:C76([ROLES:87])<1)
							ALL RECORDS:C47([ROLES:87])
						End if 
					End if 
				End if 
				If (Records in selection:C76([ROLES:87])>0)
					ORDER BY:C49([ROLES:87]; [ROLES:87]Role_Code:1; >)
					FIRST RECORD:C50([ROLES:87])
					//SR_t_EmailPrintOption2Role:=[ROLES]Role Code
					SR_t_EmailPrintOption2Role:=[ROLES:87]Role_Code:1
				End if 
			End if   //14/11/08 v631b120g -kmw (Pick up defaults from any lingering old style email/print settings if possible.)
			
		: ($_ptr_VarToSetToDefault=(->SR_at_EmailPrintOption3))
			ARRAY TEXT:C222(SR_at_EmailPrintOption3; 9)  //;6)`Added new options kmw 20/02/09 v631b120o
			SR_at_EmailPrintOption3{1}:="Print report instead."
			SR_at_EmailPrintOption3{2}:="Supply 'To Address' at the time report generated."
			SR_at_EmailPrintOption3{3}:="Use default Contact_Email."
			SR_at_EmailPrintOption3{4}:="Use Company_Contact_Email where role is..."
			SR_at_EmailPrintOption3{5}:="Use company 'Accounts Payable' email."
			SR_at_EmailPrintOption3{6}:="Use company 'Accounts Receivable' email."
			SR_at_EmailPrintOption3{7}:="Use specific Contact_Email where contact code is..."  //Added kmw 20/02/09 v631b120o
			SR_at_EmailPrintOption3{8}:="Use specific personnel email where person ID is..."  //Added kmw 20/02/09 v631b120o
			SR_at_EmailPrintOption3{9}:="Use specific email address..."  //Added kmw 23/02/09 v631b120o
			//**************** 14/11/08 v631b120g -kmw ****************
			//Put appropriate option in here based on whatever lingering old style email/print setting defaults may have been picked up earlier
			//SR_at_EmailPrintOption3:=1
			Case of 
				: (SR_at_EmailPrintOption2=1)  //Supply 'To Address' at the time report generated.
					SR_at_EmailPrintOption3:=1  //print
				: (SR_at_EmailPrintOption2=2)  //"Use current Contact_Email."
					SR_at_EmailPrintOption3:=1  //print
				: (SR_at_EmailPrintOption2=3)  //Use Contact_Email where Role is..
					SR_at_EmailPrintOption3:=3  //Use current Contact_Email
				: (SR_at_EmailPrintOption2=4)  //Use Company 'Accounts Payable' email.
					SR_at_EmailPrintOption3:=3  //Use current Contact_Email
				: (SR_at_EmailPrintOption2=5)  //Use Company 'Accounts Receivable' email.
					SR_at_EmailPrintOption3:=3  //Use current Contact_Email
				Else   //shouldn't happen
					SR_at_EmailPrintOption3:=1  //print
			End case 
			//**************************************************************
			
			
			//************ Changed to array of values 20/02/09 -kmw ************
			//: ($_ptr_VarToSetToDefault=(->SR_t_EmailPrintOption3Role))
		: ($_ptr_VarToSetToDefault=(->SR_t_EmailPrintOption3Role))
			//C_TEXT(SR_t_EmailPrintOption3Role)
			C_TEXT:C284(SR_t_EmailPrintOption3Role)
			QUERY:C277([ROLES:87]; [ROLES:87]Role_Name:2="@account@")
			If (Records in selection:C76([ROLES:87])<1)
				QUERY:C277([ROLES:87]; [ROLES:87]Role_Name:2="@decision@")
				If (Records in selection:C76([ROLES:87])<1)
					QUERY:C277([ROLES:87]; [ROLES:87]Role_Name:2#"")
					If (Records in selection:C76([ROLES:87])<1)
						ALL RECORDS:C47([ROLES:87])
					End if 
				End if 
			End if 
			If (Records in selection:C76([ROLES:87])>0)
				ORDER BY:C49([ROLES:87]; [ROLES:87]Role_Code:1; >)
				FIRST RECORD:C50([ROLES:87])
				//SR_t_EmailPrintOption3Role:=[ROLES]Role Code
				SR_t_EmailPrintOption3Role:=[ROLES:87]Role_Code:1
			End if 
			//********************************************************************
		: ($_ptr_VarToSetToDefault=(->SR_t_EmailPrintOption3Email))
		: ($_ptr_VarToSetToDefault=(->SR_t_EmailPrintOption3Cont))
		: ($_ptr_VarToSetToDefault=(->SR_t_EmailPrintOption3Pers))
			
		: ($_ptr_VarToSetToDefault=(->SR_at_EmailPrintOption4))
			ARRAY TEXT:C222(SR_at_EmailPrintOption4; 2)
			SR_at_EmailPrintOption4{1}:="Print report instead."
			SR_at_EmailPrintOption4{2}:="Supply email address at the time report generated."
			SR_at_EmailPrintOption4:=1
	End case 
Else   //no var speicifed to have it's values to to default so set them all (by multiple recursive calls to itself each specifying one of the default values needing set)
	Reports_PrefsSetDefaults(->SR_l_CompSettingsUseStandardSR)  //Added 17/11/08 v631b120i -kmw
	Reports_PrefsSetDefaults(->SR_l_CompSettingsOverrideSR)  //Added 17/11/08 v631b120i -kmw
	Reports_PrefsSetDefaults(->SR_at_EmailPrintOption1)
	Reports_PrefsSetDefaults(->SR_at_EmailPrintOption2)
	//************ Changed to array of values 20/02/09 -kmw ************
	//Reports_PrefsSetDefaults (->SR_t_EmailPrintOption2Role)
	//Reports_PrefsSetDefaults (->SR_t_EmailPrintOption2Role)
	Reports_PrefsSetDefaults(->SR_t_EmailPrintOption2Email)
	Reports_PrefsSetDefaults(->SR_t_EmailPrintOption2Cont)
	Reports_PrefsSetDefaults(->SR_t_EmailPrintOption2Role)
	Reports_PrefsSetDefaults(->SR_t_EmailPrintOption2Pers)
	
	//********************************************************************
	Reports_PrefsSetDefaults(->SR_at_EmailPrintOption3)
	//************ Changed to array of values 20/02/09 -kmw ************
	//Reports_PrefsSetDefaults (->SR_t_EmailPrintOption3Role)
	//Reports_PrefsSetDefaults (->SR_t_EmailPrintOption3Role)
	Reports_PrefsSetDefaults(->SR_t_EmailPrintOption3Email)
	Reports_PrefsSetDefaults(->SR_t_EmailPrintOption3Cont)
	Reports_PrefsSetDefaults(->SR_t_EmailPrintOption3Role)
	Reports_PrefsSetDefaults(->SR_t_EmailPrintOption3Pers)
	
	
	//********************************************************************
	Reports_PrefsSetDefaults(->SR_at_EmailPrintOption4)
End if 
ERR_MethodTrackerReturn("Reports_PrefsSetDefaults"; $_t_oldMethodName)
