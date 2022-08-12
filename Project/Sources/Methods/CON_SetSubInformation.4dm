//%attributes = {}
If (False:C215)
	//Project Method Name:      CON_SetSubInformation
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 08/03/2011 15:40
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(CON_al_EditMode;0)
	//ARRAY POINTER(CON_aptr_LBSetup;0)
	//ARRAY TEXT(CON_at_editMode;0)
	C_LONGINT:C283($_l_ContactID; $_l_CurrentProcess; $_l_ProcessState; $_l_Retries; $_l_ScreenCentreVertical; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_WindowTop; $2; CON_l_ContactID)
	C_LONGINT:C283(CON_l_FurtherFieldsMod; CON_l_IPcall; CON_l_ParentProcess; CON_l_SubInfoProcess)
	C_PICTURE:C286(CON_Pi_EditMode)
	C_TEXT:C284($_t_ContactCode; $_t_DisplayType; $_t_oldMethodName; $1; $3; CON_t_ContactCode; CON_t_DisplayType)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CON_SetSubInformation")

//NG this method is needed because I want to add the tabs onto a contact screen
//however the contact screen is already pretty busy and has the complication of including the applicant data.
//This makes it pretty hard to display the tabs in that screen. So we are going to open a seperat window(sizable etc) To display the contact data..Note this is in its own process

If (Count parameters:C259>=3)
	$_t_ContactCode:=$1
	$_l_ContactID:=$2
	$_t_DisplayType:=$3  //if we are showing an applican t rather than a contact this will say ContactApplic
	$_l_CurrentProcess:=Current process:C322
	GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
	$_l_ScreenCentreVertical:=(($_l_WindowBottom-$_l_WindowTop)/2)
	If (True:C214)
		ARRAY POINTER:C280(CON_aptr_LBSetup; 0)
		CON_l_ContactID:=$_l_ContactID
		CON_t_ContactCode:=$_t_ContactCode
		CON_t_DisplayType:=$_t_DisplayType  //Note this does not change during the process
		CON_l_ParentProcess:=Current process:C322
		ARRAY TEXT:C222(CON_at_editMode; 0)
		ARRAY LONGINT:C221(CON_al_EditMode; 0)
		ARRAY POINTER:C280(CON_aptr_LBSetup; 0)
		LBi_SetListBoxOptions(->CON_at_editMode; ->CON_al_EditMode; ->CON_Pi_EditMode; True:C214)
		If ([CONTACTS:1]Contact_Code:2#CON_t_ContactCode)
			QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=CON_t_ContactCode)  // note that this process in readonly mode-the record will be locked in the parent process
		End if 
		CON_l_FurtherFieldsMod:=0
		CON_SubLPB
		
	Else 
		
		If (CON_l_SubInfoProcess=0) & (False:C215)
			//Process is not running
			CON_l_SubInfoProcess:=New process:C317("CON_ShowSubInformation"; 512000; "Contact_Information"; $_t_ContactCode; $_l_ContactID; $_t_DisplayType; $_l_CurrentProcess; $_l_WindowRight; $_l_ScreenCentreVertical)
			
		Else 
			$_l_ProcessState:=Process state:C330(CON_l_SubInfoProcess)
			If ($_l_ProcessState<0)
				CON_l_SubInfoProcess:=New process:C317("CON_ShowSubInformation"; 512000; "Contact_Information"; $_t_ContactCode; $_l_ContactID; $_t_DisplayType; $_l_CurrentProcess; $_l_WindowRight; $_l_ScreenCentreVertical)
			Else 
				$_l_Retries:=0
				While (Semaphore:C143("$CONINFOBUSY"))
					$_l_Retries:=$_l_Retries+1
					DelayTicks(10*(1+$_l_Retries))
				End while 
				
				SET PROCESS VARIABLE:C370(CON_l_SubInfoProcess; CON_l_ContactID; $_l_ContactID)
				SET PROCESS VARIABLE:C370(CON_l_SubInfoProcess; CON_t_ContactCode; $_t_ContactCode)
				SET PROCESS VARIABLE:C370(CON_l_SubInfoProcess; CON_l_IPcall; 100)
				POST OUTSIDE CALL:C329(CON_l_SubInfoProcess)
				CLEAR SEMAPHORE:C144("$CONINFOBUSY")
			End if 
			
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("CON_SetSubInformation"; $_t_oldMethodName)