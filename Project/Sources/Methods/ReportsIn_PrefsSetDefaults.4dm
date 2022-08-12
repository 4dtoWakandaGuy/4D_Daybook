//%attributes = {}
If (False:C215)
	//Project Method Name:      ReportsIn_PrefsSetDefaults
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/11/2009`Method: ReportsIn_PrefsSetDefaults
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(EMail_at_DocEmailTo;0)
	//ARRAY TEXT(IR_at_EmailPrintOption;0)
	//ARRAY TEXT(IR_at_EmailPrintOption1;0)
	//ARRAY TEXT(IR_at_EmailPrintOption2;0)
	//ARRAY TEXT(IR_at_EmailPrintOption3;0)
	//ARRAY TEXT(IR_at_EmailPrintOption4;0)
	C_BOOLEAN:C305(DOC_bo_CopyToprinter)
	C_LONGINT:C283(DOC_l_docDoEmail; DOC_l_docDoEmail_copy; DOC_l_docDoPdf; DOC_l_DocDoPDFcopy; DOC_l_DocDoPrint; DOC_l_DoPrintCopy; IR_l_CompSettingsOverrideSR; IR_l_CompSettingsUseStandardSR)
	C_POINTER:C301($_ptr_VarToSetToDefault; $1)
	C_TEXT:C284($_t_oldMethodName; email_t_Role; IR_t_EmailPrintOption2Role; IR_t_EmailPrintOption3Role)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ReportsIn_PrefsSetDefaults")


//Added 17/11/08 v631b120i -kmw



If (Count parameters:C259>0)
	
	$_ptr_VarToSetToDefault:=$1
	Case of 
		: ($_ptr_VarToSetToDefault=(->IR_l_CompSettingsUseStandardSR))  //Added 18/11/08 v631b120i -kmw
			//Whether company level settings override report level settings is meaningless if setting defaults at the report level but defaults functionality (as with other functionality) is shared by report and company level and no harm in having them in setting them at the report level (they're just not used for anything)
			IR_l_CompSettingsUseStandardSR:=1
			
		: ($_ptr_VarToSetToDefault=(->IR_l_CompSettingsOverrideSR))  //Added 18/11/08 v631b120i -kmw
			//Whether company level settings override report level settings is meaningless if setting defaults at the report level but defaults functionality (as with other functionality) is shared by report and company level and no harm in having them in setting them at  report level (they're just not used for anything)
			IR_l_CompSettingsOverrideSR:=0
			
		: ($_ptr_VarToSetToDefault=(->IR_at_EmailPrintOption1))
			ARRAY TEXT:C222(IR_at_EmailPrintOption1; 4)
			IR_at_EmailPrintOption1{1}:="Print"
			IR_at_EmailPrintOption1{2}:="Email"
			IR_at_EmailPrintOption1{3}:="Print AND Email"
			IR_at_EmailPrintOption1{4}:="Ask user at the time report generated."
			//**************** 14/11/08 v631b120g -kmw ****************
			//Pick up defaults from any lingering old style email/print settings if possible.
			//Should only have one type of old style print/email setting set at one time (Internal or SR). NOTE: To ensure this we will need to make sure these values are always set back to zero whenever we are about to load old and new style print/email settings (which should be being loaded at about the same time because the we still use some of the old settings)
			If (DOC_l_DocDoPrint=1) | (DOC_l_DoPrintCopy=1)
				IR_at_EmailPrintOption1:=1  //Print
			Else 
				If (DOC_l_docDoPdf=1) | (DOC_l_DocDoPDFcopy=1)
					If (DOC_l_docDoEmail=1) | (DOC_l_docDoEmail_copy=1)
						If (DOC_bo_CopyToprinter)  //ie old style setting "send copy to printer" (only available on SR settings)
							IR_at_EmailPrintOption1:=3  //email and print //our equiv will therefore be "Print AND Email"
						Else   //ie old style setting standard email option will therefore be "Email"
							IR_at_EmailPrintOption1:=2  //Email  //our
						End if 
					Else   //I think this must mean something like "automatically print striaght to pdf (but don't email)"....new settings don't really have this option yet so allow for this with the following option.
						IR_at_EmailPrintOption1:=4  //email and print
					End if 
				Else   //This is just weird (no print and no pdf selected) but just in case it can happen allow for it with this
					IR_at_EmailPrintOption1:=4  //email and print
				End if 
			End if 
			//**************************************************************
			If (IR_at_EmailPrintOption=0)  //added NG 2020
				//NG JUly 2020-the following makes no sense so as it overrides the above so have added the if=0 above
				IR_at_EmailPrintOption1:=1  //added kmw 26/11/08 v631b120i (ensure print is always selected for internal reports as my understanding is that we currently havn't added this ability yet)
			End if 
			
			
		: ($_ptr_VarToSetToDefault=(->IR_at_EmailPrintOption2))
			ARRAY TEXT:C222(IR_at_EmailPrintOption2; 5)
			IR_at_EmailPrintOption2{1}:="Supply 'To Address' at the time report generated."
			IR_at_EmailPrintOption2{2}:="Use default Contact_Email."
			IR_at_EmailPrintOption2{3}:="Use Contact_Email where Role is..."
			IR_at_EmailPrintOption2{4}:="Use Company 'Accounts Payable' email."
			IR_at_EmailPrintOption2{5}:="Use Company 'Accounts Receivable' email."
			//**************** 14/11/08 v631b120g -kmw ****************
			//Pick up defaults from any lingering old style email/print settings if possible.
			If (IR_at_EmailPrintOption1>1)
				Case of   //I think in old style settings EMail_at_DocEmailTo was obnly available for super reports but check it.
					: (EMail_at_DocEmailTo=1)  //contact
						IR_at_EmailPrintOption2:=2  //current contact
					: (EMail_at_DocEmailTo=2)  //contact where role is
						IR_at_EmailPrintOption2:=3  //contact where role is
					: (EMail_at_DocEmailTo=3)  //accounts payable
						IR_at_EmailPrintOption2:=4  //accounts payable
					: (EMail_at_DocEmailTo=4)  //accounts receivable
						IR_at_EmailPrintOption2:=5  //accounts receivable
					Else 
						IR_at_EmailPrintOption2:=2  //default to use current contact
				End case 
			Else 
				IR_at_EmailPrintOption2:=1  //emailing not being used anyway but this will be default if they switch emailing on
			End if 
			//**************************************************************
			
		: ($_ptr_VarToSetToDefault=(->IR_t_EmailPrintOption2Role))
			If (email_t_Role#"")  //14/11/08 v631b120g -kmw (Pick up defaults from any lingering old style email/print settings if possible.)
				IR_t_EmailPrintOption2Role:=email_t_Role  //14/11/08 v631b120g -kmw (Pick up defaults from any lingering old style email/print settings if possible.)
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
					IR_t_EmailPrintOption2Role:=[ROLES:87]Role_Code:1
				End if 
			End if   //14/11/08 v631b120g -kmw (Pick up defaults from any lingering old style email/print settings if possible.)
			
		: ($_ptr_VarToSetToDefault=(->IR_at_EmailPrintOption3))
			ARRAY TEXT:C222(IR_at_EmailPrintOption3; 6)
			IR_at_EmailPrintOption3{1}:="Print report instead."
			IR_at_EmailPrintOption3{2}:="Supply 'To Address' at the time report generated."
			IR_at_EmailPrintOption3{3}:="Use default Contact_Email."
			IR_at_EmailPrintOption3{4}:="Use Contact_Email where Role is..."
			IR_at_EmailPrintOption3{5}:="Use Company 'Accounts Payable' email."
			IR_at_EmailPrintOption3{6}:="Use Company 'Accounts Receivable' email."
			//**************** 14/11/08 v631b120g -kmw ****************
			//Put appropriate option in here based on whatever lingering old style email/print setting defaults may have been picked up earlier
			//IR_at_EmailPrintOption3:=1
			Case of 
				: (IR_at_EmailPrintOption2=1)  //Supply 'To Address' at the time report generated.
					IR_at_EmailPrintOption3:=1  //print
				: (IR_at_EmailPrintOption2=2)  //"Use current Contact_Email."
					IR_at_EmailPrintOption3:=1  //print
				: (IR_at_EmailPrintOption2=3)  //Use Contact_Email where Role is..
					IR_at_EmailPrintOption3:=3  //Use current Contact_Email
				: (IR_at_EmailPrintOption2=4)  //Use Company 'Accounts Payable' email.
					IR_at_EmailPrintOption3:=3  //Use current Contact_Email
				: (IR_at_EmailPrintOption2=5)  //Use Company 'Accounts Receivable' email.
					IR_at_EmailPrintOption3:=3  //Use current Contact_Email
				Else   //shouldn't happen
					IR_at_EmailPrintOption3:=1  //print
			End case 
			//**************************************************************
			
		: ($_ptr_VarToSetToDefault=(->IR_t_EmailPrintOption3Role))
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
				IR_t_EmailPrintOption3Role:=[ROLES:87]Role_Code:1
			End if 
			
		: ($_ptr_VarToSetToDefault=(->IR_at_EmailPrintOption4))
			ARRAY TEXT:C222(IR_at_EmailPrintOption4; 2)
			IR_at_EmailPrintOption4{1}:="Print report instead."
			IR_at_EmailPrintOption4{2}:="Supply email address at the time report generated."
			IR_at_EmailPrintOption4:=1
	End case 
Else   //no var speicifed to have it's values to to default so set them all (by multiple recursive calls to itself each specifying one of the default values needing set)
	ReportsIn_PrefsSetDefaults(->IR_l_CompSettingsUseStandardSR)  //Added 18/11/08 v631b120i -kmw
	ReportsIn_PrefsSetDefaults(->IR_l_CompSettingsOverrideSR)  //Added 18/11/08 v631b120i -kmw
	ReportsIn_PrefsSetDefaults(->IR_at_EmailPrintOption1)
	ReportsIn_PrefsSetDefaults(->IR_at_EmailPrintOption2)
	ReportsIn_PrefsSetDefaults(->IR_t_EmailPrintOption2Role)
	ReportsIn_PrefsSetDefaults(->IR_at_EmailPrintOption3)
	ReportsIn_PrefsSetDefaults(->IR_t_EmailPrintOption3Role)
	ReportsIn_PrefsSetDefaults(->IR_at_EmailPrintOption4)
End if 
ERR_MethodTrackerReturn("ReportsIn_PrefsSetDefaults"; $_t_oldMethodName)
