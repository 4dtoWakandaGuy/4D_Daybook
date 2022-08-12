If (False:C215)
	//Table Form Method Name: [COMPANIES]dRequest
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:06
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(GEN_at_ComboBoxValues;0)
	C_BOOLEAN:C305(<>SCPT_bo_NoAutoScripts; DB_bo_NoLoad; GEN_bo_RequestDate; GEN_bo_RequestLongint; GEN_bo_RequestReal; Gen_bo_UseComboBoxPage)
	C_DATE:C307(GEN_d_date)
	C_LONGINT:C283($_l_event; GEN_l_Amount; xCancel)
	C_REAL:C285(GEN_R_Amount)
	C_TEXT:C284(<>ButtCanc; <>ButtOK; $_t_oldMethodName; vT)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [COMPANIES].dRequest"; Form event code:C388)
$_l_event:=Form event code:C388
//$Timer:=60

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		If (Not:C34(Gen_bo_UseComboBoxPage))
			ARRAY TEXT:C222(GEN_at_ComboBoxValues; 0)  //Note that i have not set a way to have a numeric list so this is not current set up to use with 'amount'
		Else 
			FORM GOTO PAGE:C247(2)
			
		End if 
		OBJECT SET VISIBLE:C603(GEN_d_date; False:C215)
		
		OBJECT SET VISIBLE:C603(GEN_R_Amount; False:C215)
		OBJECT SET VISIBLE:C603(GEN_l_Amount; False:C215)
		OBJECT SET VISIBLE:C603(vT; True:C214)
		Case of 
			: (Gen_bo_UseComboBoxPage)
				BRING TO FRONT:C326(Current process:C322)
				
				OBJECT SET VISIBLE:C603(GEN_R_Amount; False:C215)
				OBJECT SET VISIBLE:C603(GEN_l_Amount; False:C215)
				GEN_at_ComboBoxValues{0}:=vT
				OBJECT SET VISIBLE:C603(vT; False:C215)
				OBJECT SET VISIBLE:C603(GEN_at_ComboBoxValues; True:C214)
				GOTO OBJECT:C206(GEN_at_ComboBoxValues)
			: (GEN_R_Amount#0) | (GEN_bo_RequestReal)
				OBJECT SET VISIBLE:C603(GEN_R_Amount; True:C214)
				OBJECT SET VISIBLE:C603(GEN_l_Amount; False:C215)
				OBJECT SET VISIBLE:C603(vT; False:C215)
				GOTO OBJECT:C206(GEN_R_Amount)
			: (GEN_l_Amount#0) | (GEN_bo_RequestLongint)
				
				OBJECT SET VISIBLE:C603(GEN_R_Amount; False:C215)
				OBJECT SET VISIBLE:C603(GEN_l_Amount; True:C214)
				OBJECT SET VISIBLE:C603(vT; False:C215)
				GOTO OBJECT:C206(GEN_l_Amount)
			: (GEN_d_date#!00-00-00!) | (GEN_bo_RequestDate)
				OBJECT SET VISIBLE:C603(GEN_d_date; True:C214)
				OBJECT SET VISIBLE:C603(vT; False:C215)
				GOTO OBJECT:C206(GEN_d_date)
				
			Else 
				OBJECT SET VISIBLE:C603(GEN_d_date; False:C215)
				
				OBJECT SET VISIBLE:C603(GEN_R_Amount; False:C215)
				OBJECT SET VISIBLE:C603(GEN_l_Amount; False:C215)
				OBJECT SET VISIBLE:C603(vT; True:C214)
				GOTO OBJECT:C206(Vt)
		End case 
		//SET TIMER($timer)
		OpenHelp(Table:C252(->[COMPANIES:2]); "dRequest")
		WS_AutoscreenSize(2; 101; 318)
		If (<>ButtOK#"")
			OBJECT SET TITLE:C194(xOK; <>ButtOK)
		End if 
		If (<>ButtCanc#"")
			OBJECT SET TITLE:C194(xCancel; <>ButtCanc)
		Else 
			OBJECT SET VISIBLE:C603(xCancel; False:C215)
		End if 
		If (<>SCPT_bo_NoAutoScripts=False:C215)
			PLAY:C290("Daybook Confirm"; 0)
		End if 
		
		INT_SetDialog
		WS_KeepFocus
	: ($_l_event=On Timer:K2:25)
		//BRING TO FRONT(Current process)
	: ($_l_event=On Deactivate:K2:10)
		//PAUSE PROCESS(Current process)
		//: (Outside call)
		//  In_ButtdCall
End case 
ERR_MethodTrackerReturn("FM:dRequest"; $_t_oldMethodName)
