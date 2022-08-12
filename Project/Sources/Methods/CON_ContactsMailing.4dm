//%attributes = {}
If (False:C215)
	//Project Method Name:      CON_ContactsMailing
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  19/03/2011 18:30 v7.0.0/B45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	C_BOOLEAN:C305(<>MultiCo; WIN_bo_TrackerInited)
	C_LONGINT:C283($_l_OK; $_l_WindowReferenceRow; cList; DB_l_CurrentDisplayedForm; rCont; vNo; vP; WIN_l_CurrentWinRef)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentContext; vAnalysis; vOmit; vSource; vSource_; vStatus; vType)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CON_ContactsMailing")

CREATE SET:C116([CONTACTS:1]; "$temp")

If (Records in set:C195("ListboxSet0")>0)
	USE SET:C118("ListboxSet0")
End if 
If (Records in selection:C76([CONTACTS:1])>0)
	
	vNo:=Records in selection:C76([CONTACTS:1])
	rCont:=1
	MAsk_Print(->[CONTACTS:1])
	
	
	If (vP=1)
		If (<>MultiCo)
			vType:=""
			vStatus:=""
			vSource:=""
			vOmit:=""
			vAnalysis:=""
			vSource_:=""
			Open_AnyTypeWindow(258; 483; 5; "Company Requirements")
			DIALOG:C40([DOCUMENTS:7]; "dAsk_Comp")
			$_l_OK:=OK
			OK:=1
			CLOSE WINDOW:C154
			If (WIN_bo_TrackerInited)
				$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
				If ($_l_WindowReferenceRow>0)
					WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
				End if 
			End if 
		Else 
			$_l_OK:=1
		End if 
		If ($_l_OK=1)
			
			MAsk_MS(->[CONTACTS:1])
			If (OK=1)
				If (cList=1)
					FORM SET OUTPUT:C54([CONTACTS:1]; "Contacts_List")
					MList_Print(->[CONTACTS:1])
				End if 
				MailP_Let(->[CONTACTS:1])
				MailP_Lab(->[CONTACTS:1])
				MailP_Env(->[CONTACTS:1])
				MailP_Exp(->[CONTACTS:1])
			End if 
		End if 
	End if 
	
End if 


USE SET:C118("$Temp")

DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
SEL_UpdateRecordCache(DB_l_CurrentDisplayedForm)
DB_SetFormMenuoptions
ERR_MethodTrackerReturn("CON_ContactsMailing"; $_t_oldMethodName)