//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Fax_SPStartM2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 04/09/2012 15:18
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>FaxUrgent)
	C_LONGINT:C283(<>FaxCover; <>FaxDestin; $0; $Cover; bd10; bd11; FAX_Return)
	C_REAL:C285(FAX_Cover; FaxReturn)
	C_TEXT:C284($_t_oldMethodName; $_t_Organisation; $1; $2; $3; $4; FAxParam3; FAxParam4; vConfirm; VT; vTitle1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Fax_SPStartM2")
//Fax_SPStartM2 - Multi 2
$0:=0
If (Fax_SPSetup)
	
	If (bd10=1)
		If ((<>FaxCover>0) & (<>FaxCover<11))
			$Cover:=<>FaxCover
		Else 
			$Cover:=0
		End if 
	Else 
		$Cover:=0
	End if 
	FAX_Cover:=$Cover
	$_t_Organisation:=DB_GetOrganisation
	PLUGCALL_FAX("StartMessage"; 2; ""; ->$_t_Organisation; ->vConfirm; ->FAX_Cover; ->FAX_Return)
	$0:=FaxReturn
	If ($0=0)
		FAxParam3:=$2
		FAxParam4:=$3
		PLUGCALL_FAX("AddAddress"; 2; $1; ->FAxParam3; ->FAxParam4; -><>FaxUrgent; -><>FaxDestin; ->Fax_Return)
		$0:=Fax_Return
		If ($Cover>0)
			Fax_Return:=0
			PLUGCALL_FAX("AddComment"; 2; VT; ->Fax_Return)
			$0:=Fax_Return
		End if 
		
		If ($0=0)
			If (bd11=1)
				vTitle1:=""
				PLUGCALL_FAX("PickEnclosure"; 2; Vtitle1; ->Fax_Return)
				$0:=Fax_Return
			End if 
			PLUGCALL_FAX("PreparePrint"; 2)
			
		End if 
	End if 
Else 
	$0:=1
End if 
ERR_MethodTrackerReturn("Fax_SPStartM2"; $_t_oldMethodName)