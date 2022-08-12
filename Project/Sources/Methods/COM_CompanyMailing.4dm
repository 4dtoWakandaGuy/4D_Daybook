//%attributes = {}
If (False:C215)
	//Project Method Name:      COM_CompanyMailing
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:   01/11/2010 18:47
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(cList)
	//C_UNKNOWN(rComp)
	//C_UNKNOWN(vJobTitle)
	//C_UNKNOWN(vNo)
	//C_UNKNOWN(vP)
	//C_UNKNOWN(vRole)
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	C_BOOLEAN:C305(WIN_bo_TrackerInited)
	C_LONGINT:C283($_l_WindowReferenceRow; cList; DB_l_CurrentDisplayedForm; rComp; vNo; vP; WIN_l_CurrentWinRef; $_l_OK; $_l_WindowReferenceRow; DB_l_CurrentDisplayedForm; WIN_l_CurrentWinRef)
	C_TEXT:C284(DB_t_CurrentContext; vJobTitle; vRole; $_t_oldMethodName; DB_t_CurrentContext)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("COM_CompanyMailing")
CREATE SET:C116([COMPANIES:2]; "$temp")

If (Records in set:C195("ListboxSet0")>0)
	USE SET:C118("ListboxSet0")
End if 
If (Records in selection:C76([COMPANIES:2])>0)
	vNo:=Records in selection:C76([COMPANIES:2])
	rComp:=1
	MAsk_Print(->[COMPANIES:2])
	//we now have a document if we are printing a mail merge
	
	If (vP=1)
		vJobTitle:=""
		vRole:=""
		Open_AnyTypeWindow(258; 483; 5; "Contact Requirements")
		DIALOG:C40([DOCUMENTS:7]; "dAsk_Cont")
		$_l_OK:=OK
		OK:=1
		CLOSE WINDOW:C154
		If (WIN_bo_TrackerInited)
			$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
			If ($_l_WindowReferenceRow>0)
				WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
			End if 
		End if 
		If ($_l_OK=1)
			MAsk_MS(->[COMPANIES:2])  //Mail sort
			If (OK=1)
				If (cList=1)
					FORM SET OUTPUT:C54([COMPANIES:2]; "Companies_List")
					MList_Print(->[COMPANIES:2])
					
				End if 
				MailP_Let(->[COMPANIES:2])
				MailP_Lab(->[COMPANIES:2])
				MailP_Env(->[COMPANIES:2])
				MailP_Exp(->[COMPANIES:2])
			End if 
		End if 
	End if 
	
End if 
USE SET:C118("$Temp")

DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
SEL_UpdateRecordCache(DB_l_CurrentDisplayedForm)
DB_SetFormMenuoptions
ERR_MethodTrackerReturn("COM_CompanyMailing"; $_t_oldMethodName)
