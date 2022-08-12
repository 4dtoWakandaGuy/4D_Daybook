//%attributes = {}
If (False:C215)
	//Project Method Name:      Reports_PrefsGet
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/11/2009`Method: Reports_PrefsGet
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY POINTER:C280($_aptr_PrefsToLoad; 0)
	//ARRAY TEXT(SR_at_EmailPrintOption1;0)
	//ARRAY TEXT(SR_at_EmailPrintOption2;0)
	//ARRAY TEXT(SR_at_EmailPrintOption3;0)
	//ARRAY TEXT(SR_at_EmailPrintOption3Val;0)
	//ARRAY TEXT(SR_at_EmailPrintOption4;0)
	//ARRAY TEXT(SR_t_EmailPrintOption2Role;0)
	C_LONGINT:C283(SR_l_CompSettingsOverrideSR; SR_l_CompSettingsUseStandardSR)
	C_POINTER:C301($_ptr_EmailAddress; $_ptr_GenerationType; $_ptr_PrefsToLoad; $1; $2)
	C_TEXT:C284($_t_EmailAddress; $_t_GenerationType; $_t_oldMethodName; $_t_ReportPrefCompCode; $_t_ReportPrefCompDocStr; $_t_ReportPrefDocCode; $3; $4; SR_t_EmailPrintOption3Role)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Reports_PrefsGet")


$_ptr_GenerationType:=$1

$_ptr_EmailAddress:=$2

If (Count parameters:C259>0)
	$_t_ReportPrefCompCode:=$3
	If ([COMPANIES:2]Company_Code:1#$_t_ReportPrefCompCode)
		QUERY:C277([COMPANIES:2]Company_Code:1=$_t_ReportPrefCompCode)
	End if 
Else 
	$_t_ReportPrefCompCode:=[COMPANIES:2]Company_Code:1
End if 

If (Count parameters:C259>1)
	$_t_ReportPrefDocCode:=$4
Else 
	$_t_ReportPrefDocCode:=[DOCUMENTS:7]Document_Code:1
End if 

$_t_ReportPrefCompDocStr:=$_t_ReportPrefDocCode

//
ARRAY POINTER:C280($_aptr_PrefsToLoad; 8)
$_aptr_PrefsToLoad{1}:=->SR_l_CompSettingsUseStandardSR
$_aptr_PrefsToLoad{2}:=->SR_l_CompSettingsOverrideSR
$_aptr_PrefsToLoad{3}:=->SR_at_EmailPrintOption1
$_aptr_PrefsToLoad{4}:=->SR_at_EmailPrintOption2
//************ Changed to array of values 20/02/09 -kmw ************
//$_aptr_PrefsToLoad{5}:=->SR_t_EmailPrintOption2Role
$_aptr_PrefsToLoad{5}:=->SR_t_EmailPrintOption2Role
//********************************************************************
$_aptr_PrefsToLoad{6}:=->SR_at_EmailPrintOption3
//************ Changed to array of values 20/02/09 -kmw ************
//$_aptr_PrefsToLoad{7}:=->SR_t_EmailPrintOption3Role
$_aptr_PrefsToLoad{7}:=->SR_t_EmailPrintOption3Role
//********************************************************************
$_aptr_PrefsToLoad{8}:=->SR_at_EmailPrintOption4
$_ptr_PrefsToLoad:=->$_aptr_PrefsToLoad
Reports_PrefsLoadNEW($_t_ReportPrefCompDocStr; "COMPANY REPORT"; $_ptr_PrefsToLoad; False:C215; Table:C252(->[COMPANIES:2]); [COMPANIES:2]x_ID:63)

If (SR_l_CompSettingsUseStandardSR=1)
	ARRAY POINTER:C280($_aptr_PrefsToLoad; 8)
	//$_aptr_PrefsToLoad{1}:=->SR_l_CompSettingsUseStandardSR
	//$_aptr_PrefsToLoad{2}:=->SR_l_CompSettingsOverrideSR
	$_aptr_PrefsToLoad{3}:=->SR_at_EmailPrintOption1
	$_aptr_PrefsToLoad{4}:=->SR_at_EmailPrintOption2
	//************ Changed to array of values 20/02/09 -kmw ************
	//$_aptr_PrefsToLoad{5}:=->SR_t_EmailPrintOption2Role
	$_aptr_PrefsToLoad{5}:=->SR_t_EmailPrintOption2Role
	//********************************************************************
	$_aptr_PrefsToLoad{6}:=->SR_at_EmailPrintOption3
	//************ Changed to array of values 20/02/09 -kmw ************
	//$_aptr_PrefsToLoad{7}:=->SR_t_EmailPrintOption3Role
	$_aptr_PrefsToLoad{7}:=->SR_t_EmailPrintOption3Role
	//********************************************************************
	$_aptr_PrefsToLoad{8}:=->SR_at_EmailPrintOption4
	$_ptr_PrefsToLoad:=->$_aptr_PrefsToLoad
	//Reports_PrefsLoadNEW ($_t_ReportPrefCompCode;"REPORT";$_ptr_PrefsToLoad)
	Reports_PrefsLoadNEW($_t_ReportPrefDocCode; "REPORT"; $_ptr_PrefsToLoad; False:C215; Table:C252(->[DOCUMENTS:7]); 0)  //fixed bug where it was passing comp code instead of doc code - 02/12/08 v631b120u -kmw
End if 
//
//


$_t_GenerationType:=SR_at_EmailPrintOption1{SR_at_EmailPrintOption1}
$_t_EmailAddress:=""

Case of 
	: (SR_at_EmailPrintOption1=1)  //Print
		//we already have correct generation type and blank email
	Else 
		Case of 
			: (SR_at_EmailPrintOption2=1)  //Supply email address at the time report is generated
				//we already have correct generation type and blank email
			Else 
				Case of 
					: (SR_at_EmailPrintOption2=2)  //Use default Contact_Email.
						$_t_EmailAddress:=[CONTACTS:1]Email_Address:35  //Set to whatever contact is in the current selection
					: (SR_at_EmailPrintOption2=3)
						CREATE SET:C116([CONTACTS:1]; "$keepMyContacts")
						QUERY:C277([CONTACTS:1]; [CONTACTS:1]Company_Code:1=$_t_ReportPrefCompCode; *)
						//************ Changed to array of values 20/02/09 -kmw ************
						//QUERY([CONTACTS]; & ;[CONTACTS]Role=SR_t_EmailPrintOption2Role)
						QUERY:C277([CONTACTS:1];  & ; [CONTACTS:1]Role:11=SR_t_EmailPrintOption2Role)
						//********************************************************************
						If (Records in selection:C76([CONTACTS:1])>0)
							$_t_EmailAddress:=[CONTACTS:1]Email_Address:35
						Else 
							//we already have correct generation type and blank email
						End if 
						USE SET:C118("$keepMyContacts")
						CLEAR SET:C117("$keepMyContacts")  //probably unncessary but just in case added kmw 20/02/09 v631b120o
					: (SR_at_EmailPrintOption2=4)  //use company's accounts payable email address
						Company_docPrintPrefGet("AccPayableEmail"; "email"; ->$_t_EmailAddress)
						
					: (SR_at_EmailPrintOption2=5)  //use company's accounts receivable email address
						Company_docPrintPrefGet("AccReceivableEmail"; "email"; ->$_t_EmailAddress)
						
						//**************************************** added kmw 23/02/09 v631b120o ****************************************
					: (SR_at_EmailPrintOption2=6)  //use specific Contact_Email
						CREATE SET:C116([CONTACTS:1]; "$keepMyContacts")
						QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=SR_t_EmailPrintOption2Role)
						If (Records in selection:C76([CONTACTS:1])>0)
							$_t_EmailAddress:=[CONTACTS:1]Email_Address:35
						Else 
							//we already have correct generation type and blank email
						End if 
						USE SET:C118("$keepMyContacts")
						CLEAR SET:C117("$keepMyContacts")
						
					: (SR_at_EmailPrintOption2=7)  //use specific personnel email
						CREATE SET:C116([PERSONNEL:11]; "$keepMyPersonnel")
						QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=SR_t_EmailPrintOption2Role)
						If (Records in selection:C76([PERSONNEL:11])>0)
							$_t_EmailAddress:=[PERSONNEL:11]Email_Address:36
						Else 
							//we already have correct generation type and blank email
						End if 
						USE SET:C118("$keepMyPersonnel")
						CLEAR SET:C117("$keepMyPersonnel")
						
					: (SR_at_EmailPrintOption2=8)  //use specific email
						$_t_EmailAddress:=SR_t_EmailPrintOption2Role
						//*******************************************************************************************************************
				End case 
				If ($_t_EmailAddress="")
					Case of 
						: (SR_at_EmailPrintOption3=1)  //Print instead
							$_t_GenerationType:="Print"
						: (SR_at_EmailPrintOption3=2)  //Supply email address at the time report is generated
							//generation type already correctly set to email and email address already correctly set to blank
						Else 
							Case of 
								: (SR_at_EmailPrintOption3=3)  //Use default Contact_Email.
									$_t_EmailAddress:=[CONTACTS:1]Email_Address:35  //Set to whatever contact is in the current selection
								: (SR_at_EmailPrintOption3=4)
									CREATE SET:C116([CONTACTS:1]; "$keepMyContacts")
									QUERY:C277([CONTACTS:1]; [CONTACTS:1]Company_Code:1=$_t_ReportPrefCompCode; *)
									//************ Changed to array of values 20/02/09 -kmw ************
									//QUERY([CONTACTS]; & ;[CONTACTS]Role=SR_t_EmailPrintOption3Role)
									QUERY:C277([CONTACTS:1];  & ; [CONTACTS:1]Role:11=SR_t_EmailPrintOption3Role)
									//********************************************************************
									If (Records in selection:C76([CONTACTS:1])>0)
										$_t_EmailAddress:=[CONTACTS:1]Email_Address:35
									Else 
										//we already have correct generation type and blank email
									End if 
									USE SET:C118("$keepMyContacts")
									CLEAR SET:C117("$keepMyContacts")  //probably unncessary but just in case added kmw 20/02/09 v631b120o
								: (SR_at_EmailPrintOption3=5)  //use company's accounts payable email address
									Company_docPrintPrefGet("AccPayableEmail"; "email"; ->$_t_EmailAddress)
									
								: (SR_at_EmailPrintOption3=6)  //use company's accounts receivable email address
									Company_docPrintPrefGet("AccReceivableEmail"; "email"; ->$_t_EmailAddress)
									
									//**************************************** added kmw 23/02/09 v631b120o ****************************************
								: (SR_at_EmailPrintOption3=7)  //use specific Contact_Email
									CREATE SET:C116([CONTACTS:1]; "$keepMyContacts")
									QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=SR_t_EmailPrintOption3Role)
									If (Records in selection:C76([CONTACTS:1])>0)
										$_t_EmailAddress:=[CONTACTS:1]Email_Address:35
									Else 
										//we already have correct generation type and blank email
									End if 
									USE SET:C118("$keepMyContacts")
									CLEAR SET:C117("$keepMyContacts")
									
								: (SR_at_EmailPrintOption3=8)  //use specific personnel email
									CREATE SET:C116([PERSONNEL:11]; "$keepMyPersonnel")
									QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=SR_t_EmailPrintOption3Role)
									If (Records in selection:C76([PERSONNEL:11])>0)
										$_t_EmailAddress:=[PERSONNEL:11]Email_Address:36
									Else 
										//we already have correct generation type and blank email
									End if 
									USE SET:C118("$keepMyPersonnel")
									CLEAR SET:C117("$keepMyPersonnel")
									
								: (SR_at_EmailPrintOption3=9)  //use specific email
									$_t_EmailAddress:=SR_t_EmailPrintOption3Role  //not sure this is correct.
									//*******************************************************************************************************************
									
							End case 
							If ($_t_EmailAddress="")
								Case of 
									: (SR_at_EmailPrintOption4=1)  //Print instead
										$_t_GenerationType:="Print"
								End case 
							End if 
					End case 
				End if 
		End case 
End case 

//Return values
$_ptr_GenerationType->:=$_t_GenerationType
$_ptr_EmailAddress->:=$_t_EmailAddress
ERR_MethodTrackerReturn("Reports_PrefsGet"; $_t_oldMethodName)
