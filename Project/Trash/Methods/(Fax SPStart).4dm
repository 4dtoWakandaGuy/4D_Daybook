//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Fax SPStart
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 20:27
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	C_BOOLEAN:C305(<>FaxUrgent; WIN_bo_TrackerInited)
	C_LONGINT:C283(<>FaxCover; <>FaxDestin; $_l_WindowReferenceRow; $0; $Cover; bd10; bd11; FAX_Return; WIN_l_CurrentWinRef)
	C_REAL:C285(FAX_Cover; FaxReturn)
	C_TEXT:C284($_t_oldMethodName; $_t_Organisation; $1; $2; $3; $4; FAxParam3; FaxParam4; vConfirm; vT; vTitle1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Fax SPStart")
//Fax SPStart - see also StartM1 & 2
$0:=0
If (Fax_SPSetup)
	
	vConfirm:=$1
	vT:=""
	Open_Any_Window(304; 438)
	DIALOG:C40([COMPANIES:2]; "dFax SPCover")
	CLOSE WINDOW:C154
	If (WIN_bo_TrackerInited)
		$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
		If ($_l_WindowReferenceRow>0)
			WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
		End if 
	End if 
	If (bd10=1)
		If ((<>FaxCover>0) & (<>FaxCover<11))
			$Cover:=<>FaxCover
		Else 
			$Cover:=0
		End if 
	Else 
		$Cover:=0
	End if 
	If (OK=0)
		$0:=1
	End if 
	
	If ($0=0)
		FAX_Cover:=$cover
		$_t_Organisation:=DB_GetOrganisation
		PLUGCALL_FAX("StartMessage"; 2; ""; ->$_t_Organisation; ->vConfirm; ->FAX_Cover; ->FAX_Return)
		
		$0:=FAX_Return
		If ($0=0)
			FAxParam3:=$3
			FaxParam4:=$4
			Fax_Return:=0
			PLUGCALL_FAX("AddAddress"; 2; $2; ->FAxParam3; ->FAxParam4; -><>FaxUrgent; -><>FaxDestin; ->Fax_Return)
			$0:=FaxReturn
			If ($Cover>0)
				PLUGCALL_FAX("AddComment"; 2; VT; ->Fax_Return)
			End if 
			If ($0=0)
				If (bd11=1)
					vTitle1:=""
					PLUGCALL_FAX("PickEnclosure"; 2; Vtitle1; ->Fax_Return)
					
					
				End if 
				Fax_Return:=0
				PLUGCALL_FAX("SwitchPrinter"; 2; ""; ->Fax_Return)
				
				If ($0=0)
					PLUGCALL_FAX("PreparePrint"; 2)
					
				End if 
			End if 
		End if 
	End if 
Else 
	$0:=1
End if 
ERR_MethodTrackerReturn("Fax SPStart"; $_t_oldMethodName)